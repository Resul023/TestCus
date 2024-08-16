using Dapper;
using Npgsql;
using TestCustoms.Models;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using System.Text;
using NpgsqlTypes;

namespace TestCustoms.Controllers;

[Route("api/[controller]")]
[ApiController]
public class TestCreatorsController : ControllerBase
{
    public string ConnectionStringPostgre { get; set; } = "Server=localhost;Port=5432;Database=postgres;User Id=postgres;Password=Hello123456?;";
    [HttpGet("quizId")]
    public List<Question> GetQuestionByQuizId(int quizId)
    {
        var sql = """
            select
            	q.id,
                q.name,
                jsonb_agg(
                    jsonb_build_object(
                        'questionId', qs.id,
                        'questionName', qs.name,
                        'quizId',qs.quizid,
                        'variants', (
                            SELECT jsonb_agg(
                                       jsonb_build_object(
                                           'variantId', v.id,
                                           'variantName', v.name,
                                           'variantIsTrue',v.istrue,
                                           'questionId', v.questionid
                                       )
                                   )
                            FROM variant v
                            WHERE v.questionid = qs.id
                        )
                    )
                ) AS question
            FROM
                quiz q
            JOIN
                question qs
            ON
                q.id = qs.quizid
            where q.id = @quizId 
            GROUP BY
                q.name,q.id,qs.quizid
            """;

        List<Question> questionList = new();
        using (var connection = new NpgsqlConnection(ConnectionStringPostgre))
        {
            connection.Open();
            var quizzes = connection.Query<Quiz>(sql);

            using (var command = new NpgsqlCommand(sql, connection))
            {
                command.Parameters.AddWithValue("@quizId", NpgsqlDbType.Integer, quizId);
                using (var reader = command.ExecuteReader())
                {
                    if (reader.Read())
                    {
                        var json = reader.GetString(2);

                        var questions = JsonConvert.DeserializeObject<List<Question>>(json);
                        if (questions is not null && questions.Count() is not 0)
                        {
                            questionList = questions;
                        }
                    }
                }
            }
        }
            return questionList;
    }

    [HttpGet]
    public List<Quiz> GetAllQuiz()
    {
        var query = "select * from quiz";
        List<Quiz> quizzes = new();
        using (var connection = new NpgsqlConnection(ConnectionStringPostgre))
        {
            connection.Open();
            quizzes = connection.Query<Quiz>(query).ToList();
            Console.WriteLine(connection.State);
        }
        return quizzes;
    }

   
}

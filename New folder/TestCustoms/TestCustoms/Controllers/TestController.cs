using Dapper;
using Microsoft.AspNetCore.Mvc;
using Npgsql;
using TestCustoms.Models;

namespace TestCustoms.Controllers;
[Route("api/[controller]")]
[ApiController]
public class TestController : ControllerBase
{
    public string ConnectionStringPostgre { get; set; } = "Server=localhost;Port=5432;Database=postgres;User Id=postgres;Password=Hello123456?;";
    // GET: api/<TestController>
    [HttpGet]
    public IEnumerable<string> Get()
    {
        using (var connection = new NpgsqlConnection(ConnectionStringPostgre))
        {
            connection.Open();
            var sql = "SELECT * FROM Persons";

            var books = connection.Query<Person>(sql).ToList();
            Console.WriteLine(books);
        }
        return new string[] { "value1", "value2" };
    }

    // GET api/<TestController>/5
    [HttpGet("{id}")]
    public string Get(int id)
    {
        return "value";
    }

    //POST api/<TestController>
    //[HttpPost]
    //public void Post([FromBody] string value)
    //{
    //}

    //PUT api/<TestController>/5
    //[HttpPut("{id}")]
    //public void Put(int id, [FromBody] string value)
    //{
    //}

    //DELETE api/<TestController>/5
    //[HttpDelete("{id}")]
    //public void Delete(int id)
    //{
    //}
}

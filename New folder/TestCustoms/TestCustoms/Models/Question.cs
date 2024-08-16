using Newtonsoft.Json;

namespace TestCustoms.Models;
public class Question
{
    [JsonProperty("questionId")]
    public int Id { get; set; }

    [JsonProperty("questionName")]
    public string Name { get; set; }

    [JsonProperty("quizId")]
    public int QuizId { get; set; }

    [JsonProperty("variants")]
    public  ICollection<Variant> Variants { get; set; }
}

using Newtonsoft.Json;

namespace TestCustoms.Models;
public class Quiz
{
    [JsonProperty("Id")]
    public int Id { get; set; }

    [JsonProperty("name")]
    public string Name { get; set; }
    public ICollection<Question> Questions { get; set; }

}

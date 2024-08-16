using Newtonsoft.Json;

namespace TestCustoms.Models;
public class Variant
{
    [JsonProperty("variantId")]
    public int Id { get; set; }

    [JsonProperty("variantName")]
    public string Name { get; set; }

    [JsonProperty("variantIsTrue")]
    public bool IsTrue { get; set; }

    [JsonProperty("questionId")]
    public int QuestionId { get; set; }
}

using System.Runtime.Serialization;

namespace WebAppProject.Models
{
    [DataContract]
    public class GetJSON
    {
        [DataMember(Name = "id")]
        public int Id { get; set; }
        [DataMember(Name = "data")]
        public DataJSON Data { get; set; }
    }

}

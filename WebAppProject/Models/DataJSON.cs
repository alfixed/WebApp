using System.Runtime.Serialization;

namespace WebAppProject.Models
{
    [DataContract]
    public class DataJSON
    {
        [DataMember(Name = "fullName")]
        public string FullName { get; set; }
        [DataMember(Name = "email")]
        public string Email { get; set; }
    }
}

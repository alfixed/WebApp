
namespace WebAppProject.Data
{
    using System;
    using System.Collections.Generic;

    public partial class DataTask
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public DataTask()
        {
            this.Event = new HashSet<DataEvent>();
        }
        public int Id { get; set; }
        public TaskTypes TaskType { get; set; }
        public ISTypes Source { get; set; }
        public string Data { get; set; }
        public string Destination { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<DataEvent> Event { get; set; }
        public virtual InformationSystem InformationSystem { get; set; }
    }
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Data.Entity;
using WebAppProject.Data;
using WebAppProject.Models;

namespace WebAppProject.Controllers
{
    //[Authorize]
    public class ValuesController : ApiController
    {
        private DataModelContainer db = new DataModelContainer();

        // GET api/values
        public IEnumerable<GetJSON> Get()
        {
            //test git
            DataJSON d1 = new DataJSON();
            d1.FullName = "Николай Спиридонов";
            d1.Email = "nspiridomov@satel.org";
            GetJSON obj1 = new GetJSON();
            obj1.Id = 1;
            obj1.Data = d1;

            DataJSON d2 = new DataJSON();
            d2.FullName = "Игорь Петренко";
            d2.Email = "ipetrenko@logictel.ru";
            GetJSON obj2 = new GetJSON();
            obj2.Id = 2;
            obj2.Data = d2;
            return new GetJSON[] { obj1, obj2 };
        }

        // GET api/values/5
        public IEnumerable<DataTask> Get(int id)
        {
            var tempDb = db.DataTasks;
            return tempDb;
        }

        // POST api/values
        public void Post([FromBody]string value)
        {
        }

        // PUT api/values/5
        public void Put(int id, [FromBody]string value)
        {
        }

        // DELETE api/values/5
        public void Delete(int id)
        {
        }
    }
}

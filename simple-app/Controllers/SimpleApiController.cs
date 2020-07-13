using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;

namespace simple_app.Controllers
{
    [ApiController]
    [Route("/")]
    public class SimpleApiController : ControllerBase
    {
        private static readonly string[] Summaries = new[]
        {
            "This is a simple api"
        };

        private readonly ILogger<SimpleApiController> _logger;

        public SimpleApiController(ILogger<SimpleApiController> logger)
        {
            _logger = logger;
        }

        [HttpGet]
        public IEnumerable<SimpleApi> Get()
        {

            return Enumerable.Range(1, 1).Select(index => new SimpleApi
            {
                Summary = Summaries[0]
            })
            .ToArray();
        }
    }
}

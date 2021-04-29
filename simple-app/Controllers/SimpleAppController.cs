using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using Microsoft.Extensions.Configuration;

namespace simple_app.Controllers
{
    [ApiController]
    [Route("/")]
    public class SimpleAppController : ControllerBase
    {
        private readonly IConfiguration Configuration;
        private static readonly string[] Summaries = new[]
        {
            "This is a simple api."
        };

        private readonly ILogger<SimpleAppController> _logger;

        public SimpleAppController(ILogger<SimpleAppController> logger, IConfiguration configuration)
        {
            _logger = logger;
            Configuration = configuration;
        }

        [HttpGet]
        public IEnumerable<SimpleApp> Get()
        {

            return Enumerable.Range(1, 1).Select(index => new SimpleApp
            {
                Summary = Summaries[0] + " It was deployed in " + Configuration["Prefix"] + "."
            })
            .ToArray();
        }
    }
}

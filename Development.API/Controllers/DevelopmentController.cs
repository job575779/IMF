using Development.API.Infrastructure;
using Microsoft.AspNetCore.Cors;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Development.API.Controllers
{

    [Route("api/v1/[controller]")]
    [ApiController]
    public class DevelopmentController : ControllerBase
    {
        private readonly DevelopmentContext _developmentContext;

        public DevelopmentController(DevelopmentContext context)
        {
            _developmentContext = context ?? throw new ArgumentNullException(nameof(context));           
        }

        //GET api/v1/[controller]/items[?pageSize = 3 & pageIndex = 10]
        [HttpGet]
        [Route("items")]
        //[DisableCors]
        [ProducesResponseType(typeof(PaginatedItemsViewModel<Models.Development>), StatusCodes.Status200OK)]
        [ProducesResponseType(typeof(IEnumerable<Models.Development>), StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status400BadRequest)]
        public async Task<IActionResult> ItemsAsync([FromQuery] int pageSize = 10, [FromQuery] int pageIndex = 0, string ids = null)
        {
            if (!string.IsNullOrEmpty(ids))
            {
                var items = await GetItemsByIdsAsync(ids);

                if (!items.Any())
                {
                    return BadRequest("ids value invalid. Must be comma-separated list of numbers");
                }

                return Ok(items);
            }

            var totalItems = await _developmentContext.Developments
                .LongCountAsync();

            var itemsOnPage = await _developmentContext.Developments
                .OrderBy(c => c.Value)
                .Skip(pageSize * pageIndex)
                .Take(pageSize)
                .ToListAsync();

            var model = new PaginatedItemsViewModel<Models.Development>(pageIndex, pageSize, totalItems, itemsOnPage);

            return Ok(model);
        }

        [HttpGet]
        [Route("itemslist")]
        //[DisableCors]
        [ProducesResponseType(typeof(PaginatedItemsViewModel<Models.DevelopmentView>), StatusCodes.Status200OK)]
        [ProducesResponseType(typeof(IEnumerable<Models.DevelopmentView>), StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status400BadRequest)]
        public async Task<IActionResult> ItemsListAsync([FromQuery] int pageSize = 10, [FromQuery] int pageIndex = 0)
        {   
            var totalItems = await _developmentContext.DevelopmentView
                .LongCountAsync();

            var itemsOnPage = await _developmentContext.DevelopmentView
                .OrderBy(c => c.Value)
                .Skip(pageSize * pageIndex)
                .Take(pageSize)
                .ToListAsync();

            var model = new PaginatedItemsViewModel<Models.DevelopmentView>(pageIndex, pageSize, totalItems, itemsOnPage);

            return Ok(model);
        }

        private async Task<List<Models.Development>> GetItemsByIdsAsync(string ids)
        {
            var numIds = ids.Split(',').Select(id => (Ok: long.TryParse(id, out long x), Value: x));

            if (!numIds.All(nid => nid.Ok))
            {
                return new List<Models.Development>();
            }

            var idsToSelect = numIds
                .Select(id => id.Value);

            var items = await _developmentContext.Developments.Where(ci => idsToSelect.Contains(ci.Id)).ToListAsync();


            return items;
        }
    }
}

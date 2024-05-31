﻿using Badminton.Web.DTO.SubCourt;
using Badminton.Web.Interfaces;
using Badminton.Web.Mappers;
using Badminton.Web.Models;
using Microsoft.AspNetCore.Mvc;

namespace Badminton.Web.Controllers
{
    [Route("api/subCourt")]
    [ApiController]
    public class SCourtController : ControllerBase
    {
        private readonly ISCourtRepository _sCourtRepo;
        private readonly ICourtRepository _courtRepo;
        public SCourtController(ISCourtRepository sCourtRepo, ICourtRepository courtRepo)
        {
            _sCourtRepo = sCourtRepo;
            _courtRepo = courtRepo; 
        }

        [HttpGet]
        public async Task<IActionResult> GetAllSCourt()
        {
            if(!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            var sCourts = await _sCourtRepo.GetAllAsync();
            var sCourtDTO = sCourts.Select(s => s.ToFormatSCourtDTO()).ToList();
            return Ok(sCourtDTO);
        }

        [HttpGet]
        [Route("{id:int}")]
        public async Task<IActionResult> GetSCourtById([FromRoute] int id)
        {
            if(!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            var sCourt = await _sCourtRepo.GetByIdAsync(id);
            if(sCourt == null)
            {
                return NotFound();
            }

            return Ok(sCourt.ToFormatSCourtDTO());
        }

        [HttpPut]
        [Route("{id:int}")]
        public async Task<IActionResult> Update([FromRoute] int id, UpdateSCourtDTO updateDTO)
        {
            if(!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            var sCourt = await _sCourtRepo.UpdateAsync(id, updateDTO);
            if( sCourt == null)
            {
                return NotFound("Không tìm thấy sân!");
            }

            return Ok(sCourt.ToFormatSCourtDTO());
        }

        [HttpPost("{courtId:int}")]
        public async Task<IActionResult> Create([FromRoute] int courtId, CreateSCourtDTO createDTO)
        {
            if(!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if(!await _courtRepo.CourtExist(courtId)) {
                return BadRequest("Sân không tồn tại!");
            }

            var sCourtModel = createDTO.ToFormatSCourtFromCreate(courtId);
            await _sCourtRepo.CreateAsync(sCourtModel);
            return CreatedAtAction(nameof(GetSCourtById), new { id = sCourtModel.CourtId }, sCourtModel.ToFormatSCourtDTO());
        }
    }
}
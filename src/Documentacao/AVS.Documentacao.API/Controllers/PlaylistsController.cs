﻿using AVS.Banda.Application.DTOs;
using AVS.Banda.Application.Interfaces;
using AVS.Banda.Domain.AppServices.DTOs;
using Microsoft.AspNetCore.Mvc;

namespace AVS.Documentacao.API.Controllers
{
    [Route("api")]    
    public class PlaylistsController : PrincipalController
    {
        private readonly IPlaylistAppService _playlistAppService;
        private readonly IMusicaPlaylistAppService _musicaPlaylistAppService;

        public PlaylistsController(IPlaylistAppService playlistAppService, 
                                   IMusicaPlaylistAppService musicaPlaylistAppService)
        {
            _playlistAppService = playlistAppService;
            _musicaPlaylistAppService = musicaPlaylistAppService;
        }
        
        [HttpGet("playlists")]
        public async Task<IActionResult> ObterTodasPlaylists()
        {
            try
            {
                var playlists = await _playlistAppService.ObterTodos();
                return playlists == null || (!playlists.Any()) ? ProcessarRespostaMensagem(
                    StatusCodes.Status404NotFound, "Não existem dados para exibição.") : RespostaPersonalizada(playlists.ToArray());
            }
            catch (Exception ex)
            {
                AdicionarErroProcessamento(ex.Message);
                return RespostaPersonalizada();
            }

        }

        [HttpGet("playlist/minhas-musicas")]
        public async Task<IActionResult> ObterMusicas()
        {
            try
            {
                var playlistExistente = await _playlistAppService
                    .BuscarMusicasPlaylist(x => x.UsuarioId == UsuarioId);
                return playlistExistente == null ? ProcessarRespostaMensagem(
                    StatusCodes.Status404NotFound, "Não existem dados para exibição.") : RespostaPersonalizada(playlistExistente);
            }
            catch (Exception ex)
            {
                AdicionarErroProcessamento(ex.Message);
                return RespostaPersonalizada();
            }

        }

        [HttpGet("playlist/detalhe/{id}")]
        public async Task<IActionResult> ObterPlaylistPorId(Guid id)
        {
            try
            {
                var playlist = await _playlistAppService.ObterPorId(id);
                return playlist == null ? ProcessarRespostaMensagem(
                    StatusCodes.Status404NotFound, "Playlist não encontrada.") : RespostaPersonalizada(playlist);
            }
            catch (Exception ex)
            {
                AdicionarErroProcessamento(ex.Message);
                return RespostaPersonalizada();
            }

        }       

        [HttpPost("playlist/adicionar")]
        public async Task<IActionResult> AdicionarPlaylist()
        {            
            try
            {
                var numero = 0;
                var playlistsExistentes = await _playlistAppService.BuscarTodosPorCriterio(x => x.UsuarioId == UsuarioId);                
                if (playlistsExistentes != null || (!playlistsExistentes.Any())) { numero = playlistsExistentes.Count(); }
                var playlistDTO = new PlaylistRequestDto(                     
                    UsuarioId, $"Minha Playlist nº{++numero}", 
                    "Preencha sua descrição", 
                    "http://uri.com.br"
                    );
                if (playlistDTO == null) return RespostaPersonalizada();
                //if (!ExecutarValidacao(new PlaylistDTOValidator(), playlistDTO)) return RespostaPersonalizada(ValidationResult);
                await _playlistAppService.Salvar(playlistDTO);
                AdicionaMensagemSucesso("Playlist adicionada com sucesso.");
                return RespostaPersonalizada(StatusCodes.Status201Created);
            }
            catch (Exception ex)
            {
                AdicionarErroProcessamento(ex.Message);
                return RespostaPersonalizada();
            }
        }        

        [HttpPut("playlist/atualizar")]
        public async Task<IActionResult> AtualizarPlaylist([FromBody] PlaylistRequestDto playlistDTO)
        {
            if (!ModelState.IsValid) return RespostaPersonalizada(ModelState);
            try
            {
                if (playlistDTO == null) return RespostaPersonalizada();
                //if (!ExecutarValidacao(new PlaylistDTOValidator(), playlistDTO)) return RespostaPersonalizada(ValidationResult);
                await _playlistAppService.Atualizar(playlistDTO);
                AdicionaMensagemSucesso("Playlist atualizada com sucesso.");
                return RespostaPersonalizada(StatusCodes.Status200OK);
            }
            catch (Exception ex)
            {
                AdicionarErroProcessamento(ex.Message);
                return RespostaPersonalizada();
            }

        }        

        [HttpDelete("playlist/excluir")]
        public async Task<IActionResult> ExcluirPlaylist([FromBody] PlaylistRequestDto playlistDTO)
        {
            if (!ModelState.IsValid) return RespostaPersonalizada(ModelState);
            try
            {
                if (playlistDTO == null) return RespostaPersonalizada();
                //if (!ExecutarValidacao(new PlaylistDTOValidator(), playlistDTO)) return RespostaPersonalizada(ValidationResult);
                await _playlistAppService.Exluir(playlistDTO);
                AdicionaMensagemSucesso("Playlist excluída com sucesso.");
                return RespostaPersonalizada(StatusCodes.Status204NoContent);
            }
            catch (Exception ex)
            {
                AdicionarErroProcessamento(ex.Message);
                return RespostaPersonalizada();
            }

        }

        [HttpPost("playlist/adicionar/musica/{playlistId}/{musicaId}")]
        public async Task<IActionResult> AdicionarMusicaPlaylist(Guid playlistId, Guid musicaId)
        {
            if (!ModelState.IsValid) return RespostaPersonalizada(ModelState);
            try
            {
                var musicaPlaylistDTO = new MusicaPlaylistRequestDto(playlistId, musicaId);
                //if (!ExecutarValidacao(new MusicaPlaylistDTOValidator(), musicaPlaylistDTO)) return RespostaPersonalizada(ValidationResult);
                await _musicaPlaylistAppService.Salvar(musicaPlaylistDTO);
                AdicionaMensagemSucesso("Música adicionada a playlist com sucesso.");
                return RespostaPersonalizada(StatusCodes.Status201Created);
            }
            catch (Exception ex)
            {
                AdicionarErroProcessamento(ex.Message);
                return RespostaPersonalizada();
            }
            
        }

        [HttpPost("playlist/excluir/musica/{playlistId}/{musicaId}")]
        public async Task<IActionResult> ExcluirMusicaPlaylist(Guid playlistId, Guid musicaId)
        {
            if (!ModelState.IsValid) return RespostaPersonalizada(ModelState);
            try
            {
                var musicaPlaylistDTO = new MusicaPlaylistRequestDto(playlistId, musicaId);
                //if (!ExecutarValidacao(new MusicaPlaylistDTOValidator(), musicaPlaylistDTO)) return RespostaPersonalizada(ValidationResult);
                await _musicaPlaylistAppService.Exluir(musicaPlaylistDTO);
                AdicionaMensagemSucesso("Música excluída da playlist com sucesso.");
                return RespostaPersonalizada(StatusCodes.Status204NoContent);
            }
            catch (Exception ex)
            {
                AdicionarErroProcessamento(ex.Message);
                return RespostaPersonalizada();
            }
            
        }

        protected override bool ExecutarValidacao<TV, TE>(TV validacao, TE entidade)
        {
            ValidationResult = validacao.Validate(entidade);
            if (ValidationResult.IsValid) return true;

            return false;
        }
    }
}

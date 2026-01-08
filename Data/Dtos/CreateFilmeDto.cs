using System.ComponentModel.DataAnnotations;

namespace FilmesApi.Data.Dtos;

public class CreateFilmeDto
{
  [Required(ErrorMessage = "O título do filme é obrigatório")]
  public string Titulo { get; set; }

  [Required(ErrorMessage = "O gênero do filme é obrigatório")]
  [StringLength(50, ErrorMessage = "O gênero do filme deve ter no máximo 50 caracteres")]
  public string Genero { get; set; }

  [Required(ErrorMessage = "A duração do filme é obrigatória")]
  [Range(70, 600, ErrorMessage = "A duração do filme deve estar entre 70 e 600 minutos")]
  public int Duracao { get; set; }

  [Required(ErrorMessage = "Por favor insira um nome válido")]
  [StringLength(200, ErrorMessage = "O nome do diretor deve ter no máximo 200 caracteres")]
  public string Diretor { get; set; }
}

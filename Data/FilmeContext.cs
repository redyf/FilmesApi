namespace FilmesApi.Data;
using Microsoft.EntityFrameworkCore;
using FilmesApi.Models;

public class FilmeContext : DbContext
{
    public FilmeContext(DbContextOptions<FilmeContext> opts) : base(opts) { }
    public DbSet<Filme> Filmes { get; set; }
}

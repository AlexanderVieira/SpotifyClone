﻿using AVS.Core.Extensions;
using AVS.Infra.Data;
using Microsoft.EntityFrameworkCore;

namespace AVS.Documentacao.API.Configuracao
{
    public static class ApiConfig
    {
        public static void AddApiConfiguration(this IServiceCollection services, IConfiguration configuration)
        {
            services.AddDbContext<SpotifyCloneContext>(options =>
                    options.UseSqlServer(configuration.GetConnectionString("DefaultConnection")).UseLazyLoadingProxies());
            services.AddScoped<PopulaBanco>();
            services.AddControllers();
            services.AddEndpointsApiExplorer();

            services.AddCors(options =>
            {
                options.AddPolicy("Total",
                    builder =>
                        builder
                        .AllowAnyOrigin()
                        .AllowAnyMethod()
                        .AllowAnyHeader());
            });

        }

        public static void UseApiConfiguration(this WebApplication app)
        {
            if (app.Environment.IsDevelopment())
            {
                app.UseSwagger();
                app.UseSwaggerUI();
                app.UseItToSeedSqlServer();
            }

            app.UseHttpsRedirection();
            app.UseCors("Total");
            app.UseAuthorization();            
            app.MapControllers();
        }
    }
}

using backend.Services.product;
using backend.Services;
using backend.Services.Auth;
using Microsoft.AspNetCore.Identity.UI.Services;
using backend.Models;
using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;
using Microsoft.AspNetCore.Authentication.Cookies;

var builder = WebApplication.CreateBuilder(args);
var services = builder.Services;
var WebSpecificOrigins = "WebSpecificOrigins";
// Add services to the container.

builder.Services.AddControllers();
// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();


#region DI
services.AddScoped<FireBaseService>();
services.AddScoped<BaseProductService>();

#endregion
#region CORS
builder.Services.AddCors(options =>
{
    options.AddPolicy(name: WebSpecificOrigins,
                      builder =>
                      {
                          builder.WithOrigins("http://localhost:5173")
                          .AllowAnyHeader()
                          .AllowAnyMethod()
                          .AllowCredentials()
                          ;
                      });
});
#endregion

#region Identity + Identity_Dabasae
builder.Services.AddIdentity<User, IdentityRole>(options => options.SignIn.RequireConfirmedAccount = true)
    .AddEntityFrameworkStores<AppDbContext>()
    .AddDefaultTokenProviders()
    ;
// builder.Services.AddDefaultIdentity<User>()
//     .AddEntityFrameworkStores<AppDbContext>()
//     .AddDefaultTokenProviders()
//     .AddRoles<IdentityRole>()
//     ;

builder.Services.AddDbContext<AppDbContext>(options =>
{
    string connectionString = builder.Configuration.GetConnectionString("DefaultConnection");
    options.UseSqlServer(connectionString);
});
services.PostConfigure<CookieAuthenticationOptions>(IdentityConstants.ApplicationScheme, options =>
{
    // options.LoginPath = "/Identity/Account/Login";
    // options.LogoutPath = "/Identity/Account/Logout";
    // options.AccessDeniedPath = "/Identity/Account/AccessDenied";
});


#endregion

#region Mail
builder.Services.AddOptions();
var mailSetting = builder.Configuration.GetSection("MailSettings");
builder.Services.Configure<MailSettings>(mailSetting);
builder.Services.AddSingleton<IEmailSender, SendMailService>();

#endregion

#region  Json

// services.AddControllersWithViews()
//     .AddJsonOptions(options =>
//         options.JsonSerializerOptions.ReferenceHandler = System.Text.Json.Serialization.ReferenceHandler.IgnoreCycles
//     );
services.AddControllers()
    .AddJsonOptions(options =>
        options.JsonSerializerOptions.ReferenceHandler = System.Text.Json.Serialization.ReferenceHandler.IgnoreCycles
    )
    ;

#endregion

var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}


app.UseHttpsRedirection();

app.UseAuthorization();

app.MapControllers();

app.Run();

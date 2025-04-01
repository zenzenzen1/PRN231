using final_project.Services.ClientServices.Payment;
using Microsoft.AspNetCore.OData;
using Microsoft.EntityFrameworkCore;
using Microsoft.OData.Edm;
using Microsoft.OData.ModelBuilder;
using Service.MangaOnline.Extensions;
using Service.MangaOnline.Hubs;
using Service.MangaOnline.Models;
using Service.MangaOnline.Services;

var builder = WebApplication.CreateBuilder(args);
var services = builder.Services;
// Add services to the container.
builder.Services.AddSignalR();

builder.Services.AddControllers();

services.AddDbContext<MangaOnlineV1DevContext>(options =>
{
    options.UseSqlServer(builder.Configuration.GetConnectionString("ConStr"), sqlOptions =>
    {
        sqlOptions.EnableRetryOnFailure(
            maxRetryCount: 5, // Number of retries
            maxRetryDelay: TimeSpan.FromSeconds(1), // Wait time before retry
            errorNumbersToAdd: null // Retry on all transient errors
        );
    });
});

//Session
builder.Services.AddDistributedMemoryCache();
builder.Services.AddSession(options =>
{
    options.IdleTimeout = TimeSpan.FromMinutes(30);
    options.Cookie.HttpOnly = true;
    options.Cookie.IsEssential = true;
});



// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();
builder.Services.AddDbContext<MangaOnlineV1DevContext>();
builder.Services.AddSingleton<IJwtTokenHandler, JwtTokenHandler>();
builder.Services.AddSingleton<IExtensionManga, ExtensionManga>();
builder.Services.AddSingleton<IMapObject, MapObject>();
builder.Services.AddScoped<MangaOnlineV1DevContext>();
builder.Services.AddScoped<StatisticService>();
builder.Services.AddScoped<UserService>();
builder.Services.AddScoped<PriceHistoryService>();
builder.Services.AddScoped<NotificationHub>();
builder.Services.AddScoped<VnPayService>();
builder.Services.AddScoped<CategoryService>();

builder.Services.AddCors(options =>
{
    options.AddPolicy("AllowAll",
        builder => builder.AllowAnyOrigin()
            .AllowAnyMethod()
            .AllowAnyHeader());
});
builder.Services.AddControllers().AddOData(otp => otp.Select().Filter().Count().OrderBy().Expand().SetMaxTop(100)
.AddRouteComponents("odata", GetEdmModel())
);
var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
    app.UseHsts();
}
app.UseCors(builder => builder
    .WithOrigins("http://localhost:5030") // Địa chỉ nguồn gốc mà bạn muốn cho phép truy cập (có thể thêm nhiều địa chỉ khác nhau)
    // .AllowAnyOrigin()
    .AllowAnyHeader()
    .AllowAnyMethod()
    .AllowCredentials()
);

app.UseHttpsRedirection();

app.UseRouting();

app.UseAuthorization();

app.MapControllers();

app.UseSession();

// http://localhost:5098/hubs/notification
app.MapHub<NotificationHub>("/hubs/notification");
app.MapHub<PaymentHub>("/hubs/payment");
app.MapHub<StatisticHub>("/hubs/statistic");

app.Run();



static IEdmModel GetEdmModel()
{

    ODataConventionModelBuilder builder = new ODataConventionModelBuilder();
    builder.EntitySet<Manga>("Manga");
    return builder.GetEdmModel();
}

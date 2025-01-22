using AgriTedWeb.Client.Pages;
using AgriTedWeb.Components;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.DependencyInjection;
using AgriTedWeb.Data;
using System.Text.Json;
using Newtonsoft.Json;
using Radzen;

var builder = WebApplication.CreateBuilder(args);
builder.Services.AddDbContextFactory<AgriTedWebContext>(options =>
    options.UseSqlServer(builder.Configuration.GetConnectionString("AgriTedWebContext") ?? throw new InvalidOperationException("Connection string 'AgriTedWebContext' not found.")));

builder.Services.AddQuickGridEntityFrameworkAdapter();

builder.Services.AddDatabaseDeveloperPageExceptionFilter();
builder.Services.AddRadzenComponents();
// Add services to the container.
builder.Services.AddRazorComponents()
    .AddInteractiveWebAssemblyComponents()
    .AddInteractiveServerComponents();


var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseWebAssemblyDebugging();
}
else
{
    app.UseExceptionHandler("/Error", createScopeForErrors: true);
    // The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
    app.UseHsts();
    app.UseMigrationsEndPoint();
}


app.UseHttpsRedirection();

app.UseStaticFiles();
app.UseAntiforgery();

app.MapRazorComponents<App>()
    .AddInteractiveWebAssemblyRenderMode()
    .AddInteractiveServerRenderMode()
    .AddAdditionalAssemblies(typeof(AgriTedWeb.Client._Imports).Assembly);

app.Run();

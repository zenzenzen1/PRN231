# EXE2
# front end
- install nodejs version 20
run command
- npm i
- npm run dev

# back end
 + using: dotnet ef migrations, identity authentication
    Reference: https://xuanthulab.net/asp-net-razor-ung-dung-ef-lam-viec-voi-co-so-du-lieu.html
    
 + Database
- change connection string in appsettings.json
run command
- dotnet ef database update

 + note:
- folder Areas is user functions template(no effect in project): login, logout, register, etc
- ModelsDemo: No effect in project, use as reference

# SWP-ComputerShop: a reference project, used as template
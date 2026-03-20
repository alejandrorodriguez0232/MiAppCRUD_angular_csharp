# install.ps1
Write-Host "=== INSTALACION DE APLICACION CRUD ===" -ForegroundColor Green

# Verificar .NET Core
Write-Host "Verificando .NET Core..." -ForegroundColor Yellow
dotnet --version
if ($LASTEXITCODE -ne 0) {
    Write-Host "Instalando .NET Core 6.0..." -ForegroundColor Red
    # Descargar e instalar .NET Core 6.0
    Invoke-WebRequest -Uri "https://download.visualstudio.microsoft.com/download/pr/0e18b0cb-731c-4d1a-93c3-1c183e78a9b2/63ebfdd1e8807cd4c7e0a64ed6f5f95b/dotnet-sdk-6.0.100-win-x64.exe" -OutFile "dotnet-sdk.exe"
    Start-Process -Wait -FilePath "dotnet-sdk.exe" -ArgumentList "/quiet"
    Remove-Item "dotnet-sdk.exe"
}

# Configurar base de datos
Write-Host "Configurando base de datos..." -ForegroundColor Yellow
Write-Host "Por favor, ejecute el script SQL en SQL Server Management Studio:" -ForegroundColor Cyan
Write-Host "Archivo: database/script.sql" -ForegroundColor Cyan
Read-Host "Presione Enter cuando haya ejecutado el script SQL"

# Configurar backend
Write-Host "Configurando backend..." -ForegroundColor Yellow
cd backend

# Actualizar cadena de conexión en appsettings.json
$appsettings = Get-Content "appsettings.json" -Raw | ConvertFrom-Json
$serverName = Read-Host "Ingrese el nombre de su servidor SQL Server (ej: localhost, .\SQLEXPRESS)"
$appsettings.ConnectionStrings.DefaultConnection = "Server=$serverName;Database=MiAppCRUDDB;Trusted_Connection=True;MultipleActiveResultSets=true;TrustServerCertificate=True"
$appsettings | ConvertTo-Json -Depth 3 | Set-Content "appsettings.json"

# Restaurar paquetes
dotnet restore

# Crear migraciones
dotnet ef migrations add InitialCreate

# Actualizar base de datos
dotnet ef database update

cd ..

Write-Host "=== INSTALACION COMPLETADA ===" -ForegroundColor Green

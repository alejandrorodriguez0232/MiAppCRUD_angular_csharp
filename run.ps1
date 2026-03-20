# run.ps1
Write-Host "=== INICIANDO APLICACION CRUD ===" -ForegroundColor Green

# Iniciar backend
Write-Host "Iniciando backend .NET Core..." -ForegroundColor Yellow
cd backend
Start-Process powershell -ArgumentList "-NoExit", "-Command", "dotnet run"
cd ..

# Esperar unos segundos para que el backend inicie
Start-Sleep -Seconds 5

# Obtener la URL del backend
$backendUrl = "https://localhost:7000"
$backendHttpUrl = "http://localhost:5000"

Write-Host "Backend iniciado en: $backendUrl" -ForegroundColor Green
Write-Host "Frontend disponible en: frontend/index.html" -ForegroundColor Green
Write-Host "Abriendo frontend en el navegador..." -ForegroundColor Yellow

# Abrir frontend en el navegador
Start-Process "frontend/index.html"

Write-Host "=== APLICACION INICIADA ===" -ForegroundColor Green
Write-Host "Para detener la aplicacion, cierre las ventanas de PowerShell" -ForegroundColor Yellow

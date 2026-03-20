# CONFIGURACIÓN DEL PROYECTO CRUD

## SOLUCIÓN A ERRORES DE CONFIGURACIÓN

### Problema Original
- Error: `System.IO.FileLoadException: Could not load file or assembly 'System.Runtime, Version=8.0.0.0'`
- Causa: Incompatibilidad entre .NET 6.0 y dependencias que requerían .NET 8.0

### Cambios Realizados

#### 1. Actualizar backend.csproj
```xml
<!-- Antes -->
<TargetFramework>net6.0</TargetFramework>
<PackageReference Include="Microsoft.EntityFrameworkCore.SqlServer" Version="6.0.0" />
<PackageReference Include="Microsoft.EntityFrameworkCore.Tools" Version="6.0.0" />

<!-- Después -->
<TargetFramework>net8.0</TargetFramework>
<PackageReference Include="Microsoft.EntityFrameworkCore.SqlServer" Version="8.0.0" />
<PackageReference Include="Microsoft.EntityFrameworkCore.Tools" Version="8.0.0" />
```

#### 2. Actualizar URL en frontend/app.js
```javascript
// Antes
var apiUrl = 'https://localhost:7085/api/productos';

// Después  
var apiUrl = 'http://localhost:5001/api/productos';
```

## COMANDOS PARA LEVANTAR EL PROYECTO

### 1. Limpiar y Restaurar
```powershell
cd backend
dotnet clean
dotnet restore
```

### 2. Matar Procesos Anteriores (si es necesario)
```powershell
# Verificar procesos backend.exe
tasklist /fi "imagename eq backend.exe"

# Matar proceso si está activo (reemplazar PID)
taskkill /f /pid [PID_DEL_PROCESO]

# O matar todos los procesos backend.exe
taskkill /f /im backend.exe
```

### 3. Iniciar Backend
```powershell
cd backend
dotnet run --urls "http://localhost:5001"
```

### 4. Iniciar Frontend
```powershell
# Abrir en navegador
start "frontend/index.html"
```

## VERIFICACIÓN

### Backend
- URL: http://localhost:5001
- Swagger: http://localhost:5001/swagger
- API Endpoint: http://localhost:5001/api/productos

### Frontend
- Archivo: frontend/index.html
- Se conecta automáticamente al backend

## PUERTOS UTILIZADOS
- Backend: 5001 (HTTP)
- Frontend: Archivo local (no requiere puerto)

## NOTAS IMPORTANTES
- Se cambió de HTTPS a HTTP para evitar problemas de certificado
- Se actualizó .NET 6.0 a 8.0 para resolver conflictos de ensamblados
- Entity Framework actualizado a versión 8.0.0 compatible

## EJECUCIÓN COMPLETA
```powershell
# 1. Ir al directorio del backend
cd backend

# 2. Limpiar y restaurar
dotnet clean
dotnet restore

# 3. Iniciar backend
dotnet run --urls "http://localhost:5001"

# 4. En otra terminal, abrir frontend
start "frontend/index.html"
```

El proyecto ahora funciona correctamente sin errores de System.Runtime.

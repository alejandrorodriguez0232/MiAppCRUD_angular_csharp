# Aplicación CRUD Completa - AngularJS + .NET Core + SQL Server

Una aplicación web completa de gestión de productos con operaciones CRUD (Crear, Leer, Actualizar, Eliminar) utilizando AngularJS en el frontend y .NET Core Web API con Entity Framework en el backend, conectado a SQL Server.

## 📁 Estructura del Proyecto

```
MiAppCRUD/
├── backend/
│   ├── Controllers/
│   │   └── ProductosController.cs
│   ├── Models/
│   │   ├── Producto.cs
│   │   └── MiAppDbContext.cs
│   ├── appsettings.json
│   ├── Program.cs
│   ├── backend.csproj
│   └── [archivos generados por .NET]
├── frontend/
│   ├── index.html
│   ├── app.js
│   └── style.css
├── database/
│   └── script.sql
├── install.ps1
├── run.ps1
├── README.md
└── MiAppCRUD.sln
```

## 🚀 Requisitos Previos

- **.NET Core 6.0 SDK** o superior
- **SQL Server** (local o SQL Server Express)
- **SQL Server Management Studio** (SSMS) para ejecutar el script de la base de datos
- **PowerShell** (como Administrador)

## 📋 Instalación Paso a Paso

### 1. Clonar/Descargar el Proyecto

El proyecto ya está creado en: `C:\Users\Luis\Escritorio\MiAppCRUD`

### 2. Configurar la Base de Datos

1. Abre **SQL Server Management Studio**
2. Conéctate a tu instancia de SQL Server
3. Ejecuta el script SQL ubicado en: `database/script.sql`

Este script creará:
- La base de datos `MiAppCRUDDB`
- La tabla `Productos`
- Datos de ejemplo iniciales

### 3. Ejecutar el Script de Instalación

Abre PowerShell **como Administrador** y ejecuta:

```powershell
cd "C:\Users\Luis\Escritorio\MiAppCRUD"
.\install.ps1
```

El script de instalación:
- Verificará que .NET Core esté instalado
- Te pedirá el nombre de tu servidor SQL Server
- Configurará la cadena de conexión
- Restaurará los paquetes NuGet
- Creará las migraciones de Entity Framework
- Actualizará la base de datos

### 4. Ejecutar la Aplicación

Una vez completada la instalación, ejecuta:

```powershell
.\run.ps1
```

Esto iniciará:
- El backend .NET Core en `https://localhost:7000`
- El frontend AngularJS en tu navegador

## 🔧 Configuración Manual (si es necesario)

### Cambiar Servidor SQL

Si necesitas cambiar el servidor SQL después de la instalación, edita el archivo:
`backend/appsettings.json`

```json
{
  "ConnectionStrings": {
    "DefaultConnection": "Server=TU_SERVIDOR;Database=MiAppCRUDDB;Trusted_Connection=True;MultipleActiveResultSets=true;TrustServerCertificate=True"
  }
}
```

### Cambiar Puertos del Backend

Los puertos por defecto son:
- HTTPS: `https://localhost:7000`
- HTTP: `http://localhost:5000`

Para cambiarlos, edita: `backend/Properties/launchSettings.json`

## 🌐 Endpoints de la API

| Método | URL | Descripción |
|--------|-----|-------------|
| GET | `/api/productos` | Obtener todos los productos |
| GET | `/api/productos/{id}` | Obtener un producto específico |
| POST | `/api/productos` | Crear un nuevo producto |
| PUT | `/api/productos/{id}` | Actualizar un producto existente |
| DELETE | `/api/productos/{id}` | Eliminar un producto |

## 📱 Funcionalidades del Frontend

- **Formulario intuitivo** para crear/editar productos
- **Tabla responsive** con todos los productos
- **Validación de campos** requeridos
- **Confirmación** para eliminaciones
- **Navegación suave** entre secciones
- **Diseño moderno** con gradientes y animaciones

## 🛠️ Tecnologías Utilizadas

### Backend
- **.NET Core 6.0** - Framework principal
- **Entity Framework Core 6.0** - ORM para base de datos
- **SQL Server** - Base de datos relacional
- **ASP.NET Core Web API** - API RESTful
- **Swagger/OpenAPI** - Documentación de API

### Frontend
- **AngularJS 1.8.2** - Framework JavaScript
- **HTML5** - Estructura semántica
- **CSS3** - Estilos modernos con gradientes
- **JavaScript ES6** - Lógica de la aplicación

## 🔍 Solución de Problemas Comunes

### Error de Conexión a SQL Server

```powershell
# Verificar si SQL Server está corriendo
Get-Service MSSQLSERVER

# Si no está corriendo, iniciarlo
Start-Service MSSQLSERVER
```

### Error de Certificado HTTPS

```powershell
# Confiar en el certificado de desarrollo de .NET
dotnet dev-certs https --trust
```

### Verificar Puertos Disponibles

```powershell
# Verificar puerto 7000
netstat -ano | findstr :7000

# Verificar puerto 5000
netstat -ano | findstr :5000
```

### Error de Migraciones

Si las migraciones fallan, elimina la base de datos y vuelve a crearla:

```powershell
cd backend
dotnet ef database drop
dotnet ef database update
```

## 📝 Notas Importantes

- La aplicación utiliza **autenticación Windows** para SQL Server (`Trusted_Connection=True`)
- El **CORS** está configurado para permitir cualquier origen (solo para desarrollo)
- Los datos de ejemplo se insertan automáticamente al ejecutar el script SQL
- La aplicación es **totalmente responsive** y funciona en dispositivos móviles

## 🤝 Contribuciones

Si encuentras algún error o quieres mejorar la aplicación, siéntete libre de hacer un fork y enviar un pull request.

## 📄 Licencia

Este proyecto es para fines educativos y de demostración.

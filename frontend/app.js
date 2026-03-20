angular.module('miAppCRUD', [])
.controller('ProductoController', ['$http', function($http) {
    var vm = this;
    vm.productos = [];
    vm.producto = {};
    vm.editando = false;
    
    var apiUrl = 'http://localhost:5001/api/productos'; // Cambia el puerto según tu configuración
    
    // Cargar todos los productos
    vm.cargarProductos = function() {
        $http.get(apiUrl)
            .then(function(response) {
                vm.productos = response.data;
            })
            .catch(function(error) {
                console.error('Error al cargar productos:', error);
                alert('Error al cargar los productos');
            });
    };
    
    // Guardar producto (crear o actualizar)
    vm.guardarProducto = function() {
        if (!vm.producto.Nombre || !vm.producto.Precio || !vm.producto.Stock) {
            alert('Por favor complete todos los campos requeridos');
            return;
        }
        
        if (vm.editando) {
            // Actualizar producto existente
            $http.put(apiUrl + '/' + vm.producto.Id, vm.producto)
                .then(function() {
                    vm.cargarProductos();
                    vm.cancelarEdicion();
                    alert('Producto actualizado correctamente');
                })
                .catch(function(error) {
                    console.error('Error al actualizar producto:', error);
                    alert('Error al actualizar el producto');
                });
        } else {
            // Crear nuevo producto
            $http.post(apiUrl, vm.producto)
                .then(function() {
                    vm.cargarProductos();
                    vm.producto = {};
                    alert('Producto creado correctamente');
                })
                .catch(function(error) {
                    console.error('Error al crear producto:', error);
                    alert('Error al crear el producto');
                });
        }
    };
    
    // Editar producto
    vm.editarProducto = function(producto) {
        vm.producto = angular.copy(producto);
        vm.editando = true;
        // Scroll al formulario
        document.querySelector('.form-container').scrollIntoView({ behavior: 'smooth' });
    };
    
    // Eliminar producto
    vm.eliminarProducto = function(id) {
        if (confirm('¿Está seguro de eliminar este producto?')) {
            $http.delete(apiUrl + '/' + id)
                .then(function() {
                    vm.cargarProductos();
                    alert('Producto eliminado correctamente');
                })
                .catch(function(error) {
                    console.error('Error al eliminar producto:', error);
                    alert('Error al eliminar el producto');
                });
        }
    };
    
    // Cancelar edición
    vm.cancelarEdicion = function() {
        vm.producto = {};
        vm.editando = false;
    };
    
    // Inicializar
    vm.cargarProductos();
}]);

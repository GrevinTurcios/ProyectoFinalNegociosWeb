function agregarAlCarrito(producto) {
    if (!producto || !producto.id || !producto.stock) {
        console.error('Datos del producto inválidos:', producto);
        return;
    }

    // Obtener el carrito, la cantidad total y el total final del localStorage
    let carrito = localStorage.getItem('carrito');
    let cantidadTotal = parseInt(localStorage.getItem('cantidadTotal')) || 0;
    let totalFinal = parseFloat(localStorage.getItem('totalFinal')) || 0;

    // Si el carrito no existe en localStorage, inicializarlo como un array vacío
    if (carrito === null) {
        carrito = [];
    } else {
        // Parsear el carrito de JSON a un objeto JavaScript
        carrito = JSON.parse(carrito);
    }
    
    // Buscar el producto en el carrito
    let productoEnCarrito = carrito.find(p => p.id === producto.id);
    
    if (productoEnCarrito) {
        // Si el producto ya está en el carrito, verificar el stock disponible
        if (productoEnCarrito.cantidad + 1 > producto.stock) {
            console.error('No hay suficiente stock para agregar más del producto:', producto);
            return;
        }
        // Actualizar la cantidad y recalcular el subtotal
        totalFinal -= productoEnCarrito.subtotal; // Restar el subtotal actual del total final
        productoEnCarrito.cantidad += 1;
        productoEnCarrito.subtotal = productoEnCarrito.cantidad * producto.precio;
        totalFinal += productoEnCarrito.subtotal; // Sumar el nuevo subtotal al total final
    } else {
        // Si el producto no está en el carrito, verificar el stock disponible
        if (1 > producto.stock) {
            console.error('No hay suficiente stock para agregar el producto:', producto);
            return;
        }
        // Agregar el producto con cantidad 1 y calcular el subtotal
        carrito.push({
            id: producto.id,
            nombre: producto.nombre,
            imagen: producto.imagen,
            precio: producto.precio,
            stock: producto.stock,
            cantidad: 1,
            subtotal: producto.precio
        });
        totalFinal += producto.precio; // Agregar el subtotal del nuevo producto al total final
    }
    
    // Aumentar la cantidad total de productos
    cantidadTotal += 1;

    // Guardar el carrito, la cantidad total y el total final actualizados en localStorage
    localStorage.setItem('carrito', JSON.stringify(carrito));
    localStorage.setItem('cantidadTotal', cantidadTotal.toString());
    localStorage.setItem('totalFinal', totalFinal.toFixed(2).toString()); // Guardar el total final con dos decimales
    console.log('Carrito actualizado:', carrito);
    console.log('Cantidad total actualizada:', cantidadTotal);
    console.log('Total final actualizado:', totalFinal.toFixed(2));
}

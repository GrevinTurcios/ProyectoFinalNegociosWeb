// script.js
document.addEventListener('DOMContentLoaded', function() {
    
        actualizarContadorCarrito();
    
        actualizarTablaCarrito();
    
        actualizarTotalFinal();
    
    
    

    // Función para actualizar la tabla del carrito
    function actualizarTablaCarrito() {
        let carrito = JSON.parse(localStorage.getItem('carrito')) || [];
        let carritoBody = document.getElementById('carrito-body');
        carritoBody.innerHTML = ''; // Limpiar la tabla

        carrito.forEach(producto => {
            let row = document.createElement('tr');

            let cellImagen = document.createElement('td');
            let img = document.createElement('img');
            img.src = producto.imagen;
            img.width = 50; // Ajustar el tamaño de la imagen
            cellImagen.appendChild(img);

            let cellNombre = document.createElement('td');
            cellNombre.textContent = producto.nombre;

            let cellPrecio = document.createElement('td');
            cellPrecio.textContent = `$${producto.precio.toFixed(2)}`;

            let cellCantidad = document.createElement('td');
            let minusButton = document.createElement('button');
            minusButton.textContent = '-';
            minusButton.className = 'minus';
            minusButton.onclick = () => cambiarCantidad(producto.id, -1);
            let plusButton = document.createElement('button');
            plusButton.textContent = '+';
            plusButton.className = 'plus';
            plusButton.onclick = () => cambiarCantidad(producto.id, 1);
            cellCantidad.appendChild(minusButton);
            cellCantidad.appendChild(document.createTextNode(` ${producto.cantidad} `));
            cellCantidad.appendChild(plusButton);

            let cellSubtotal = document.createElement('td');
            cellSubtotal.textContent = `$${producto.subtotal.toFixed(2)}`;

            row.appendChild(cellImagen);
            row.appendChild(cellNombre);
            row.appendChild(cellPrecio);
            row.appendChild(cellCantidad);
            row.appendChild(cellSubtotal);

            carritoBody.appendChild(row);
        });
    }

    // Función para cambiar la cantidad de un producto en el carrito
    function cambiarCantidad(productoId, cambio) {
        let carrito = JSON.parse(localStorage.getItem('carrito')) || [];
        let cantidadTotal = parseInt(localStorage.getItem('cantidadTotal')) || 0;
        let totalFinal = parseFloat(localStorage.getItem('totalFinal')) || 0;

        let producto = carrito.find(p => p.id === productoId);

        if (producto) {
            let nuevaCantidad = producto.cantidad + cambio;
            if (nuevaCantidad <= 0) {
                carrito = carrito.filter(p => p.id !== productoId);
                cantidadTotal -= producto.cantidad;
                totalFinal -= producto.subtotal;
            } else if (nuevaCantidad <= producto.stock) {
                cantidadTotal += cambio;
                totalFinal += cambio * producto.precio;
                producto.cantidad = nuevaCantidad;
                producto.subtotal = nuevaCantidad * producto.precio;
            } else {
                alert('No hay suficiente stock disponible');
                return;
            }

            localStorage.setItem('carrito', JSON.stringify(carrito));
            localStorage.setItem('cantidadTotal', cantidadTotal.toString());
            localStorage.setItem('totalFinal', totalFinal.toFixed(2).toString());
            actualizarTablaCarrito();
            actualizarContadorCarrito(); // Llamar a la función para actualizar el contador
            actualizarTotalFinal(); // Llamar a la función para actualizar el total final
        }
        
    }

    // Función para actualizar el contador del carrito
    function actualizarContadorCarrito() {
        // Obtener la cantidad total de productos desde localStorage
        let cantidadTotal = parseInt(localStorage.getItem('cantidadTotal')) || 0;

        // Mostrar "10+" si la cantidad es mayor que 10, de lo contrario mostrar la cantidad exacta
        let contador = cantidadTotal > 10 ? '10+' : cantidadTotal;

        // Actualizar el contenido del contador
        document.getElementById('carrito-count').textContent = contador;
    }

    // Función para actualizar el total final
    function actualizarTotalFinal() {
        let totalFinal = parseFloat(localStorage.getItem('totalFinal')) || 0;
        document.getElementById('total-final').textContent = totalFinal.toFixed(2);
    }
    
    
});

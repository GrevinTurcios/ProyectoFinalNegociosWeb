<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="public/css/catalogo.css">
    <link rel="stylesheet" href="public/css/carrito.css">
    <script src="/{{BASE_DIR}}/public/js/scripts.js" crossorigin="anonymous"></script>
    <title>Carrito</title>
    <br>
</head>
<div class="background-video">
        <video autoplay muted loop>
            <source src="public/videos/carretilla.mp4" type="video/mp4">
            Tu navegador no soporta el elemento de video.
        </video>
    </div>
<body>
    
    <h1>Carrito de Compras</h1>
    <br>
    <table id="carrito-table">
        <thead>
            <tr>
                <th>Imagen</th>
                <th>Nombre</th>
                <th>Precio</th>
                <th>Cantidad</th>
                <th>Subtotal</th>
            </tr>
        </thead>
        <tbody id="carrito-body">
            <!-- Productos del carrito -->
        </tbody>
    </table>
    <div id="total-container">
        <h2>Total: $<span id="total-final">0.00</span></h2>
    </div>
    <form id="checkoutForm" method="post" action="index.php?page=checkout_checkout">
    <input type="hidden" name="totalFinal" id="totalFinal">
<button type="submit" id="pagar-button">Pagar</button>
    </form>
    
</body>
</html>

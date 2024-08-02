<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="public/css/catalogo.css">
    <style>
        .card {
            position: relative;
            padding: 10px;
        }
        .card .btn-circle {
            width: 30px;
            height: 30px;
            padding: 6px 0;
            border-radius: 15px;
            text-align: center;
            font-size: 12px;
            line-height: 1.428571429;
            position: absolute;
            top: 10px;
            right: 10px;
        }
        .card-img-top {
            position: relative;
        }
        
    </style>
</head>
<body>
    <div class="background-video">
        <video autoplay muted loop>
            <source src="public/videos/Catalogo.mp4" type="video/mp4">
            Tu navegador no soporta el elemento de video.
        </video>
    </div>
    
    <div class="container">
        <br>
        <br>
        <br>
        <h1>Catálogo de productos</h1>
        <br>
        <br>
        <div class="container-l">
            <div class="row">
                <div class="col-12">
                    <div class="row">
                        {{foreach Catalogo}}
                        <div class="col-3">
                            <div class="card">
                                <img src="{{imagen}}" class="card-img-top" alt="{{nombre}}">
                                <button class="btn btn-primary btn-circle" onclick='agregarAlCarrito({ "id": "{{id}}", "nombre": "{{nombre}}", "imagen": "{{imagen}}","stock": "{{stock}}", "precio": {{precio}} })'>+</button>
                                <h2>{{nombre}}</h2>
                                <div><span>Precio {{precio}} LP</span></div>
                            </div>
                        </div>
                        {{endfor Catalogo}}
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
<script src="../PF2/src/js/script.js"></script>
</html>


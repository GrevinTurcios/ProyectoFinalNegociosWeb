<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lista de productos</title>
    <link rel="stylesheet" href="public/css/mantenimiento.css"> <!-- Ajusta según sea necesario -->
</head>
<body>
    <div class="background-video">
        <video autoplay muted loop>
            <source src="public/videos/Lista.mp4" type="video/mp4">
            Your browser does not support the video tag.
        </video>
    </div>
    <section class="container-l WWList center-content">
        <section class="depth-6">
            <h2>Lista de productos</h2>
            <section class="grid">
                <form action="index.php?page=Mantenimiento-Catalogo-Catalogos" method="post" class="row">
                    <input class="col-8" type="text" name="search" placeholder="Buscar por nombre" value="{{search}}">
                    <button class="col-4" type="submit"><i class="fa-solid fa-magnifying-glass"></i> &nbsp;Buscar</button>
                </form>
            </section>
        </section>
        <div class="table-container">
            <table class="tabla">
                <thead>
                    <tr>
                        <th>Id</th>
                        <th>Nombre</th>
                        <th>Imagen</th>
                        <th>Categoría</th>
                        <th>Precio</th>
                        <th>Stock</th>
                        <th>Estado</th>
                        {{if mnt_catalogo_new}}
                        <th><a href="index.php?page=Mantenimiento-Catalogo-Catalogo&mode=INS">
                            <i class="fa-solid fa-file-circle-plus"></i>
                            &nbsp; Nuevo producto</a></th>
                        {{endif mnt_catalogo_new}}
                    </tr>
                </thead>
                <tbody>
                    {{foreach catalogo}}
                    <tr>
                        <td>{{id}}</td>
                        <td><a href="index.php?page=Mantenimiento-Catalogo-Catalogo&mode=DSP&id={{id}}"><i class="fa-solid fa-eye"></i> &nbsp;{{name}}</a></td>
                        <td><img src="{{imagen}}" alt="Imagen del producto"></td>
                        <td>{{category_name}}</td>
                        <td>{{price}}</td>
                        <td>{{stock}}</td>
                        <td>{{status}}</td>
                        <td class="center">
                            {{if ~mnt_catalogo_upt}}
                            <a href="index.php?page=Mantenimiento-Catalogo-Catalogo&mode=UPD&id={{id}}">
                                <i class="fa-solid fa-pen"></i> &nbsp; Editar
                            </a>
                            &nbsp;
                            {{endif ~mnt_catalogo_upt}}
                            {{if ~mnt_catalogo_del}}
                            &nbsp;
                            <a href="index.php?page=Mantenimiento-Catalogo-Catalogo&mode=DEL&id={{id}}">
                                <i class="fa-solid fa-trash-can"></i> &nbsp;
                                Eliminar
                            </a>
                            {{endif ~mnt_catalogo_del}}
                        </td>
                    </tr>
                    {{endfor catalogo}}
                </tbody>
                <tfoot>
                    <tr>
                        <td colspan="6">Total de registros: {{total}}</td>
                    </tr>
                </tfoot>
            </table>
        </div>
    </section>
</body>
</html>


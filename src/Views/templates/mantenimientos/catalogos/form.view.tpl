<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Editar Producto</title>
    <link rel="stylesheet" href="public/css/mantenimiento.css">
</head>
<body>
    <div class="background-video">
        <video autoplay muted loop>
            <source src="public/videos/Lista.mp4" type="video/mp4">
            Your browser does not support the video tag.
        </video>
    </div>
    <section class="container-F px-4 py-4">
<section class="grid">
            <section class="row">
                <h2 class="col-12 col-m-6 offset-m-3 depth-1 p-4">{{modeDsc}}</h2>
            </section>
        </section>
        <section class="grid">
            <section class="row my-4">
                <form class="col-12 col-m-6 offset-m-3 depth-1" action="index.php?page=Mantenimiento-Catalogo-Catalogo&mode={{mode}}&id={{id}}" method="POST">
                    <input type="hidden" name="id" value="{{id}}">
                    <input type="hidden" name="xsrftk" value="{{xsrftk}}">
                    <input type="hidden" name="mode" value="{{mode}}">
                    <div class="row my-4">
                        <label class="col-4" for="prdprd">Código:</label>
                        <input class="col-8" type="text" name="prdprd" id="prdprd" value="{{id}}" readonly>
                    </div>
                    <div class="row my-4">
                        <label class="col-4" for="prddsc">Descripción:</label>
                        <input class="col-8" type="text" name="name" id="prddsc" value="{{name}}" required {{isReadOnly}}>
                        {{with errors}}
                            {{if error_name}}
                                {{foreach error_name}}
                                    <div class="col-12 error">{{this}}</div>
                                {{endfor error_name}}
                            {{endif error_name}}
                        {{endwith errors}}
                    </div>
                    <div class="row my-4">
                        <label class="col-4" for="prdimg">Imagen:</label>
                        <input class="col-8" type="text" name="imagen" id="prdimg" value="{{imagen}}" required {{isReadOnly}}>
                        {{with errors}}
                            {{if error_imagen}}
                                {{foreach error_imagen}}
                                    <div class="col-12 error">{{this}}</div>
                                {{endfor error_imagen}}
                            {{endif error_imagen}}
                        {{endwith errors}}
                    </div>
                    <div class="row my-4">
                        <label class="col-4" for="category">Categoría:</label>
                        <select class="col-8" type="text" name="category" id="category" {{if isReadOnly}} readonly enabled {{endif isReadOnly}}>
                            {{foreach categories}}
                                <option value="{{category_id}}" {{categorySelected}}>{{category_name}}</option>
                            {{endfor categories}}
                        </select>   
                        {{with errors}}
                            {{if error_category}}
                                {{foreach error_category}}
                                    <div class="col-12 error">{{this}}</div>
                                {{endfor error_category}}
                            {{endif error_category}}
                        {{endwith errors}}
                    </div>
                    <div class="row my-4">
                        <label class="col-4" for="prdprc">Precio:</label>
                        <input class="col-8" type="number" name="price" id="prdprc" value="{{price}}" required {{isReadOnly}}>
                        {{with errors}}
                            {{if error_price}}
                                {{foreach error_price}}
                                    <div class="col-12 error">{{this}}</div>
                                {{endfor error_price}}
                            {{endif error_price}}
                        {{endwith errors}}
                    </div>
                    <div class="row my-4">
                        <label class="col-4" for="prdctd">Cantidad:</label>
                        <input class="col-8" type="number" name="stock" id="prdctd" value="{{stock}}" required {{isReadOnly}}>
                        {{with errors}}
                            {{if error_stock}}
                                {{foreach error_stock}}
                                    <div class="col-12 error">{{this}}</div>
                                {{endfor error_stock}}
                            {{endif error_stock}}
                        {{endwith errors}}
                    </div>
                    <div class="row my-4">
                        <label class="col-4" for="prdest">Estado:</label>
                        <select class="col-8" name="status" id="prdest" required {{if isReadOnly}} readonly enabled {{endif isReadOnly}}>
                            <option value="ACT" {{prdestACT}}>Activo</option>
                            <option value="INA" {{prdestINA}}>Inactivo</option>
                        </select>
                        {{with errors}}
                            {{if error_status}}
                                {{foreach error_status}}
                                    <div class="col-12 error">{{this}}</div>
                                {{endfor error_status}}
                            {{endif error_status}}
                        {{endwith errors}}
                    </div>
                    <div class="row flex-end">
                        {{ifnot isDisplay}}
                            <button type="submit" class="primary mx-2">
                                <i class="fa-solid fa-check"></i>&nbsp;
                                Guardar
                            </button>
                        {{endifnot isDisplay}}
                        <button type="button" onclick="window.location='index.php?page=Mantenimiento-Catalogo-Catalogos'">
                            <i class="fa-solid fa-xmark"></i>
                            Cancelar
                        </button>
                    </div>
                </form>
            </section>
        </section>
    </section>
</body>
</html>
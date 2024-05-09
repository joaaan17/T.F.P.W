var carrito = []; // Array que contendrá los objetos que son los productos
var producto = new Object();

function anadirCarrito(id, nombre, precio, cantidad, talla) {

    carrito = JSON.parse(localStorage.getItem('mi-carrito-almacenado')) || [];

    let img = document.querySelector('.IMGproducto[data-producto-id="' + id + '"]');
    srcImagen = img.src;

    producto.codigo = id; 
    producto.nombre = nombre; 
    producto.cantidad = cantidad; 
    producto.precio = precio; 
    producto.talla = talla;
    producto.img = srcImagen;


    let ok = revisarCarrito(producto.codigo);

    if(ok == false)
        carrito.push(producto); 

    alert("Producto añadido al carrito")
    console.log("Se ha añadido al carrito: ", producto);

    guardarCarrito();

    cargarCarrito();
}

var carrito = null;

function cargarCarrito() {
    console.log("paso");
    if (carrito === null) { // Si no hemos cargado todavía el carrito
        carrito = JSON.parse(localStorage.getItem("mi-carrito-almacenado"));

        if (carrito === null) { // Si no existía carrito almacenado
            carrito = []; // Creamos un vector vacío
        }
    }

    mostrarCarroVacio();

    for (let i = 0; i < carrito.length; i++)
        mostrarItem(carrito[i]);
        
    precioCarritoTotal();
}

function guardarCarrito() {
    localStorage.setItem("mi-carrito-almacenado", JSON.stringify(carrito));
}

function vaciarCarrito() {
    carrito = [];

    guardarCarrito();

    mostrarCarroVacio();
    precioCarritoTotal();
}

function revisarCarrito(ident){
    let j = 0; 
    ok = false;

    while(j < carrito.length && ok == false) {
        if (carrito[j].codigo === ident) {
            carrito[j].cantidad++;
            ok = true;
        }
        
        j++;
    }
    return ok;
}

function mostrarItem(producto){
    console.log("paso2");
    const listaCarrito = document.getElementById('listaCarrito'); // Obtener la lista del DOM
    listaCarrito.classList.add('container');

    // Crear el elemento base
    let itemCarrito = document.createElement('div');
    itemCarrito.classList.add('containerAdmin');

    // Crear la imagen
    const row = document.createElement('div');
    const col1 = document.createElement('div');
    col1.classList.add('col-lg-2', 'col-sm-2', 'd-flex', 'justify-content-center', 'align-items-center');
    row.classList.add('row');
    const imagen2 = document.createElement('img');
    imagen2.src = producto.img;  
    imagen2.style.width = '160px';
    imagen2.style.position = 'relative';
    imagen2.style.left = '-3px';
    col1.appendChild(imagen2);
    row.appendChild(col1);

    // Crear elementos para nombre, talla, precio y botones
    const col2 = document.createElement('div');
    col2.classList.add('col-lg-3', 'col-sm-5', 'd-flex', 'justify-content-center', 'align-items-center');
    const nombre2 = document.createElement('p');
    nombre2.classList.add('textAdmin2');
    nombre2.textContent = producto.nombre;
    col2.appendChild(nombre2);
    row.appendChild(col2);

    const col3 = document.createElement('div');
    col3.classList.add('col-lg-1', 'col-sm-1', 'd-flex', 'justify-content-center', 'align-items-center');
    const talla2 = document.createElement('p');
    talla2.classList.add('textAdmin2');
    talla2.textContent = producto.talla;
    col3.appendChild(talla2);
    row.appendChild(col3);

    const col4 = document.createElement('div');
    col4.classList.add('col-lg-3', 'col-sm-3', 'd-flex', 'justify-content-center', 'align-items-center');
    const precio2 = document.createElement('p');
    precio2.classList.add('textAdmin2');
    precio2.textContent = `${producto.precio}€`;
    col4.appendChild(precio2);
    row.appendChild(col4);

    const col5 = document.createElement('div');
    col5.classList.add('col-lg-3', 'col-sm-1', 'd-flex', 'justify-content-center', 'align-items-center');
    const bot = document.createElement('div');
    bot.classList.add('button-container', 'carrito');
    const cantidadContenedor = document.createElement('div');
    cantidadContenedor.classList.add('button-group');

    const decrementar = document.createElement('button');
    decrementar.classList.add('botonhover');
    decrementar.textContent = '-';
    cantidadContenedor.appendChild(decrementar);

    const cantidad2 = document.createElement('div');
    cantidad2.classList.add('cantidad');
    cantidad2.textContent = producto.cantidad;
    cantidadContenedor.appendChild(cantidad2);

    const incrementar = document.createElement('button');
    incrementar.classList.add('botonhover');
    incrementar.textContent = '+';
    cantidadContenedor.appendChild(incrementar);

    decrementar.addEventListener('click', function() {
            producto.cantidad--; 
            cantidad2.textContent = producto.cantidad; 
            precioCarritoTotal();

            if(producto.cantidad<=0)
                borrarItem(producto.codigo);
    });

    incrementar.addEventListener('click', function() {
        producto.cantidad++; 
        cantidad2.textContent = producto.cantidad; 
        precioCarritoTotal();
    });

    bot.appendChild(cantidadContenedor);
    col5.appendChild(bot);
    row.appendChild(col5);  
    
    itemCarrito.appendChild(row);
    listaCarrito.appendChild(itemCarrito);
}

function mostrarCarroVacio() {
    const listaCarritoVacia = document.getElementById('listaCarrito'); 
    listaCarritoVacia.innerHTML = ''; 
}

function precioCarritoTotal(){
    let preciotot=0;

    for (let i = 0; i < carrito.length; i++){
        preciotot += carrito[i].precio * carrito[i].cantidad;
    }

    const precioborrar = document.getElementById('preciototal'); 
    precioborrar.innerHTML = ''; 

    const precio = document.getElementById('preciototal');
    precio.classList.add('container');
    
    let itemPrecio = document.createElement('p');
    itemPrecio.classList.add('textAdmin2')
    itemPrecio.textContent = "Precio Total:" + preciotot + "€";

    precio.appendChild(itemPrecio);
}

function borrarItem(ident){

    for (let j = 0; j < carrito.length; j++) {
        if (carrito[j].codigo === ident) {
            indice = j;
            break; 
        }
    }

    carrito.splice(indice, 1);
    guardarCarrito();
    mostrarCarroVacio();

    for (let i = 0; i < carrito.length; i++)
        mostrarItem(carrito[i]);

    precioCarritoTotal();
}
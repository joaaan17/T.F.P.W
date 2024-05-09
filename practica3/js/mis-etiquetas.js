

class Pie extends HTMLElement {
    constructor() {
        super()
        this.innerHTML = `		<footer>
        <div id="footer" class="container-fluid">
          <div class="row">
            <div id="logoFooter" class="col-lg-3">
              <p id="TFPWfooter" style="color: #ffffff;">T.F.P.W</p>
            </div>
            <div id="contenedorFooter" class="col-lg-6" style="color: #ffffff;">
              <p id="TXTFooter">NuestrasRedesSociales</p>
            </div>
            <div class="col-lg-3">
              <img id="Instagram" class="Icono" src="Iconos/instagram.svg" alt="Instagram">
              <img id="Twitter" class="Icono" src="Iconos/twitter.svg" alt="Twitter">
            </div>
          </div>
        </div>
        <div id="Agradecimiento">
          <p>Muchas gracias por tu visita</p>
        </div>
      </footer>    
        `
    }
}
window.customElements.define('mi-pie', Pie);



class Menu2 extends HTMLElement {
  constructor() {
      super()
      this.innerHTML = `
      <nav class="navbar navbar-expand-sm bg-dark navbar-dark" >
			<div class="container-fluid d-flex justify-content-between">
			  <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#collapsibleNavbar">
				<span class="navbar-toggler-icon"></span>
			  </button>
			  <div class="collapse navbar-collapse">
				<ul class="navbar-nav">
				  <li class="nav-item">
					<a class="nav-link" href="administracion.php">Productos</a>
				  </li>
				  <li class="nav-item">
					<a class="nav-link" href="pedidos.php">Pedidos</a>
				  </li>
				<li class="nav-item">
				  <a class="nav-link" href="usuarios.php">Usuarios</a>
				</li>  
				</ul>
			  </div>
			  <div class="logo-container d-flex justify-content-center align-items-center"  >        
				<a id="logoMenu" class="navbar-brand" href="empresa1.html">T.F.P.W</a>
			  </div>  
			<nav>
			  <div class="navbar-icons-right">                      
          <a href="carrito.jsp">
            <img id="Cesta" class="Icono" src="Iconos/Cesta2.svg" alt="Cesta">
          </a>
          <a href="loginUsuario.jsp">
            <img id="Perfil" class="Icono" src="Iconos/Perfil2.svg" alt="Perfil">
          </a>
			  </div>
			</nav>
			</div>
			
		  </nav>
      
      
      `
  }
}
window.customElements.define('mi-menu2', Menu2);

class Autenticacion extends HTMLElement {
  constructor() {
      super()
      this.innerHTML = `
          <form action="/action_page.php" class="was-validated">
      <div class="mb-3 mt-3">
        <label for="uname" class="form-label"><span class="colorUsername"> Username:</span></label>
        <input type="text" class="form-control" id="uname" placeholder="Enter username" name="uname" required>
        <div class="valid-feedback">Valid.</div>
        <div class="invalid-feedback">Please fill out this field.</div>
      </div>
      <div class="mb-3">
        <label for="pwd" class="form-label"><span class="colorUsername"> Password:</span></label>
        <input type="password" class="form-control" id="pwd" placeholder="Enter password" name="pswd" required>
        <div class="valid-feedback">Valid.</div>
        <div class="invalid-feedback">Please fill out this field.</div>
      </div>
      <div class="form-check mb-3">
        <input class="form-check-input" type="checkbox" id="myCheck" name="remember" required>
        <label class="form-check-label" for="myCheck">I agree on blabla.</label>
        <div class="valid-feedback">Valid.</div>
        <div class="invalid-feedback">Check this checkbox to continue.</div>
      </div>
      <button type="submit" class="btn btn-outline-secondary">Submit</button>    </form>
      <br><br>
      
      
      `
  }
}
window.customElements.define('mi-autenticacion', Autenticacion);


class Carousel extends HTMLElement {
  constructor() {
      super()
      this.innerHTML = `
      <div id="demo" class="carousel slide" data-bs-ride="carousel">

      <!-- Indicators/dots -->
      <div class="carousel-indicators">
        <button type="button" data-bs-target="#demo" data-bs-slide-to="0" class="active"></button>
        <button type="button" data-bs-target="#demo" data-bs-slide-to="1"></button>
        <button type="button" data-bs-target="#demo" data-bs-slide-to="2"></button>
      </div>
      
      <!-- The slideshow/carousel -->
      <div class="carousel-inner">
        <div class="carousel-item active">
        <img src="./Imagenes/lacoste.jpg" alt="Los Angeles" class="d-block" style="width:100%">
        </div>
        <div class="carousel-item">
        <img src="./Imagenes/lacoste.jpg" alt="Chicago" class="d-block" style="width:100%">
        </div>
        <div class="carousel-item">
        <img src="./Imagenes/lacoste.jpg" alt="New York" class="d-block" style="width:100%">
      
        </div>
      </div>
      
      <!-- Left and right controls/icons -->
      <button class="carousel-control-prev" type="button" data-bs-target="#demo" data-bs-slide="prev">
        <span class="carousel-control-prev-icon"></span>
      </button>
      <button class="carousel-control-next" type="button" data-bs-target="#demo" data-bs-slide="next">
        <span class="carousel-control-next-icon"></span>
      </button>
      </div>
      `
  }
}
window.customElements.define('mi-carousel', Carousel);

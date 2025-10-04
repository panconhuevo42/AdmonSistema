<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Alimentación Balanceada</title>
  <link rel="stylesheet" href="styles/styles.css">
</head>
<body>

  <!-- Overlay para mejorar contraste si es necesario -->
  <div class="background-overlay"></div>

  <header class="encabezado">
    <!-- Texto centrado -->
    <div class="titulo">
      <h1>Alimentación Balanceada desde la base hasta la punta de la pirámide</h1>
      <p>La mente es la planta que debes cuidar, pero el cuerpo es la tierra donde esta se cultiva</p>
    </div>
  </header>

  <nav class="navbar">
  <!-- Contenedor del logo -->
  <div class="nav-left">
    <a href="dashboard.jsp" class="nav-logo">
      <img src="imagenes/logo.png" alt="Logo del proyecto">
    </a>
  </div>

  <!-- Contenedor de los enlaces -->
  <div class="nav-right">
    <a href="#Base1">Nivel 1</a>
    <a href="#Base2">Nivel 2</a>
    <a href="#Base3">Nivel 3</a>
    <a href="#Base4">Nivel 4</a>
    <a href="#Base5">Nivel 5</a>
    <a href="login.jsp">Iniciar Sesión</a>
  </div>
</nav>

  <section class="hero">
    <h1>Eres lo que comes</h1>
    <p>La pirámide alimenticia es una representación gráfica que organiza los alimentos en niveles, indicando qué grupos deben consumirse en mayor o menor cantidad para llevar una dieta equilibrada.</p>
    <img src="imagenes/piramide alimenticia.png" alt="Imagen de la pirámide alimenticia">
  </section>

  <!-- Nivel 1 -->
  <section id="Base1" class="section">
    <h2>Frutas y Verduras</h2>
    <h3>Recomendaciones:</h3>
    <ul>
      <li>Consume una variedad de colores en frutas y verduras para asegurar una amplia gama de vitaminas, minerales y antioxidantes.</li>
      <li>Incluye vegetales de hoja verde (espinaca, lechuga, brócoli) y frutas ricas en vitamina C (naranjas, fresas).</li>
    </ul>

    <h3>Frecuencia:</h3>
    <ul>
      <li>5 a 7 porciones diarias. Se recomienda que la mitad del plato de cada comida esté compuesto por frutas o verduras.</li>
      <li>Distribución: Consúmelos en cada comida principal y, si es posible, como parte de snacks (por ejemplo, frutas frescas o ensaladas).</li>
    </ul>

    <div class="cards">
      <div class="card">
        <h3>Frutas</h3>
        <p>Ricas en vitaminas (como la vitamina C), minerales, fibra y antioxidantes. Aportan energía natural y deben ser consumidas a diario.</p>
      </div>
      <div class="card">
        <h3>Verduras</h3>
        <p>Aportan vitaminas, minerales, fibra y antioxidantes esenciales para la salud. Son bajas en calorías, por lo que pueden consumirse en grandes cantidades.</p>
      </div>
    </div>
  </section>

  <!-- Nivel 2 -->
  <section id="Base2" class="section">
    <h2>Carbohidratos</h2>
    <h3>Recomendaciones:</h3>
    <ul>
      <li>Opta por versiones integrales (pan integral, arroz integral, pasta integral) para aprovechar la fibra y los nutrientes adicionales.</li>
      <li>No sobrecargar las comidas con carbohidratos refinados, ya que esto puede llevar a un aumento de peso no saludable.</li>
    </ul>

    <h3>Frecuencia:</h3>
    <ul>
      <li>3 a 5 porciones diarias. Una porción equivale a una rebanada de pan, 1/2 taza de arroz o pasta cocida, o 1/2 taza de cereal.</li>
      <li>Distribución: Consúmelos en las comidas principales (desayuno, almuerzo, cena) y como snacks entre comidas (por ejemplo, avena o crackers integrales).</li>
    </ul>

    <div class="cards">
      <div class="card">
        <h3>Cereal</h3>
        <p>Fuentes de carbohidratos complejos que proporcionan energía sostenida, como avena, trigo y maíz. Son la base de la dieta y deben consumirse en grandes cantidades.</p>
      </div>
      <div class="card">
        <h3>Pan</h3>
        <p>Alimento básico rico en carbohidratos. Ofrece energía y es versátil, pero es mejor optar por versiones integrales para aprovechar sus nutrientes.</p>
      </div>
      <div class="card">
        <h3>Arroz</h3>
        <p>Un alimento rico en carbohidratos, especialmente el integral, que aporta fibra y energía. Es un básico en muchas culturas.</p>
      </div>
      <div class="card">
        <h3>Pasta</h3>
        <p>Fuente de carbohidratos que aporta energía rápida. Se recomienda en su versión integral por su mayor contenido de fibra y nutrientes.</p>
      </div>
    </div>
  </section>

  <!-- Nivel 3 -->
  <section id="Base3" class="section">
    <h2>Proteínas Animales y Vegetales</h2>
    <h3>Recomendaciones:</h3>
    <ul>
      <li>Incluye fuentes de proteínas magras, como pollo sin piel, pescado, huevos y legumbres para evitar el exceso de grasas saturadas.</li>
      <li>Limita el consumo de carnes rojas procesadas, que pueden ser altas en sodio y grasas saturadas.</li>
      <li>Para dietas basadas en plantas, las legumbres, tofu y tempeh son excelentes fuentes de proteínas.</li>
    </ul>

    <h3>Frecuencia:</h3>
    <ul>
      <li>2 a 3 porciones diarias. Una porción equivale a 100-150 gramos de carne, pescado o tofu.</li>
      <li>Distribución: Incluye una fuente de proteína en cada comida principal (desayuno, almuerzo y cena). Puedes añadir pequeñas porciones de frutos secos o semillas como snacks entre comidas.</li>
    </ul>

    <div class="cards">
      <div class="card">
        <h3>Proteínas Animales</h3>
        <p>Carne: Aporta proteínas, hierro y zinc. Mejor elegir carnes magras.</p>
        <p>Pescado: Fuente de proteínas y ácidos grasos omega-3, buenos para el corazón.</p>
        <p>Huevo: Ricos en proteínas completas y vitaminas esenciales como la B12.</p>
      </div>
      <div class="card">
        <h3>Proteínas Vegetales</h3>
        <p>Legumbres: Frijoles, lentejas y garbanzos, ricos en proteínas, fibra e hierro.</p>
        <p>Frutos secos y semillas: Almendras, nueces y chía, aportan proteínas y grasas saludables.</p>
        <p>Tofu y tempeh: Derivados de soja, con proteínas completas y bajos en grasa.</p>
      </div>
    </div>
  </section>

  <!-- Nivel 4 -->
  <section id="Base4" class="section">
    <h2>Lácteos y Grasas Saludables</h2>
    <h3>Recomendaciones:</h3>
    <ul>
      <li>Prefiere lácteos bajos en grasa o alternativas vegetales fortificadas con calcio, como la leche de almendra o soya.</li>
      <li>Consume grasas saludables como las provenientes de aguacates, aceite de oliva y frutos secos para mejorar la salud cardiovascular.</li>
    </ul>

    <h3>Frecuencia:</h3>
    <ul>
      <li>2 a 3 porciones diarias. Una porción de lácteos equivale a 1 taza de leche o yogur, o 30-40 gramos de queso.</li>
      <li>Distribución: Inclúyelos en las comidas principales, como un vaso de leche en el desayuno o una ensalada con aceite de oliva en el almuerzo. Las grasas saludables también pueden incorporarse como snacks (ej. puñado de nueces).</li>
    </ul>

    <div class="cards">
      <div class="card">
        <h3>Lácteos</h3>
        <p>Leche: Fuente de calcio, proteínas y vitaminas. Se recomienda leche baja en grasa o alternativas vegetales fortificadas.</p>
        <p>Yogur: Contiene probióticos que benefician la digestión y es una buena fuente de calcio y proteínas.</p>
        <p>Queso: Aporta proteínas y calcio, pero debe consumirse con moderación debido a su alto contenido en grasas saturadas.</p>
      </div>
      <div class="card">
        <h3>Grasas Saludables</h3>
        <p>Aceites vegetales: Aceite de oliva, aguacate y coco proporcionan grasas insaturadas, buenas para la salud cardiovascular.</p>
        <p>Frutos secos y semillas: Almendras, nueces y chía ofrecen ácidos grasos omega-3 y antioxidantes beneficiosos.</p>
      </div>
    </div>
  </section>

  <!-- Nivel 5 -->
  <section id="Base5" class="section">
    <h2>Azúcares y Dulces</h2>
    <h3>Recomendaciones:</h3>
    <ul>
      <li>Limita el consumo de alimentos y bebidas con azúcar añadida. Si consumes dulces, hazlo en pequeñas cantidades y no todos los días.</li>
      <li>Evita el consumo excesivo de refrescos azucarados y pasteles, que pueden contribuir a un aumento de peso no saludable.</li>
    </ul>

    <h3>Frecuencia:</h3>
    <ul>
      <li>2-3 veces por semana. Lo ideal es mantener el consumo de azúcares y dulces al mínimo, reservándolos para ocasiones especiales.</li>
      <li>Distribución: Opta por snacks bajos en azúcar entre comidas, y consume dulces solo de vez en cuando (por ejemplo, en celebraciones o como un pequeño postre tras una comida).</li>
    </ul>

    <div class="cards">
      <div class="card">
        <h3>Azúcares</h3>
        <p>Azúcar refinado: Aporta energía rápida, pero su consumo excesivo puede causar problemas como la obesidad o diabetes.</p>
        <p>Miel: Aunque es más natural, también debe consumirse con moderación debido a su alto contenido de azúcar.</p>
      </div>
      <div class="card">
        <h3>Dulces</h3>
        <p>Galletas, pasteles y caramelos: Son alimentos altos en calorías y azúcar, recomendados solo ocasionalmente.</p>
        <p>Bebidas azucaradas: Las sodas y jugos con azúcar añadido deben limitarse para evitar el aumento de peso y problemas de salud.</p>
      </div>
    </div>
  </section>



  
  <footer>
    <p>&copy; 2025 Alimentación Balanceada</p>
  </footer>

</body>
</html>

-- Active: 1752796799447@@127.0.0.1@3306@acosa

--Tabla de Productos
  CREATE TABLE `products` (
    `productId` INT(11) NOT NULL AUTO_INCREMENT,
    `productName` VARCHAR(255) NOT NULL,
    `productDescription` TEXT NOT NULL,
    `productPrice` DECIMAL(10,2) NOT NULL,
    `productImgUrl` VARCHAR(255) NOT NULL,
    `productStatus` CHAR(3) NOT NULL,
    `categoryId` INT(11) NOT NULL,
    PRIMARY KEY (`productId`)
  ) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4;

--Tabla de Categorias
  CREATE TABLE `categories` (
    `categoryId` int(11) NOT NULL AUTO_INCREMENT,
    `categoryName` varchar(100) NOT NULL,
    PRIMARY KEY (`categoryId`)
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--Tabla de Ventas
  CREATE TABLE `sales` (
    `saleId` INT(11) NOT NULL AUTO_INCREMENT,
    `productId` INT(11) NOT NULL,
    `discountPercent` DECIMAL(5,2) NOT NULL COMMENT 'Porcentaje de descuento (ej: 20.00 para 20%)',
    `saleStart` DATETIME NOT NULL,
    `saleEnd` DATETIME NOT NULL,
    PRIMARY KEY (`saleId`),
    KEY `fk_sales_products_idx` (`productId`),
    CONSTRAINT `fk_sales_products` FOREIGN KEY (`productId`) REFERENCES `products` (`productId`) ON DELETE CASCADE ON UPDATE CASCADE
  ) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4;

--Datos en la tabla de Productos
  INSERT INTO `products` (`productId`, `productName`, `productDescription`, `productPrice`, `productImgUrl`, `productStatus`, `categoryId`) VALUES
  (1, 'Marcador Acrilico Deli 6 Colores', 'Descubre la magia de la creatividad con este paquete de 6 marcadores acrílicos Deli, ideales para darle un toque brillante y metálico a tus proyectos escolares.', 79.90, 'https://acosa.com.hn/wp-content/uploads/2025/02/HM114-B.webp','ACT', 1);

  INSERT INTO `products` (`productId`, `productName`, `productDescription`, `productPrice`, `productImgUrl`, `productStatus`) VALUES
  (2, 'Mochila Genial Max Diseños Unisex', 'Disfruta de la comodidad y estilo, con un diseño moderno y funcional, esta mochila es perfecta para llevar todas tus pertenencias de forma segura y organizada.', 487.80, 'https://acosa.com.hn/wp-content/uploads/2024/12/GEX-MEU2404.webp','ACT', 1);

  INSERT INTO `products` (`productId`, `productName`, `productDescription`, `productPrice`, `productImgUrl`, `productStatus`) VALUES
  (3, 'Cuaderno #3 3 Materias Genial Diseños Femeninos', 'Experimenta la combinación perfecta de estilo y funcionalidad. Con sus diseños femeninos únicos, este cuaderno te ayudará a mantenerte organizada y creativa a la vez.', 49.92, 'https://acosa.com.hn/wp-content/uploads/2022/11/A45654.jpg','ACT', 1);

  INSERT INTO `products` (`productId`, `productName`, `productDescription`, `productPrice`, `productImgUrl`, `productStatus`) VALUES
  (4, 'Barra Adhesiva 21Gr Uhu', 'Ideal para tus proyectos escolares, manualidades o trabajos de oficina. Su fórmula de secado rápido garantiza una adhesión fuerte y limpia.', 41.88, 'https://acosa.com.hn/wp-content/uploads/2021/03/A1222.webp','ACT', 1);

  INSERT INTO `products` (`productId`, `productName`, `productDescription`, `productPrice`, `productImgUrl`, `productStatus`) VALUES
  (5, 'Acordeon Plastico Deli Tamaño Carta 13 Divisiones Vertical', 'Este práctico acordeón de plástico tamaño carta te ayudará a mantener tus documentos organizados de manera eficiente y ordenada. Con 13 divisiones verticales, podrás clasificar tus papeles de forma sencilla y rápida.', 205.00, 'https://acosa.com.hn/wp-content/uploads/2023/10/E5556.webp','ACT', 2);

  INSERT INTO `products` (`productId`, `productName`, `productDescription`, `productPrice`, `productImgUrl`, `productStatus`) VALUES
  (6, 'Grapadora Stanley Bostitch Tira Completa B660 Negra', 'Engrapador con tecnología anti-atasco para engrapado suave, dos funciones (temporal y estándar), indicador de grapas y remachador ajustable para 210 grapas estándar.', 206.00, 'https://acosa.com.hn/wp-content/uploads/2021/03/B660-BLK.webp','ACT', 2);

  INSERT INTO `products` (`productId`, `productName`, `productDescription`, `productPrice`, `productImgUrl`, `productStatus`) VALUES
  (7, 'Tablero T/Carta Acrimet Gancho Metal', 'Tablero tipo carta, fabricado en metal resistente, diseñado para uso en oficinas, talleres o espacios industriales. Ideal para organizar documentos, notas o materiales de trabajo, ofreciendo durabilidad y funcionalidad gracias a su construcción sólida y acabado de calidad.', 70.00, 'https://acosa.com.hn/wp-content/uploads/2021/08/A30930.png','ACT', 2);

  INSERT INTO `products` (`productId`, `productName`, `productDescription`, `productPrice`, `productImgUrl`, `productStatus`) VALUES
  (8, 'Dispensador Tape Deli 210Mm Surt Negro/Azul', 'Este dispensador de cinta de gran tamaño es la solución perfecta para mantener tus documentos organizados en la oficina. Con un diseño moderno, este producto es fácil de usar y ahorra tiempo en el embalaje de paquetes. Además, su tamaño grande garantiza que no te quedes sin cinta cuando más la necesitas.', 146.10, 'https://acosa.com.hn/wp-content/uploads/2022/11/E816.jpg','ACT', 2);

  INSERT INTO `products` (`productId`, `productName`, `productDescription`, `productPrice`, `productImgUrl`, `productStatus`) VALUES
  (9, 'Bombillo Inteligente Led Wifi Nexxt Rgb A19 Multicolor', 'Nunca fue tan fácil darle un toque personal a tu hogar con la iluminación de Nexxt. Disfruta de ambientes únicos y multicolor creados por ti, decide a qué hora se encienden o apagan las luces y mucho más, todo esto desde tu celular y con comandos de voz.', 205.00, 'https://acosa.com.hn/wp-content/uploads/2025/04/NHB-C110M.webp','ACT', 3);

  INSERT INTO `products` (`productId`, `productName`, `productDescription`, `productPrice`, `productImgUrl`, `productStatus`) VALUES
  (10, 'Camara Inteligente 2K 3Mp Para Interior Domo Tp-Link', 'Cámara 2K con visión panorámica 360º, visión nocturna hasta 9 metros, detección de movimiento con alertas, alarma de luz y sonido, audio bidireccional, almacenamiento seguro hasta 512GB, y control por voz compatible con Google Assistant y Alexa.', 990.00, 'https://acosa.com.hn/wp-content/uploads/2024/03/Tapo-C210.webp','ACT', 3);

  INSERT INTO `products` (`productId`, `productName`, `productDescription`, `productPrice`, `productImgUrl`, `productStatus`) VALUES
  (11, 'Cerradura inteligente con conectividad WiFi, diseño moderno en negro, que permite control remoto y acceso seguro a tu hogar desde tu smartphone. Fácil instalación y compatible con asistentes de voz.', 'Cerradura Inteligente Wifi Negro Nexxt.', 2800.00, 'https://acosa.com.hn/wp-content/uploads/2023/06/A71785.webp','ACT', 3);

  INSERT INTO `products` (`productId`, `productName`, `productDescription`, `productPrice`, `productImgUrl`, `productStatus`) VALUES
  (12, 'Difusor De Aroma Inteligente Wifi Nexxt', 'Difusor de aroma inteligente WiFi Nexxt NHA-A600 – Controla aromas desde tu móvil para un ambiente relajante y personalizado.', 1345.01, 'https://acosa.com.hn/wp-content/uploads/2021/06/NHA-A600.png','ACT', 3);

  INSERT INTO `products` (`productId`, `productName`, `productDescription`, `productPrice`, `productImgUrl`, `productStatus`) VALUES
  (13, 'Audifono Redragon Gaming Hylas 3.5Mm Rosa Con Microfono Rgb H260P', 'Los Hylas son auriculares estéreo con conexión de 3,5 mm y diafragmas de neodimio de 50 mm que ofrecen un sonido claro y preciso, con aislamiento pasivo para una experiencia inmersiva.', 590.00, 'https://acosa.com.hn/wp-content/uploads/2022/02/H260p-RGB.jpg','ACT', 4);

  INSERT INTO `products` (`productId`, `productName`, `productDescription`, `productPrice`, `productImgUrl`, `productStatus`) VALUES
  (14, 'Control Gaming Inalambrico Marvo Gt-88 Trasnp Rgb', 'Mando inalámbrico compatible con Android, iOS, PC, PS3, PS4 y Nintendo Switch. Diseño ergonómico con materiales antideslizantes y resistentes al sudor. Joystick 3D de alta durabilidad (500,000 usos). Soporte para móvil hasta 8.5 cm. Uso continuo de 8-12 horas.', 755.00, 'https://acosa.com.hn/wp-content/uploads/2025/07/GT-88.webp','ACT', 4);

  INSERT INTO `products` (`productId`, `productName`, `productDescription`, `productPrice`, `productImgUrl`, `productStatus`) VALUES
  (15, 'Alfombra Para Silla Trust Gaming Negro Gxt 715', 'Alfombra para silla Trust Gaming GXT 715, color negro, diseñada para proteger el suelo y facilitar el movimiento de la silla con estilo y durabilidad.', 644.00, 'https://acosa.com.hn/wp-content/uploads/2021/09/22524-1.png','ACT', 4);

  INSERT INTO `products` (`productId`, `productName`, `productDescription`, `productPrice`, `productImgUrl`, `productStatus`) VALUES
  (16, 'Disipador De Calor Laptop Marvo Gaming Usb Negro Fn-40', 'Disipador de calor para laptop Marvo Gaming USB FN-40, diseñado para evitar el sobrecalentamiento durante largas sesiones. Compacto, ligero y fácil de usar con conexión USB. Ideal para mantener tu portátil fresco y mejorar su rendimiento.', 595.00, 'https://acosa.com.hn/wp-content/uploads/2022/02/FN-40.jpg','ACT', 4);


--Datos en la tabla de Ventas
  INSERT INTO `sales` (`saleId`, `productId`, `discountPercent`, `saleStart`, `saleEnd`) VALUES
  (1, 1, 20.00, '2025-07-18 00:00:00', '2025-10-31 23:59:59'),
  (2, 8, 10.00, '2025-07-18 00:00:00', '2025-10-31 23:59:59'),
  (3, 12, 15.00, '2025-07-18 00:00:00', '2025-10-31 23:59:59'),
  (4, 16, 25.00, '2025-07-18 00:00:00', '2025-10-31 23:59:59');

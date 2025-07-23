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
    `stock` INT(11) NOT NULL DEFAULT 0,
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
  INSERT INTO `products` (`productId`, `productName`, `productDescription`, `productPrice`, `productImgUrl`, `productStatus`, `categoryId`, `stock`) VALUES
  (1, 'Marcador Acrilico Deli 6 Colores', 'Descubre la magia de la creatividad...', 79.90, 'https://acosa.com.hn/wp-content/uploads/2025/02/HM114-B.webp', 'ACT', 1, 15),
  (2, 'Mochila Genial Max Diseños Unisex', 'Disfruta de la comodidad y estilo...', 487.80, 'https://acosa.com.hn/wp-content/uploads/2024/12/GEX-MEU2404.webp', 'ACT', 1, 10),
  (3, 'Cuaderno #3 3 Materias Genial Diseños Femeninos', 'Experimenta la combinación perfecta...', 49.92, 'https://acosa.com.hn/wp-content/uploads/2022/11/A45654.jpg', 'ACT', 1, 30),
  (4, 'Barra Adhesiva 21Gr Uhu', 'Ideal para tus proyectos escolares...', 41.88, 'https://acosa.com.hn/wp-content/uploads/2021/03/A1222.webp', 'ACT', 1, 40),
  (5, 'Acordeon Plastico Deli Tamaño Carta 13 Divisiones Vertical', 'Este práctico acordeón...', 205.00, 'https://acosa.com.hn/wp-content/uploads/2023/10/E5556.webp', 'ACT', 2, 20),
  (6, 'Grapadora Stanley Bostitch Tira Completa B660 Negra', 'Engrapador con tecnología anti-atasco...', 206.00, 'https://acosa.com.hn/wp-content/uploads/2021/03/B660-BLK.webp', 'ACT', 2, 25),
  (7, 'Tablero T/Carta Acrimet Gancho Metal', 'Tablero tipo carta, fabricado en metal...', 70.00, 'https://acosa.com.hn/wp-content/uploads/2021/08/A30930.png', 'ACT', 2, 50),
  (8, 'Dispensador Tape Deli 210Mm Surt Negro/Azul', 'Este dispensador de cinta de gran tamaño...', 146.10, 'https://acosa.com.hn/wp-content/uploads/2022/11/E816.jpg', 'ACT', 2, 35),
  (9, 'Bombillo Inteligente Led Wifi Nexxt Rgb A19 Multicolor', 'Nunca fue tan fácil darle un toque personal...', 205.00, 'https://acosa.com.hn/wp-content/uploads/2025/04/NHB-C110M.webp', 'ACT', 3, 12),
  (10, 'Camara Inteligente 2K 3Mp Para Interior Domo Tp-Link', 'Cámara 2K con visión panorámica...', 990.00, 'https://acosa.com.hn/wp-content/uploads/2024/03/Tapo-C210.webp', 'ACT', 3, 8),
  (11, 'Cerradura Inteligente Wifi Negro Nexxt.', 'Cerradura inteligente con conectividad WiFi...', 2800.00, 'https://acosa.com.hn/wp-content/uploads/2023/06/A71785.webp', 'ACT', 3, 6),
  (12, 'Difusor De Aroma Inteligente Wifi Nexxt', 'Difusor de aroma inteligente WiFi...', 1345.01, 'https://acosa.com.hn/wp-content/uploads/2021/06/NHA-A600.png', 'ACT', 3, 5),
  (13, 'Audifono Redragon Gaming Hylas 3.5Mm Rosa Con Microfono Rgb H260P', 'Los Hylas son auriculares estéreo...', 590.00, 'https://acosa.com.hn/wp-content/uploads/2022/02/H260p-RGB.jpg', 'ACT', 4, 18),
  (14, 'Control Gaming Inalambrico Marvo Gt-88 Trasnp Rgb', 'Mando inalámbrico compatible con Android...', 755.00, 'https://acosa.com.hn/wp-content/uploads/2025/07/GT-88.webp', 'ACT', 4, 13),
  (15, 'Alfombra Para Silla Trust Gaming Negro Gxt 715', 'Alfombra para silla Trust Gaming GXT 715...', 644.00, 'https://acosa.com.hn/wp-content/uploads/2021/09/22524-1.png', 'ACT', 4, 9),
  (16, 'Disipador De Calor Laptop Marvo Gaming Usb Negro Fn-40', 'Disipador de calor para laptop Marvo Gaming...', 595.00, 'https://acosa.com.hn/wp-content/uploads/2022/02/FN-40.jpg', 'ACT', 4, 11);


--Datos en la tabla de Ventas
  INSERT INTO `sales` (`saleId`, `productId`, `discountPercent`, `saleStart`, `saleEnd`) VALUES
  (1, 1, 20.00, '2025-07-18 00:00:00', '2025-10-31 23:59:59'),
  (2, 8, 10.00, '2025-07-18 00:00:00', '2025-10-31 23:59:59'),
  (3, 12, 15.00, '2025-07-18 00:00:00', '2025-10-31 23:59:59'),
  (4, 16, 25.00, '2025-07-18 00:00:00', '2025-10-31 23:59:59');

<?php
namespace Dao\Products;
use Dao\Table;

class Products extends Table {
    public static function getDailyDeals() {
      $sqlstr = "SELECT p.productId, p.productName, p.productDescription, s.salePrice as productPrice, p.productImgUrl, p.productStatus FROM products p INNER JOIN sales s ON p.productId = s.productId WHERE s.saleStart <= NOW() AND s.saleEnd >= NOW()";
      $params = [];
      $registros = self::obtenerRegistros($sqlstr, $params);
      return $registros;
    }

    public static function getOneProductPerCategory() {
      $sqlstr = "SELECT p.productId, p.productName, p.productDescription, p.productPrice, p.productImgUrl, p.productStatus, c.categoryName FROM products p INNER JOIN categories c ON p.categoryId = c.categoryId WHERE p.productStatus = 'ACT' AND p.productId = (SELECT MIN(p2.productId) FROM products p2 WHERE p2.categoryId = p.categoryId AND p2.productStatus = 'ACT') LIMIT 4";
      $params = [];
      $registros = self::obtenerRegistros($sqlstr, $params);
      return $registros;
    }
    
    public static function getProductsByCategory($categoryId)
    {
    $sqlstr = "SELECT productId, productName, productDescription, productPrice, productImgUrl FROM products WHERE categoryId = :categoryId AND productStatus = 'ACT'";
    $params = ["categoryId" => $categoryId];
    return self::obtenerRegistros($sqlstr, $params);
  }
}
?>
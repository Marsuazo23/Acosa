<?php

namespace Dao\modules\products;

use Dao\Table;

class Products extends Table
{
    public static function getAll(): array
    {
        $sqlstr = "SELECT productId, productName, productDescription, productPrice, productImgUrl, productStatus, categoryId, stock FROM products;";
        return self::obtenerRegistros($sqlstr, []);
    }

    public static function getById(int $id)
    {
        $sqlstr = "SELECT * FROM products WHERE productId = :productId;";
        return self::obtenerUnRegistro($sqlstr, ["productId" => $id]);
    }

    public static function insertProduct(
        string $productName,
        string $productDescription,
        float $productPrice,
        string $productImgUrl,
        string $productStatus,
        int $categoryId,
        int $stock
    ) {
        $sqlstr = "INSERT INTO products (productName, productDescription, productPrice, productImgUrl, productStatus, categoryId, stock)
                VALUES (:productName, :productDescription, :productPrice, :productImgUrl, :productStatus, :categoryId, :stock);";
        return self::executeNonQuery(
            $sqlstr,
            [
                "productName" => $productName,
                "productDescription" => $productDescription,
                "productPrice" => $productPrice,
                "productImgUrl" => $productImgUrl,
                "productStatus" => $productStatus,
                "categoryId" => $categoryId,
                "stock" => $stock
            ]
        );
    }

    public static function updateProduct(
        int $id,
        string $productName,
        string $productDescription,
        float $productPrice,
        string $productImgUrl,
        string $productStatus,
        int $categoryId,
        int $stock
    ) {
        $sqlstr = "UPDATE products SET 
                    productName = :productName,
                    productDescription = :productDescription,
                    productPrice = :productPrice,
                    productImgUrl = :productImgUrl,
                    productStatus = :productStatus,
                    categoryId = :categoryId,
                    stock = :stock
                WHERE productId = :productId;";
        return self::executeNonQuery(
            $sqlstr,
            [
                "productName" => $productName,
                "productDescription" => $productDescription,
                "productPrice" => $productPrice,
                "productImgUrl" => $productImgUrl,
                "productStatus" => $productStatus,
                "categoryId" => $categoryId,
                "stock" => $stock,
                "productId" => $id
            ]
        );
    }

    public static function deleteProduct(int $id)
    {
        $sqlstr = "DELETE FROM products WHERE productId = :productId;";
        return self::executeNonQuery($sqlstr, ["productId" => $id]);
    }
}

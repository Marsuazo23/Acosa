<?php

namespace Utilities;

class Nav
{
    public static function setPublicNavContext()
    {
        $tmpNAVIGATION = Context::getContextByKey("PUBLIC_NAVIGATION");
        if ($tmpNAVIGATION === "") {
            $navigationData = self::getNavFromJson()["public"];
            $saveToSession = intval(Context::getContextByKey("DEVELOPMENT")) !== 1;
            Context::setContext("PUBLIC_NAVIGATION", $navigationData, $saveToSession);
        }
    }
    public static function setNavContext()
    {
        $tmpNAVIGATION = Context::getContextByKey("NAVIGATION");
        if (empty($tmpNAVIGATION)) {
            $tmpNAVIGATION = [];
            $userID = Security::getUserId();

            if ($userID === 0) { 
                // No logueado, menú público completo
                $tmpNAVIGATION = self::getNavFromJson()["public"];
            } else {
                // Usuario logueado: cargar menú privado filtrado por permisos
                $navigationData = self::getNavFromJson()["private"];
                foreach ($navigationData as $navEntry) {
                    if (Security::isAuthorized($userID, $navEntry["id"], 'MNU')) {
                        $tmpNAVIGATION[] = $navEntry;
                    }
                }
                // Si no tiene ningún permiso privado, mostrar menú público
                // Pero sin opciones "Iniciar Sesión" y "Crear Cuenta"
                if (empty($tmpNAVIGATION)) {
                    $publicMenu = self::getNavFromJson()["public"];
                    // Filtrar las opciones de login y registro
                    $tmpNAVIGATION = array_filter($publicMenu, function($item) {
                        return !in_array($item["id"], ["Menu_SignIn", "Menu_SignUp"]);
                    });
                    // Reindexar array para evitar claves discontinuas
                    $tmpNAVIGATION = array_values($tmpNAVIGATION);
                }
            }

            $saveToSession = intval(Context::getContextByKey("DEVELOPMENT")) !== 1;
            Context::setContext("NAVIGATION", $tmpNAVIGATION, $saveToSession);
        }
    }


    public static function invalidateNavData()
    {
        Context::removeContextByKey("NAVIGATION_DATA");
        Context::removeContextByKey("NAVIGATION");
        Context::removeContextByKey("PUBLIC_NAVIGATION");
    }

    private static function getNavFromJson()
    {
        $jsonContent = Context::getContextByKey("NAVIGATION_DATA");
        if ($jsonContent === "") {
            $filePath = 'nav.config.json';
            if (!file_exists($filePath)) {
                throw new \Exception(sprintf('%s does not exist', $filePath));
            }
            if (!is_readable($filePath)) {
                throw new \Exception(sprintf('%s file is not readable', $filePath));
            }
            $jsonContent = file_get_contents($filePath);
            $saveToSession = intval(Context::getContextByKey("DEVELOPMENT")) !== 1;
            Context::setContext("NAVIGATION_DATA", $jsonContent, $saveToSession);
        }
        $jsonData = json_decode($jsonContent, true);
        return $jsonData;
    }

    private function __construct()
    {
    }
    private function __clone()
    {
    }
}

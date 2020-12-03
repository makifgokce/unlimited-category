<?php
	define("DB_HOST", "localhost");
	define("DB_NAME", "category");
	define("DB_USER", "root");
    define("DB_PASS", "");
    $dsn = "mysql:host=". DB_HOST . ";dbname=". DB_NAME . ";charset=utf8";
    try
    {
        $db = new PDO($dsn, DB_USER, DB_PASS);
    }catch(PDOException $e)
    {
        $error = $e->getMessage();
    }
    
    function Category($parent_id=0)
    {
        global $db;
        $query = $db->prepare("SELECT `id`, `name`, `url`, `parent_id`, `sort_order` FROM `category` WHERE `parent_id` = :parent_id ORDER BY `parent_id`, `sort_order`, `name`");
        $query->bindValue(':parent_id', $parent_id, PDO::PARAM_INT);
        $query->execute();
        $data = [];
        if($query->rowCount() > 0)
        {
            while($category = $query->fetch(PDO::FETCH_ASSOC))
            {
                $data[] = [
                    'name' => $category["name"],
                    'url' => $category["url"],
                    'sub_category' => Category($category["id"])
                ];
            }
        }
        return $data;
    }

    function RenderCategory($data)
    {
        $list = '<ul>';
        foreach($data as $category)
        {
            if(!empty($category["name"]))
            {
                $list .= '<li class="list-unstyled"><a href="'. $category["url"] .'" class="btn btn-success btn-sm small mb-2">'. $category["name"] . '</a></li>';
                if(!empty($category["sub_category"]))
                {
                    $list .= RenderCategory($category["sub_category"]);
                }
            }
        }
        $list .= '</ul>';
        return $list;
    }
?>
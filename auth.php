<?php
//   $err_msg = '';

if (isset($_POST["login"]) and $_POST["login"]!='')
{
    try {
        $sql = 'SELECT id_user, firstname, lastname, password FROM user WHERE email=(:login)';
        $stmt = $conn->prepare($sql);
        $stmt->bindValue(':login', $_POST['login']);
        $stmt->execute();

    } catch (PDOexception $error) {
        $msg = "Ошибка аутентификации: " . $error->getMessage();
    }
    // если удалось получить строку с паролем из БД
    if ($row=$stmt->fetch(PDO::FETCH_LAZY))
    {
        if (MD5($_POST["password"])!= MD5($row['password'])) $msg = "Неправильный пароль!";
        else {
            // успешная аутентификация
            $_SESSION['login'] = $_POST['login'];
            $_SESSION['firstname'] = $_POST['firstname'];
            $_SESSION['lastname'] = $_POST['lastname'];
            $_SESSION['id_user'] = $_POST['id_user'];
            //if ($row['is_teacher']==1) $_SESSION['teacher'] = true;
            $msg =  "Вы успешно вошли в систему";
        }
    }
    else $msg =  "Неправильное имя пользователя!";

}

if (isset($_GET["logout"]))
{
    $_SESSION = null;
    $_SESSION['msg'] =  "Вы успешно вышли из системы";
    header('Location: http://Biblioteka/index.php?page=c#');
    exit( );
}

?>

<?php
    require "dbconnect.php";
    try {
        echo ("SELECT * FROM Издание");
        $result = $conn->query("SELECT * FROM Издание");
        $row = $result->fetch();
        $result = $conn->query("SELECT * FROM Издание");
        if ($result->rowCount() == 0) throw new PDOException('Издание не найдено', 1111 );
        $sql = 'DELETE FROM Издание WHERE ID=:id';
        $stmt = $conn->prepare($sql);
        $stmt->bindValue(':id', $_GET['id']);
        $stmt->execute();
        $_SESSION['msg'] = "Издание успешно удалено";
        // return generated id
        // $id = $pdo->lastInsertId('id');
    } catch (PDOexception $error) {
        if ($error->getCode() == '23000') {
            $_SESSION['msg'] = "Ошибка удаления издания: данное издание используется в другой таблице и не может быть удалёно";
        } else {
            $_SESSION['msg'] = "Ошибка удаления издания: " . $error->getMessage();
        }
    }
    // перенаправление на главную страницу приложения
    header('Location: http://Biblioteka/index.php?page=c#');
    exit( );



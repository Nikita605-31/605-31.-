<h1>Издания:</h1>
<?php
$result = $conn->query("SELECT Издание.ID AS id, Издание.name AS cname, Издание.image FROM Издание GROUP BY Издание.ID");

while ($row = $result->fetch()) {
//style="max-width: 18rem;"
    echo'
        
        <div class="card border-dark mb-3" >
            <div class="card-body text-dark">
                <div class="row g-0">
                    <div class="col-md-1">  
                        <img src="'.$row['image'].'" alt="Task picture" height="60px">
                    </div>
                    <div class="col-md-7">
                    <a class="nav-link" href="/index.php?page=t" >
                        <h5 class="card-title">' . $row['cname'] . '</h5>
                    </a>
                    </div>
                    <div class="col-md-1">
                        <a href="deletecategory.php?id='.$row['id'].'" class="btn btn-danger">Удалить</a>
                    </div>
                </div>
            </div>
            
        </div>
 
    ';
}
?>



<h2>Добавление издания</h2>
<form method="post" action="insertcategory.php" enctype="multipart/form-data">
    <p><label>
            Наименование издания: <input type="text" name="name">
            Автор: <input type="text" name="Author">
        </label>
    <p><label>
            <div class="mb-3">
                <input type="text" class="form-control" name="image">
                <div class="form-text">Введите URL изображения</div>
            </div>
        </label>
    <p><label>
            Пользователь: <select name="id_user">

                <?php
                $result = $conn->query("SELECT * FROM user");
                while ($row = $result->fetch()) {
                    echo '<option value='.$row['id_user'].'>'.$row['lastname'].'</option>';

                }
                ?>
            </select>
        </label>
    <p><input type="submit" value="Создать">
</form>





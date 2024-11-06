<?php
session_start();

# If user is logged in and is a job seeker, redirect to job seeker dashboard
if (isset($_SESSION["type"]) && $_SESSION["type"] == "demandeur") {
  header("Location: ./demandeur/dashboard.php");
  exit;
}

# If user is logged in and is an employer, redirect to employer dashboard
if (isset($_SESSION["type"]) && $_SESSION["type"] == "employer") {
  header("Location: ./Employer/dashboard.php");
  exit;
}


# If user is not logged in, do nothing (stay on index page)
?>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title></title>
  <link rel="stylesheet" href="css/style.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.1.3/css/bootstrap.min.css">
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.3.1/js/bootstrap.min.js"></script>

</head>

<body>
  <nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container-fluid">
      <a class="navbar-brand" href="#"></a>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
        aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav ms-auto">
          <li class="nav-item">
            <a class="nav-link active" aria-current="page" href="./goo.php">Sign In</a>
          </li>
        </ul>
      </div>
    </div>
  </nav>

  <section id="hero" style="background-color: #0077ff5e;">
    <div class="container">
      <div class="row align-items-center">
        <div class="col-md-6">
          <h1>Trouvez l'emploi de vos rêves ici</h1>
          <p class="lead">Recherchez des offres d'emploi et publiez votre CV.</p>
          <a href="./demandeur/register.php" button class="btn btn-light btn-lg">Rejoignez-nous</a>
        </div>
        <div class="col-md-6">
          <img src="img/ui-ux-design-services.png" alt="Job Search Image">
        </div>
      </div>
    </div>
  </section>

  <!-- Bootstrap JavaScript Libraries -->
  <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"
    integrity="sha384-7zSr5A5d5n+cjxM5DN9EYwni1fWlbg0I6BgiMCyuUkCvU0z6BXIy0U9X6YTpCvGN" crossorigin="anonymous">
    </script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"
    integrity="sha384-KZo+yPzvUkWpWo8i6U1y6AvNNCvNlWzB8RZIBP10ZSRSs/4nWzWhfDx2dh/Uq4HJ" crossorigin="anonymous">
    </script>
</body>

</html>
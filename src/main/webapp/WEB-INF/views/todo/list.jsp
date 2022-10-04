<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="en">
<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

  <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

  <title>Hello, world!</title>
</head>
<body>

<div class="container-fluid">
  <div class="row">
    <div class="row">
      <div class="col">
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
          <a class="navbar-brand" href="#">Navbar</a>
          <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
          </button>
          <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
            <div class="navbar-nav">
              <a class="nav-item nav-link active" href="#">Home <span class="sr-only">(current)</span></a>
              <a class="nav-item nav-link" href="#">Features</a>
              <a class="nav-item nav-link" href="#">Pricing</a>
              <a class="nav-item nav-link disabled" href="#">Disabled</a>
            </div>
          </div>
        </nav>
      </div>
    </div>
  </div>
  <!-- header end -->

  <div class="row content">
    <div class="col">
      <div class="card">
        <div class="card-header">
          Featured
        </div>
        <div class="card-body">
          <h5 class="card-title">Special title treatment</h5>
          <table class="table">
            <thead>
            <tr>
              <th scope="col">tno</th>
              <th scope="col">Title</th>
              <th scope="col">Writer</th>
              <th scope="col">DueDate</th>
              <th scope="col">Finished</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${responseDTO.dtoList}" var="dto">
              <tr>
                <th scope="row"><c:out value="${dto.tno}" /></th>
                <td>
                  <a href="/todo/read?tno=${dto.tno}&${pageRequestDTO.link}"
                       class="text-decoration-none">
                  <c:out value="${dto.title}" /></a>
                </td>
                <td><c:out value="${dto.writer}" /> </td>
                <td><c:out value="${dto.dueDate}" /> </td>
                <td><c:out value="${dto.finished}" /> </td>
              </tr>
            </c:forEach>
            </tbody>
          </table>

          <div class="float-end">
            <ul class="pagination flex-wrap">
              <c:if test="${responseDTO.prev}">
                <li class="page-item">
                  <a class="page-link" data-num="${responseDTO.start - 1}">Previous</a>
                </li>
              </c:if>

              <c:forEach begin="${responseDTO.start}" end="${responseDTO.end}" var="num">
                <li class="page-item ${responseDTO.page == num? "active":""}">
                  <a class="page-link" data-num="${num}">${num}</a>
                </li>
              </c:forEach>

              <c:if test="${responseDTO.next}">
                <li class="page-item">
                  <a class="page-link" data-num="${responseDTO.end + 1}">Next</a>
                </li>
              </c:if>
            </ul>

            <script>
              document.querySelector(".pagination").addEventListener("click", function (e) {
                e.preventDefault()
                e.stopPropagation()

                const target = e.target

                if(target.tagName !== 'A') {
                  return
                }
                const num = target.getAttribute("data-num")

                self.location = `/todo/list?page=\${num}`
              }, false)
            </script>
          </div>
        </div>
      </div>
    </div>
  </div>

  <div class="row footer">
    <div class="row fixed-bottom" style="z-index: -100">
      <footer class="py-1 my-1">
        <p class="text-center text-muted">Footer</p>
      </footer>
    </div>
  </div>
</div>

<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</body>
</html>
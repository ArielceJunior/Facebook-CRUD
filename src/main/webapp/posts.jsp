<jsp:directive.page contentType="text/html; charset=UTF-8" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="pt-BR">

<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap-icons.css">
	<title>Facebook</title>
</head>

<body>
	<div class="container">
		<div class="row pt-5">
			<div class="col-md-1"></div>
			<div class="col-md-10">
				
				<a href="index.jsp" class="btn btn-secondary">
			    	<i class="bi bi-house"></i>
			  	</a>
				
				<div class="d-flex justify-content-between align-items-center mb-3">
			 
				  <h1 class="m-0">Posts</h1>
				
				  <a href="form_post" class="btn btn-primary">
				    Novo Post
				  </a>
			
				</div>
				
				<table class="table table-hover">
					<thead>
						<tr>
							<th scope="col">Id</th>
							<th scope="col">Conteúdo</th>
							<th scope="col">Data do post</th>
							<th scope="col">Usuário</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="post" items="${posts}">
							<tr>
								<th scope="row">${post.getId()}</th>
								<td scope="row">${post.getContent()}</td>
								<td scope="row">${post.getPostDate()}</td>
								<td scope="row">${post.getUser().getName()}</td>
								<td>
									<a class="bi bi-pencil-square" href="${pageContext.request.contextPath}/post/update?postId=${post.getId()}"></a>
								</td>
								<td>
									<a class="bi bi-trash" href="${pageContext.request.contextPath}/post/delete?postId=${post.getId()}"></a>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<div class="col-md-1"></div>
		</div>
		<div class="row">

		</div>
	</div>
	<script src="js/bootstrap.bundle.min.js"></script>

	<script type="text/javascript">
		/* function interceptClickEvent(e) {
			var href;
			var target = e.target || e.srcElement;

			if (target.tagName === 'A') {
				href = target.getAttribute('href');

				if (href.includes("delete")) {

					let option = window.confirm("Deseja mesmo excluir esse usuário?");
				}
			}
		}

		// Listen for link click events at the document level
		if (document.addEventListener) {
			document.addEventListener('click', interceptClickEvent);
		} else if (document.attachEvent) {
			document.attachEvent('onclick', interceptClickEvent);
		} */
	</script>
</body>
</html>

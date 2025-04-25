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
			 
				  <h1 class="m-0">Usuários</h1>
				
				  <a href="form_user.jsp" class="btn btn-primary">
				    Novo Usuário
				  </a>
			
				</div>
				
				<table class="table table-hover">
					<thead>
						<tr>
							<th scope="col">Id</th>
							<th scope="col">Nome</th>
							<th scope="col">Sexo</th>
							<th scope="col">E-mail</th>
							<th scope="col">Editar</th>
							<th scope="col">Remover</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="usuario" items="${usuarios}">
							<tr>
								<th scope="row">${usuario.getId()}</th>
								<td scope="row">${usuario.getName()}</td>
								<td scope="row">${usuario.getGender()}</td>
								<td scope="row">${usuario.getEmail()}</td>
								<td>
									<a class="bi bi-pencil-square" href="${pageContext.request.contextPath}/user/update?userId=${usuario.getId()}"></a>
								</td>
								<td>
									<a class="bi bi-trash" href="${pageContext.request.contextPath}/user/delete?userId=${usuario.getId()}"></a>
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

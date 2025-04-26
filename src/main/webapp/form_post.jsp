<jsp:directive.page contentType="text/html; charset=UTF-8" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/bootstrap.min.css">
<title>Cadastro Post</title>
</head>

<body>

	<div class="container">
		<div class="row">
			<div class="col-2"></div>

			<form action="/facebook/post/save" method="GET" class="col-8">
				<h1>Novo Post</h1>

				<input type="hidden" id="post_id" name="post_id"
					value="${post.getId()}" required>

				<div class="mb-3">
					<label for="post_content" class="form-label">Conteúdo</label> 
					<input
						type="text" id="post_content" name="post_content"
						class="form-control" value="${post.getContent()}" required>
				</div>

			
				<div class="mb-3">
					<label for="user_id" class="form-label">Usuário</label>

					<div class="mb-3">
						<c:choose>
							<c:when test="${not empty post.user}">
								<input type="text" class="form-control"
									value="ID: ${post.user.id} - ${post.user.name}" readonly>
								<input type="hidden" name="user_id" value="${post.user.id}">
							</c:when>

							<c:otherwise>

								<select name="user_id">
									<c:forEach var="usuario" items="${usuarios}">
										<option value="${usuario.id}">${usuario.name}</option>
									</c:forEach>
								</select>

							</c:otherwise>
						</c:choose>
					</div>
				


				<button type="submit" class="btn btn-primary">Enviar</button>
			</form>

			<div class="col-2"></div>
		</div>
	</div>

	<script src="js/bootstrap.bundle.min.js"></script>
</body>

</html>
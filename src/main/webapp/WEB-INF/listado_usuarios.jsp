<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta2/css/all.min.css" integrity="sha512-YWzhKL2whUzgiheMoBFwW8CKV4qpHQAEuvilg9FAn5VJUDwKZZxkJNuGM4XkWuk94WCrrwslk8yWNGmY1EduTA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<title>Insert title here</title>
</head>
<body>
Alumnos

<div class="container">
<h2>Listado de Cuentas</h2>
	<table class="table table-bordered">
	  <thead>
	    <tr>
	      <th scope="col">#</th>
	      <th scope="col">Usuario</th>
	      <th scope="col">Activo</th>
	      <th scope="col">Acción</th>
	    </tr>
	  </thead>
	  <tbody>
	  	<c:forEach items="${lista_usuarios}" var="usuario">
				<tr>
					<td> <c:out value="${usuario.id}"/> </td>
					<td> <c:out value="${usuario.nombreUsuario}"></c:out> </td>
					<td> 
					<c:choose>
					    <c:when test="${usuario.activo==false}">
					        Desactivado
					        
					    </c:when>    
					    <c:otherwise>
					        Activado
					    </c:otherwise>
					</c:choose>
					</td>
					
					 <td>
					 	<a href="/admin/cuentas/modificar/${usuario.id}" class="btn btn-primary"><i class="fas fa-edit"></i></a>
					 	<a href="/admin/cuentas/eliminar/${usuario.id}" class="btn btn-danger"><i class="fas fa-trash-alt"></i></a>
						<!--<form action="/alumno/eliminar" method="POST">
							<input type="hidden" name="id" value="<c:out value="${alumno.id}" />">
							<input type="submit" value="Eliminar" class="btn btn-primary">
						</form>
						-->
					</td>
				</tr>
			</c:forEach>
			

	  </tbody>
	</table>

	<h1>Crear Usuario</h1>
	<c:if test="${message!=null}">
		<div class="alert alert-primary" role="alert">
			<c:out value="${message}" /> 
		</div>
	</c:if>
	
	<form:form action="/admin/cuentas/crear" method="POST" modelAttribute="cuenta">
		<div class="row g-3">
			<div class="col-md-6">
				<form:label path="nombreUsuario">Nombre de Usuario</form:label>
				<form:input type="text" id="nombreUsuario" path="nombreUsuario" class="form-control"/>
			</div>
			<div class="col-md-6">
				<form:label path="contrasena">Contraseña</form:label>
				<form:input type="text" id="contrasena" path="contrasena" class="form-control"/>
			</div>
			<!--<form:hidden path="tipoUsuario" value="2"/>-->
			<div class="col-md-12">
				<input type="submit" value="Crear Usuario"  class="btn btn-primary">
			</div>
		</div>
	</form:form>
	
	
</div>
	
	

</body>
</html>
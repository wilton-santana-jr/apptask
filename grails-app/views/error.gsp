<!DOCTYPE html>
<html>
	<head>
		<title><g:if env="development">Erro em tempo de execução</g:if><g:else>Error</g:else></title>
		<meta name="layout" content="main">
		<g:if env="development"><asset:stylesheet src="errors.css"/></g:if>
	</head>
	<body>
		<g:if env="development">
			<g:renderException exception="${exception}" />
		</g:if>
		<g:else>
			<ul class="errors">
				<li>Ocorreu um erro!Entre em contato com o administrador do sistema!</li>
			</ul>
		</g:else>
	</body>
</html>

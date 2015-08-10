<%@ page import="Category" %>
<!DOCTYPE html>
<html>
    <head>
        
        <meta charset="utf-8" />

        <title>Categorias</title>

        <asset:javascript src="jquery-1.11.3.min.js"/>    
        <asset:javascript src="jquery.validate.js"/>                
        <asset:javascript src="categorys-controller.js"/>                
        <asset:stylesheet src="02-categorys.css"/>

</head>
<body>

    <header>
        <span>Lista de Categorias</span>		
    </header>
    <main id="categoryPage">
        <section id="categoryCreation" class="${categoryInstanceIn?'':'nott'}">

            <g:form id="categoryForm"  url="[action:'save',controller:'category']" >
                <input type="hidden" name="id" value="${categoryInstanceIn?.id}" />							
                <div>
                    <label>Categoria</label> 
                    <input type="text" required="required" value="${categoryInstanceIn?.name}"  name="category" class="large" placeholder="Profissional" maxlength="200" />
                </div>               
                <nav>
                    <a href="#" id="saveCategory"  >Salvar categoria</a>
                    <a href="#" id="clearCategory" >Limpar categoria</a>
                </nav>
            </g:form>
        </section>
        <section>

            
            <table id="tblCategorys">
                <colgroup>					
                    <col width="70%">                    
                    <col width="30%">
                </colgroup>
                <thead>
                    <tr>                        
                        <th>Categoria</th>
                        <th>Ações</th>
                    </tr>
                </thead>
                <tbody>	

                    <g:each in="${categoryInstanceList}"     var="categoryInstance">                            


                        <tr id="${fieldValue(bean: categoryInstance, field: "id")}"  >
                            <td>${fieldValue(bean: categoryInstance, field: "name")}</td>                                                        
                            <td>
                                <nav align="center">			

                                    <g:link class="editRow"
                                        controller="category" action="index" params="[idCategory: categoryInstance.id]"                                   
                                        ><g:message code="default.button.editCategory.label"  default="Editar" /></g:link>                                        

                                    <g:link  class="deleteRow" controller="category" action="deletarCategory" 
                                        params="[idCategory: categoryInstance.id]" 
                                    onclick="return confirm('${message(code: 'default.button.deleted.confirm.message', default: 'Deseja realmente excluir a categoria: '+categoryInstance.name+' ?')}');"
                                        ><g:message code="default.button.delete.label" default="Deletar" /></g:link>

                                </nav>
                            </td>
                        </tr>
                    </g:each>

                </tbody>
            </table>
            
            <nav>			
                <a href="#" id="btnAddCategory">Adicionar categoria</a>            
                <g:link class="list" controller="task" action="index">Listar tarefas</g:link>            
                </nav>


        </section>
    </main>
    <footer></footer> 
    <script>
        $(document).ready(function() {
        categorysController.init($('#categoryPage'), function() {        
        });	
        });
    </script>
</body>
</html>

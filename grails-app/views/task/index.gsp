<%@ page import="Task" %>
<%@ page import="Category" %>
<!DOCTYPE html>
<html>
    <head>

    <meta charset="utf-8" />

    <title>Tarefas</title>

    <asset:javascript src="jquery-1.11.3.min.js"/> 
    <asset:javascript src="jquery.validate.js"/>
    <asset:javascript src="tasks-controller.js"/>                
    <asset:stylesheet src="02-tasks.css"/>

</head>
<body>
    <header>
        <span>Lista de Tarefas</span>		
    </header>
    <main id="taskPage">
        <section id="taskCreation" class="${taskInstanceIn?'':'nott'}">

            <g:form id="taskForm"  url="[action:'save',controller:'task']" >
                <input type="hidden" name="id" value="${taskInstanceIn?.id}" />							
                <div>
                    <label>Tarefa</label> 
                    <input type="text" required="required" value="${taskInstanceIn?.name}"  name="task" class="large" placeholder="Estudar e programar" maxlength="200" />
                </div>
                <div>
                    <label>Finalizar até</label> <input type="date" value="<g:formatDate format="yyyy-MM-dd" date="${taskInstanceIn?.dateDeadLine}" />" required="required" name="requiredBy" />
                </div>
                <div>
                    <label>Categoria</label> 
                    <g:select id="category" name="category.id"  from="${Category.list()}" optionKey="id" required="" value="${taskInstanceIn?.category?.id}" />
                </div>
                <nav>
                    <a href="#" id="saveTask"  >Salvar tarefa</a>
                    <a href="#" id="clearTask" >Limpar tarefa</a>
                </nav>
            </g:form>
        </section>
        <section>


            <table id="tblTasks">
                <colgroup>					
                    <col width="40%">
                    <col width="15%">
                    <col width="15%">
                    <col width="30%">
                </colgroup>
                <thead>
                    <tr>
                        <th>Nome</th>
                        <th>Deadline</th>
                        <th>Categoria</th>
                        <th>Ações</th>
                    </tr>
                </thead>
                <tbody>	

                    <g:each in="${taskInstanceList}"     var="taskInstance">                            


                        <tr id="${fieldValue(bean: taskInstance, field: "id")}"
                            class=" <g:formatCssTarefa taskDeadLine="${taskInstance.dateDeadLine}" taskCompleted="${taskInstance.completed}" /> ">
                            <td>${fieldValue(bean: taskInstance, field: "name")}</td>
                            <td><g:formatDate format="dd/MM/yyyy" date="${taskInstance.dateDeadLine}" /></time></td>
                            <td>${fieldValue(bean: taskInstance, field: "category")}</td>
                            <td>
                                <nav>			

                                    <g:link class="editRow"
                                        controller="task" action="index" params="[idTask: taskInstance.id]" 
                                    style="${(taskInstance.completed)?'display:none;':''}"
                                        ><g:message code="default.button.editTask.label"  default="Editar" /></g:link>                                        

                                    <g:link  class="completeRow" controller="task" action="completarTask" params="[idTask: taskInstance.id]" 
                                    style="${(taskInstance.completed)?'display:none;':''}"                                    
                                    onclick="return confirm('${message(code: 'default.button.completed.confirm.message', default: 'Deseja realmente marcar a tarefa:'+taskInstance.name+' como completada?')}');"
                                        ><g:message code="default.button.completed.label" default="Completar" /></g:link>

                                    <g:link  class="deleteRow" controller="task" action="deletarTask" 
                                    params="[idTask: taskInstance.id]" 
                                    onclick="return confirm('${message(code: 'default.button.deleted.confirm.message', default: 'Deseja realmente excluir a tarefa: '+taskInstance.name+' ?')}');"
                                        ><g:message code="default.button.delete.label" default="Deletar" /></g:link>

                                </nav>
                            </td>
                        </tr>
                </g:each>

            </tbody>
        </table>
        <nav>			
            <a href="#" id="btnAddTask">Adicionar tarefa</a>            
            <g:link class="list" controller="category" action="index"><g:message code="default.category.list.label"  /></g:link>            
        </nav>


    </section>
</main>
<footer>Você tem <span id="taskCount">${taskInstanceCount}</span> tarefas</footer>

<script>
    $(document).ready(function() {
    tasksController.init($('#taskPage'), function() {    
    });	
    });
</script>


</body>
</html>


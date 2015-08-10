tasksController = function() {

	function errorLogger(errorCode, errorMessage) {
		console.log(errorCode +':'+ errorMessage);
	}
	
	var taskPage;
	var initialised = false;  	
	
	return {
	    
		init : function(page) {
		     									
			if (!initialised) {
			
				taskPage = page;
				
				$(taskPage).find( '[required="required"]' ).prev('label').append( '<span>*</span>').children( 'span').addClass('required');
								
				
				$(taskPage).find( '#btnAddTask' ).click( function(evt) {
					evt.preventDefault();
                                        $(taskPage ).find('#taskCreation' ).removeClass( 'not');
					$(taskPage ).find('#taskCreation' ).removeClass( 'nott');
				});
				
				$(taskPage).find('tbody tr' ).click(function(evt) {
					$(evt.target ).closest('td').siblings( ).andSelf( ).toggleClass( 'rowHighlight');
				});
				
				
				
				
			
				
				
				
				//ação executada quando é efetuada uma inserção de uma nova tarefa ou atualização dos dados de uma tarefa já existente
				$(taskPage).find( '#saveTask' ).click(function(evt) {
					evt.preventDefault();					                                                                                                            	
                                        //primeiro verifica-se se  usuário informou todos os dados da tarefa corretamente						
                                        if ($(taskPage).find('form').valid()) {						   
                                           taskForm.submit();
                                        }			
						
				});
				//fim da ação responsável pela inserção de uma nova tarefa ou atualização dos dados de uma tarefa já existente
				
				
				//ação responsável pela limpeza dos campos de uma nova tarefa que está sendo cadastrada ou dos campos 
				//de uma tarefa que está sendo editada
				$(taskPage).find( '#clearTask' ).click(function(evt) {
				            //percorre todos os campos do formulario com id taskForm e aplica um reset para cada input e select do formulário
							$('#taskForm').each (function(){
								this.reset();
							});		
							//em seguida posiciona o cursor do mouse no elemento input cujo nome é task
							$('input[name=task]').focus();							
				});
				//fim da ação responsável pela limpeza dos campos de uma nova tarefa que está sendo cadastrada ou dos campos de uma tarefa que está sendo editada
				


				
				
				initialised = true;
			}
                    }
	}
}();
categorysController = function() {

	function errorLogger(errorCode, errorMessage) {
		console.log(errorCode +':'+ errorMessage);
	}
	
	var categoryPage;
	var initialised = false;  
				
	return {
	    
		init : function(page) {
		     									
			if (!initialised) {
			
				categoryPage = page;
				
				$(categoryPage).find( '[required="required"]' ).prev('label').append( '<span>*</span>').children( 'span').addClass('required');
				
				$(categoryPage).find('tbody tr:even').addClass( 'even');
				
				$(categoryPage).find( '#btnAddCategory' ).click( function(evt) {
					evt.preventDefault();
                                        $(categoryPage ).find('#categoryCreation' ).removeClass( 'not');                                        
					$(categoryPage ).find('#categoryCreation' ).removeClass( 'nott');
				});
				
				$(categoryPage).find('tbody tr' ).click(function(evt) {
					$(evt.target ).closest('td').siblings( ).andSelf( ).toggleClass( 'rowHighlight');
				});
								
				//ação executada quando é efetuada uma inserção de uma nova tarefa ou atualização dos dados de uma tarefa já existente
				$(categoryPage).find( '#saveCategory' ).click(function(evt) {
					evt.preventDefault();					                                                                                                            	
                                        //primeiro verifica-se se  usuário informou todos os dados da tarefa corretamente						
                                        if ($(categoryPage).find('form').valid()) {						   
                                           categoryForm.submit();
                                        }			
						
				});
				//fim da ação responsável pela inserção de uma nova tarefa ou atualização dos dados de uma tarefa já existente
				
				
				//ação responsável pela limpeza dos campos de uma nova categoria que está sendo cadastrada ou dos campos 
				//de uma categoria que está sendo editada
				$(categoryPage).find( '#clearCategory' ).click(function(evt) {
				            //percorre todos os campos do formulario com id categoryForm e aplica um reset para cada input e select do formulário
							$('#categoryForm').each (function(){
								this.reset();
							});		
							//em seguida posiciona o cursor do mouse no elemento input cujo nome é category
							$('input[name=category]').focus();							
				});
				//fim da ação responsável pela limpeza dos campos de uma nova categoria que está sendo cadastrada ou dos campos de uma categoria que está sendo editada
				
				initialised = true;
			}
                    }             
	}
}();
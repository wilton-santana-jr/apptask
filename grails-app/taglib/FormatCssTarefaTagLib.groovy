import java.util.*;

/**
 * TagLib para exibir o css apropriado para cada tarefa de acordo com a data de deadline da tarefa e se a mesma
 * encontra-se completada ou não
 * @author WILTON
 */
class FormatCssTarefaTagLib {
    def formatCssTarefa = { attrs, body ->
        
        def cssDeSaida="";
        
        def hoje = new java.util.Date();
        
        if(attrs.taskCompleted==true){
            cssDeSaida=cssDeSaida+" taskCompleted ";
        }    
            
        if(attrs.taskDeadLine<hoje){
           cssDeSaida=cssDeSaida+" overdue "; 
        }else{
        
            java.util.Calendar ca = Calendar.getInstance(); 
            ca.setTime(attrs.taskDeadLine);
            ca.add(Calendar.DAY_OF_YEAR,-5);                    
            if((hoje<attrs.taskDeadLine&&
                  hoje>=ca.getTime())){
              cssDeSaida=cssDeSaida+" warning ";
            }  
        }

        out << cssDeSaida
    }
}


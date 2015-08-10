

import static org.springframework.http.HttpStatus.*;
import grails.transaction.Transactional;
import java.util.*;
import Task;
import Category;

@Transactional(readOnly = true)
class TaskController {
    
    
    
    def index() {        

        def taskInstanceIn = Task.get(params.idTask);
        
        params.sort="dateDeadLine"
        params.order="desc"        
        def qtdTarefasEmAberto = Task.where({completed==false}).count()
 
        respond Task.list(params), model:[taskInstanceCount: qtdTarefasEmAberto,taskInstanceIn: taskInstanceIn]    
    }
    
    
    @Transactional
    def deletarTask(Integer idTask) {

        
        def taskInstance = Task.get(idTask);
        
        if (taskInstance == null) {
            notFound()
            return
        }

        taskInstance.delete flush:true
        
        
        redirect(controller: "task", action: "index");                
        
    }
        
    @Transactional
    def completarTask(Integer idTask) {
        
        def taskInstance = Task.get(idTask);

        
        if (taskInstance == null) {
            notFound()
            return            
            
        }else if(taskInstance.completed!=true){
            taskInstance.completed=true        
            taskInstance.save flush:true        
        }    
                
        redirect(controller: "task", action: "index");                
        
    }
    
    
    @Transactional
    def save() {
        
        def taskInstance;
        
        taskInstance = Task.get(params.id);
                              
        if(taskInstance!=null && taskInstance.completed!=true){
            taskInstance.completed=false;
            taskInstance.name=params.task;
            taskInstance.dateDeadLine=new Date().parse('yyyy-MM-dd', params.requiredBy);
            taskInstance.category= Category.get(params.category.id);
            taskInstance.save flush:true
        }else{           
            taskInstance = new Task(name:params.task, dateDeadLine: new Date().parse('yyyy-MM-dd', 
                    params.requiredBy), completed: false, category: Category.get(params.category.id));                                       
            taskInstance.save flush:true        
        }   
          

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.task.created.message', args: [message(code: 'task.label', default: 'Tarefa'), taskInstance.id])
                //redirect taskInstance
                redirect(controller: "task", action: "index"); 
            }
            '*' { respond taskInstance, [status: CREATED] }
        }
    }
    
    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'task.label', default: 'Tarefa'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
    
}

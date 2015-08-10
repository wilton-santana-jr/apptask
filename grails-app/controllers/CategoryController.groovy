

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional;
import java.util.*;

import Category;


//Controlador  responsavel por gerenciar as categorias de tarefas do usuario do sistema
@Transactional(readOnly = true)
class CategoryController {
        
    
    def index() {        
               
         def categoryInstanceIn = Category.get(params.idCategory);
                    
         params.sort="name"
         params.order="asc"        
         
         respond Category.list(params), model:[categoryInstanceIn: categoryInstanceIn]    
    }
    
    
    @Transactional
    def deletarCategory(Integer idCategory) {

        
        def categoryInstance = Category.get(idCategory);
        
        if (categoryInstance == null) {
            notFound()
            return
        }

        categoryInstance.delete flush:true
        
        
        redirect(controller: "category", action: "index");                
        
    }
    
    @Transactional
    def save() {
        def categoryInstance;
        
        categoryInstance = Category.get(params.id);
                              
        if(categoryInstance!=null){            
            categoryInstance.name=params.category;            
            categoryInstance.save flush:true
        }else{           
            categoryInstance = new Category(name:params.category);                                       
            categoryInstance.save flush:true        
        }   
          

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.category.created.message', args: [message(code: 'category.label', default: 'Categoria'), categoryInstance.id])
                //redirect categoryInstance
                redirect(controller: "category", action: "index"); 
            }
            '*' { respond taskInstance, [status: CREATED] }
        }
    }
    
    
    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'category.label', default: 'Categoria'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
    
}
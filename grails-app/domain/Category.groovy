
class Category {
    String name;         
    
    static constraints = {
        name(blank:false) 
    }
    
    String toString(){ 
      "${name}" 
    } 
}




class Task {
    String name;
    Date dateDeadLine;
    Boolean completed;
    
    static belongsTo = [category:Category]
    
    static constraints = {
        name(blank:false, maxSize:50)
        category()        
        dateDeadLine() 
        completed()     
    }
    
}


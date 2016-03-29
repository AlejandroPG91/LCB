package frontController;

import controller.BookFacadeLocal;
import entity.Book;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletException;

public class ModifyInDataBaseCommand extends FrontCommand{

    @Override
    public void process() {
        try {
            BookFacadeLocal DBConnection = InitialContext.doLookup("java:global/LCB/LCB-ejb/BookFacade");
            Book book;
            
            String isbn = request.getParameter("isbn3");
            
            book = DBConnection.find(Integer.parseInt(isbn));
            
            String title = request.getParameter("title1");
            String author = request.getParameter("author1");
            String publisher = request.getParameter("publisher1");
            String publishYear = request.getParameter("publishYear1");
            String price = request.getParameter("price1");
            String copy = request.getParameter("copy1");
            
            if(title != ""){
                book.setTitle(title);
            }
            if (author != ""){
                book.setAuthor(author);
            }
            if(publisher != ""){
                book.setPublisher(publisher);
            }
            if(publishYear != ""){
                book.setPublishyear(Integer.parseInt(publishYear));
            }
            if(price != ""){
                book.setPrice(Integer.parseInt(price));
            }
            if(copy != ""){
                book.setCopy(Integer.parseInt(copy));
            }
            
            DBConnection.edit(book);
            
            forward("/indexView.jsp");
            
        } catch (NamingException | ServletException | IOException ex) {
            Logger.getLogger(ModifyInDataBaseCommand.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
}

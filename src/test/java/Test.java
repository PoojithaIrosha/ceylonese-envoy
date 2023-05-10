import com.ceyloneseenvoy.ceyloneseenvoy.model.Customer;
import com.ceyloneseenvoy.ceyloneseenvoy.util.HibernateUtil;
import org.hibernate.Session;

public class Test {
    public static void main(String[] args) {
        Session session = HibernateUtil.getSessionFactory().openSession();

        System.out.println(session.get(Customer.class, 1L));
    }
}
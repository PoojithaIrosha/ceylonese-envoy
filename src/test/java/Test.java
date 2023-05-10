import com.ceyloneseenvoy.ceyloneseenvoy.model.User;
import com.ceyloneseenvoy.ceyloneseenvoy.util.HibernateUtil;
import org.hibernate.Session;

public class Test {
    public static void main(String[] args) {
        Session session = HibernateUtil.getSessionFactory().openSession();

        System.out.println(session.get(User.class, 1L));
    }
}
import com.ceyloneseenvoy.ceyloneseenvoy.model.Customer;
import com.ceyloneseenvoy.ceyloneseenvoy.model.TourReview;
import com.ceyloneseenvoy.ceyloneseenvoy.util.HibernateUtil;
import org.hibernate.Session;

public class Test {
    public static void main(String[] args) {
        try(Session hs = HibernateUtil.getSessionFactory().openSession()) {
            hs.createQuery("from TourReview tr where tr.tourPackage.id = :id", TourReview.class)
                    .setParameter("id", 1L)
                    .list()
                    .forEach(System.out::println);
        }
    }
}
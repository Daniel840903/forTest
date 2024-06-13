package model;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

public class ProductDao {

    private Session session;

    public ProductDao(Session session) {
        this.session = session;
    }

    public Product findById(int id) {
        return session.get(Product.class, id);
    }

    public List<Product> findAll() {
        Query<Product> query = session.createQuery("from Product", Product.class);
        return query.list();
    }

    public Product insert(Product product) {
        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            session.persist(product);
            System.out.println(product);
            tx.commit();
            return product;
        } catch (Exception e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
            return null;
        }
    }


    public Product update(Product product) {
        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            session.update(product);
            tx.commit();
            return product;
        } catch (Exception e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
            return null;
        }
    }


    public boolean deleteById(int id) {
        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            Product product = session.get(Product.class, id);
            if (product != null) {
                session.remove(product);
                tx.commit();
                return true;
            }
            return false;
        } catch (Exception e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
            return false;
        }
    }


    public List<Product> getLikeProducts(String productName) {
        Query<Product> query = session.createQuery("from Product where productName like :name", Product.class);
        query.setParameter("name", "%" + productName + "%");
        return query.list();
    }
}

package model;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.query.Query;

public class ProductDao implements IProduct {

    private Session session;

    public ProductDao(Session session) {
        this.session = session;
    }
@Override
    public Product findById(int id) {
        return session.get(Product.class, id);
    }
@Override
    public List<Product> findAll() {
        Query<Product> query = session.createQuery("from Product", Product.class);
        return query.list();
    }
@Override
    public Product insert(Product insterBean) {
        session.persist(insterBean);
        session.flush();
        return insterBean;
        }
@Override
    public Product update(Product updateBean) {
        Product resultBean = session.get(Product.class,updateBean.getProductid());
        if (resultBean != null) {
            resultBean.setProductName(updateBean.getProductName());
            resultBean.setPrice(updateBean.getPrice());
            resultBean.setDescription(updateBean.getDescription());
            resultBean.setStockQuantity(updateBean.getStockQuantity());
            session.update(resultBean);
            session.flush();
        }
        return resultBean;
        
    }

@Override
    public boolean deleteById(int id) {
        Product deleteBean = session.get(Product.class,id);
        if(deleteBean!=null) {
        	session.remove(deleteBean);
        	session.flush();
        	return true;
        }
        return false;
    }


    public List<Product> getLikeProducts(String productName) {
        Query<Product> query = session.createQuery("from Product where productName like :name", Product.class);
        query.setParameter("name", "%" + productName + "%");
        return query.list();
    }
}

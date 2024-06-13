package model;

import java.util.List;

import org.hibernate.Session;

public class ProductService implements IProductService {

    private ProductDao pDao;

    public ProductService(Session session) {
        pDao = new ProductDao(session);
    }

    @Override
    public Product findById(int id) {
        return pDao.findById(id);
    }

    @Override
    public List<Product> findAll() {
        return pDao.findAll();
    }

    @Override
    public Product insert(Product insertBean) {
        return pDao.insert(insertBean);
    }

    @Override
    public Product update(Product updateBean) {
        return pDao.update(updateBean);
    }

    @Override
    public boolean deleteById(int id) {
        return pDao.deleteById(id);
    }

    @Override
    public List<Product> getLikeProducts(String productName) {
        return pDao.getLikeProducts(productName);
    }
}

package model;

import java.util.List;

public interface IProductService {

    public Product findById(int id);

    public List<Product> findAll();

    public Product insert(Product insertBean);

    public Product update(Product updateBean);

    public boolean deleteById(int id);

    public List<Product> getLikeProducts(String productName);
}

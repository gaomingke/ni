package servlet;

import util.Product;

import java.util.ArrayList;
import java.util.List;

public class ProductServlet {
 public List<Product> findAll() {

        Product product1 = new Product();
        product1.setNumber(267);
        product1.setName("小米");
        product1.setId(123);
        product1.setPrice(8867F);


        Product product2 = new Product();
        product2.setNumber(167);
        product2.setName("华为");
        product2.setId(126);
        product2.setPrice(5867F);


        Product product3 = new Product();
        product3.setNumber(367);
        product3.setName("iphone6");
        product3.setId(163);
        product3.setPrice(8967F);

        List<Product> products = new ArrayList<>();
        products.add(product1);
        products.add(product2);
        products.add(product3);

        return products;

    }
}

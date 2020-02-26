package perfume.entity;

import java.util.HashMap;
import java.util.Map;
import java.util.Set;

//购物车类
//购物车类
public class Cart {

    public static void main(String[] args) {

    }

    //购买商品的集合
    private HashMap<Item, Integer> goods;

    //购物车的总金额
    private double totalPrice;

    public HashMap<Item, Integer> getGoods() {
        return goods;
    }

    public void setGoods(HashMap<Item, Integer> goods) {
        this.goods = goods;
    }

    public Cart() {
        goods = new HashMap<>();
        totalPrice = 0.0;
    }
    public int getItemNumber(){
        return goods.size();
    }

    public double getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(double totalPrice) {
        this.totalPrice = totalPrice;
    }

    //添加商品进购物车的方法
    public boolean addGoodInCart(Item item, int number) {
        if (goods.containsKey(item)) {

            goods.put(item, goods.get(item) + number);
        } else {

            goods.put(item, number);
        }
        calTotalPrice();//重新计算购物车的总金额
        return true;
    }

    //删除商品的方法
    public boolean removeGoodsFromCart(Item item) {
        goods.remove(item);
        calTotalPrice();//重新计算购物车的总金额
        return true;
    }

    public double calTotalPrice() {
        double sum = 0.0;
        Set<Item> keySet = goods.keySet();//获得键的集合
        for (Item Item : keySet) {
            sum += Item.getPrice() * goods.get(Item);
        }
        this.setTotalPrice(sum);//设置购物车的总金额
        return sum;
    }

    public boolean reduceNumber(Item item,int number){
        if(goods.containsKey(item)){
            if(goods.get(item)>number){
                goods.put(item, goods.get(item) - number);
                calTotalPrice();
                return true;
            }else{
                return false;
            }
        }else{
            return false;
        }
    }
}


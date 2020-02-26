package perfume.entity;

/**
 * 商品类
 */
public class Item {
    private int id;//id
    private String name;//中文名
    private String engname;//英文名
    private String brand;//品牌
    private double price;//价格
    private String photo;//照片
    private String desc;//描述
    private int stock; //库存

    public Item(int id, String name, String engname, String brand, double price, String photo, String desc, int stock) {
        this.id = id;
        this.name = name;
        this.engname = engname;
        this.brand = brand;
        this.price = price;
        this.photo = photo;
        this.desc = desc;
        this.stock = stock;
    }

    public Item() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEngname() {
        return engname;
    }

    public void setEngname(String engname) {
        this.engname = engname;
    }

    public String getBrand() {
        return brand;
    }

    public void setBrand(String brand) {
        this.brand = brand;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getPhoto() {
        return photo;
    }

    public void setPhoto(String photo) {
        this.photo = photo;
    }

    public String getDesc() {
        return desc;
    }

    public void setDesc(String desc) {
        this.desc = desc;
    }

    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }


    @Override
    public int hashCode() {
        // TODO Auto-generated method stub
        return this.getId()+this.getName().hashCode();
    }

    @Override
    public boolean equals(Object obj) {
        // TODO Auto-generated method stub
        if(this==obj)
        {
            return true;
        }
        if(obj instanceof Item)
        {
            Item i = (Item)obj;
            if(this.getId()==i.getId()&&this.getName().equals(i.getName()))
            {
                return true;
            }
            else
            {
                return false;
            }
        }
        else
        {
            return false;
        }
    }
}

package user.db;

public class ProductDto {

    private String sProductName;
    private String sProductAuthor;
    private String sProductPublisher;
    private String sProductDescription;
    private String sProductImage;

    public String getsProductName() {
        return sProductName;
    }

    public void setsProductName(String sProductName) {
        this.sProductName = sProductName;
    }

    public String getsProductAuthor() {
        return sProductAuthor;
    }

    public void setsProductAuthor(String sProductAuthor) {
        this.sProductAuthor = sProductAuthor;
    }

    public String getsProductPublisher() {
        return sProductPublisher;
    }

    public void setsProductPublisher(String sProductPublisher) {
        this.sProductPublisher = sProductPublisher;
    }

    public String getsProductDescription() {
        return sProductDescription;
    }

    public void setsProductDescription(String sProductDescription) {
        this.sProductDescription = sProductDescription;
    }

    public String getsProductImage() {
        return sProductImage;
    }

    public void setsProductImage(String sProductImage) {
        this.sProductImage = sProductImage;
    }
}

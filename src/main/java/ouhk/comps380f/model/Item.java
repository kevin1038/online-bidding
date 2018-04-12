package ouhk.comps380f.model;

import java.util.Collection;
import java.util.Hashtable;
import java.util.Map;

public class Item {

    private long id;
    private String itemName;
    private String description;
    private Map<String, Photo> photos = new Hashtable<>();
    private double price;
    private String owner;
    private long bidCount;
    private String status;
    private Map<Integer, Comment> comments = new Hashtable<>();

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getItemName() {
        return itemName;
    }

    public void setItemName(String itemName) {
        this.itemName = itemName;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Photo getPhoto(String name) {
        return this.photos.get(name);
    }

    public Collection<Photo> getPhotos() {
        return this.photos.values();
    }

    public void addPhoto(Photo photo) {
        this.photos.put(photo.getName(), photo);
    }

    public int getNumberOfPhotos() {
        return this.photos.size();
    }

    public boolean hasPhoto(String name) {
        return this.photos.containsKey(name);
    }

    public Photo deletePhoto(String name) {
        return this.photos.remove(name);
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getOwner() {
        return owner;
    }

    public void setOwner(String owner) {
        this.owner = owner;
    }

    public long getBidCount() {
        return bidCount;
    }

    public void setBidCount(int bidCount) {
        this.bidCount = bidCount;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Map<Integer, Comment> getComments() {
        return comments;
    }

    public void setComments(Map<Integer, Comment> comments) {
        this.comments = comments;
    }

}

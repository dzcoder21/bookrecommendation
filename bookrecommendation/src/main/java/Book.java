// Book.java
public class Book {
    private int id;
    private String title;
    private String author;
    private double rating;

    public Book(int id, String title, String author, double rating) {
        this.id = id;
        this.title = title;
        this.author = author;
        this.rating = rating;
    }

    // Getters
    public int getId() { return id; }
    public String getTitle() { return title; }
    public String getAuthor() { return author; }
    public double getRating() { return rating; }
}

package ouhk.comps380f.model;

public class Photo {

    private String name;
    private String mimeContentType;
    private byte[] contents;
    private String encodedContents;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getMimeContentType() {
        return mimeContentType;
    }

    public void setMimeContentType(String mimeContentType) {
        this.mimeContentType = mimeContentType;
    }

    public byte[] getContents() {
        return contents;
    }

    public void setContents(byte[] contents) {
        this.contents = contents;
    }

    public String getEncodedContents() {
        return encodedContents;
    }

    public void setEncodedContents(String encodedContents) {
        this.encodedContents = encodedContents;
    }
    
}

package vo;

import org.springframework.web.multipart.MultipartFile;

public class BootcampVO {
	private int bnum;
	private String program;
	private String academy;
	private String logo;
	private String img;
	private String url;
	private String address;
	private int visible;
	private int mnum;
	private MultipartFile logoFile;
	private MultipartFile imgFile;
	
	/*public BootcampVO() {
		super();
	}
	public BootcampVO(String program, String academy) {
		this.program = program;
		this.academy = academy;
	}*/
	
	public int getBnum() {
		return bnum;
	}
	public void setBnum(int bnum) {
		this.bnum = bnum;
	}
	public String getProgram() {
		return program;
	}
	public void setProgram(String program) {
		this.program = program;
	}
	public String getAcademy() {
		return academy;
	}
	public void setAcademy(String academy) {
		this.academy = academy;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public int getVisible() {
		return visible;
	}
	public void setVisible(int visible) {
		this.visible = visible;
	}
	public int getMnum() {
		return mnum;
	}
	public void setMnum(int mnum) {
		this.mnum = mnum;
	}
	public String getLogo() {
		return logo;
	}
	public void setLogo(String logo) {
		this.logo = logo;
	}
	public MultipartFile getLogoFile() {
		return logoFile;
	}
	public void setLogoFile(MultipartFile logoFile) {
		this.logoFile = logoFile;
	}
	public MultipartFile getImgFile() {
		return imgFile;
	}
	public void setImgFile(MultipartFile imgFile) {
		this.imgFile = imgFile;
	}
	@Override
	public String toString() {
		return "BootcampVO [bnum=" + bnum + ", program=" + program + ", academy=" + academy + ", logo=" + logo
				+ ", img=" + img + ", url=" + url + ", address=" + address + ", visible=" + visible + ", mnum=" + mnum
				+ ", logoFile=" + logoFile + ", imgFile=" + imgFile + "]";
	}
	
	
}

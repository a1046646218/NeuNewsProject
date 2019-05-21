package neu.edu.entity;

public class commentDecode {
	private comment com;
	private int flag;
	public commentDecode(comment com, int flag) {
		super();
		this.com = com;
		this.flag = flag;
	}
	public comment getCom() {
		return com;
	}
	public void setCom(comment com) {
		this.com = com;
	}
	public int getFlag() {
		return flag;
	}
	public void setFlag(int flag) {
		this.flag = flag;
	}
	
}

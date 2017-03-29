package shop.jlmy.dto;

import java.util.List;

public class Page {
	private int pageSize;			//每页显示的条数
	private int pageNow;			//当前页码
	private int pageCount;			//总页数
	private int total;				//总记录数
	private List<?> list;			//当前页码中显示的对象集合

	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public int getPageNow() {
		return pageNow;
	}
	public void setPageNow(int pageNow) {
		this.pageNow = pageNow;
	}
	public int getPageCount() {
		return (total%pageSize!=0)?total/pageSize+1:total/pageSize;
	}
	public void setPageCount(int pageCount) {
		this.pageCount = pageCount;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public List<?> getList() {
		return list;
	}
	public void setList(List<?> list) {
		this.list = list;
	}
	public Page(int pageSize, int pageNow, int pageCount, int total, List<?> list) {
		super();
		this.pageSize = pageSize;
		this.pageNow = pageNow;
		this.pageCount = pageCount;
		this.total = total;
		this.list = list;
	}
	public Page() {
		super();
	}
	@Override
	public String toString() {
		return "Page [pageSize=" + pageSize + ", pageNow=" + pageNow
				+ ", pageCount=" + pageCount + ", total=" + total + ", list="
				+ list + "]";
	}
}

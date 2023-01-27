package vo;

public class PagingVO {

		private int curPage=1;           // 현재 페이지 번호
		private int rowSizePerPage=5;   // 한 페이지당 레코드 수      
		private int pageSize=5;         // 페이지 리스트에서 보여줄 페이지 갯수   
		private int totalRowCount ;      // 총 레코드 건수
		
		
		
		private int firstRow ;           // 시작 레크드 번호   
		private int lastRow;             // 마지막 레크드 번호 
		private int totalPageCount;      // 총 페이지 건수
		private int firstPage; 	         // 페이지 리스트에서 시작  페이지 번호 
		private int lastPage;            // 페이지 리스트에서 마지막 페이지 번호 
		private int bnum;

		public void pageSetting() {
			totalPageCount = (totalRowCount-1)/rowSizePerPage+ 1;
			firstRow = (curPage - 1) * rowSizePerPage + 1;
			lastRow = firstRow + rowSizePerPage-1;
			if(lastRow >= totalRowCount) { 
				lastRow = totalRowCount;
			} 

			firstPage = (  (curPage-1) / pageSize) * pageSize + 1;
			
			lastPage = firstPage + pageSize-1;
			if(lastPage > totalPageCount) {
				lastPage = totalPageCount;
			}
		
			
		}
		
		public int getCurPage() {
			return curPage;
		}


		public void setCurPage(int curPage) {
			this.curPage = curPage;
		}


		public int getRowSizePerPage() {
			return rowSizePerPage;
		}


		public void setRowSizePerPage(int rowSizePerPage) {
			this.rowSizePerPage = rowSizePerPage;
		}


		public int getFirstRow() {
			return firstRow;
		}


		public void setFirstRow(int firstRow) {
			this.firstRow = firstRow;
		}


		public int getLastRow() {
			return lastRow;
		}


		public void setLastRow(int lastRow) {
			this.lastRow = lastRow;
		}


		public int getTotalRowCount() {
			return totalRowCount;
		}


		public void setTotalRowCount(int totalRowCount) {
			this.totalRowCount = totalRowCount;
		}


		public int getTotalPageCount() {
			return totalPageCount;
		}


		public void setTotalPageCount(int totalPageCount) {
			this.totalPageCount = totalPageCount;
		}


		public int getPageSize() {
			return pageSize;
		}


		public void setPageSize(int pageSize) {
			this.pageSize = pageSize;
		}


		public int getFirstPage() {
			return firstPage;
		}


		public void setFirstPage(int firstPage) {
			this.firstPage = firstPage;
		}


		public int getLastPage() {
			return lastPage;
		}


		public void setLastPage(int lastPage) {
			this.lastPage = lastPage;
		}
		public int getBnum() {
			return bnum;
		}
		public void setBnum(int bnum) {
			this.bnum = bnum;
		}
}

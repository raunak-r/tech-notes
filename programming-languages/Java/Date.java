public class Date{
	/*A DATE WILL HAVE THE FOLLOWING ATTRIBUTES*/
	private int day;
	private	int month;
	private int year;
	private boolean valid;
	private boolean leap;

	//SETS THE DATE TO 1,1,1753
	//CALLS EACH OF THE 3 FUNCTION TO SET THE DAY, MONTH, YEAR
	Date(){
		//System.out.println("date");
		setValid(1,1,1753);
		
		setDay(1,1,1753);
		setMonth(1);
		setYear(1753);
		
		setDate(1,1,1753);
	}	

	//THIS IS INVOKED WHEN PARAMETERS ARE PASSED TO SET THE DATE.
	//setValid(m,d,y); IS CALLED TO CHECK IF THE GIVEN DATE IS VALID OR NOT.
	Date(int m, int d, int y){
		//System.out.println("date(m,d,y)");
		setValid(m,d,y);
		
		setMonth(m);
		setDay(m,d,y);
		setYear(y);

		setDate(m,d,y);
	}

	//THE PURPOSE IS TO PRINT WHETHER THE DATE IS VALID OR NOT.
	void setDate(int m, int d, int y){
		//System.out.println("SETdate(m,d,y)");
		if(this.valid == true){
			System.out.println("Valid");
			System.out.println(this.month + ", " + this.day + ", " + this.year + "\n");
		}
		else if(this.valid == false){
			System.out.println("NOT Valid");
			System.out.println(this.month + ", " + this.day + ", " + this.year + "\n");
		}	
	}

	//If the passed parameters are valid then set the day to the given d.
	private void setDay(int m,int d,int y){
		if(this.valid){
			this.day = d;
		}
		else{
			this.day = 1;
		}
	}

	private void setMonth(int m){
		if(this.valid){
			this.month = m;
		}
		else
			this.month = 1;
	}

	private void setYear(int y){
		if(this.valid)
			this.year = y;
		else
			this.year = 1753;
	}


	//CHECKS IF THE GIVEN PARAMETERS ARE VALID OR NOT
	private void setValid(int m, int d, int y) {
		//System.out.println("Inside setValid");
		//System.out.println(m + "," + d + "," + y);
        if (y < 1753 || y > 3000 ) {
        	this.valid = false;
        	return;
        }
        if (m < 1 || m > 12) {        	
        	this.valid = false;
        	return;
        }
        if ((d < 1) || (d > 31)) {
        	this.valid = false;
        	return;
        }
        	
        /*TO CHECK IF THE GIVEN YEAR IS A LEAP YEAR*/
   	    if(y%4 == 0){
   	    	this.leap = true;
    	}
    	else if(y%100 == 0){
    		if(y%400 == 0){
    			this.leap = true;	
    		}
    	}
    	else
    		this.leap = false;
       	
       	//System.out.println(this.leap);

    	/*TO CHECK IF GIVEN DATE IS VALID OR NOT FOR THE GIVEN YEAR*/
    	
    	//IF LEAP YEAR AND FEB > 29 days
    	if((this.leap == true) && (m == 2)){
    		if(d>29 || d<0){
    			this.valid = false;
    			return;
    		}
    		else{
    			this.valid = true;
    			return;	
    		}
    	}
    	
    	//IF NOT LEAP YEAR AND FEB HAS >28 days
    	if(this.leap == false && m==2){
    		if(d>28 || d<0){
    			this.valid = false;
    			return;
    		}
    		else
    			this.valid = true;	
    	}
    	
    	//DO THIS IF IT IS NOT A LEAP YEAR
    	if(m>=1 && m<=7){
    		if(m%2 == 1){
    			if(d<=30 && d>=1)
    				this.valid = true;
    			else
    				this.valid = false;
    			return;
    		}
    		else{
    			if(d<=30 && d>=1)
    				this.valid = true;
    			else
    				this.valid = false;
    			return;
    		}
    	}

    	else if(m>=8 && m<=12){
    		if( m%2 == 0){
    			if(d<=30 && d>=1)
    				this.valid = true;
	    		else
    				this.valid = false;
    			return;
    		}
    		else{
    			if(d<=30 && d>=1)
    				this.valid = true;
	    		else
    				this.valid = false;
    			return;
    		}
    	}
    }

    public static void main(String args[]){
    	System.out.println("WELCOME TO DATE MACHINE");
		Date d3 = new Date(1,25,2500);	//valid
		Date d4 = new Date();	//will set it to 1,1,1753
		Date d1 = new Date(5,2,3001);	//not valid
		Date d2 = new Date(1,1,1500);	//not valid
		Date d5 = new Date(12,6,2017);	//valid
		Date d6 = new Date(9,8,2016);	//valid
		Date d7 = new Date(2,30,2500);	//NOT valid
		Date d8 = new Date(2,28,2500);	//Valid
	}
}
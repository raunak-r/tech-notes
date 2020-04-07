<script>
var A, B;

function get_part1matrices_from_html() {
    A = [];
    for(var row=0; row<4; row++){
    	A[row]=[]; // initialize 
    	for(var col = 0; col<4; col++) 
    		A[row][col] = 0;
    }

    B = [];
    for(var row = 0; row<4; row++){
    	B[row] = []; // initialize
		for(var col = 0; col <4; col++) 
			B[row][col] = 0;
	}
	// we know A is 4x4, you may hard-code those values
    // TO-DO: insert logic here to populate Javascript matrix A from the PART1 HTML table  
    
    for(var i=1; i<=4; i++){
    	for(var j=1; j<=4; j++){
    		var elem = document.getElementById('a'+i+j).value;
    		var element = parseFloat(elem);
    		A[i][j] = element;
    	}
    } 

    // !!! you have to use nested for-loops and dynamically address the HTML 
    // tags by noticing their ids (row/column indexed) 

    // we know B is also 4x4
	for(var i=1; i<=4; i++){
	    for(var j=1; j<4=; j++){
	    	var elem = document.getElementById('b'+i+j).value;
	    	var element = parseFloat(elem);
	    	B[i][j] = element;
	    }	
	} 
    // TO-DO: insert logic here to populate Javascript matrix B from the PART 1 HTML table 
}

function get_part2matrices_from_html() {
    A = [];
    for(var row= 0; row<4; row++){
    	A[i] = []; // initialize 
    	for(var col = 0; col <4; col ++) 
    		A[row][col] = 0;
    }

    B = [];
    for(var i = 0; i<4; i++) B[i] = []; // initialize
	
	for(var i=1; i<=4; i++){
    	for(var j=1; j<4=; j++){
    		var elem = document.getElementById('d'+i+j).value;
    		var element = parseFloat(elem);
    		A[i][j] = element;
    	}
    }

    for(var i=1; i<=4; i++){
    		var elem = document.getElementById('e'+i+1).value;
    		var element = parseFloat(elem);
    		B[i][1] = element;
    	}
    }
    // the HTML tag id's begin with d, e and f
}

function multiply(A, B) {
        
        // find the sizes of matrices A, and B (they could be vectors)
        // assign the sizes to r1, c1, r2, c2
        var r1_A = A.length;
        var c1_A = A[0].length;

        var r2_B = B.length;
        var c2_B = B[0].length;
        // if the matrices are not comformable, output an alert and return
        if( c1_A != r2_B ){
        	//OUTPUT ALERT
        	//RETURN
        }
        
        // compute the size of the output matrix, assign to r3 and c3
        // create the new matrix C 
        var C = [];
        for(var i = 0; i<r1_A; i++){
        	C[i] = []; // initialize 
    		for(var j= 0; j<c2_B; j++) 
    			C[i][j] = 0;
		}
        
        // compute C 
        for(var row=0; row<r1_A; row++){
    		for(var col=0; col<c2_B; col++) 
    			for(var i=0; i<c1_A; i++){
    				C[row][col] += A[row][i] * B[i][col];
    			}
		}

        return C;
}

function workpart1() {
    
    get_part1matrices_from_html(); // fetch data from HTML tables
    var C = multiply(A, B); // perform the multiplication 
    var r3 = C.length; // find output matrix rows  
    var c3 = C[0].length; // find output matrix columns

    for(var r=0; r<r3; r++) {
        for(var c=0; c<c3; c++) {
            // populate HTML table C
            document.getElementById('c' + (r+1).toString() + (c+1).toString()).value = C[r][c];
        }
    }
    document.getElementById('output').innerHTML = "Done!";
}

function workpart2() {
    
    get_part2matrices_from_html(); // fetch data from HTML tables
    var C = multiply(A, B); // perform the multiplication 
    var r3 = C.length;  // find output matrix rows  
    var c3 = C[0].length;// find output matrix columns
    
    for(var r = 0;r<r3;r++) {
        for(var c = 0; c<c3; c++) {
            // populate HTML table f
            document.getElementById('f' + (r+1).toString() + (c+1).toString()).value = C[r][c];
        }
    }
    document.getElementById('output').innerHTML = "Done!";
}

</script>
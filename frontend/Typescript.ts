```
Ts is superset of js.

. strong typing, like c, java etc.
. object-oriented features.
. compile-time checking
. modules, classes, Interfaces, Access Modifiers

Browsers convert/transpile TS to JS.

### Install TypeScript
	> npm install -g typescript
	> tsc --version
```

function log(message){
	console.log(message);
}

function doSomething(){
	for(let i=0; i<5; i++){
		console.log(i);
	}
	// notice how i is available outside for block.
	// var creates global variable.
	// and yet ts generates valid js code.
	// so, always use 'let' to declare variables.
	// console.log("F: " + i);
}
doSomething()

var message = 'Hello World';
log(message);

////////////////////////// Data Types
// throws error
let count = 5;
count = 'a';
// therefore
let a: number;
let b: boolean;
let c: string;
let d: any;
let e: number[] = [1,2,3];
let f: any[] = [1, true, 'a', false];

const colorRed = 0;
const colorGreen = 1;

enum Color { Red=0, Green=1 };
// enum automatically sets first value as 0,
// and so on, but better to write it explicitly.
let backgroundColor = Color.Red;


////////////////////////// Type Assertions
let msg = 'abc';
let endsWithC = emsg.endsWith('c');


// type assertions
let endsWithC = (<string>message).endsWith('c');
let alternativeWay = (message as string).endsWith('c');


////////////////////////// Arrow Functions
let log = function(msg){
	console.log(msg);
}

let doLog = (message) => {
	console.log(message);
}

let doLog = () => console.log();


////////////////////////// Interfaces
let drawPoint = (x,y) => {
	// see below
}
// instead of above better to call in this way
interface Point{
	x: number,
	y: number
}

let drawPoint = (point: Point) => {
	// ...
}

drawPoint({
	x: 1,
	y: 2
})

////////////////////////// Classes & Objects
class Point{
	x: number;
	y: number;

	// ? makes a parameter optional
	constructor(x?:number, y?:number){
		this.x = x;
		this.y = y;
	}
	draw(){
		console.log('x: ' + this.x + ' y: ' + this.y);
	}
	getDistance(another: Point){}
}

let point = new Point();
point.x=1;
point.y=2;
point.draw();


////////////////////////// Access Modifiers
class Point{
	constructor(private x?:number, private y?:number){}
	
	draw(){
		console.log('x: ' + this.x + ' y: ' + this.y);
	}
	getDistance(another: Point){}
}

let point = new Point(1,2);
point.draw();


////////////////////////// Properties
// creating private fields but they can be set or get
// by caller functions.
class Point{
	constructor(private _x?:number, private _y?:number){}
	
	draw(){
		console.log('x: ' + this._x + ' y: ' + this._y);
	}
	getDistance(another: Point){}

	get x(){
		return this._x;
	}
	set x(value){
		if(value)
			this._x = value;
		else
			throw new Error('Error Statement');
	}
}

let point = new Point(1,2);
let x = point.x;
point.x = 10;
point.draw();

>>> Run the file: tsc --target es5 temp.ts


////////////////////////// Modules
import { Point } from './point';


////////////////////////// EXAMPLE LIKE COMPONENT
export class LikeComponent{
	constructor(private _likesCount: number,\
				private _isSelected: boolean){

	}

	onClick(){
		this._likesCount += (this._isSelected) ? -1 : 1;
		this._iSelected = !this._isSelected;
	}

	get likesCount(){
		return this._likesCount;
	}

	get isSelected(){
		return this._isSelected;
	}
}


// 
import { LikeComponent } from './like.component';

let component = new LikeComponent(10, true);
component.onClick();
console.log('likesCount': ${component._likesCount}, _isSelected=false)
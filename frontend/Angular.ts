Components - Template + Data + Behaviour (of a view)
Directives
Routers
Services

```
> Property Binding
> CSS Class Binding
> Style Binding
> Event Binding
```


# component
data
html template
logic

example components:
	navbar
	sidebar
	courses
 		rating component

A real world app is a tree of components.

create
register it in a module
add an element in an html markup

1. component
2. generating components
3. templates
4. directives
5. services
6. dependency injection
7. generating services

# Displaying data and handling events

1. display data
2. apply classes / styles dynamically
3. format data using pipes
4. handle events

## Property Binding

string interpolation - <h2>{{ title }}</h2>
property binding - <h2 [textContent]="title"></h2>

## Attribute Binding

<table>
	<tr>
		<td [attr.colspan]="colSpan"></td>
	</tr>
</table>

### DOM vs HTML
DOM is the tree of objects, html is a markup lang used to represent DOM.
DOM can be also created using vanilla js.

ex HTMl -> <img src="">
ex. DOM -> img has a property src

we've properties in dom, which aren't there in html.
html and dom properties have a 1-1 mapping.

if the attribute is not found, then attr.propertyName syntax can be used.

## Bootstrap
	
	> npm install bootstrap --save

^3.3.7 - major.minor.patch

Inside src>styles.css

import bootstrap/dist/css/bootstrap.css

## Class Binding

[class.active]="some Field defined inside the class"
[class.active]="isActive"

isActive = true;
when based on some condition, a class is added.

## Style Binding
[style.anyStyleProperty]="isActive ? 'blue' : 'white'"

based on some condition, a style property will be set.

Google for "dom style object property"

## Event Binding
mousemovements, keystrokes, etc.

(click)="methodInComponent"
ex. <button (click)="onSave($event)">

	onSave($event){
		console.log("button clicked", $event)
	}

### Event Bubbling

<div (click)="onDivClicked">
	<button (click)="onSave">
	</button>
</div>

to stop multiple on click events from taking place. add the below line in the last onClick Method.

$event.stopPropogation();

## Event Filtering

<input (keyup)="onKeyUp($event)" />

onKeyUp($event){
	if ($event.keyCode == 13)
		console.log("enter pressed")
}

## Template Variables
<input #email (keyup.enter)="onKeyUp(email.value)" />

onKeyUp(email){
	console.log(email)
}

<!-- but the passing of params isnt clean -->

## Two Way Binding
<input [value]="email" (keyup.enter)="onKeyUp()" />

onKeyUp(){
	console.log(this.email)
}

The direction of binding is usually from component -> view.

ngModel is a directive to implement 2 way bining.

<input [(ngModel)]="email" (keyup.enter)="onKeyUp()" />

## Pipes

uppercase
	{{course.title | uppercase | lowercase}}
	> leftmost result flows from left to right across pipes to arrive at a result.
lowercase
decimal
	{{course.rating | number:'1.1-1' }}
	> minimum-maximum
currency
	{{course.currency | currency:'AUD':true:'3.2-2' }}
percent

npm package: @angular/common

### Custom Pipes
{{ text | summary }}

1. Create new file

``` file.pipe.ts
	import { Pipe, PipeTransform } from '@angular/core';

	@Pipe({
		name: 'summary',
	})
	export class SummaryPipe implements PipeTransform{
		transform(value: any, args?: any){
			if(!value)
				return null;

			return value.substr(0,10) + '...';
		}
	}

```

2. Register it as module
```
@NgModule>declarations
SummaryPipe
```

# Building Reusable Components

to make reusable components, there has to be an input and output params.
import { Component } from 'angular2/core';
import { Location, RouteConfig, RouterLink, Router, CanActivate } from 'angular2/router';
import { COMMON_DIRECTIVES, FORM_DIRECTIVES, FormBuilder, ControlGroup, Validators, Control } from 'angular2/common';

@Component({
  selector: 'Index',
  directives: [ ],
  templateUrl: './dest/views/index/index.html'
})
export class Index {
  items: any;

  constructor( ) {
    this.items = [
      { name: 'Ana', number: '213' },
      { name: 'Dito', number: '222' }
    ];
  }
}

import { Component } from 'angular2/core';
import { RouterLink } from 'angular2/router';
import { AuthService } from '../../services/authService';

@Component({
    directives: [ RouterLink ],
    templateUrl: 'dest/views/overview/overview.html'
})
export class Overview{
  items: any;
  lala: any = 123;

  constructor(){
    this.items = [
      { name: 'Bozo', number: '555' },
      { name: 'Kifla', number: '111' }
    ];
  }
}

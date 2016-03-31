import {Component} from 'angular2/core';
import {RouteConfig, ROUTER_DIRECTIVES, ROUTER_PROVIDERS} from 'angular2/router';
import {CliRouteConfig} from './route-config';
import {Http} from 'angular2/http';

@Component({
  selector: 'front-ts-app',
  providers: [ROUTER_PROVIDERS],
  templateUrl: 'app/front-ts.html',
  directives: [ROUTER_DIRECTIVES],
  pipes: []
})
@RouteConfig([

].concat(CliRouteConfig))

export class FrontTsApp {
  defaultMeaning: number = 42;
  items: any;

  meaningOfLife(http: Http, meaning?: number) {

    http.get('localhost:8080/users').map((res) => res.json()).subscribe((res) => {
      console.log(res); //
    });

    return `The meaning of life is ${meaning || this.defaultMeaning}`;
  }
}

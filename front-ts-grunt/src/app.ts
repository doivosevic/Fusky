import { Component } from "angular2/core";
import { COMMON_DIRECTIVES } from "angular2/common";
import { Http } from "angular2/http";
import { RouteConfig, RouterLink, RouterOutlet, Route, ROUTER_DIRECTIVES, Router, Location} from 'angular2/router';

import { Index } from './views/index/index';
import { Overview } from './views/overview/overview';

@Component({
    selector: 'App',
    templateUrl: './dest/app.html',
    styles: [],
    directives: [ ROUTER_DIRECTIVES, COMMON_DIRECTIVES ]
})
@RouteConfig([
    { path: '/', name: 'Index', component: Index, useAsDefault: true },
    { path: '/overview', name: 'Overview', component: Overview }
])
export class App {
    router: Router;
    location: Location;

    constructor(router: Router, location: Location) {
        this.router = router;
    };
}

import {bootstrap} from 'angular2/platform/browser';
import {FrontTsApp} from './app/front-ts';
import {ROUTER_PROVIDERS} from 'angular2/router';

bootstrap(FrontTsApp, [
  ROUTER_PROVIDERS
]);

import {describe, it, expect, beforeEachProviders, inject} from 'angular2/testing';
import {FrontTsApp} from '../app/front-ts';

beforeEachProviders(() => [FrontTsApp]);

// describe('App: FrontTs', () => {
//   it('should have the `defaultMeaning` as 42', inject([FrontTsApp], (app: FrontTsApp) => {
//     expect(app.defaultMeaning).toBe(42);
//   }));
//
//   describe('#meaningOfLife', () => {
//     it('should get the meaning of life', inject([FrontTsApp], (app: FrontTsApp) => {
//       // expect(app.meaningOfLife()).toBe('The meaning of life is 42');
//       // expect(app.meaningOfLife(22)).toBe('The meaning of life is 22');
//     }));
//   });
// });

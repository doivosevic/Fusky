export class FrontTsPage {
  navigateTo() {
    return browser.get('/');
  }

  getParagraphText() {
    return element(by.css('front-ts-app p')).getText();
  }
}
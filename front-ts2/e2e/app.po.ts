export class FrontTsPage {
  navigateTo() { return browser.get('/'); }
  getParagraphText() { return element(by.css('FrontTs-app p')).getText(); }
}

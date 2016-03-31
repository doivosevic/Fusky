import { FrontTsPage } from './app.po';

describe('front-ts App', function() {
  let page: FrontTsPage;

  beforeEach(() => {
    page = new FrontTsPage();
  })

  it('should display message saying app works', () => {
    page.navigateTo();
    expect(page.getParagraphText()).toEqual('front-ts Works!');
  });
});

const puppeteer = require('puppeteer');

(async () => {
  const browser = await puppeteer.launch({
    executablePath: '/usr/bin/chromium-browser',
    headless: true,
    args: ['--disable-dev-shm-usage'],
  });
  const page = await browser.newPage();
  await page.setViewport({width: 1280, height: 1440});
  let url = 'https://google.com';
  try {
    await page.goto(url, {timeout: 30000});
    await page.screenshot({path: '/screenshots/screenshot.png'});
  } catch (error) {
      console.log(error);
  } finally {
    await browser.close();
  }
})();

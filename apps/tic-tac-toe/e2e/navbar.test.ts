import { expect, test } from '@playwright/test';

test('navbar h1 element is visible and says tic tac toe', async ({ page }) => {
    await page.goto('/');
    const navbarTitle = await page.locator('nav h1');
    await expect(navbarTitle).toBeVisible();
    await expect(navbarTitle).toHaveText('Tic Tac Toe');
});

test('navbar theme dropdown is visible',async ({page}) => {
    await page.goto('/');
    const navbarThemeDropdown = await page.getByTestId('theme-controller');
    await expect(navbarThemeDropdown).toBeVisible();
});


test('navbar themecontroller should switch themes', async ({ page }) => {
    await page.goto('/');
    const dropdownTrigger = page.getByRole('button', { name: /dark/i });
    await dropdownTrigger.click();

    const themeButton = page.getByRole('button', { name: /synthwave/i });
    await themeButton.click();

    const themeAttribute = await page.evaluate(() => {
        return document.documentElement.getAttribute('data-theme');
    });
    expect(themeAttribute).toBe('synthwave');
});
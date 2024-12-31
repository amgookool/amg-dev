import { defineConfig } from '@playwright/test';

export default defineConfig({
	name: 'Tic Tac Toe',
	reporter: 'html',
	retries: 2,
	webServer: {
		command: 'pnpm run build && pnpm run preview',
		port: 8788
	},
	testDir: 'e2e',
	use: {
		// Capture screenshot after each test failure.
		screenshot: 'only-on-failure',

		// Record trace only when retrying a test for the first time.
		trace: 'on-first-retry',

		// Record video only when retrying a test for the first time.
		video: 'on-first-retry',

		// Emulates the user timezone.
		timezoneId: 'America/La_Paz',

		 // Viewport used for all pages in the context.
		 viewport: { width: 1920, height: 1080 },
	}
});

import { defineConfig } from 'vitest/config';
import { sveltekit } from '@sveltejs/kit/vite';

export default defineConfig({
	plugins: [sveltekit()],

	test: {
		coverage:{
			reporter:['html', 'json', 'text-summary']
		},
		include: ['src/**/*.{test,spec}.{js,ts}']
	}
});

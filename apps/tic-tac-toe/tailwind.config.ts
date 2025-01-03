import typography from '@tailwindcss/typography';
import type { Config } from 'tailwindcss';
import daisyui, { Config as DaisyConfig } from 'daisyui';
import { iconsPlugin, getIconCollections } from '@egoist/tailwindcss-icons';
export default {
	content: ['./src/**/*.{html,js,svelte,ts}'],

	theme: {
		extend: {
			keyframes: {
				wiggle: {
					'0%, 100%': { transform: 'rotate(-3deg)' },
					'50%': { transform: 'rotate(3deg)' }
				},
				flip: {
					from: { transform: 'rotateY(0deg)' },
					to: { transform: 'rotateY(360deg)' }
				}
			},
			animation: {
				wiggle: 'wiggle 1s ease-in-out infinite',
				'wiggle-slow': 'wiggle 4s ease-in-out infinite',
				'spin-slow': 'spin 3s linear infinite',
				'bounce-slow': 'bounce 3s infinite',
				flip: 'flip 3s cubic-bezier(0, 0.2, 0.6, 1) infinite'
			}
		}
	},

	plugins: [
		typography,
		iconsPlugin({
			collections: getIconCollections(['lucide', 'mdi'])
		}),
		daisyui
	],

	// daisyUI config (optional - here are the default values)
	daisyui: {
		themes: true, // false: only light + dark | true: all themes | array: specific themes like this ["light", "dark", "cupcake"]
		darkTheme: 'dark', // name of one of the included themes for dark mode
		base: true, // applies background color and foreground color for root element by default
		styled: true, // include daisyUI colors and design decisions for all components
		utils: true, // adds responsive and modifier utility classes
		prefix: '', // prefix for daisyUI classnames (components, modifiers and responsive class names. Not colors)
		logs: true, // Shows info about daisyUI version and used config in the console when building your CSS
		themeRoot: ':root' // The element that receives theme color CSS variables
	} as DaisyConfig
} satisfies Config;

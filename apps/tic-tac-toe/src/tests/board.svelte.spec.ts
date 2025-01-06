import { tileBorderStyles, tilePlayerColor } from '$lib/components/Board.svelte';
import { describe, expect, it } from 'vitest';
import { areClassesEquivalent } from './helpers';


describe('Board components functionality', () => {
	// Test for primary and secondary text colors based on player
	it('func should return the primary text color for X and secondary text color for O.', () => {
		expect(tilePlayerColor('X')).toBe('text-primary');
		expect(tilePlayerColor('O')).toBe('text-secondary');
		expect(tilePlayerColor(null)).toBe(''); // default
	});
	// Test for tailwindcss string for tile borders
	it('func should return the appropiate tailwindcss border class to make up board', () => {
		const tileBorderIndexStyles: Record<number, string> = {
			0: 'border-e-2 border-b-2',
			1: 'border-b-2',
			2: 'border-s-2 border-b-2',
			3: 'border-e-2',
			4: '',
			5: 'border-s-2',
			6: 'border-e-2 border-t-2',
			7: 'border-t-2',
			8: 'border-s-2 border-t-2'
		};
		expect(areClassesEquivalent(tileBorderStyles(0), tileBorderIndexStyles[0])).toBe(true);
		expect(areClassesEquivalent(tileBorderStyles(1), tileBorderIndexStyles[1])).toBe(true);
		expect(areClassesEquivalent(tileBorderStyles(2), tileBorderIndexStyles[2])).toBe(true);
		expect(areClassesEquivalent(tileBorderStyles(3), tileBorderIndexStyles[3])).toBe(true);
		expect(areClassesEquivalent(tileBorderStyles(4), tileBorderIndexStyles[4])).toBe(true);
		expect(areClassesEquivalent(tileBorderStyles(5), tileBorderIndexStyles[5])).toBe(true);
		expect(areClassesEquivalent(tileBorderStyles(6), tileBorderIndexStyles[6])).toBe(true);
		expect(areClassesEquivalent(tileBorderStyles(7), tileBorderIndexStyles[7])).toBe(true);
		expect(areClassesEquivalent(tileBorderStyles(8), tileBorderIndexStyles[8])).toBe(true);
	});
});



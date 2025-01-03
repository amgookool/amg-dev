import { describe, it, expect } from 'vitest';

import { tilePlayerColor, tileBorderStyles } from '$lib/components/Board.svelte';

// Helper function to compare class strings ignoring order
const areClassesEquivalent = (class1: string, class2: string): boolean => {
	const set1 = new Set(class1.split(" ").filter(Boolean));
	const set2 = new Set(class2.split(" ").filter(Boolean));
	return set1.size === set2.size && [...set1].every((cls) => set2.has(cls));
  };


describe('Board components functionality', () => {
	it('func should return the primary text color for X and secondary text color for O.', () => {
		expect(tilePlayerColor('X')).toBe('text-primary');
		expect(tilePlayerColor('O')).toBe('text-secondary');
		expect(tilePlayerColor(null)).toBe(''); // default
	});
	it('func should return the appropiate tailwindcss boarder class to make up board', () => {
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



// Helper function to compare class strings ignoring order
export const areClassesEquivalent = (class1: string, class2: string): boolean => {
	const set1 = new Set(class1.split(" ").filter(Boolean));
	const set2 = new Set(class2.split(" ").filter(Boolean));
	return set1.size === set2.size && [...set1].every((cls) => set2.has(cls));
  };
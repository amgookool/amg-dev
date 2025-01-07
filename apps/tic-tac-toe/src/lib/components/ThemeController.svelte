<script module lang="ts">
	const themeValues = [
		// 'light',
		// 'dark',
		// 'cupcake',
		// 'bumblebee',
		// 'emerald',
		// 'corporate',
		// 'retro',
		// 'cyberpunk',
		// 'valentine',
		// 'garden',
		// 'fantasy',
		// 'black',
		// 'cmyk',
		// 'acid',
		// 'nord',
		// 'sunset'
		// 'business',
		// 'lemonade',
		// 'lofi',
		// 'aqua',
		'dark',
		'synthwave',
		'halloween',
		'forest',
		'pastel',
		'wireframe',
		'luxury',
		'dracula',
		'autumn',
		'night',
		'coffee',
		'winter',
		'dim'
	];
	const themes = themeValues.map((theme) => {
		return {
			label: theme.charAt(0).toUpperCase() + theme.slice(1),
			value: theme
		};
	});
</script>

<script lang="ts">
	import { onMount } from 'svelte';
	let currentTheme = $state<string | null>('dark');

	onMount(() => {
		const localStorageTheme = localStorage.getItem('theme');
		if (localStorageTheme) {
			document.documentElement.setAttribute('data-theme', localStorageTheme);
			currentTheme = localStorageTheme;
		}
	});

	$effect(() => {
		currentTheme = document.documentElement.getAttribute('data-theme');
	});

	export const handleThemeChange = (theme: string) => {
		localStorage.setItem('theme', theme);
		document.documentElement.setAttribute('data-theme', theme);
		currentTheme = theme;
	};
</script>

{#snippet themeItem(props: { label: string; value: string })}
	<input
		class="theme-controller btn btn-sm btn-block btn-ghost justify-start"
		type="radio"
		name="theme-dropdown"
		aria-label={props.label}
		value={props.value}
		checked={currentTheme === props.value}
	/>
{/snippet}

<div data-testId="theme-controller" class="dropdown dropdown-bottom dropdown-end">
	<div tabindex="0" role="button" class="btn m-1">
		{currentTheme}
		<svg
			width="12px"
			height="12px"
			class="inline-block h-2 w-2 fill-current opacity-60"
			xmlns="http://www.w3.org/2000/svg"
			viewBox="0 0 2048 2048"
		>
			<path d="M1799 349l242 241-1017 1017L7 590l242-241 775 775 775-775z"></path>
		</svg>
	</div>

	<!-- svelte-ignore a11y_no_noninteractive_tabindex -->
	<ul tabindex="0" class="dropdown-content bg-base-300 rounded-box z-[1] w-52 p-2 shadow-2xl">
		{#each themes as theme}
			<li>
				<button class="w-full" onclick={() => handleThemeChange(theme.value)}>
					{@render themeItem(theme)}
				</button>
			</li>
		{/each}
	</ul>
</div>

<script lang="ts">
	import ThemeController from '$lib/components/ThemeController.svelte';
</script>

<nav class="container flex w-full items-center justify-between px-8 py-2">
	<h1 class={['text-4xl/normal text-info lg:motion-preset-float-sm']}>Tic Tac Toe</h1>
	<ThemeController />
</nav>

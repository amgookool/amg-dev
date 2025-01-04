<script lang="ts">
    import ThemeController from '$lib/components/ThemeController.svelte';
</script>

<nav class="container flex w-full items-center justify-between px-8 py-2">
    <h1 class={["motion-preset-typewriter-[11] motion-duration-[20000ms]", 'text-4xl text-accent']}>Tic Tac Toe</h1>
    <ThemeController />
</nav>
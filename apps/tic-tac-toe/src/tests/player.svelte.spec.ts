import { describe, it, expect } from 'vitest';

import { PlayersState } from '$lib/states/players.svelte';

describe('Players state functionality', () => {
    it('should set player name', () => {
        PlayersState.setPlayerName('X', 'user1');
        expect(PlayersState.X.name).toBe('user1');
        PlayersState.setPlayerName('O', 'user2');
        expect(PlayersState.O.name).toBe('user2');
    });

    it('should increment player wins', () => {
        PlayersState.incrementWins('X');
        expect(PlayersState.X.wins).toBe(1);
        PlayersState.incrementWins('O');
        expect(PlayersState.O.wins).toBe(1);
    });

    it('should increment total games', () => {
        PlayersState.incrementTotalGames();
        expect(PlayersState.totalGames).toBe(1);
    });

    it('should reset players state', () => {
        PlayersState.reset();
        expect(PlayersState.X.name).toBe('Player X');
        expect(PlayersState.O.name).toBe('Player O');
        expect(PlayersState.X.wins).toBe(0);
        expect(PlayersState.O.wins).toBe(0);
        expect(PlayersState.totalGames).toBe(0);
    });
});
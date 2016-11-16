describe('JavaScript addition operator', () =>  {
  it('adds two numbers together', () =>  {
    expect(1 + 2).toEqual(3);
  });
});

describe('fn createTiles to create 25 tiles with random colors', () =>  {
  const tiles = createTiles();

  it('tiles should have 5 rows',() => {
    expect(tiles.length).toEqual(5);
  });
  it("tile's rows should have 5 columns", () => {
    for(let i = 0; i < tiles.length; i++){
      expect(tiles[i].length).toEqual(5);
    }
  });
});

describe('User stats', () => {
  const stats = getUserStats();

  it('stats should have all the required keys', () => {
    expect(stats.total_games).toBeDefined();
    expect(stats.games_per_color).toBeDefined();
    expect(stats.mean_score).toBeDefined();
    expect(stats.modal_score).toBeDefined();
  });
});

describe('String#capitalize', () => {
  it('should capitalize a single word', () => {
    expect('cat'.capitalize()).toBe('Cat');
  });
  it('should not change a capitalized word', () => {
    expect('Cat'.capitalize()).toBe('Cat');
  });
  it('should capitalize multiple words', () => {
    expect('cat dog cat'.capitalize()).toBe('Cat Dog Cat');
  });
});
describe('JavaScript addition operator', function () {
  it('adds two numbers together', function () {
    expect(1 + 2).toEqual(3);
  });
});

describe('fn createTiles to create 25 tiles with random colors', function () {
  const tiles = createTiles();

  it('tiles should have 5 rows',function(){
    expect(tiles.length).toEqual(5);
  });
  it("tile's rows should have 5 columns", function(){
    for(let i = 0; i < tiles.length; i++){
      expect(tiles[i].length).toEqual(5);
    }
  });
});

describe('String#capitalize', function(){
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
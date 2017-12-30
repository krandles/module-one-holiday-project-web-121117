kevin = User.create(name: "Kevin")
ian = User.create(name: "Ian")
michael = User.create(name: "Michael")
dan = User.create(name: "Dan")
sam = User.create(name: "Sam")

other_half = Brewery.create(name: "Other Half Brewing Co.", location: "Brooklyn, NY")
interboro = Brewery.create(name: "Interboro Spirits and Ales", location: "Brooklyn, NY")
bottle_logic = Brewery.create(name: "Bottle Logic Brewing", location: "Anaheim, CA")
licbp = Brewery.create(name: "LIC Beer Project", location: "Queens, NY")
tree_house = Brewery.create(name: "Tree House Brewing Company", location: "Charlton, MA")
equilibrium = Brewery.create(name: "Equilibrium Brewery", location: "Middletown, NY")
monkish = Brewery.create(name: "Monkish Brewing Co.", location: "Torrance, CA")
hill_farmstead = Brewery.create(name: "Hill Farmstead Brewery", location: "Greensboro Bend, VT")
alchemist = Brewery.create(name: "The Alchemist", location: "Stowe, VT")

pale = Style.create(name: "Pale Ale")
ipa = Style.create(name: "IPA")
dipa = Style.create(name: "Double / Imperial IPA")
milk_stout = Style.create(name: "Milk / Sweet Stout")
ris = Style.create(name: "Russian Imperial Stout")
ais = Style.create(name: "American Double / Imperial Stout")
saison = Style.create(name: "Saison / Farmhouse Ale")
berliner = Style.create(name: "Berliner Weissbier")
porter = Style.create(name: "American Porter")
wild = Style.create(name: "American Wild Ale")

beer_list = [
  ["Julius", tree_house, ipa, 6.8],
  ["Haze", tree_house, dipa, 8.2],
  ["Green", tree_house, ipa, 7.6],
  ["Double Shot", tree_house, ais, 7.6],
  ["Single Shot", tree_house, milk_stout, 6.4],
  ["King Julius", tree_house, dipa, 8.3],
  ["DDH Mylar Bags", other_half, dipa, 8.5],
  ["DDH All Citra Everything", other_half, dipa, 8.5],
  ["Green Power", other_half, dipa, 8.0],
  ["Hypersleep", other_half, ais, 11.8],
  ["All Infinity Everything", other_half, dipa, 8.7],
  ["Oh...", other_half, ipa, 6.0],
  ["MC²", equilibrium, dipa, 8.0],
  ["Fractal Citra", equilibrium, ipa, 6.8],
  ["Mmm...Osa", equilibrium, pale, 4.8],
  ["There And Back Again", equilibrium, wild, 6.0],
  ["Casey", equilibrium, saison, 6.0],
  ["DDH Premiere", interboro, ipa, 6.0],
  ["Ambassador", interboro, ris, 11.0],
  ["Barrel-Aged Ambassador", interboro, ris, 11.0],
  ["Can I Kick It?", interboro, dipa, 8.0],
  ["Stay Gold", interboro, ipa, 6.0],
  ["Another Dose", interboro, dipa, 7.8],
  ["Reaction State", bottle_logic, ais, 11.8],
  ["Ground State", bottle_logic, ais, 13.4],
  ["Fundamental Observation", bottle_logic, ais, 14.3],
  ["Up Up", bottle_logic, ipa, 7.0],
  ["Leche Borracho", bottle_logic, ais, 11.0],
  ["Breathe - Apricot", licbp, berliner, 3.5],
  ["Drop A Gem", licbp, dipa, 8.5],
  ["Pile Of Crowns", licbp, dipa, 8.5],
  ["Dulcinea", licbp, wild, 6.0],
  ["Heaven Beside You", licbp, ais, 11.0],
  ["Foggier Window", monkish, dipa, 8.1],
  ["Juteux", monkish, wild, 8.3],
  ["Funk Juggling", monkish, saison, 6.0],
  ["Really Real", monkish, ipa, 8.3],
  ["Smarter Than Spock", monkish, ipa, 7.1],
  ["Double Citra", hill_farmstead, dipa, 8.0],
  ["Everett", hill_farmstead, porter, 7.5],
  ["Shirley Mae", hill_farmstead, porter, 4.0],
  ["Arthur", hill_farmstead, saison, 6.0],
  ["Society & Solitude #4", hill_farmstead, dipa, 8.0],
  ["Heady Topper", alchemist, dipa, 8.0],
  ["Focal Banger", alchemist, ipa, 7.0],
  ["Luscious", alchemist, ris, 9.2],
  ["Crusher", alchemist, dipa, 9.0]
]

beer_list.each do |beer|
  this_beer = Beer.create(name: beer[0], abv: beer[3])
  beer[1].beers << this_beer
  beer[2].beers << this_beer
end

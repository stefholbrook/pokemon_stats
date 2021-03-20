# PokemonStats
Given a list of pokemon, returns mean, median and mode for height and weight.

* `mix deps.get`
* `mix run --no-halt`

###Example Request
```
curl -X POST --header "Content-Type: application/json" --data '{"pokemon": ["charmander", "bulbasaur", "squirtle", "pidgey", "rattata"]}' http://localhost:4001/stats
```


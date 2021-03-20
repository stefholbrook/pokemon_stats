# PokemonStats
Returns mean, median, mode height and weight for given list of pokemon

* `mix deps.get`
* `mix run --no-halt`

###Example Request
```
curl -X POST --header "Content-Type: application/json" --data '{"pokemon": ["charmander", "bulbasaur", "squirtle", "pidgey", "rattata"]}' http://localhost:4001/stats
```


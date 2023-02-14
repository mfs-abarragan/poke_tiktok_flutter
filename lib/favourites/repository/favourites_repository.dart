import 'package:either_dart/either.dart';
import '../../pokemon-slider/controllers/pokemon.dart';
import '../../pokemon-slider/controllers/server_error.dart';
import '../api/favourites_api.dart';

class FavouritesRepository {
  PokemonFavouritesAPI pokemonFavouritesAPI = PokemonFavouritesAPI();
  Future<Either<ServerError, Pokemon>> loadFavouritePokemon(
      int favouritePokemonNumber) async {
    return await pokemonFavouritesAPI
        .loadFavouritePokemon(favouritePokemonNumber);
  }
}

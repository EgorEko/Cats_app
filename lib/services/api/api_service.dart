import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import 'responses/fact_dto.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: 'https://cat-fact.herokuapp.com')
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @GET('/facts/random')
  Future<FactDTO> getRandomFact({
    @Query('animal_type') String animalType = 'cat',
    @Query('amount') int amount = 1,
  });
}

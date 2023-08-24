import 'a_service_base_model.dart';

abstract class AServiceManager{
  //For singleton.
  AServiceManager? get instance;
  void init();

  //HTTP requests.
  Future get<T extends ServiceBaseModel>(String path, T model, String? jwt, List<String>? queryParamName, List<dynamic>? queryParamValue);  
  Future post<T extends ServiceBaseModel, Z extends ServiceBaseModel>(String path, T dataModel, Z responseModel, String? jwt, List<String>? queryParamName, List<dynamic>? queryParamValue);
  Future del<T extends ServiceBaseModel>(String path, T model, String? jwt, List<String>? queryParamName, List<dynamic>? queryParamValue);
  Future put<T extends ServiceBaseModel, Z extends ServiceBaseModel>(String path, T dataModel, Z responseModel, String? jwt, List<String>? queryParamName, List<dynamic>? queryParamValue);
}
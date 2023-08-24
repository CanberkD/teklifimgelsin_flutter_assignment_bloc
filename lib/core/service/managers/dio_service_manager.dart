
import 'package:dio/dio.dart';
import 'package:teklifimgelsin_flutter_assignment_bloc/core/service/abstracts/a_service_manager.dart';
import 'package:teklifimgelsin_flutter_assignment_bloc/product/constants/service/service_paths.dart';
import '../abstracts/a_service_base_model.dart';

class DioServiceManager extends AServiceManager{
  
  DioServiceManager();

  late Dio _dio;
  
  static DioServiceManager? _instance;
  
  @override
  AServiceManager? get instance {
    _instance ??= DioServiceManager._init();
    return _instance;
  }
  
  DioServiceManager._init(){
    init();
  }

  @override
  Future get<T extends ServiceBaseModel>(String path, T model, String? jwt, List<String>? queryParamName, List<dynamic>? queryParamValue) async{

    jwt != null ? _dio.options.headers["Authorization"] = "Bearer $jwt" : null;
    
    Map<String, dynamic>? queryMap = {};
    if(queryParamName != null && queryParamValue != null && queryParamName.length == queryParamValue.length){
      for(int i = 0; i < queryParamValue.length; i++){
        queryMap[queryParamName[i]] = queryParamValue[i];
      }
    }

    try{
      
      final response = await _dio.get(
      path, 
      queryParameters: queryMap,
      options: Options(
        followRedirects: true,
        validateStatus: (status) => true,
      )
      );

      final responseBody = response.data;
      if(responseBody is List){
        return responseBody.map((e) => model.fromJson(e)).toList();
      }
      else if(responseBody is Map){
        return model.fromJson(responseBody as Map<String, dynamic>);
      }
      return responseBody;
      
    }
    catch(e){
      throw Exception(e);
    }
    
  }

  @override
  Future post<T extends ServiceBaseModel, Z extends ServiceBaseModel>(String path, T dataModel, Z responseModel, String? jwt, List<String>? queryParamName, List<dynamic>? queryParamValue) async {

    jwt != null ? _dio.options.headers["Authorization"] = "Bearer $jwt" : null;
    
    Map<String, dynamic>? queryMap = {};
    if(queryParamName != null && queryParamValue != null && queryParamName.length == queryParamValue.length){
      for(int i = 0; i < queryParamValue.length; i++){
        queryMap[queryParamName[i]] = queryParamValue[i];
      }
    }
    try{
      final response = await _dio.post(path, 
      data: dataModel.toJson(), 
      queryParameters: queryMap, 
      options: Options(
        followRedirects: false,
        validateStatus: (status) => true,
      ));
      
        final responseBody = response.data;
        if(responseBody is List){
          return responseBody.map((e) => responseModel.fromJson(e)).toList();
        }
        else if(responseBody is Map){
          return responseModel.fromJson(responseBody as Map<String, dynamic>);
        }
        return responseBody;      
    
    }
    catch(e){
      throw Exception(e);
    }    
  }

  @override
  Future del<T extends ServiceBaseModel>(String path, T model, String? jwt, List<String>? queryParamName, List<dynamic>? queryParamValue) async{

    jwt != null ? _dio.options.headers["Authorization"] = "Bearer $jwt" : null;
    
    Map<String, dynamic>? queryMap = {};
    if(queryParamName != null && queryParamValue != null && queryParamName.length == queryParamValue.length){
      for(int i = 0; i < queryParamValue.length; i++){
        queryMap[queryParamName[i]] = queryParamValue[i];
      }
    }

    final response = await _dio.delete(
      path, 
      queryParameters: queryMap,
      options: Options(
        followRedirects: false,
        validateStatus: (status) => true,
      )
    );

    try{
      final responseBody = response.data;
      if(responseBody is List){
        return responseBody.map((e) => model.fromJson(e)).toList();
      }
      else if(responseBody is Map){
        return model.fromJson(responseBody as Map<String, dynamic>);
      }
      return responseBody;
    }
    catch(e){
      throw Exception(e);
    }

    

  }

  @override
  Future put<T extends ServiceBaseModel, Z extends ServiceBaseModel>(String path, T dataModel, Z responseModel, String? jwt, List<String>? queryParamName, List<dynamic>? queryParamValue) async {

    jwt != null ? _dio.options.headers["Authorization"] = "Bearer $jwt" : null;
    
    Map<String, dynamic>? queryMap = {};
    if(queryParamName != null && queryParamValue != null && queryParamName.length == queryParamValue.length){
      for(int i = 0; i < queryParamValue.length; i++){
        queryMap[queryParamName[i]] = queryParamValue[i];
      }
    }

    try{
      final response = await _dio.put(path, 
      data: dataModel.toJson(), 
      queryParameters: queryMap, 
      options: Options(
        followRedirects: false,
        validateStatus: (status) => true,
      ));
        final responseBody = response.data;
        if(responseBody is List){
          return responseBody.map((e) => responseModel.fromJson(e)).toList();
        }
        else if(responseBody is Map){
          return responseModel.fromJson(responseBody as Map<String, dynamic>);
        }
        return responseBody;  
    }
    catch(e){
      throw Exception(e);
    }    
  }
  
  @override
  void init() {
    String baseUrl = ServicePaths().getBaseUrl();

    final baseOptions = BaseOptions(
      baseUrl: baseUrl,
      followRedirects: false,
      validateStatus: ((status) {
        return status != null ? (status< 500) : false;
      })
    );

    _dio = Dio(baseOptions);
  }
  
}
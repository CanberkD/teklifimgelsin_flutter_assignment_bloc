class ServicePaths{
  final String _baseUrl = "https://prepi.teklifimgelsin.com/api/"; 
  final String _getCardOffers = "prep/createCardPost"; 

  String getBaseUrl () => _baseUrl;
  String getCardOffers () => '$_baseUrl$_getCardOffers';
}
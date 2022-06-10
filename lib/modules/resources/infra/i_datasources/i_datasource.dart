abstract class IDatasource {
  Future<List<Map<String, Map<String, String>>>> getAll();
}

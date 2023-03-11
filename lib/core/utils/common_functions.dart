class CommonFunctions {
  static String getRetrieveApiPhotosFilter({
    required int firstElement,
    required int elementsToRetrieve,
  }) {
    String filter = "?";
    for (int i = firstElement; i < (firstElement + elementsToRetrieve); i++) {
      filter += "id=$i&";
    }
    return filter;
  }
}

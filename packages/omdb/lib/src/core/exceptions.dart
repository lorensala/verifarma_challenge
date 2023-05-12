// ignore_for_file: public_member_api_docs

class MovieException implements Exception {
  const MovieException(this.message);
  final String message;

  @override
  String toString() => message;
}

class MovieNotFoundException extends MovieException {
  const MovieNotFoundException() : super('Movie not found.');
}

class MovieUnauthorizedException extends MovieException {
  const MovieUnauthorizedException() : super('Unauthorized.');
}

class MovieUnknownException extends MovieException {
  const MovieUnknownException() : super('Unknown error.');
}

class MovieConvertionException extends MovieException {
  const MovieConvertionException() : super('Error converting movie.');
}

class MovieNoConnectionException extends MovieException {
  const MovieNoConnectionException() : super('No connection.');
}

class MovieBadCertificateException extends MovieException {
  const MovieBadCertificateException() : super('Bad certificate.');
}

class MovieBadResponseException extends MovieException {
  const MovieBadResponseException() : super('Bad response.');
}

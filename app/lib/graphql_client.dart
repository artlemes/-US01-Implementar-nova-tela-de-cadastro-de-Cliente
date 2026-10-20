import 'package:graphql_flutter/graphql_flutter.dart';


const apiUrl = 'http://10.0.2.2:3000/graphql';

final graphQLClient = GraphQLClient(
  link: HttpLink(apiUrl),
  cache: GraphQLCache(),
);
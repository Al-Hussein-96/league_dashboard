import 'package:equatable/equatable.dart';
import 'package:league_dashboard/screen/games/domain/entities/status.dart';

class Substadium extends Equatable{
  final int id;
  final String imageUrl;
  final String name;
  final int stadiumId;

  Substadium({
    required this.id,
    required this.imageUrl,
    required this.name,
    required this.stadiumId,
  }):super([id]);
}

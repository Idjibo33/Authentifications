class Utilisateur {
  String? id;
  String? nom;
  String? prenom;
  String? email;
  String? password;
  Utilisateur({
    required this.id,
    required this.nom,
    required this.prenom,
    required this.email,
    required this.password,
  });
  factory Utilisateur.fromMap(Map<String, dynamic> map) {
    return Utilisateur(
      id: map['id'],
      nom: map['nom'],
      prenom: map['prenom'],
      email: map['email'],
      password: map['password'],
    );
  }
}

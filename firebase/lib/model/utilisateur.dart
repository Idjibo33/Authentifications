class Utilisateur {
  String? id;
  String? nom;
  String? prenom;
  String? email;
  String? password;
  Utilisateur({this.id, this.nom, this.prenom, this.email, this.password});
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

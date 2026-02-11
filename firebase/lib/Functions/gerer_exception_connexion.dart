String gererExceptionConnexion(String e) {
  switch (e) {
    case "Exception: [firebase_auth/invalid-email] The email address is badly formatted.":
      return "Entrez un e-mail valide";
    case "Exception: [firebase_auth/email-already-in-use] The email address is already in use by another account.":
      return "Il existe un compte avec cet email, connectez-vous avec";
    case "Exception: [firebase_auth/invalid-credential] The supplied auth credential is incorrect, malformed or has expired.":
      return "Le mot de passe est incorrect";
    default:
      return "Une erreur est survenue";
  }
}

String gererExceptionInscription(String e) {
  switch (e) {
    case "Exception: [firebase_auth/invalid-email] The email address is badly formatted.":
      return "Entrez un e-mail valide";
    case "Exception: [firebase_auth/email-already-in-use] The email address is already in use by another account.":
      return "Il existe un compte avec cet email, connectez-vous avec";
    case "Exception: [firebase_auth/weak-password] Password should be at least 6 characters":
      return "Le mot de passe doit avoir au minimum 6 caractères";
    default:
      return "Une erreur est survenue";
  }
}

abstract class AuthRepository {
  Future<void> signIn(String email, String password);
  Future<void> signOut();
  Future<void> signUp(String email, String password); // Added for registration
  // Add other auth methods as needed
}
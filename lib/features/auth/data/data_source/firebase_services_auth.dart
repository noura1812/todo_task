import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:todo/core/common/domain/repository/preferences_repository.dart';
import 'package:todo/core/config/constants.dart';
import 'package:todo/features/auth/domain/model/user.dart';
import 'package:firebase_auth/firebase_auth.dart' hide User;

@Injectable()
class FirebaseServicesAuth {
  static final FirebaseAuth auth = FirebaseAuth.instance;
  final PreferencesRepository preferencesRepository;
  FirebaseServicesAuth(this.preferencesRepository);
  Future<User?> login({required String email, required String password}) async {
    await auth.createUserWithEmailAndPassword(email: email, password: password);
    return await getUser(uId: auth.currentUser?.uid);
  }

  Future<User?> register(User user) async {
    await auth.createUserWithEmailAndPassword(
        email: user.email!, password: user.password!);
    if (auth.currentUser?.uid != null) {
      user = user.copyWith(id: (auth.currentUser!.uid));
    }
    await _addUser(user);
    return user;

    // try {

    // } on firebase.FirebaseAuthException catch (e) {
    //   if (e.code == 'weak-password') {
    //     return 'The password provided is too weak.';
    //   } else if (e.code == 'email-already-in-use') {
    //     return 'The account already exists for that email.';
    //   } else if (e.code == 'user-not-found') {
    //     return 'No user found for that email.';
    //   } else if (e.code == 'invalid-email') {
    //     return 'Invalid email';
    //   } else {
    //     return e.code.toString().replaceAll('-', ' ');
    //   }
    // } catch (e) {
    //   return e.toString();
    // }
  }

  Future<User?> getUser({String? uId}) async {
    String? id = (uId ?? preferencesRepository.getValueByKey(AppConstants.uId));
    if (id == null) {
      return null;
    }
    return await _getUserById(id);
  }

  Future<void> editUser(User user) {
    return _getUserCollection().doc(user.id!).update(user.toJson());
  }

  CollectionReference<User> _getUserCollection() {
    return FirebaseFirestore.instance.collection('users').withConverter<User>(
      fromFirestore: (snapshot, options) {
        return User.fromJson(snapshot.data()!);
      },
      toFirestore: (value, options) {
        return value.toJson();
      },
    );
  }

  Future<void> _addUser(User user) {
    var collection = _getUserCollection();
    var docRef = collection.doc(user.id);

    return docRef.set(user);
  }

  Future<User?> _getUserById(String id) async {
    var collection = _getUserCollection();
    var user = await collection.where('id', isEqualTo: id).get();
    return user.docs.first.data();
  }

  Future<void> logout() async {
    await auth.signOut();
//   await preferencesRepository.removeValueByKey(AppConstants.uId);
  }

  Future<void> forgotPassword(String email) async {}

  Future<void> deleteAccount() async {}
}

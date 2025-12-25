import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../models/message.dart';

class ChatService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Collection name cho chat công cộng
  static const String _chatCollection = 'public_chat';

  // Stream lấy tin nhắn realtime (sắp xếp theo thời gian)
  Stream<List<Message>> getMessages() {
    return _firestore
        .collection(_chatCollection)
        .orderBy('timestamp', descending: true)
        .limit(100)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) => Message.fromFirestore(doc)).toList();
    });
  }

  // Gửi tin nhắn mới
  Future<void> sendMessage(String text) async {
    final user = _auth.currentUser;
    if (user == null || text.trim().isEmpty) return;

    final message = Message(
      id: '',
      senderId: user.uid,
      senderName: user.displayName ?? 'Unknown',
      senderPhotoUrl: user.photoURL ?? '',
      text: text.trim(),
      timestamp: DateTime.now(),
    );

    await _firestore.collection(_chatCollection).add(message.toMap());
  }

  // Xóa tin nhắn (chỉ owner mới xóa được)
  Future<bool> deleteMessage(String messageId) async {
    final user = _auth.currentUser;
    if (user == null) return false;

    final doc =
        await _firestore.collection(_chatCollection).doc(messageId).get();

    if (doc.exists && doc.data()?['senderId'] == user.uid) {
      await _firestore.collection(_chatCollection).doc(messageId).delete();
      return true;
    }
    return false;
  }
}

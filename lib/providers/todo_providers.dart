import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/models/todo.dart';
import 'package:todo_app/providers/auth_providers.dart';

// 투두 리스트 가져오기
final todoListProvider = StreamProvider<List<Todo>>((ref) {
  final firestore = ref.watch(firestoreProvider);
  return firestore.collection('todos').snapshots().map((snapshot) {
    return snapshot.docs.map((doc) {
      return Todo.fromJson({...doc.data(), 'id': doc.id});
    }).toList();
  });
});

// 투두 추가
final addTodoProvider = Provider((ref) {
  final firestore = ref.watch(firestoreProvider);
  return (String title) async {
    await firestore.collection('todos').add({
      'title': title,
      'isComplete': false,
    });
  };
});

// 투두 상태 변경
final toggleTodoProvider = Provider((ref) {
  final firestore = ref.watch(firestoreProvider);
  return (String id, bool isComplete) async {
    await firestore.collection('todos').doc(id).update({
      'isComplete': !isComplete,
    });
  };
});

//투두 삭제
final deleteTodoProvider = Provider((ref) {
  final firestore = ref.watch(firestoreProvider);
  return (String id) async {
    await firestore.collection('todos').doc(id).delete();
  };
});

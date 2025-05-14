import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:summit_rock/src/features/authentication/domain/app_user.dart';
import 'package:summit_rock/src/features/settings/domain/summit_rock_year.dart';
import 'package:summit_rock/src/features/word_decoder/domain/result.dart';

part 'results_repository.g.dart';

@Riverpod(keepAlive: true)
ResultsRepository resultsRepository(ResultsRepositoryRef ref) {
  return ResultsRepository(FirebaseFirestore.instance);
}

// Look at this checkout repository for a good example
// https://github.com/bizz84/flutter-firebase-masterclass/blob/main/ecommerce_app/lib/src/features/checkout/data/checkout_sessions_repository.dart

/// API for reading, watching and writing Result data for a specific user ID
class ResultsRepository {
  ResultsRepository(this._firestore);
  final FirebaseFirestore _firestore;

  // static String offerBatchesPath() => '/batches';
  static String usersPath() => '/users';
  static String userPath(UserId uid) => '/users/$uid';
  static String userResultsPath(UserId uid) => '/users/$uid/results';
  static String userResultPath(UserId uid, ResultId resultId) =>
      '/users/$uid/results/$resultId';

  DocumentReference<Result> _resultRef(UserId uid, ResultId resultId) {
    return _firestore.doc(userResultPath(uid, resultId)).withConverter(
          fromFirestore: (doc, _) => Result.fromJson(doc.data()!),
          toFirestore: (result, _) => result.toJson(),
        );
  }

  Query<Result> _resultsRef(UserId uid, SummitRockYear? year) {
    if (year != null) {
      return _firestore
          .collection(userResultsPath(uid))
          .where("year", isEqualTo: year.name)
          .withConverter(
            fromFirestore: (doc, _) => Result.fromJson(doc.data()!),
            toFirestore: (Result result, options) => result.toJson(),
          )
          .orderBy('updatedAt', descending: true);
    }
    return _firestore
        .collection(userResultsPath(uid))
        .withConverter(
          fromFirestore: (doc, _) => Result.fromJson(doc.data()!),
          toFirestore: (Result result, options) => result.toJson(),
        )
        .orderBy('updatedAt', descending: true);
  }

  // CollectionReference<List<Result>> _resultsRef(UserId uid) {
  //   return _firestore.collection(userResultsPath(uid)).withConverter(
  //     fromFirestore: (doc, _) => Result.fromJson(doc.data()!),
  //     toFirestore: (cart, _) => cart.toJson(),
  //   );
  // }

  Future<Result?> fetchResult(UserId uid, ResultId resultId) async {
    final ref = _resultRef(uid, resultId);
    final snapshot = await ref.get();
    return snapshot.data();
  }

  Stream<Result?> watchResult(UserId uid, ResultId resultId) {
    final ref = _resultRef(uid, resultId);
    return ref.snapshots().map((snapshot) => snapshot.data());
  }

  Stream<List<Result>> watchResultsList({
    required UserId uid,
    required SummitRockYear? year,
  }) {
    final ref = _resultsRef(uid, year);
    return ref.snapshots().map((snapshot) =>
        snapshot.docs.map((docSnapshot) => docSnapshot.data()).toList());
  }

  // Stream<List<Result>> watchResults(UserId uid) {
  //   try {
  //     return _firestore
  //         .collection(offerBatchesPath())
  //         .snapshots()
  //         .map((snapshot) {
  //       return snapshot.docs
  //           .map((doc) => OfferBatch.fromMap(doc.data()))
  //           .toList();
  //     });
  //   } catch (e) {
  //     throw Exception("Error watching OfferBatches: $e");
  //   }
  // }

  Future<void> setResult(UserId uid, Result result) async {
    final ref = _resultRef(uid, result.id);
    await ref.set(result, SetOptions(merge: true));
  }

  Future<void> deleteAllResults(UserId uid) async {
    await _firestore.collection(userResultsPath(uid)).get().then((snapshot) {
      for (DocumentSnapshot doc in snapshot.docs) {
        doc.reference.delete();
      }
    });
  }
}

// import 'dart:async';
//
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:riverpod_annotation/riverpod_annotation.dart';
// import 'package:summit_rock/src/features/word_decoder/domain/result.dart';
//
// part 'results_repository.g.dart';
//
// @riverpod
// Stream<List<Result>> resultsListStream(ResultsListStreamRef ref) {
//   final resultsRepository = ref.watch(resultsRepositoryProvider);
//   return resultsRepository.watchResultsList();
// }
//
// @riverpod
// Future<List<Result>> resultsListFuture(ResultsListFutureRef ref) {
//   final resultsRepository = ref.watch(resultsRepositoryProvider);
//   return resultsRepository.fetchResultsList();
// }
//
// @riverpod
// Stream<Result?> resultStream(ResultStreamRef ref, ResultId id) {
//   final resultsRepository = ref.watch(resultsRepositoryProvider);
//   return resultsRepository.watchResult(id);
// }
//
// @riverpod
// Future<Result?> resultFuture(ResultFutureRef ref, ResultId id) {
//   final resultsRepository = ref.watch(resultsRepositoryProvider);
//   return resultsRepository.fetchResult(id);
// }
//
// @Riverpod(keepAlive: true)
// ResultsRepository resultsRepository(ResultsRepositoryRef ref) {
//   return ResultsRepository(FirebaseFirestore.instance);
// }
//
// class ResultsRepository {
//   const ResultsRepository(this._firestore);
//   final FirebaseFirestore _firestore;
//
//   static String resultsPath() => 'results';
//   static String resultPath(ResultId id) => 'results/$id';
//
//   Future<List<Result>> fetchResultsList() async {
//     final ref = _resultsRef();
//     final snapshot = await ref.get();
//     return snapshot.docs.map((docSnapshot) => docSnapshot.data()).toList();
//   }
//
//   Stream<List<Result>> watchResultsList() {
//     final ref = _resultsRef();
//     return ref.snapshots().map((snapshot) =>
//         snapshot.docs.map((docSnapshot) => docSnapshot.data()).toList());
//   }
//
//   Future<Result?> fetchResult(ResultId id) async {
//     final ref = _resultRef(id);
//     final snapshot = await ref.get();
//     return snapshot.data();
//   }
//
//   Stream<Result?> watchResult(ResultId id) {
//     final ref = _resultRef(id);
//     return ref.snapshots().map((snapshot) => snapshot.data());
//   }
//
//   Future<void> createResult(ResultId id, String imageUrl) {
//     return _firestore.doc(resultPath(id)).set(
//       {
//         'id': id,
//         'imageUrl': imageUrl,
//       },
//       // use merge: true to keep old fields (if any)
//       SetOptions(merge: true),
//     );
//   }
//
//   Future<void> updateResult(Result result) {
//     final ref = _resultRef(result.id);
//     return ref.set(result);
//   }
//
//   Future<void> deleteResult(ResultId id) {
//     return _firestore.doc(resultPath(id)).delete();
//   }
//
//   DocumentReference<Result> _resultRef(ResultId id) =>
//       _firestore.doc(resultPath(id)).withConverter(
//             fromFirestore: (doc, _) => Result.fromJson(doc.data()!),
//             toFirestore: (Result result, options) => result.toJson(),
//           );
//
//   Query<Result> _resultsRef() => _firestore
//       .collection(resultsPath())
//       .withConverter(
//         fromFirestore: (doc, _) => Result.fromJson(doc.data()!),
//         toFirestore: (Result result, options) => result.toJson(),
//       )
//       .orderBy('id');
//
//   /// * Temporary search implementation.
//   /// * Note: this is quite inefficient as it pulls the entire result list
//   /// * and then filters the data on the client
//   // Future<List<Result>> search(String query) async {
//   //   // 1. Get all results from Firestore
//   //   final resultsList = await fetchResultsList();
//   //   // 2. Perform client-side filtering
//   //   return resultsList
//   //       .where((result) =>
//   //           result.title.toLowerCase().contains(query.toLowerCase()))
//   //       .toList();
//   // }
// }
//
// // import 'package:cloud_firestore/cloud_firestore.dart';
// // import 'package:flutter/foundation.dart';
// // import 'package:hooks_riverpod/hooks_riverpod.dart';
// // import 'package:riverpod_annotation/riverpod_annotation.dart';
// //
// // part 'result_repository.g.dart';
// //
// // final pDatabase = Provider((ref) => FirebaseFirestore.instance);
// //
// // @riverpod
// // database(Ref ref) {
// //   return FirebaseFirestore.instance;
// // }
// //
// // final pOfferCodesRepository = Provider((ref) {
// //   return OfferCodesRepository(ref.watch(pDatabase));
// // });
// //
// // class OfferCodesRepository {
// //   const OfferCodesRepository(this._firestore);
// //   final FirebaseFirestore _firestore;
// //
// //   static String logsPath() => '/logs';
// //   static String logPath(String logId) => '/logs/$logId';
// //   static String offerBatchesPath() => '/batches';
// //   static String offerBatchPath(String batchId) => '/batches/$batchId';
// //   static String recoilMonthlyCollection() => '/recoilMonthlyCodes';
// //   static String recoilYearlyCollection() => '/recoilYearlyCodes';
// //   static String recoilEarlyBirdCollection() => '/recoilEarlyBirdCodes';
// //   static String recoilMonthlyPath(String code) =>
// //       '${recoilMonthlyCollection()}/$code';
// //   static String recoilYearlyPath(String code) =>
// //       '${recoilYearlyCollection()}/$code';
// //   static String recoilEarlyBirdPath(String code) =>
// //       '${recoilEarlyBirdCollection()}/$code';
// //
// //   static String offerCodePath(OfferCode code) {
// //     if (kDebugMode) {
// //       return '/debugCodes/${code.code}';
// //     }
// //     switch (code.offerType) {
// //       case OfferType.recoilMonthly:
// //         return recoilMonthlyPath(code.code);
// //       case OfferType.recoilYearly:
// //         return recoilYearlyPath(code.code);
// //       case OfferType.recoilEarlyBird:
// //         return recoilEarlyBirdPath(code.code);
// //       case OfferType.unknown:
// //         return '';
// //     }
// //   }
// //
// //   static String _getCollectionPath(OfferType type) {
// //     if (kDebugMode) {
// //       return '/debugCodes';
// //     }
// //     switch (type) {
// //       case OfferType.recoilMonthly:
// //         return recoilMonthlyCollection();
// //       case OfferType.recoilYearly:
// //         return recoilYearlyCollection();
// //       case OfferType.recoilEarlyBird:
// //         return recoilEarlyBirdCollection();
// //       case OfferType.unknown:
// //         throw StateError('Cannot get Collection Path for Unknown OfferType');
// //     }
// //   }
// //
// //   Future<void> addOfferCode(OfferCode code) async {
// //     try {
// //       return _firestore.doc(offerCodePath(code)).set(
// //             code.toMap(),
// //             SetOptions(merge: true), // merge: true keeps old fields (if any)
// //           );
// //     } catch (err) {
// //       print("Error Saving OfferCode: $code\n$err");
// //       rethrow;
// //     }
// //   }
// //
// //   Future<bool> saveOfferBatch(OfferBatch batch) async {
// //     try {
// //       final reference = _firestore.doc(offerBatchPath(batch.id));
// //       await reference.set(batch.toMap(), SetOptions(merge: true));
// //       return true;
// //     } catch (err) {
// //       print("Error Saving OfferBatch: ${batch.id}\n$err");
// //       rethrow;
// //     }
// //   }
// //
// //   Future<bool> saveLog(Log log) async {
// //     try {
// //       final reference = _firestore.doc(logPath(log.id));
// //       await reference.set(log.toMap(), SetOptions(merge: true));
// //       return true;
// //     } catch (err) {
// //       print("Error Saving Log: ${log.id}\n$err");
// //       rethrow;
// //     }
// //   }
// //
// //   Stream<List<Log>> watchLogs() {
// //     try {
// //       return _firestore
// //           .collection(logsPath())
// //           .orderBy('distributionDate', descending: true)
// //           .snapshots()
// //           .map((snapshot) {
// //         // TODO paginate this!
// //         return snapshot.docs.map((doc) => Log.fromMap(doc.data())).toList();
// //       });
// //     } catch (e) {
// //       throw Exception("Error watching Logs: $e");
// //     }
// //   }
// //
// //   Future<List<Log>> getUserLogs(String userId) {
// //     try {
// //       return _firestore
// //           .collection(logsPath())
// //           .where('distributorId', isEqualTo: userId)
// //           .orderBy('distributionDate', descending: true)
// //           .get()
// //           .then((value) {
// //         // TODO paginate this!
// //         return value.docs.map((doc) => Log.fromMap(doc.data())).toList();
// //       });
// //     } catch (e) {
// //       throw Exception("Error watching Logs: $e");
// //     }
// //   }
// //
// //   Stream<List<OfferBatch>> watchOfferBatches() {
// //     try {
// //       return _firestore
// //           .collection(offerBatchesPath())
// //           .snapshots()
// //           .map((snapshot) {
// //         return snapshot.docs
// //             .map((doc) => OfferBatch.fromMap(doc.data()))
// //             .toList();
// //       });
// //     } catch (e) {
// //       throw Exception("Error watching OfferBatches: $e");
// //     }
// //   }
// //
// //   Future<List<OfferBatch>> getDeactivatedBatches() async {
// //     try {
// //       final List<OfferBatch> deactivatedBatches = await _firestore
// //           .collection(offerBatchesPath())
// //           .where('deactivatedDate', isNull: true)
// //           .get()
// //           .then((value) {
// //         print("Got back ${value.size} Deactivated Batches");
// //         List<OfferBatch> batches = [];
// //         for (final doc in value.docs) {
// //           OfferBatch batch = OfferBatch.fromMap(doc.data());
// //           batches.add(batch);
// //         }
// //         return batches;
// //       });
// //       return deactivatedBatches;
// //     } catch (err) {
// //       print("Error Getting Available Batches");
// //       return [];
// //     }
// //   }
// //
// //   Future<List<OfferBatch>> getAvailableBatches() async {
// //     try {
// //       final List<OfferBatch> availableBatches = await _firestore
// //           .collection(offerBatchesPath())
// //           .where('deactivatedDate', isNull: true)
// //           .get()
// //           .then((value) {
// //         print("Got back ${value.size} Active Batches");
// //         List<OfferBatch> batches = [];
// //         for (final doc in value.docs) {
// //           OfferBatch batch = OfferBatch.fromMap(doc.data());
// //           batches.add(batch);
// //         }
// //         return batches;
// //       });
// //       return availableBatches;
// //     } catch (err) {
// //       print("Error Getting Available Batches");
// //       return [];
// //     }
// //   }
// //
// //   Future<List<String>> _getAvailableBatchIds() async {
// //     List<OfferBatch> availableBatches = await getAvailableBatches();
// //     List<String> ids = ['originalBatchId'];
// //     for (final batch in availableBatches) {
// //       ids.add(batch.id);
// //     }
// //     return ids;
// //   }
// //
// //   Future<OfferCode?> getAvailableOfferCode(OfferType type) async {
// //     try {
// //       List<String> activeBatchIds = await _getAvailableBatchIds();
// //       final OfferCode? availableCode = await _firestore
// //           .collection(_getCollectionPath(type))
// //           .where('batchId', whereIn: activeBatchIds)
// //           .where("shared", isEqualTo: false)
// //           .limit(1)
// //           .get()
// //           .then((QuerySnapshot querySnapshot) {
// //         for (var docSnapshot in querySnapshot.docs) {
// //           final data = docSnapshot.data() as Map<String, dynamic>;
// //           OfferCode offerCode = OfferCode.fromMap(data);
// //           print("Got back $offerCode");
// //           return offerCode;
// //         }
// //       }).onError(
// //         (error, stackTrace) {
// //           print("Error querying for available OfferCode: $error");
// //           return null;
// //         },
// //       );
// //       return availableCode;
// //     } catch (err) {
// //       print("Error Getting OfferCode:\n$err");
// //       rethrow;
// //     }
// //   }
// //
// //   Future<OfferCode?> updateOfferCode(OfferCode code) async {
// //     print("Saving $code");
// //     final codeDocRef = _firestore.doc(offerCodePath(code));
// //     return await _firestore.runTransaction((transaction) async {
// //       return await transaction
// //           .get(codeDocRef)
// //           .then<OfferCode?>((codeDoc) async {
// //         OfferCode oldCode = OfferCode.fromMap(codeDoc.data());
// //         if (oldCode.shared) {
// //           // "THIS CODE HAS ALREADY BEEN SHARED!!!!! GET A NEW CODE!!!!";
// //           print("THIS CODE HAS ALREADY BEEN SHARED!!!!! GET A NEW CODE!!!!");
// //           return await tryAnotherCode(code);
// //         }
// //         transaction.update(codeDocRef, code.toMap());
// //         return code;
// //       });
// //     }).onError((error, stackTrace) {
// //       print("Error Updating OfferCode: $error");
// //       throw StateError("Error Updating OfferCode");
// //     });
// //   }
// //
// //   Future<OfferCode?> tryAnotherCode(OfferCode usedCode) async {
// //     OfferCode? newCode = await getAvailableOfferCode(usedCode.offerType);
// //     if (newCode != null) {
// //       OfferCode updatedCode = newCode.copyWith(
// //         distributorId: usedCode.distributorId,
// //         distributionDate: usedCode.distributionDate,
// //         distributorName: usedCode.distributorName,
// //         recipientName: usedCode.recipientName,
// //         shared: true,
// //       );
// //       return updateOfferCode(updatedCode);
// //     }
// //     return null;
// //   }
// //
// //   Future<bool> deactivateBatch(OfferBatch batch) async {
// //     OfferBatch updatedBatch = batch.copyWith(deactivatedDate: DateTime.now());
// //     return await saveOfferBatch(updatedBatch);
// //   }
// //
// //   Future<bool> reactivateBatch(OfferBatch batch) async {
// //     OfferBatch updatedBatch = batch.copyWith(deactivatedDate: null);
// //     return await saveOfferBatch(updatedBatch);
// //   }
// // }

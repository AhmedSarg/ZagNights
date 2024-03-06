import 'package:dartz/dartz.dart';

import '../../domain/repository/repository.dart';
import '../data_source/remote_data_source.dart';
import '../network/error_handler.dart';
import '../network/failure.dart';
import '../network/network_info.dart';

class RepositoryImpl implements Repository {
  final RemoteDataSource _remoteDataSource;
  // final LocalDataSource _localDataSource;
  // final CacheDataSource _cacheDataSource;
  final NetworkInfo _networkInfo;
  // final GSheetFactory _gSheetFactory;
  // final DateNTP _dateNTP;

  RepositoryImpl(
    this._remoteDataSource,
    // this._localDataSource,
    this._networkInfo,
    // this._cacheDataSource,
    // this._gSheetFactory,
    // this._dateNTP,
  );

  @override
  Future<Either<Failure, bool>> getAppStatus() async {
    try {
      if (await _networkInfo.isConnected) {
        var data = await _remoteDataSource.getAppStatus();
        return Right(data);
      }
      else {
        return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
      }
    } catch (e) {
      return Left(ErrorHandler.handle(e).failure);
    }
  }

  // @override
  // Future<Either<Failure, NewsListModel>> getNewsList() async {
  //   try {
  //     // if (kDebugMode) await Future.delayed(const Duration(seconds: 0));
  //     // var data = await _localDataSource.getNewsData();
  //
  //     if (await _networkInfo.isConnected) {
  //       var response = await _remoteDataSource.getNews();
  //       await _cacheDataSource.setNewsList(response);
  //       return Right(await response.toDomain());
  //     } else {
  //       try {
  //         var response = await _cacheDataSource.getNewsList();
  //         return Right(await response.toDomain());
  //       } catch (e) {
  //         return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
  //       }
  //     }
  //   } catch (e) {
  //     return Left(ErrorHandler.handle(e).failure);
  //   }
  // }

}

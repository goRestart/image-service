import CoreService
import S3

extension Assembly {
  
  var imageRepository: ImageRepository {
    return ImageRepository(
      remoteDataSource: s3RemoteImageDataSource,
      diskDataSource: diskImageDataSource
    )
  }
  
  // MARK: - Remote Data Source
  
  private var s3RemoteImageDataSource: RemoteImageDataSource {
    return S3RemoteImageDataSource(
      s3: s3
    )
  }

  private var s3: S3 {
    return try! S3(
      config: config
    )
  }
  
  // MARK: - Disk Data source
  
  private var diskImageDataSource: ImageDataSource {
    return ImageDiskDataSource(
      saveImageTask: saveImageTask
    )
  }
  
  private var saveImageTask: SaveImageTask {
    return SaveImageTask()
  }
}

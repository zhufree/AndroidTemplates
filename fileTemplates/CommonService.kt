package ${PACKAGE_NAME}

import okhttp3.MediaType
import okhttp3.RequestBody
import retrofit2.http.*

interface ${upperName}Api {
    @Headers(WindConstants.CONTENT_TYPE_JSON, WindConstants.APP_ID, WindConstants.API_KEY)
    @GET("1/classes/${upperName}Model")
    suspend fun getAll${upperName}(@Query("skip") skip: Int = 0,
//                      @Query("limit") limit: Int = 100,
                      @Query("order") order: String = "-createdAt")
            : ApiBean.ApiListResponse<${upperName}Model>

    @Headers(WindConstants.CONTENT_TYPE_JSON, WindConstants.APP_ID, WindConstants.API_KEY)
    @GET("1/classes/${upperName}Model")
    suspend fun get${upperName}OfAuthor(@Query("where") where: String, @Query("order") order: String = "-createdAt")
            : ApiBean.ApiListResponse<${upperName}Model>

    @Headers(WindConstants.CONTENT_TYPE_JSON, WindConstants.APP_ID, WindConstants.API_KEY)
    @POST("1/classes/${upperName}Model")
    suspend fun addNew${upperName}(@Body jsonStr: RequestBody): ApiBean.AddResponse

    // 获取单个model
    @Headers(WindConstants.CONTENT_TYPE_JSON, WindConstants.APP_ID, WindConstants.API_KEY)
    @GET("1/classes/${upperName}Model/{objectId}")
    suspend fun get${upperName}(@Path("objectId") objectId: String): ${upperName}Model

    @Headers(WindConstants.CONTENT_TYPE_JSON, WindConstants.APP_ID, WindConstants.API_KEY)
    @DELETE("1/classes/${upperName}Model/{objectId}")
    suspend fun delete${upperName}(@Path("objectId") objectId: String): ApiBean.OkResponse

}

object ${NAME}:BaseService() {

    suspend fun getAll${upperName}(next:(List<${upperName}Model>)->Unit) {
        val response = ApiManager.${lowerName}Api.getAll${upperName}()
        next(response.results)
    }

    suspend fun get${upperName}OfAuthor(authorId: String, next:(List<${upperName}Model>)->Unit) {
        val where = "{\"authorId\":\"$authorId\"}"
        val response = ApiManager.${lowerName}Api.get${upperName}OfAuthor(where)
        next(response.results)
    }

    suspend fun addNew${upperName}(new${upperName}:${upperName}Model, next:()->Unit) {
        val ${lowerName}Str = postGson.toJson(new${upperName})
        val ${lowerName}Body = RequestBody.create(MediaType.parse("application/json;charset=UTF-8"), ${lowerName}Str)
        val response = ApiManager.${lowerName}Api.addNew${upperName}(${lowerName}Body)
        next()
    }

    suspend fun get${upperName}(${lowerName}Id:String, next:(${upperName}Model)->Unit) {
        next(ApiManager.${lowerName}Api.get${upperName}(${lowerName}Id))
    }

    suspend fun delete${upperName}(${lowerName}Id: String, next: () -> Unit) {
        ApiManager.${lowerName}Api.delete${upperName}(${lowerName}Id)
        next()
    }

}
@Headers(CONTENT_TYPE_JSON, APP_ID, API_KEY)
@POST("1/classes/$className$Model")
fun addNew$className$(@Body jsonStr: RequestBody): Observable<ApiBean.AddResponse>

@Headers(CONTENT_TYPE_JSON, APP_ID, API_KEY)
@GET("1/classes/$className$Model")
fun getAll$className$sOfOne(@Query("where") where: String, @Query("order") order: String = "-createdAt")
    : Observable<ApiBean.ApiListResponse<$className$Model>>
    
@Headers(CONTENT_TYPE_JSON, APP_ID, API_KEY)
@DELETE("1/classes/$className$Model/{objectId}")
fun delete$className$(@Path("objectId") objectId: String): Observable<ApiBean.OkResponse>

fun getAll$className$s(updateView: (eventList: List<$className$Model>) -> Unit) {
    val where = "{}"
    apiService.getAll$className$s(where).subscribeOn(Schedulers.io()).observeOn(AndroidSchedulers.mainThread())
            .subscribe(object : BaseObserver<ApiBean.ApiListResponse<$className$Model>>() {
                override fun onNext(t: ApiBean.ApiListResponse<$className$Model>) {
                    updateView(t.results)
                }
            })
}

fun addNew$className$($name$: $className$Model, doLater: ($name$Id: String) -> Unit) {
    val $name$Str = postGson.toJson($name$)
    val $name$Body = RequestBody.create(MediaType.parse("application/json;charset=UTF-8"), $name$Str)

    apiService.addNew$className$($name$Body).subscribeOn(Schedulers.io()).observeOn(AndroidSchedulers.mainThread())
            .subscribe(object : BaseObserver<ApiBean.AddResponse>() {
                override fun onNext(t: ApiBean.AddResponse) {
                    doLater(t.objectId)
                }
            })
}

fun delete$className$(objectId: String) {
    apiService.delete$className$(objectId).subscribeOn(Schedulers.io())
            .observeOn(AndroidSchedulers.mainThread())
            .subscribe(object : BaseObserver<ApiBean.OkResponse>() {
                override fun onNext(t: ApiBean.OkResponse) {
                }
            })
}
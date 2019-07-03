#if (${PACKAGE_NAME} && ${PACKAGE_NAME} != "")package ${PACKAGE_NAME}
#end

import androidx.lifecycle.LiveData
import androidx.room.Dao
import androidx.room.Insert
import androidx.room.OnConflictStrategy.REPLACE
import androidx.room.Query

#parse("Kt File Header.kt")
@Dao
interface ${NAME} {
    @Insert(onConflict = REPLACE)
    fun save(${lowerClassName}: ${className}Model)

    @Insert(onConflict = REPLACE)
    fun saveAll(${lowerClassName}s: List<${className}Model>)
    
    @Query("SELECT * FROM ${lowerClassName}s WHERE objectId = :${lowerClassName}Id")
    fun load(${lowerClassName}Id: String): LiveData<${className}Model>

    @Query("SELECT * FROM ${lowerClassName}s")
    fun loadAll(): LiveData<List<${className}Model>>
    
    @Query("DELETE FROM ${lowerClassName}s")
    fun clear${className}()
}


#if (${PACKAGE_NAME} && ${PACKAGE_NAME} != "")package ${PACKAGE_NAME}
#end

import androidx.room.Entity

@Entity(tableName = "${NAME}s")
data class ${NAME}(var title: String): BaseModel()


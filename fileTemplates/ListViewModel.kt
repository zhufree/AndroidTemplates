#if (${PACKAGE_NAME} && ${PACKAGE_NAME} != "")package ${PACKAGE_NAME}
#end

import androidx.lifecycle.ViewModel

class ${NAME}(private val listRepo: ${className}Repository) : ViewModel() {

    private var listInit = false

    fun get${className}List(): LiveData<List<${className}Model>>? {
        if (!listInit) {
            load${className}s()
            listInit = true
        }
        return listRepo.list
    }

    fun load${className}s() {
        listRepo.load${className}List()
    }
}

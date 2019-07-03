package ${escapeKotlinIdentifiers(packageName)}

import androidx.lifecycle.LiveData
import androidx.lifecycle.ViewModel
import ${escapeKotlinIdentifiers(packageName)}.${modelName?cap_first}Model
import ${escapeKotlinIdentifiers(packageName)}.${modelName?cap_first}Repository

class ${modelName?cap_first}ListViewModel(private val repo: ${modelName?cap_first}Repository) : ViewModel() {
    fun get${modelName?cap_first}List(): LiveData<ArrayList<${modelName?cap_first}Model>>? {
        return repo.${modelName}List
    }

    fun load${modelName?cap_first}Models() {
        repo.loadWorkList()
    }
}
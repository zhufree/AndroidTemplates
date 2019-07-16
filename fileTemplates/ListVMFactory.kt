#if (${PACKAGE_NAME} && ${PACKAGE_NAME} != "")package ${PACKAGE_NAME}
#end

import androidx.lifecycle.ViewModel
import androidx.lifecycle.ViewModelProvider


#parse("Kt File Header.kt")
class ${NAME}(
        private val repository: ${className}Repository
) : ViewModelProvider.NewInstanceFactory() {

    @Suppress("UNCHECKED_CAST")
    override fun <T : ViewModel> create(modelClass: Class<T>) = ${className}ListViewModel(repository) as T
}



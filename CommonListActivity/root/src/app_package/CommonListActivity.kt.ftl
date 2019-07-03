package ${escapeKotlinIdentifiers(packageName)}

import ${superClassFqcn}
import android.os.Bundle
<#if (includeCppSupport!false) && generateLayout>
import kotlinx.android.synthetic.main.${layoutName}.*
</#if>
import androidx.databinding.DataBindingUtil
import androidx.lifecycle.Observer
import androidx.lifecycle.ViewModelProviders
import android.view.View
import ${escapeKotlinIdentifiers(packageName)}.R
import ${escapeKotlinIdentifiers(packageName)}.bean.${modelName?cap_first}Model
import ${escapeKotlinIdentifiers(packageName)}.util.InjectorUtils
import ${escapeKotlinIdentifiers(packageName)}.util.PreferenceUtil
import ${escapeKotlinIdentifiers(packageName)}.view.base.BaseActivity
import ${escapeKotlinIdentifiers(packageName)}.viewmodel.${modelName?cap_first}ListViewModel

class ${activityClass} : ${parentActivityClass}() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
<#if generateLayout>
        val bd: ${dataBindingClassName} = DataBindingUtil.setContentView(
                this, R.layout.${layoutName})
        <#include "../../../../common/jni_code_usage.kt.ftl">
<#elseif includeCppSupport!false>

        // Example of a call to a native method
        android.util.Log.d("${activityClass}", stringFromJNI())
</#if>

	

        setSupportActionBar(bd.${modelName}Toolbar)
        bd.${modelName}Toolbar.setNavigationIcon(R.drawable.ic_arrow_back_white_24dp)
        bd.${modelName}Toolbar.setNavigationOnClickListener { finish() }

        val adapter = ${modelName?cap_first}Adapter()
        bd.rl${modelName?cap_first}List.adapter = adapter
        val factory = InjectorUtils.provide${modelName?cap_first}ListViewModelFactory(this)
        val model = ViewModelProviders.of(this, factory)
                .get(${modelName?cap_first}ListViewModel::class.java)

        
        model.get${modelName?cap_first}(PreferenceUtil.getUserId())
                ?.observe(this, Observer<List<${modelName?cap_first}Model>> { ${modelName}s ->
                    // update UI
                    if (${modelName}s.isNotEmpty()) {
                        bd.tvEmpty${modelName?cap_first}.visibility = View.GONE
                        adapter.submitList(${modelName}s)
                    }
                })
    }
<#include "../../../../common/jni_code_snippet.kt.ftl">
}

package ${escapeKotlinIdentifiers(packageName)}

import android.app.Activity
import android.view.LayoutInflater
import android.view.View
import androidx.recyclerview.widget.DiffUtil
import androidx.recyclerview.widget.ListAdapter
import androidx.recyclerview.widget.RecyclerView
import com.bumptech.glide.Glide
import com.bumptech.glide.load.resource.drawable.DrawableTransitionOptions
import ${escapeKotlinIdentifiers(packageName)}.${modelName?cap_first}Model
import ${escapeKotlinIdentifiers(packageName)}.Item${modelName?cap_first}Binding

class ${adapterName} : ListAdapter<${modelName?cap_first}Model, ${modelName?cap_first}Adapter.${modelName?cap_first}Holder>(${modelName?cap_first}DiffCallback()) {


    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): ${modelName?cap_first}Holder {
        return ${modelName?cap_first}Holder(Item${modelName?cap_first}Binding.inflate(
                LayoutInflater.from(parent.context), parent, false))
    }

    override fun onBindViewHolder(holder: ${modelName?cap_first}Holder, position: Int) {
        val ${modelName} = getItem(position)
        // 绑定 holder
        holder.apply {
            bind(createOnClickListener(${modelName}), ${modelName}) // 点击事件
            itemView.tag = ${modelName}
        }
    }

    private fun createOnClickListener(${modelName}: ${modelName?cap_first}Model): View.OnClickListener {
        return View.OnClickListener {
            
        }
    }

    class ${modelName?cap_first}Holder(private val binding: Item${modelName?cap_first}Binding) : RecyclerView.ViewHolder(binding.root) {
        fun bind(listener: View.OnClickListener, item: ${modelName?cap_first}Model) {
            // 具体绑定监听事件和数据
            binding.apply {
                clickListener = listener
                ${modelName} = item
                executePendingBindings()
            }
        }
    }

    /**
     * 用来对比列表中数据是否变化
     */
    private class ${modelName?cap_first}DiffCallback : DiffUtil.ItemCallback<${modelName?cap_first}Model>() {

        /**
         * 是否是同一个item
         */
        override fun areItemsTheSame(
                oldItem: ${modelName?cap_first}Model,
                newItem: ${modelName?cap_first}Model
        ): Boolean {
            return oldItem.objectId == newItem.objectId
        }

        /**
         * item的内容是否一致，仅当[areItemsTheSame]返回true时才调用做进一步判断
         */
        override fun areContentsTheSame(
                oldItem: ${modelName?cap_first}Model,
                newItem: ${modelName?cap_first}Model
        ): Boolean {
            return oldItem == newItem
        }
    }
}
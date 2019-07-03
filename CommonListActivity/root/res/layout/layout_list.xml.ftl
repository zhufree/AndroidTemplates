<?xml version="1.0" encoding="utf-8"?>
<layout>
<${getMaterialComponentName('android.support.constraint.ConstraintLayout', useAndroidX)}
    xmlns:android="http://schemas.android.com/apk/res/android"
    xmlns:tools="http://schemas.android.com/tools"
    xmlns:app="http://schemas.android.com/apk/res-auto"
    android:layout_width="match_parent"
    android:layout_height="match_parent"
    tools:context="${packageName}.${activityClass}">
<#if hasAppBar>
    <com.google.android.material.appbar.AppBarLayout
            android:id="@+id/abl_${modelName}_list"
            android:layout_width="match_parent"
            android:layout_height="wrap_content"
            android:theme="@style/AppTheme.AppBarOverlay"
            app:layout_constraintTop_toTopOf="parent">

            <androidx.appcompat.widget.Toolbar
                android:id="@+id/${modelName}_toolbar"
                android:layout_width="match_parent"
                android:layout_height="?android:attr/actionBarSize"
                android:background="@color/colorAccent"
                app:layout_scrollFlags="scroll|enterAlways"
                app:popupTheme="@style/AppTheme.PopupOverlay"
                app:title="@string/${modelName}" />
        </com.google.android.material.appbar.AppBarLayout>
</#if>
        <TextView
            android:id="@+id/tv_empty_${modelName}"
            android:layout_width="wrap_content"
            android:layout_height="wrap_content"
            android:layout_marginTop="40dp"
            android:text="@string/empty_${modelName}"
            android:textColor="@color/colorPrimaryDark"
            android:textSize="22sp"
            app:layout_constraintEnd_toEndOf="parent"
            app:layout_constraintStart_toStartOf="parent"
            app:layout_constraintTop_toBottomOf="@id/abl_${modelName}_list" />

        <androidx.recyclerview.widget.RecyclerView
            android:id="@+id/rl_${modelName}_list"
            android:layout_width="match_parent"
            android:layout_height="wrap_content"
            app:layoutManager="androidx.recyclerview.widget.LinearLayoutManager"
            app:layout_behavior="@string/appbar_scrolling_view_behavior"
            app:layout_constraintTop_toBottomOf="@id/abl_${modelName}_list"
            tools:listitem="@layout/item_${modelName}">

        </androidx.recyclerview.widget.RecyclerView>
</${getMaterialComponentName('android.support.constraint.ConstraintLayout', useAndroidX)}>
</layout>

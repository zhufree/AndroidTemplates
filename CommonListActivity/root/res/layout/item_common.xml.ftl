<?xml version="1.0" encoding="utf-8"?>
<layout xmlns:android="http://schemas.android.com/apk/res/android"
    xmlns:app="http://schemas.android.com/apk/res-auto">
	<data>

        <variable
            name="clickListener"
            type="android.view.View.OnClickListener" />

        <variable
            name="${modelName}"
            type="${packageName}.${modelName?cap_first}Model" />
    </data>
    <androidx.cardview.widget.CardView
        android:layout_width="match_parent"
        android:layout_height="wrap_content"
        android:layout_margin="5dp"
        android:onClick="@{clickListener}">

        <androidx.constraintlayout.widget.ConstraintLayout
            android:layout_width="match_parent"
            android:layout_height="wrap_content"
            android:padding="16dp">

            <TextView
                android:id="@+id/tv_${modelName}_title"
                android:layout_width="wrap_content"
                android:layout_height="wrap_content"
                android:text="@{${modelName}.title}"
                android:textSize="18sp"
                android:textStyle="bold"
                app:layout_constraintStart_toStartOf="parent"
                app:layout_constraintTop_toTopOf="parent"/>

        </androidx.constraintlayout.widget.ConstraintLayout>
    </androidx.cardview.widget.CardView>
</layout>
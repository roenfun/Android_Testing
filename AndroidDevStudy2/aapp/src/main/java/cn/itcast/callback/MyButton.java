package cn.itcast.callback;

/**
 * Created by chad on 2017/4/21.
 */

public class MyButton {
    private MyOnClickListener listener;

    /**
     * 设置具体点击监听器
     *
     * @param listener 点击监听器实现类
     */
    public void setOnClickListener(MyOnClickListener listener) {
        this.listener = listener;
    }

    /**
     * 按钮被点击
     */
    public void doClick() {
        listener.onClick();
    }
}

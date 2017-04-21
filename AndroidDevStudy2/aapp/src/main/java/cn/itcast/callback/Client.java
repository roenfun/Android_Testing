package cn.itcast.callback;

/**
 * Created by chad on 2017/4/21.
 */

public class Client {
    public static void main(String[] args) {
        MyButton button = new MyButton();
        //注册监听器
        button.setOnClickListener(new MyOnClickListener() {

            @Override
            public void onClick() {
                System.out.println("按钮被点击了");

            }

        });
        //模拟用户点击
        button.doClick();
    }
}

package org.home.thread;

/**
 * Created by Kevin.
 * User: HSZM1106-0312
 * Date: 14-1-17
 * Time: 下午11:06
 */
public class Counter {
    long count = 0;

    public synchronized void add(long value) {
        this.count += value;
    }

    public static void main(String[] args) {
        Counter counter = new Counter();
        new CounterThread(new Counter(), "t1").start();
        new CounterThread(new Counter(), "t2").start();
    }

    public static class CounterThread extends Thread {
        Counter counter;

        public CounterThread(Counter counter, String name) {
            super(name);
            this.counter = counter;
        }

        @Override
        public void run() {
            System.out.println("Thread "+this.getName()+" start run. The state is "+this.getState());
            for (int i = 0; i < 5000; i++) {
                counter.add(i);
            }
            System.out.println("Thread "+this.getName()+" stop run. The state is "+this.getState());
        }
    }


}

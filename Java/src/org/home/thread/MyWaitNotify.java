package org.home.thread;

/**
 * Created by Kevin.
 * User: HSZM1106-0312
 * Date: 14-1-17
 * Time: 下午11:41
 */
public class MyWaitNotify {

    final MonitorObject monitorObject = new MonitorObject();
    boolean wasSignalled = false;


    public void doWait() {
        synchronized (monitorObject) {
            if (!wasSignalled) {
                try {
                    monitorObject.wait();
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }
            }
            wasSignalled = false;
        }
    }

    public void doWakeUp() {
        synchronized (monitorObject) {
            wasSignalled = true;
            monitorObject.notifyAll();
        }
    }

    public class MonitorObject {
    }

    public static class Counter {
        int index = 0;

        private void increasing() {
            index++;
        }

        public int getIndex() {
            return index;
        }
    }

    public static void main(String[] args) {
        final MyWaitNotify myWaitNotify = new MyWaitNotify();
        final Counter counter = new Counter();

        Thread thread1 = new Thread(new Runnable() {
            public void run() {
                myWaitNotify.doWait();
                System.out.println("Wait!" + Thread.currentThread().getName() + ",Count is " + counter.getIndex());
            }
        });

        Thread thread2 = new Thread(new Runnable() {
            public void run() {
                myWaitNotify.doWakeUp();
                System.out.println("wakeUp!" + Thread.currentThread().getName() + ",Count is " + counter.getIndex());

            }
        });

        Thread thread3 = new Thread(new Runnable() {
            public void run() {
                myWaitNotify.doWait();
                System.out.println("wait!" + Thread.currentThread().getName() + ",Count is " + counter.getIndex());

            }
        });
        thread1.start();
        thread3.start();
        thread2.start();


    }
}

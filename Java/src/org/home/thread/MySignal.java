package org.home.thread;

/**
 * Created by Kevin.
 * User: HSZM1106-0312
 * Date: 14-1-17
 * Time: 下午11:23
 */
public class MySignal {
    protected boolean hasDataToProcess = false;

    public synchronized boolean isHasDataToProcess(){
        return this.hasDataToProcess;
    }

    public synchronized void setHasDataToProcess(boolean hasDataToProcess){
        this.hasDataToProcess = hasDataToProcess;
    }

    public static void main(String[] args) {
        final MySignal mySignal = new MySignal();

        Thread thread1 = new Thread(new Runnable() {
            public void run() {
                mySignal.setHasDataToProcess(true);
                System.out.println("SET DATA!");
            }
        });

        Thread thread2 = new Thread(new Runnable() {
            public void run() {
                while (!mySignal.isHasDataToProcess()){
                     //do nothing,but wait.
                }
                System.out.println("Data is OK, Please start to work!");

                /*if(mySignal.isHasDataToProcess()) {
                    System.out.println("Data is Ok, WE START TO WORK!");
                }else{
                    System.out.println("Wait for data...");
                }*/
            }
        });
        thread1.start();
        thread2.start();


    }


}



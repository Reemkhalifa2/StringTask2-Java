public class catDog {
    public static void main(String[] args) {
        System.out.println(catDog("catxxdogxxxdog"));
    }
    public static Boolean catDog(String str){
        Integer dogCount =0;
        Integer catCount =0;
        for(int i=0; i<str.length()-2;i++){
            if(str.substring(i,i+3).equals("cat")){
                catCount++;
            }
            if(str.substring(i,i+3).equals("dog")){
                dogCount++;
            }
        }
        return catCount == dogCount;
    }
}

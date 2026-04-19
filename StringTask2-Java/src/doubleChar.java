public class doubleChar {
    public static void main(String[] args) {
        System.out.println(doubleChar("The"));
    }
    public static String doubleChar(String str){
        String result="";
        for(Integer i=0; i<str.length();i++){
            result += str.charAt(i);
            result += str.charAt(i);
        }
        return result;
    }
}

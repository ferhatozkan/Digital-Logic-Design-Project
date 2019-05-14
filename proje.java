import java.io.*;
import java.util.ArrayList;
import java.util.List;

//Digital Design Project Step1

//Ferhat Özkan  150115009
//Ali Atalay Cebeci 150114041
//Taha Bilal Özbey 150114040

public class proje {


    public static void main(String[] args) throws FileNotFoundException, UnsupportedEncodingException {


        //Read the input txt and store the lines in an arraylist
        String line;
        List<String> lines = new ArrayList<String>();
        try {
            FileReader fileReader = new FileReader("src/input.txt");
            BufferedReader in = new BufferedReader(fileReader);
            while ((line = in.readLine()) != null) {
                lines.add(line);
            }
            in.close();
        } catch (FileNotFoundException e) {
            System.err.println("Unable to find text file.");
        } catch (IOException e) {
            System.err.println("Error reading file.");
        }




        String result = new String();
        PrintWriter writer = new PrintWriter("Instruction Memory.txt", "UTF-8");
        //get each line and seperate them from commas and white spaces
        writer.println("v2.0 raw");
        int i;
        for (i = 0; i < lines.size(); i++) {
            String[] splited = lines.get(i).split("[\\s,]+");
            //expToBinary converts the instruction to binary
            result = expToBinary(splited);
            int decimal = Integer.parseInt(result,2);
            //Convert the binary result to hexadecimal
            String hexStr = Integer.toString(decimal,16);
            System.out.println(hexStr);
            //Write the result in a txt file
            writer.println(hexStr);

        }
        writer.close();
    }

    //decides which instruction is called and calls different functions to convert the
    //instructions into binary code
    public static String expToBinary(String[] exp) {
        String binary;
        binary = "";
        switch (exp[0]) {
            case "ADD":
            case "AND":
            case "OR":
            case "XOR":
            case "ADDI":
            case "ANDI":
            case "ORI":
            case "XORI":
                binary = operations(exp);
                break;
            case "JUMP":
                binary = jump(exp);
                break;
            case "LD":
            case "ST":
                binary = stld(exp);
                break;
            case "BEQ":
            case "BLT":
            case "BGT":
            case "BLE":
            case "BGE":
                binary = branches(exp);
                break;

            default:
                throw new IllegalArgumentException("INVALID INPUT");
        }
        return binary;
    }

    public static String operations(String[] exp) {

        String binary;
        String upcode = "";
        String Ibit = "";
        String immediate = "";

        switch (exp[0]) {
            case "ADD":
                upcode = "0001";
                Ibit = "0";
                immediate = "";
                break;
            case "AND":
                upcode = "0010";
                Ibit = "0";
                immediate = "";
                break;
            case "OR":
                upcode = "0011";
                Ibit = "0";
                immediate = "";
                break;
            case "XOR":
                upcode = "0100";
                Ibit = "0";
                immediate = "";
                break;
            case "ADDI":
                upcode = "0001";
                Ibit = "1";
                immediate = exp[3];
                break;
            case "ANDI":
                upcode = "0010";
                Ibit = "1";
                immediate = exp[3];
                break;
            case "ORI":
                upcode = "0011";
                Ibit = "1";
                immediate = exp[3];
                break;
            case "XORI":
                upcode = "0100";
                Ibit = "1";
                immediate = exp[3];
                break;
            default:
                System.err.print("ERROR1!");
        }

        if (immediate == "") {

            String firstRegister = removeLabels(exp[1]);
            String secondRegister = removeLabels(exp[2]);
            String thirdRegister = removeLabels(exp[3]);

            firstRegister = decimalToBinary(firstRegister);
            secondRegister = decimalToBinary(secondRegister);
            thirdRegister = decimalToBinary(thirdRegister);

            firstRegister = extendRegister(firstRegister);
            secondRegister = extendRegister(secondRegister);
            thirdRegister = extendRegister(thirdRegister);

            binary = upcode + firstRegister + secondRegister + Ibit+ "000" + thirdRegister;

            return binary;

        } else {

            String firstRegister = removeLabels(exp[1]);
            String secondRegister = removeLabels(exp[2]);
            immediate = removesharpLabels(immediate);

            firstRegister = decimalToBinary(firstRegister);
            secondRegister = decimalToBinary(secondRegister);
            immediate = decimalToBinary(immediate);

            firstRegister = extendRegister(firstRegister);
            secondRegister = extendRegister(secondRegister);
            immediate = extendImmediate(immediate,7);

            binary = upcode + firstRegister + secondRegister + Ibit + immediate;
            binary = extendBinary(binary);

            return binary;
        }


    }

    public static String branches(String[] exp) {

        String binary;
        String upcode;
        upcode = "1000";
        String n="0";
        String z="0";
        String p="0";

        switch (exp[0]) {
            case "BEQ":
                n="0";
                z="1";
                p="0";
                break;
            case "BLT":
                n="1";
                z="0";
                p="0";
                break;
            case "BGT":
                n="0";
                z="0";
                p="1";
                break;
            case "BLE":
                n="1";
                z="1";
                p="0";
                break;
            case "BGE":
                n="0";
                z="1";
                p="1";
                break;

            default:
                System.err.print("ERROR1!");
        }

            String firstRegister = removeLabels(exp[1]);
            String secondRegister = removeLabels(exp[2]);
            String address = removesharpLabels(exp[3]);

            firstRegister = decimalToBinary(firstRegister);
            secondRegister = decimalToBinary(secondRegister);
            address = decimalToBinary(address);

            firstRegister = extendRegister(firstRegister);
            secondRegister = extendRegister(secondRegister);
            address = extendImmediate(address,5);

            binary = upcode + n + z + p + firstRegister + secondRegister + address;

            return binary;
    }

    public static String jump(String[] exp) {
        String binary;
        String upcode = "0101";

        String address = removesharpLabels(exp[1]);
        address = decimalToBinary(address);
        address = extendImmediate(address,16);

        binary = upcode + address;

        return binary;
    }

    public static String stld(String[] exp) {
        String binary;
        String upcode = "";

        switch (exp[0]) {
            case "LD":
                upcode = "0110";
                break;
            case "ST":
                upcode = "0111";
                break;
            default:
                System.err.print("ERROR1!");
        }

        String firstRegister = removeLabels(exp[1]);
        firstRegister = decimalToBinary(firstRegister);
        firstRegister = extendRegister(firstRegister);

        String immediate = exp[2];
        immediate = removesharpLabels(immediate);
        immediate = decimalToBinary(immediate);
        immediate = extendImmediate(immediate,10);

        binary = upcode + firstRegister + "00" + immediate;

        return binary;
    }

    //converts decimal numbers to binary
    public static String decimalToBinary(String exp) {
        String binary = new String();
        int intexp = Integer.parseInt(exp);
        binary = Integer.toBinaryString(intexp);
        return binary;
    }

    //removes R from strings
    public static String removeLabels(String exp) {
        String string = exp.replaceAll("R", "");
        ;
        return string;
    }
    //removes # from strings
    public static String removesharpLabels(String exp) {
        String string = exp.replaceAll("#", "");
        ;
        return string;
    }
    //extends the number of bits to 4 bit
    public static String extendRegister(String exp) {
        int length = exp.length();
        int i;
        if (length < 4) {
            for (i = 0; i < 4 - length; i++) {
                exp = "0" + exp;
            }
        }
        return exp;
    }

    //extends the number of bits to 20bit
    public static String extendBinary(String exp) {
        int length = exp.length();
        int i;
        if (length < 20) {
            for (i = 0; i < 20 - length; i++) {
                exp = exp + "0";
            }
        }
        return exp;
    }

    //extends the immediate values bits to given number of bits
    public static String extendImmediate(String exp,int size) {
        int length = exp.length();
        int i;
        if (length < size) {
            for (i = 0; i < size-length; i++) {
                exp = "0" + exp;
            }
        }
        else if ( size < length){
            exp = exp.substring(length-size,length);
        }
        return exp;
    }

}














import java.io.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

public class Main {

    public static void main(String[] args) {
        List<String> myArray = new ArrayList<>();
        int sum = 0;
        String fileP = "input.txt";
        String myData = "";
        try {
            BufferedReader reader = new BufferedReader(new FileReader(fileP));
            String line;
            while ((line = reader.readLine()) != null) {
                myData += line + "\n";
            }
            reader.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
        myArray = List.of(myData.split("\\n"));
        sum = getSumOfAllCalibrations(myArray);
        System.out.println("here " + sum);
    }

    public static int getSumOfAllCalibrations(List<String> stringArr) {
        int sum = 0;
        for (String strings : stringArr) {
            String trimmedString = strings.replaceAll("[^0-9.]", "").trim();
            String combinedNums = "" + (trimmedString.charAt(0) != '\0' ? trimmedString.charAt(0) : '0') + (trimmedString.charAt(trimmedString.length() - 1) != '\0' ? trimmedString.charAt(trimmedString.length() - 1) : '0');
            sum += Integer.parseInt(combinedNums);
        }
        return sum;
    }

}
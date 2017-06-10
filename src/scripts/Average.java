import java.io.BufferedReader;
import java.io.FileReader;

public class Average {

    private static String LogPath = "/home/jeremy/IdeaProjects/Fabflix/Reports/tomcat.txt";

    public static void main(String[] args) {

        try (BufferedReader br = new BufferedReader(new FileReader(LogPath))) {

            String line;
            long ts = 0, tj = 0, total = 0;

            while ((line = br.readLine()) != null) {

                String[] vals = line.split(" - ");
                if(vals.length != 0) {

                    total++;
                    ts += Long.parseLong(vals[0]);
                    tj += Long.parseLong(vals[1]);

                }

            }

            System.out.println(String.format("Average ts %d, Average tj: %d", ts/total, tj/total));

        } catch (Exception e) {
            e.printStackTrace();
        }

    }

}
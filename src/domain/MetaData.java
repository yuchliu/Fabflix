package domain;

import doa.DBManager;

import java.util.HashMap;

/**
 * Created by cjk98 on 5/10/2017.
 */
public class MetaData {

    public static class Column {
        public String colName;
        public String colType;
        public Column(String colName, String colType) {
            this.colName = colName;
            this.colType = colType;
        }
    }

    public static class Table {
        public String tableName;
        public Table(String tableName) {
            this.tableName = tableName;
        }
        public HashMap<String, Column> colMap = new HashMap<>();
    }

    public HashMap<String, Table> tableMap = new HashMap<>();


/*    public Table addTable(String tableName) {
        Table table = new Table(tableName);
        tableList.add(table);
        return table;
    }

    public void addColumn(Table table, String colName, String colType) {
        Column column = new Column(colName, colType);
        table.columnList.add(column);
    }*/
}

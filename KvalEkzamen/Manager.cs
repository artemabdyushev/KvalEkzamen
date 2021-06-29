using System;
using System.Collections.Generic;
using System.Configuration;
using System.Text;
using System.Windows.Controls;

namespace KvalEkzamen
{
    public class Remains
    {
        public int id_remains { get; set; }
        public int id_items { get; set; }
        public DateTime dateTime { get; set; }
        public int count_lost { get; set; }
    }

    public class Category
    {
        public int id_category { get; set; }
        public string category_name { get; set; }
    }

    public class Items
    {
        public int id_item { get; set; }
        public string item_name { get; set; }
        public int category_number { get; set; }
        public double cost { get; set; }
        public string about_item { get; set; }
        public double reate_index_item { get; set; }
        public int id_producer { get; set; }
    }

    public class Producer
    {
        public int id_producer { get; set; }
        public string name_producer { get; set; }
        public string country_producer { get; set; }
    }
    class Manager
    {
        public static Frame frame;
        public static readonly string connectionInfo = ConfigurationManager.ConnectionStrings["connectionSqlCheck"].ToString();
    }
}

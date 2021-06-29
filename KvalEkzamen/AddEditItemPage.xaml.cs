using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Text;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace KvalEkzamen
{
    /// <summary>
    /// Логика взаимодействия для AddEditItemPage.xaml
    /// </summary>
    public partial class AddEditItemPage : Page
    {
        private Items items1 { get; set; }
        private bool isEdit { get; set; }
        private void fillCombo()
        {
            using (SqlConnection connection = new SqlConnection(Manager.connectionInfo))
            {
                try
                {
                    connection.Open();

                    string sqlExpression = "SELECT name_producer FROM dbo.Producer GROUP BY name_producer";

                    using (SqlCommand command = new SqlCommand(sqlExpression, connection))
                    {
                        SqlDataReader reader = command.ExecuteReader();

                        if (reader.HasRows)
                        {
                            while (reader.Read())
                            {
                                producerInput.Items.Add(reader.GetString(0));
                            }
                        }
                    }
                }
                catch (SqlException except)
                {
                    MessageBox.Show(except.ToString());
                }
                finally
                {
                    connection.Close();
                }

                try
                {
                    connection.Open();

                    string sqlExpression = "SELECT category_name FROM dbo.Category GROUP BY category_name";

                    using (SqlCommand command = new SqlCommand(sqlExpression, connection))
                    {
                        SqlDataReader reader = command.ExecuteReader();

                        if (reader.HasRows)
                        {
                            while (reader.Read())
                            {
                                CategoryInput.Items.Add(reader.GetString(0));
                            }
                        }
                    }
                }
                catch (SqlException except)
                {
                    MessageBox.Show(except.ToString());
                }
                finally
                {
                    connection.Close();
                }
            }
        }
        public AddEditItemPage()
        {
            InitializeComponent();
            isEdit = false;
        }
        public AddEditItemPage(Items items)
        {
            InitializeComponent();
            isEdit = true;
            items1 = items;
            ItemInput.Text = items.item_name;
            CategoryInput.Text = items.category_name;
            CostInput.Text = items.cost.ToString();
            InfoInput.Text = items.about_item;
            RateInput.Text = items.rate_index_item.ToString();
            CategoryInput.SelectedItem = items.category_name;
            producerInput.SelectedItem = items.producer_name;
        }

        private void AddEdit(object sender, RoutedEventArgs e)
        {
            if (producerInput.SelectedIndex != -1)
            {
                if (CategoryInput.SelectedIndex != -1)
                {
                    if (ItemInput.Text != "")
                    {
                        if (CostInput.Text != "")
                        { 
                            if (InfoInput.Text != "")
                            {
                                if (RateInput.Text != "")
                                {
                                    //тут редактирование и удаление))))))) типо оно есть)))))
                                }
                            }
                        }
                    }
                }
            } else
            {
                MessageBox.Show("Вы не выбрали производителя");

            }
        }
    }
}

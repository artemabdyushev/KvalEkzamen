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
    /// Логика взаимодействия для ItemPage.xaml
    /// </summary>
    public partial class ItemPage : Page
    {
        public ItemPage()
        {
            InitializeComponent();
            using (SqlConnection connection = new SqlConnection(Manager.connectionInfo))
            {
                try
                {
                    connection.Open();

                    string sqlExpression = "SELECT dbo.Items.id_item, dbo.Items.item_name, dbo.Items.category_number, dbo.Items.cost, dbo.Category.category_name, dbo.Items.about_item, dbo.Items.rate_index_item, dbo.Items.id_producer, dbo.Producer.name_producer FROM dbo.Items INNER JOIN dbo.Category ON dbo.Items.category_number = dbo.Category.id_category INNER JOIN dbo.Producer ON dbo.Items.id_producer = dbo.Producer.id_producer";

                    using (SqlCommand command = new SqlCommand(sqlExpression, connection))
                    {
                        SqlDataReader reader = command.ExecuteReader();

                        if (reader.HasRows)
                        {
                            while (reader.Read())
                            {
                                ItemList.Items.Add(new Items
                                {
                                    id_item = reader.GetInt32(0),
                                    item_name = reader.GetString(1),
                                    category_number = reader.GetInt32(2),
                                    cost = reader.GetDouble(3),
                                    category_name = reader.GetString(4),
                                    about_item = reader.GetString(5),
                                    rate_index_item = reader.GetInt32(6),
                                    id_producer = reader.GetInt32(7),
                                    producer_name = reader.GetString(8)
                                });
                            }
                        }
                        else
                        {
                            MessageBox.Show("Товары отсутствуют...");
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

        private void btnRemove(object sender, RoutedEventArgs e)
        {
            if (ItemList.SelectedIndex != -1)
            {
                using (SqlConnection connection = new SqlConnection(Manager.connectionInfo))
                {
                    try
                    {
                        connection.Open();

                        using (SqlCommand command = new SqlCommand("DELETE FROM Items Where id_item = @id_item", connection))
                        {
                            command.Parameters.AddWithValue("@id_item", ((Items)ItemList.SelectedItem).id_item);

                            int number = -1;
                            number = command.ExecuteNonQuery();
                            if (number == -1) MessageBox.Show("Неудачное удаление");
                            else MessageBox.Show("Успешное удаление");
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
            else
            {
                MessageBox.Show("Вы не выбрали товар");
            }
        }

        private void btnCreate(object sender, RoutedEventArgs e)
        {
            Manager.frame.Navigate(new AddEditItemPage());
        }

        private void btnEdit(object sender, RoutedEventArgs e)
        {
            if (ItemList.SelectedIndex != -1)
            {
                Manager.frame.Navigate(new AddEditItemPage((Items)ItemList.SelectedItem));
            } else
            {
                MessageBox.Show("Вы не выбрали товар");
            }
        }
    }
}

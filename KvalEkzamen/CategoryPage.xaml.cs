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
    /// Логика взаимодействия для CategoryPage.xaml
    /// </summary>
    public partial class CategoryPage : Page
    {
        public CategoryPage()
        {
            InitializeComponent();
            using (SqlConnection connection = new SqlConnection(Manager.connectionInfo))
            {
                try
                {
                    connection.Open();

                    string sqlExpression = "SELECT * FROM Category";

                    using (SqlCommand command = new SqlCommand(sqlExpression, connection))
                    {
                        SqlDataReader reader = command.ExecuteReader();

                        if (reader.HasRows)
                        {
                            while (reader.Read())
                            {
                                CategoryList.Items.Add(new Category
                                {
                                    id_category = reader.GetInt32(0),
                                    category_name = reader.GetString(1)
                                });
                            }
                        }
                        else
                        {
                            MessageBox.Show("Категории отсутствуют...");
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
            if (CategoryList.SelectedIndex != -1)
            {
                using (SqlConnection connection = new SqlConnection(Manager.connectionInfo))
                {
                    try
                    {
                        connection.Open();

                        using (SqlCommand command = new SqlCommand("DELETE FROM Category Where id_category = @id_category", connection))
                        {
                            command.Parameters.AddWithValue("@id_category", ((Category)CategoryList.SelectedItem).id_category);

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
                MessageBox.Show("Вы не выбрали категорию товара");
            }
        }

        private void btnCreate(object sender, RoutedEventArgs e)
        {
            Manager.frame.Navigate(new AddEditCategoryPage());
        }

        private void btnEdit(object sender, RoutedEventArgs e)
        {
            if (CategoryList.SelectedIndex != -1)
            {
                Manager.frame.Navigate(new AddEditCategoryPage((Category)CategoryList.SelectedItem));
            } else
            {
                MessageBox.Show("Вы не выбрали категорию для редактирования");
            }
        }
    }
}

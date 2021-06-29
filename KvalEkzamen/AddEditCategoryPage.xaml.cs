using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Text;
using System.Text.RegularExpressions;
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
    /// Логика взаимодействия для AddEditCategoryPage.xaml
    /// </summary>
    public partial class AddEditCategoryPage : Page
    {
        private Category category1 { get; set; }
        private bool isEdit { get; set; }
        public AddEditCategoryPage() //создание
        {
            InitializeComponent();
            isEdit = false;
        }

        public AddEditCategoryPage(Category category)
        {
            InitializeComponent();
            isEdit = true;
            category1 = category;
            CategoryInput.Text = category1.category_name;
        }

        private void AddEdit(object sender, RoutedEventArgs e)
        {
            Regex regex = new Regex("^([А-Я]{1}[а-яё]{3,54})$");
            MatchCollection matches = regex.Matches(CategoryInput.Text);
            if (matches.Count > 0)
            {
                using (SqlConnection connection = new SqlConnection(Manager.connectionInfo))
                {
                    try
                    {
                        connection.Open();

                        string sqlExpression = null;
                        if (isEdit) //редактирование
                        {
                            sqlExpression = "UPDATE [dbo].[Category] SET [category_name] = @category_name WHERE id_category = @id_category";
                            using (SqlCommand command = new SqlCommand(sqlExpression, connection))
                            {
                                command.Parameters.AddWithValue("category_name", CategoryInput.Text);
                                command.Parameters.AddWithValue("@id_category", category1.id_category);
                                command.ExecuteNonQuery();
                            }
                        }
                        else //создание
                        {
                            sqlExpression = "BEGIN DECLARE @index int; set @index = (SELECT MAX(id_category) AS Expr1 FROM dbo.Category)+1; IF(@index is NULL) SET @index = 1 INSERT INTO dbo.Category VALUES (@index, @category_name)";

                            using (SqlCommand command = new SqlCommand(sqlExpression, connection))
                            {
                                command.Parameters.AddWithValue("@category_name", CategoryInput.Text);
                                command.ExecuteNonQuery();
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
                        Manager.frame.Navigate(new Menu());
                    }
                }
            } else
            {
                MessageBox.Show("Некорректный ввод категории");
            }
        }
    }
}

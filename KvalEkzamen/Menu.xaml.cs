using System;
using System.Collections.Generic;
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
    /// Логика взаимодействия для Menu.xaml
    /// </summary>
    public partial class Menu : Page
    {
        public Menu()
        {
            InitializeComponent();
        }

        private void OpenItemsPage(object sender, RoutedEventArgs e)
        {

        }

        private void OpenCategoryPage(object sender, RoutedEventArgs e)
        {
            Manager.frame.Navigate(new CategoryPage());
        }

        private void OpenRemainsPage(object sender, RoutedEventArgs e)
        {

        }
    }
}

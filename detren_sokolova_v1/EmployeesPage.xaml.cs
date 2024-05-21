using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace detren_sokolova_v1
{
    /// <summary>
    /// Логика взаимодействия для EmployeesPage.xaml
    /// </summary>
    public partial class EmployeesPage : Page
    {
        public EmployeesPage()
        {
            InitializeComponent();
            DGridEmployees.ItemsSource = de41_sokolova_v1_eduEntities1.GetContext().employee.ToList();
        }

        private void BtnEdit_Click(object sender, RoutedEventArgs e)
        {
            ManagerClick.MainFrame.Navigate(new AddEditEmployee());
        }

        private void BtnAdd_Click(object sender, RoutedEventArgs e)
        {
            ManagerClick.MainFrame.Navigate(new AddEditEmployee());
        }
    }
}

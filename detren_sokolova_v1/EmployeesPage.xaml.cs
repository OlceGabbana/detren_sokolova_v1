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
            ManagerClick.MainFrame.Navigate(new AddEditEmployee((sender as Button).DataContext as employee));
        }

        private void BtnAdd_Click(object sender, RoutedEventArgs e)
        {
            ManagerClick.MainFrame.Navigate(new AddEditEmployee(null));
        }
        private void Page_IsVisibleChanged(object sender, DependencyPropertyChangedEventArgs e)
        {
            if (Visibility == Visibility.Visible)
            {
                de41_sokolova_v1_eduEntities1.GetContext().ChangeTracker.Entries().ToList().ForEach(p => p.Reload());
                DGridEmployees.ItemsSource = de41_sokolova_v1_eduEntities1.GetContext().employee.ToList();
            }
        }

        private void BtnDel_Click(object sender, RoutedEventArgs e)
        {
            var emplForRemoving = DGridEmployees.SelectedItems.Cast<employee>().ToList();

            try
            {
                de41_sokolova_v1_eduEntities1.GetContext().employee.RemoveRange(emplForRemoving);
                de41_sokolova_v1_eduEntities1.GetContext().SaveChanges();
                MessageBox.Show("Данные удалены");

                DGridEmployees.ItemsSource = de41_sokolova_v1_eduEntities1.GetContext().employee.ToList();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message.ToString());
            }
        }
    }
}

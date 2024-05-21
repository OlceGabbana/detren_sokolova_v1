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
    /// Логика взаимодействия для AddEditEmployee.xaml
    /// </summary>
    public partial class AddEditEmployee : Page
    {
        private employee _currentEmployee = new employee();

        public AddEditEmployee()
        {
            InitializeComponent();
            DataContext = _currentEmployee;
        }

        private void BtnSave_Click(object sender, RoutedEventArgs e)
        {
            StringBuilder errors = new StringBuilder();

            if ((string.IsNullOrWhiteSpace(_currentEmployee.surname)) && (string.IsNullOrWhiteSpace(_currentEmployee.name)) && (string.IsNullOrWhiteSpace(_currentEmployee.patronimyc)) && (string.IsNullOrWhiteSpace(_currentEmployee.role)))
                errors.AppendLine("Заполните поля");
            
            if (errors.Length > 0)
            {
                MessageBox.Show(errors.ToString());
                return;
            }
            if (errors.Length == 0)
                de41_sokolova_v1_eduEntities1.GetContext().employee.Add(_currentEmployee);

            try
            {
                de41_sokolova_v1_eduEntities1.GetContext().SaveChanges();
                MessageBox.Show("Информация сохранена!");
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message.ToString());
            }
        }

       
    }
}

using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using hello = StudentImporterLibrary;
using hi = UserInterface;
namespace UserInterface
{
   
    public partial class MainMenu : Form
    {
        
        
        public MainMenu()
        {
            
            InitializeComponent();
   
        }

        private void timer1_Tick(object sender, EventArgs e)
        {
            label1.Text = DateTime.Now.ToString();
        }

        private void btnAddCourse_Click(object sender, EventArgs e)
        {
            hello.AddCourse a = new hello.AddCourse();
            a.Show();
        }

        private void btnGradeImport_Click(object sender, EventArgs e)
        {
            hi.GradeSheetImporter a = new GradeSheetImporter();
            a.Show();
        }

        private void btnAddSubject_Click(object sender, EventArgs e)
        {
            hello.AddSubject a = new hello.AddSubject();
            a.Show();
        
        }

        private void btnAddProfessor_Click(object sender, EventArgs e)
        {
            hello.AddProfessor a = new hello.AddProfessor();
            a.Show();
        }
    }
}

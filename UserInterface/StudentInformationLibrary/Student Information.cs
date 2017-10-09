using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace StudentInformationLibrary
{
    public partial class StudentInformation : Form
    {
        public StudentInformation()
        {
            InitializeComponent();
        }

        private void label2_Click(object sender, EventArgs e)
        {

        }

        private void lblName_Click(object sender, EventArgs e)
        {

        }

        private void StudentInformation_Load(object sender, EventArgs e)
        {
            // TODO: This line of code loads data into the 'gradingsystemDataSet.studentinfo' table. You can move, or remove it, as needed.
            this.studentinfoTableAdapter.Fill(this.gradingsystemDataSet.studentinfo);

        }
    }
}

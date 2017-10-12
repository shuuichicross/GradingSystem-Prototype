using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace UserInterface
{
    public partial class GradeSheetImporter : Form
    {
        public GradeSheetImporter()
        {
            InitializeComponent();
        }

        private void GradeSheetImporter_Load(object sender, EventArgs e)
        {
            // TODO: This line of code loads data into the 'gradingsystemDataSet1.gradesheet' table. You can move, or remove it, as needed.
            this.gradesheetTableAdapter.Fill(this.gradingsystemDataSet1.gradesheet);

        }

        private void button1_Click(object sender, EventArgs e)
        {
            this.gradesheetTableAdapter.addGrade(4, 4, 4, 60);
        }
    }
}

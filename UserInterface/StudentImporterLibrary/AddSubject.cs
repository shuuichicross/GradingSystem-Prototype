using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace StudentImporterLibrary
{
    public partial class AddSubject : Form
    {
        public AddSubject()
        {
            InitializeComponent();
        }

        private void btn_clear_Click(object sender, EventArgs e)
        {
            txt_CourseCode.Clear();
            txt_ProfCode.Clear();
            txt_subjectcode.Clear();


        }

        private void btn_add_Click(object sender, EventArgs e)
        {





        }
    }
}

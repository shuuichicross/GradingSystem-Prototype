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
    public partial class CourseForm : Form
    {
        MainMenu parent;
        public CourseForm(MainMenu parent)
        {
            InitializeComponent();
            this.parent = parent;
        }

        private void CourseForm_Load(object sender, EventArgs e)
        {
            // TODO: This line of code loads data into the 'gradingsystemDataSet3.course' table. You can move, or remove it, as needed.
            this.courseTableAdapter.Fill(this.gradingsystemDataSet3.course);

        }

        private void addCourse(object sender, EventArgs e)
        {
            try
            {
                if (txtCourseName.Text != "" && txtMaxYears.Text != "")
                {
                    courseTableAdapter.addCourse(txtCourseName.Text, int.Parse(txtMaxYears.Text));
                    MessageBox.Show("Successfully Added");

                    txtCourseName.Text = "";
                    txtMaxYears.Text = "";

                }
                else
                {
                    MessageBox.Show("Please fill up all fields!");
                }
            }

            catch (Exception err) { MessageBox.Show(err.Message); }

        }



    }
}

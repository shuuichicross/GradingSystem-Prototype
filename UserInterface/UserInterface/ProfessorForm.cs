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
    public partial class ProfessorForm : Form
    {
        MainMenu parent;
        public ProfessorForm(MainMenu parent)
        {
            InitializeComponent();
            this.parent = parent;
        }

        private void ProfessorForm_Load(object sender, EventArgs e)
        {
            // TODO: This line of code loads data into the 'gradingsystemDataSet2.professor' table. You can move, or remove it, as needed.
            this.professorTableAdapter.Fill(this.gradingsystemDataSet2.professor);
            // TODO: This line of code loads data into the 'gradingsystemDataSet1.professorlist' table. You can move, or remove it, as needed.
            this.professorlistTableAdapter.Fill(this.gradingsystemDataSet1.professorlist);

        }

        private void addProfessor(object sender, EventArgs e)
        {
            try
            {
                if (txtFirstName.Text != "" && txtLastName.Text != "" && txtMiddleInitial.Text != "")
                {
                    professorTableAdapter.addProfessor(txtFirstName.Text, txtMiddleInitial.Text, txtLastName.Text);
                    MessageBox.Show("Successfully Added");
                    this.professorlistTableAdapter.Fill(this.gradingsystemDataSet1.professorlist);
                    txtFirstName.Text = "";
                    txtLastName.Text = "";
                    txtMiddleInitial.Text = "";
                }
                else
                {
                    MessageBox.Show("Please fill up all fields!");
                }
            }

            catch (Exception err)
            {
                MessageBox.Show(err.Message);
            }
        }

        private void clearFields(object sender, EventArgs e)
        {
           
            if (txtFirstName.Text != "" || txtLastName.Text != "" || txtMiddleInitial.Text != "")
            {
                txtFirstName.Text = "";
                txtLastName.Text = "";
                txtMiddleInitial.Text = "";
            }

            else
            {
                MessageBox.Show("No value to be clear!");
            }
        }

    }
}

namespace UserInterface
{
    partial class StudentInfo
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.components = new System.ComponentModel.Container();
            this.label1 = new System.Windows.Forms.Label();
            this.studentinfoBindingSource = new System.Windows.Forms.BindingSource(this.components);
            this.panel2 = new System.Windows.Forms.Panel();
            this.dataGridView1 = new System.Windows.Forms.DataGridView();
            this.subjectCodeDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.gradeDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.studentinfoBindingSource1 = new System.Windows.Forms.BindingSource(this.components);
            this.gradingsystemDataSet = new UserInterface.gradingsystemDataSet();
            this.panel1 = new System.Windows.Forms.Panel();
            this.lblName = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.txtID = new System.Windows.Forms.TextBox();
            this.studentinfoTableAdapter = new UserInterface.gradingsystemDataSetTableAdapters.studentinfoTableAdapter();
            ((System.ComponentModel.ISupportInitialize)(this.studentinfoBindingSource)).BeginInit();
            this.panel2.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView1)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.studentinfoBindingSource1)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.gradingsystemDataSet)).BeginInit();
            this.panel1.SuspendLayout();
            this.SuspendLayout();
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(12, 17);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(89, 13);
            this.label1.TabIndex = 0;
            this.label1.Text = "Enter ID Number:";
            // 
            // studentinfoBindingSource
            // 
            this.studentinfoBindingSource.DataMember = "studentinfo";
            // 
            // panel2
            // 
            this.panel2.Controls.Add(this.dataGridView1);
            this.panel2.Dock = System.Windows.Forms.DockStyle.Fill;
            this.panel2.Location = new System.Drawing.Point(0, 87);
            this.panel2.Name = "panel2";
            this.panel2.Size = new System.Drawing.Size(336, 208);
            this.panel2.TabIndex = 9;
            // 
            // dataGridView1
            // 
            this.dataGridView1.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.dataGridView1.AutoGenerateColumns = false;
            this.dataGridView1.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.Fill;
            this.dataGridView1.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dataGridView1.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.subjectCodeDataGridViewTextBoxColumn,
            this.gradeDataGridViewTextBoxColumn});
            this.dataGridView1.DataSource = this.studentinfoBindingSource1;
            this.dataGridView1.Location = new System.Drawing.Point(12, 6);
            this.dataGridView1.Name = "dataGridView1";
            this.dataGridView1.Size = new System.Drawing.Size(312, 190);
            this.dataGridView1.TabIndex = 5;
            // 
            // subjectCodeDataGridViewTextBoxColumn
            // 
            this.subjectCodeDataGridViewTextBoxColumn.DataPropertyName = "subjectCode";
            this.subjectCodeDataGridViewTextBoxColumn.HeaderText = "subjectCode";
            this.subjectCodeDataGridViewTextBoxColumn.Name = "subjectCodeDataGridViewTextBoxColumn";
            // 
            // gradeDataGridViewTextBoxColumn
            // 
            this.gradeDataGridViewTextBoxColumn.DataPropertyName = "grade";
            this.gradeDataGridViewTextBoxColumn.HeaderText = "grade";
            this.gradeDataGridViewTextBoxColumn.Name = "gradeDataGridViewTextBoxColumn";
            // 
            // studentinfoBindingSource1
            // 
            this.studentinfoBindingSource1.DataMember = "studentinfo";
            this.studentinfoBindingSource1.DataSource = this.gradingsystemDataSet;
            // 
            // gradingsystemDataSet
            // 
            this.gradingsystemDataSet.DataSetName = "gradingsystemDataSet";
            this.gradingsystemDataSet.SchemaSerializationMode = System.Data.SchemaSerializationMode.IncludeSchema;
            // 
            // panel1
            // 
            this.panel1.Controls.Add(this.label1);
            this.panel1.Controls.Add(this.lblName);
            this.panel1.Controls.Add(this.label2);
            this.panel1.Controls.Add(this.txtID);
            this.panel1.Dock = System.Windows.Forms.DockStyle.Top;
            this.panel1.Location = new System.Drawing.Point(0, 0);
            this.panel1.Name = "panel1";
            this.panel1.Size = new System.Drawing.Size(336, 87);
            this.panel1.TabIndex = 8;
            this.panel1.Paint += new System.Windows.Forms.PaintEventHandler(this.panel1_Paint);
            // 
            // lblName
            // 
            this.lblName.AutoSize = true;
            this.lblName.Location = new System.Drawing.Point(104, 55);
            this.lblName.Name = "lblName";
            this.lblName.Size = new System.Drawing.Size(87, 13);
            this.lblName.TabIndex = 4;
            this.lblName.Text = "Name of Student";
            this.lblName.Visible = false;
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(12, 55);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(81, 13);
            this.label2.TabIndex = 3;
            this.label2.Text = "Student Name: ";
            // 
            // txtID
            // 
            this.txtID.Location = new System.Drawing.Point(107, 14);
            this.txtID.Name = "txtID";
            this.txtID.Size = new System.Drawing.Size(110, 20);
            this.txtID.TabIndex = 1;
            // 
            // studentinfoTableAdapter
            // 
            this.studentinfoTableAdapter.ClearBeforeFill = true;
            // 
            // StudentInfo
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(336, 295);
            this.Controls.Add(this.panel2);
            this.Controls.Add(this.panel1);
            this.Name = "StudentInfo";
            this.Text = "StudentInfo";
            this.Load += new System.EventHandler(this.StudentInfo_Load);
            ((System.ComponentModel.ISupportInitialize)(this.studentinfoBindingSource)).EndInit();
            this.panel2.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView1)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.studentinfoBindingSource1)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.gradingsystemDataSet)).EndInit();
            this.panel1.ResumeLayout(false);
            this.panel1.PerformLayout();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.BindingSource studentinfoBindingSource;
        private System.Windows.Forms.Panel panel2;
        private System.Windows.Forms.DataGridView dataGridView1;
        private System.Windows.Forms.Panel panel1;
        private System.Windows.Forms.Label lblName;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.TextBox txtID;
        private gradingsystemDataSet gradingsystemDataSet;
        private System.Windows.Forms.BindingSource studentinfoBindingSource1;
        private gradingsystemDataSetTableAdapters.studentinfoTableAdapter studentinfoTableAdapter;
        private System.Windows.Forms.DataGridViewTextBoxColumn subjectCodeDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn gradeDataGridViewTextBoxColumn;
    }
}
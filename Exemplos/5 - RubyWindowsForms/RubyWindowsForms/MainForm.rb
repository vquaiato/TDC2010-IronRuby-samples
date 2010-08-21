require "mscorlib"
require "System.Windows.Forms, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"
require "System.Drawing, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
require "System.Data, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"

require "BancoDados"

include System::Windows::Forms
include System::Threading

class MainForm < Form
	def initialize()
		self.InitializeComponent()
	end

	def InitializeComponent()
		@progressBar1 = System::Windows::Forms::ProgressBar.new()
		@button1 = System::Windows::Forms::Button.new()
		@button2 = System::Windows::Forms::Button.new()
		@dataGrid1 = System::Windows::Forms::DataGrid.new()
		@button3 = System::Windows::Forms::Button.new()
		@dataGrid1.clr_member(System::ComponentModel::ISupportInitialize, :BeginInit).call()
		self.SuspendLayout()
		# 
		# progressBar1
		# 
		@progressBar1.Location = System::Drawing::Point.new(12, 49)
		@progressBar1.Name = "progressBar1"
		@progressBar1.Size = System::Drawing::Size.new(289, 23)
		@progressBar1.TabIndex = 0
		# 
		# button1
		# 
		@button1.Location = System::Drawing::Point.new(12, 12)
		@button1.Name = "button1"
		@button1.Size = System::Drawing::Size.new(98, 31)
		@button1.TabIndex = 1
		@button1.Text = "MessageBox"
		@button1.UseVisualStyleBackColor = true
		@button1.Click { |sender, e| self.Button1Click(sender, e) }
		# 
		# button2
		# 
		@button2.Location = System::Drawing::Point.new(204, 12)
		@button2.Name = "button2"
		@button2.Size = System::Drawing::Size.new(97, 31)
		@button2.TabIndex = 2
		@button2.Text = "ProgressBar"
		@button2.UseVisualStyleBackColor = true
		@button2.Click { |sender, e| self.Button2Click(sender, e) }
		# 
		# dataGrid1
		# 
		@dataGrid1.DataMember = ""
		@dataGrid1.HeaderForeColor = System::Drawing::SystemColors.ControlText
		@dataGrid1.Location = System::Drawing::Point.new(12, 113)
		@dataGrid1.Name = "dataGrid1"
		@dataGrid1.Size = System::Drawing::Size.new(289, 155)
		@dataGrid1.TabIndex = 3
		# 
		# button3
		# 
		@button3.Location = System::Drawing::Point.new(13, 84)
		@button3.Name = "button3"
		@button3.Size = System::Drawing::Size.new(288, 23)
		@button3.TabIndex = 4
		@button3.Text = "Carregar dados do Banco"
		@button3.UseVisualStyleBackColor = true
		@button3.Click { |sender, e| self.Button3Click(sender, e) }
		# 
		# MainForm
		# 
		self.ClientSize = System::Drawing::Size.new(311, 280)
		self.Controls.Add(@button3)
		self.Controls.Add(@dataGrid1)
		self.Controls.Add(@button2)
		self.Controls.Add(@button1)
		self.Controls.Add(@progressBar1)
		self.Name = "MainForm"
		self.Text = "Hi I'm an IronRuby Windows Forms App"
		@dataGrid1.clr_member(System::ComponentModel::ISupportInitialize, :EndInit).call()
		self.ResumeLayout(false)
	end

	def Button1Click(sender, e)
		MessageBox.show "Olá Mundo"
	end
	
	def Button2Click(sender, e)
			Thread.new {
				begin
					val = 0
					
					while val < 100 do
						val += 1
						@progressBar1.Invoke MethodInvoker.new {@progressBar1.value+=1}
						
						Thread.Sleep 100
					end
				rescue
					MessageBox.show $!
				end
			}
	end

	def Button3Click(sender, e)
		banco = BancoDados.new
		cidades = banco.selecionar_cidades
		
		@dataGrid1.data_source = cidades
	end
end


require "System.Data, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"

class BancoDados
	include System::Data
	include System::Data::SqlClient
	
	def initialize
		@connection_string = "Integrated Security=True;Data Source=vquaiato-note\\sqlexpress;Initial Catalog=IronRuby;"
	end
	
	def open_conn
		if(@conn.nil? || @conn.state != ConnectionState.open)
			@conn = SqlConnection.new @connection_string
			@conn.open
		end
		
		@conn
	end
	def close_conn
		@conn.close unless @conn.nil?
	end
	
	def selecionar_cidades
		@command = open_conn.CreateCommand
		@command.command_text = 'Select * from cidades order by uf desc'
		
		adapter = SqlDataAdapter.new @command
		datatable = DataTable.new
		adapter.fill(datatable)
		
		close_conn
		
		datatable	
	end	
end

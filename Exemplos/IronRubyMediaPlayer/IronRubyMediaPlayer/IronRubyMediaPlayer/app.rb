require 'wpf'

include Microsoft::Win32
include System
include System::Windows::Controls

reader = StreamReader.new 'MainWindow.xaml'
window = XamlReader.Parse reader.ReadToEnd()

#disposing
reader.dispose

#botões
@play_button = window.find_name("Play")
@stop_button = window.find_name("Stop")
@open_button = window.find_name("Open")
@pause_button = window.find_name("Pause")

@player = window.find_name("Player")
@volume = window.find_name("Volume")
@video_seek = window.find_name("VideoSeek")

@nome_arquivo = window.find_name("Arquivo")


#open button
open_dialog = OpenFileDialog.new
open_click = Proc.new {|sender,e|
	@media_file = open_dialog.file_name if open_dialog.ShowDialog
	
	@nome_arquivo.Text = open_dialog.file_name
	
	@player.Stop
	
	#coloca mídia no player
	@player.source = Uri.new @media_file
}
@open_button.Click(&open_click)

@player.MediaOpened(&Proc.new {|sender,e|
	@video_seek.Maximum = @player.NaturalDuration.TimeSpan.TotalMilliseconds
	@video_seek.TickFrequency = @video_seek.Maximum / 1000
})

#play button
play_click = Proc.new {|sender,e|
	@player.Play
}
@play_button.Click(&play_click)

#stop button
stop_click = Proc.new {|sender,e|
	@player.Stop
}
@stop_button.Click(&stop_click)

#pause button
pause_click = Proc.new {|sender,e|
	@player.Pause
}
@pause_button.Click(&pause_click)

#video seek
seek_changed = Proc.new {|sender,args|
	time_span = TimeSpan.new 0, 0, 0, 0, @video_seek.Value
	@player.Position = time_span
}
@video_seek.ValueChanged(&seek_changed)

#run the app
app = Application.new
app.run window


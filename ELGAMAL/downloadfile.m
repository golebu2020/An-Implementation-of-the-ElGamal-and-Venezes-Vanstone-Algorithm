function data = downloadfile(channelID,fieldnames,readkey)
data = thingSpeakRead(channelID,'Fields',fieldnames,'ReadKey',readkey,'OutputFormat','table');
end
# Get the current Etag of the file:
$ETag = (Invoke-WebRequest -method "Head" https://website.domain.com/files/CitrixWorkspaceApp.exe | Select Headers -ExpandProperty Headers)["ETag"] >E:\BuildFolder

# Keep the ETag somewhere. Next time you try to get the resource do like this:
# The If-None-Match header is what does the magic.
Invoke-WebRequest -method "get" https://telework.aoc.gov/files/CitrixWorkspaceApp.exe -Headers @{"If-None-Match"=$ETag} -outfile myfile.exe

 
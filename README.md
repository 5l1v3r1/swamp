# Swamp
An OSINT tool for discovering associated sites through Google Analytics Tracking IDs
using a selection of APIs.

### Supported APIs
- [urlscan.io](https://urlscan.io/about-api/#search) (Free)
- [SpyOnWeb](https://api.spyonweb.com/v1/docs_) (Requires Account)

### Enter your Google Analytics Tracking ID or URL and let Swamp take care of the rest.

Example using a specific tracking ID: 
```bash
python3 swamp.py -id UA-6888464-2
```

Example using a url:
```bash
python3 swamp.py -url https://www.medium.com
```
Note that if the URL protocol is not given (e.g. `-url medium.com`), Swamp will default to HTTPS, and try HTTP if HTTPS fails.

Full results are printed to screen, and can be written to file with the `-o` flag.
```bash
python3 swamp.py -id UA-6888464-2 -o myOutputFile.txt
```

To use SpyOnWeb, include the `-spyonweb` flag, and set the API token with `-token`.
```bash
python3 swamp.py -id UA-6888464-2 -spyonweb -token YOUR_API_TOKEN
```

Additionally, you can use swamp.py in your own python script.
```python
import swamp
Swamp = swamp.Swamp() # init Swamp object (by default uses urlscan.io)
Swamp = swamp.Swamp(api="spyonweb",token="YOUR_API_TOKEN") # init Swamp object to use SpyOnWeb
associated_urls = Swamp.run(id="UA-12345-1") # list of unique urls associated with the tracking ID UA-12345-1
associated_urls = Swamp.run(url="infowars.com") # list of unique urls associated with the tracking ID(s) found on infowars.com

associated_domains = Swamp.urls_to_domains(associated_urls) # reduces the list of urls to a list of unique domains
```

Test scripts are included.

To verify the CLI functionality: `./test.sh [<your_SpyOnWeb_Token>]`

To verify the python module functionality: `python test.py [-spyonweb_token <your_SpyOnWeb_Token>]`

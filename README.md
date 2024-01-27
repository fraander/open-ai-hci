# Project Preview
Because I want to avoid additional charges to my OpenAI account, and because this project can only be run on a Mac and I want to make sure any TA can grade my work, I included this preview of my code in action.
[Video download link](https://github.com/fraander/open-ai-hci/assets/57777918/9e378ebe-74e4-47ff-b8ae-db35c8a69fbe
)


# Documentation
## Development Process
To develop this project, I started by choosing an API. Because I've wanted to learn the OpenAI API for a while, I chose that one. Additionally, I've used APIs in Javascript/Typescript with React many times, so I chose Swift because I've wanted to improve my API skills in that language.

To get the API working before starting on the interface, I started by building a command-line app. I found an API wrapper package similar to the Typescript one from a popular Mac development team named MacPaw. They build antivirus software that is quite well known. Then, I read their documentation and followed along to make my own queries in the command-line interface.

Once I was able to reliably display a result, I pivoted to designing an easy to read and understand iOS App interface. I've used SwiftUI many times, so this was a simple process. Next, I built a class wrapper around the functions I'd built on the command-line version of the project so that the interface and API calls could interact with each other. Once I did this the project was complete!

## Run the project
1. Download Xcode and any necessary checkboxes to indicate iOS support is required.
2. Open my cloned project from GitHub using File > Open.
3. Choose `open-ai-ios` as the scheme, and some `iPhone` as the device.
4. Click `Play` or do `command r` to run the project. It may take a minute or two to build before running.
Please contact me if there are any issues. Especially if this is your first time running an iOS app in Xcode.

# Reflection
Interacting with OpenAI's models was much easier than I thought it was going to be. Once these functions are setup it's easy to send any prompt you want and you have lots of control over the responses you get! This makes me more interested in using AI for my final project. 
That said, the nature of the responses is quite random. Even with my simple prompt, I saw responses as short as two words but as long as three sentences! For such a simple prompt I didn't expect this much variation, so it means I'd have to be ready for a wide range of possible responses from the model if I were to add it to a project. Additionally, the models are cheaper than I thought. In all my usage, I didn't cross the 1 cent mark, which was cheaper than I expected. That said, my prompt was as few tokens as I could make it, and I could see a more exacting prompt becoming expensive to use quite quickly. 
A challenge I did face is that the responses come back as an array of tokens, which is quite interesting. It makes sense, since you'd want to display partial results as they come in, given it can take a while for them to come back, but was an additional complexity I did not account for when first trying to implement a solution.

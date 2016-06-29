#
# Works with version: ruby 1.9.3p327 (2012-11-10 revision 37606)
#
require "openssl"
require "net/http"
require "uri"

class FandangoApiManager

    def Sha256Encode(stringToEncode)

        sha256 = OpenSSL::Digest::SHA256.new
        result = sha256.hexdigest(stringToEncode)

        return result
    end

    def BuildAuthorizationParameters(apiKey, sharedSecret)

        paramsToEncode = "%s%s%s" % [apiKey, sharedSecret, Time.now.to_i]
        encodedParams = self.Sha256Encode(paramsToEncode)
        result = "apikey=%s&sig=%s" % [apiKey, encodedParams]

        return result
    end

    def getResponseFromParameters(parameters)

        baseUri = "http://api.fandango.com"
        apiVersion = "1"

        apiKey = "your_api_key"
        sharedSecret = "your_shared_secret"

        authorizationParameters = BuildAuthorizationParameters(apiKey, sharedSecret)
        requestUri = "%s/v%s/?%s&%s" % [baseUri, apiVersion, parameters, authorizationParameters]

        response = Net::HTTP.get_response(URI.parse(requestUri))

        result = response.body

        return result
    end

end


api = FandangoApiManager.new

zipCode = "90064";
parameters = "op=theatersbypostalcodesearch&postalcode=%s" % [zipCode]

responseFromServer = api.getResponseFromParameters(parameters)

puts responseFromServer

# process responseFromServer...

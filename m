Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E22E6C83F26
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Jul 2025 13:53:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D8hUPj2+88HD2gq9S+pdn157IG4TRA5Wi45ekp5olY4=; b=Y8tEkZo15D/OO3gIMcO3rbEqVs
	S2oV748A7QiuDWi0AKEn7QA74GBPGXW0+URJfQHQYglGNTCr+8gM1n2Wo5wkDob8OISRP5naWGKkl
	rGYDIFQLamnu0N4YxSnmVQttmWeTlbuz/jGibWwQq0bK5RpEnJs7KuXkWCPuJRNhD5u2YqG2FMEtL
	Kv9yvznSo7RbBh2vC7ykPcnm8sDnNL3RiAjVmHIxED3oHgDVnQU+/2KvM3heaRQ1Z6HXW0pYnjkJV
	3yqiYR36biVfk0S5+miBFvcmok5qyM+j4PuNK3v/xH58EVZWoj6daXgLxAsgrwCimTrzrRGdbMJQp
	MWG+x1rA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uewOG-00000007bMM-303n;
	Thu, 24 Jul 2025 13:53:48 +0000
Received: from ip-94-112-25-9.bb.vodafone.cz ([94.112.25.9] helo=ixit.cz)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uetzf-00000007KJS-11dz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Jul 2025 11:20:13 +0000
Received: from [192.168.6.83] (office.icewarp.com [82.113.48.146])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ixit.cz (Postfix) with ESMTPSA id F14F1160FAB;
	Thu, 24 Jul 2025 13:19:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ixit.cz; s=dkim;
	t=1753355999;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=D8hUPj2+88HD2gq9S+pdn157IG4TRA5Wi45ekp5olY4=;
	b=xXUs/CVSyL4G700dRx/2WS2eO2b84PCGhOPcVuLK+FTs7t3GRM0TS7fcxpERsJ1xIhGjDb
	8e2n8QBcc2o0JEsVKUFmI5x/Qe1ySjbaOMWLp0lO7zXFpimUncbWhz9TkDiE5KrMzgxKhS
	4lJBazLXC8oiOQx3FgOlysfc4nqmnu8=
Message-ID: <d8be9f32-e78d-4a2d-8ab3-3c7d0bca4e3b@ixit.cz>
Date: Thu, 24 Jul 2025 13:19:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] dt-bindings: iio: Drop unused header includes in
 examples
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Lars-Peter Clausen <lars@metafoo.de>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>,
 =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Lucas Stankus <lucas.p.stankus@gmail.com>,
 Puranjay Mohan <puranjay@kernel.org>, Dan Robertson <dan@dlrobertson.com>,
 Marcelo Schmitt <marcelo.schmitt@analog.com>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Dragos Bogdan <dragos.bogdan@analog.com>,
 Jean-Baptiste Maneyrol <jean-baptiste.maneyrol@tdk.com>,
 =?UTF-8?Q?Ond=C5=99ej_Jirman?= <megi@xff.cz>,
 Alexandru Tachici <alexandru.tachici@analog.com>,
 Stefan Popa <stefan.popa@analog.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Stephan Gerhold <stephan@gerhold.net>,
 Ceclan Dumitru <dumitru.ceclan@analog.com>,
 Alexandru Lazar <alazar@startmail.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Matti Vaittinen <mazziesaccount@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Mike Looijmans <mike.looijmans@topic.nl>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Peter Meerwald-Stadler <pmeerw@pmeerw.net>,
 Andreas Klinger <ak@it-klinger.de>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
References: <20250724111345.47889-5-krzysztof.kozlowski@linaro.org>
Content-Language: en-US
From: David Heidelberg <david@ixit.cz>
Autocrypt: addr=david@ixit.cz; keydata=
 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
In-Reply-To: <20250724111345.47889-5-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_042011_947301_0F6E8567 
X-CRM114-Status: GOOD (  12.26  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Reviewed-by: David Heidelberg <david@ixit.cz>

On 24/07/2025 13:13, Krzysztof Kozlowski wrote:
> Drop includes of headers which example code does not use.  No functional
> impact.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>   Documentation/devicetree/bindings/iio/accel/adi,adis16240.yaml  | 1 -
>   Documentation/devicetree/bindings/iio/accel/adi,adxl313.yaml    | 2 --
>   Documentation/devicetree/bindings/iio/accel/adi,adxl345.yaml    | 2 --
>   Documentation/devicetree/bindings/iio/accel/adi,adxl355.yaml    | 2 --
>   Documentation/devicetree/bindings/iio/accel/adi,adxl372.yaml    | 2 --
>   Documentation/devicetree/bindings/iio/accel/bosch,bma255.yaml   | 1 -
>   Documentation/devicetree/bindings/iio/accel/bosch,bma400.yaml   | 1 -
>   Documentation/devicetree/bindings/iio/accel/kionix,kxsd9.yaml   | 1 -
>   Documentation/devicetree/bindings/iio/adc/adi,ad7091r5.yaml     | 1 -
>   Documentation/devicetree/bindings/iio/adc/adi,ad7173.yaml       | 1 -
>   Documentation/devicetree/bindings/iio/adc/qcom,spmi-vadc.yaml   | 1 -
>   Documentation/devicetree/bindings/iio/adc/rohm,bd79104.yaml     | 1 -
>   Documentation/devicetree/bindings/iio/adc/ti,adc128s052.yaml    | 1 -
>   Documentation/devicetree/bindings/iio/adc/ti,ads1298.yaml       | 1 -
>   Documentation/devicetree/bindings/iio/imu/adi,adis16460.yaml    | 1 -
>   .../devicetree/bindings/iio/imu/invensense,icm42600.yaml        | 2 --
>   Documentation/devicetree/bindings/iio/imu/nxp,fxos8700.yaml     | 2 --
>   Documentation/devicetree/bindings/iio/light/st,vl6180.yaml      | 1 -
>   .../bindings/iio/magnetometer/voltafield,af8133j.yaml           | 1 -
>   Documentation/devicetree/bindings/iio/pressure/bmp085.yaml      | 1 -
>   20 files changed, 26 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/iio/accel/adi,adis16240.yaml b/Documentation/devicetree/bindings/iio/accel/adi,adis16240.yaml
> index 5887021cc90f..3dc973b98f81 100644
> --- a/Documentation/devicetree/bindings/iio/accel/adi,adis16240.yaml
> +++ b/Documentation/devicetree/bindings/iio/accel/adi,adis16240.yaml
> @@ -37,7 +37,6 @@ unevaluatedProperties: false
>   
>   examples:
>     - |
> -    #include <dt-bindings/gpio/gpio.h>
>       #include <dt-bindings/interrupt-controller/irq.h>
>       spi {
>           #address-cells = <1>;
> diff --git a/Documentation/devicetree/bindings/iio/accel/adi,adxl313.yaml b/Documentation/devicetree/bindings/iio/accel/adi,adxl313.yaml
> index 0c5b64cae965..3a8c69eecfde 100644
> --- a/Documentation/devicetree/bindings/iio/accel/adi,adxl313.yaml
> +++ b/Documentation/devicetree/bindings/iio/accel/adi,adxl313.yaml
> @@ -57,7 +57,6 @@ unevaluatedProperties: false
>   
>   examples:
>     - |
> -    #include <dt-bindings/gpio/gpio.h>
>       #include <dt-bindings/interrupt-controller/irq.h>
>       i2c {
>           #address-cells = <1>;
> @@ -73,7 +72,6 @@ examples:
>           };
>       };
>     - |
> -    #include <dt-bindings/gpio/gpio.h>
>       #include <dt-bindings/interrupt-controller/irq.h>
>       spi {
>           #address-cells = <1>;
> diff --git a/Documentation/devicetree/bindings/iio/accel/adi,adxl345.yaml b/Documentation/devicetree/bindings/iio/accel/adi,adxl345.yaml
> index 84d949392012..a23a626bfab6 100644
> --- a/Documentation/devicetree/bindings/iio/accel/adi,adxl345.yaml
> +++ b/Documentation/devicetree/bindings/iio/accel/adi,adxl345.yaml
> @@ -56,7 +56,6 @@ unevaluatedProperties: false
>   
>   examples:
>     - |
> -    #include <dt-bindings/gpio/gpio.h>
>       #include <dt-bindings/interrupt-controller/irq.h>
>       i2c {
>           #address-cells = <1>;
> @@ -72,7 +71,6 @@ examples:
>           };
>       };
>     - |
> -    #include <dt-bindings/gpio/gpio.h>
>       #include <dt-bindings/interrupt-controller/irq.h>
>       spi {
>           #address-cells = <1>;
> diff --git a/Documentation/devicetree/bindings/iio/accel/adi,adxl355.yaml b/Documentation/devicetree/bindings/iio/accel/adi,adxl355.yaml
> index c07261c71013..f39e2912731f 100644
> --- a/Documentation/devicetree/bindings/iio/accel/adi,adxl355.yaml
> +++ b/Documentation/devicetree/bindings/iio/accel/adi,adxl355.yaml
> @@ -58,7 +58,6 @@ unevaluatedProperties: false
>   
>   examples:
>     - |
> -    #include <dt-bindings/gpio/gpio.h>
>       #include <dt-bindings/interrupt-controller/irq.h>
>       i2c {
>           #address-cells = <1>;
> @@ -74,7 +73,6 @@ examples:
>           };
>       };
>     - |
> -    #include <dt-bindings/gpio/gpio.h>
>       #include <dt-bindings/interrupt-controller/irq.h>
>       spi {
>           #address-cells = <1>;
> diff --git a/Documentation/devicetree/bindings/iio/accel/adi,adxl372.yaml b/Documentation/devicetree/bindings/iio/accel/adi,adxl372.yaml
> index 62465e36a590..88aa67bf2280 100644
> --- a/Documentation/devicetree/bindings/iio/accel/adi,adxl372.yaml
> +++ b/Documentation/devicetree/bindings/iio/accel/adi,adxl372.yaml
> @@ -37,7 +37,6 @@ unevaluatedProperties: false
>   
>   examples:
>     - |
> -    #include <dt-bindings/gpio/gpio.h>
>       #include <dt-bindings/interrupt-controller/irq.h>
>       i2c {
>           #address-cells = <1>;
> @@ -52,7 +51,6 @@ examples:
>           };
>       };
>     - |
> -    #include <dt-bindings/gpio/gpio.h>
>       #include <dt-bindings/interrupt-controller/irq.h>
>       spi {
>           #address-cells = <1>;
> diff --git a/Documentation/devicetree/bindings/iio/accel/bosch,bma255.yaml b/Documentation/devicetree/bindings/iio/accel/bosch,bma255.yaml
> index 457a709b583c..85c9537f1f02 100644
> --- a/Documentation/devicetree/bindings/iio/accel/bosch,bma255.yaml
> +++ b/Documentation/devicetree/bindings/iio/accel/bosch,bma255.yaml
> @@ -107,7 +107,6 @@ examples:
>           };
>       };
>     - |
> -    # include <dt-bindings/interrupt-controller/irq.h>
>       spi {
>           #address-cells = <1>;
>           #size-cells = <0>;
> diff --git a/Documentation/devicetree/bindings/iio/accel/bosch,bma400.yaml b/Documentation/devicetree/bindings/iio/accel/bosch,bma400.yaml
> index 8723a336229e..c5fedcf998f2 100644
> --- a/Documentation/devicetree/bindings/iio/accel/bosch,bma400.yaml
> +++ b/Documentation/devicetree/bindings/iio/accel/bosch,bma400.yaml
> @@ -40,7 +40,6 @@ additionalProperties: false
>   
>   examples:
>     - |
> -    #include <dt-bindings/gpio/gpio.h>
>       #include <dt-bindings/interrupt-controller/irq.h>
>       i2c {
>         #address-cells = <1>;
> diff --git a/Documentation/devicetree/bindings/iio/accel/kionix,kxsd9.yaml b/Documentation/devicetree/bindings/iio/accel/kionix,kxsd9.yaml
> index f64d99b35492..53de921768ac 100644
> --- a/Documentation/devicetree/bindings/iio/accel/kionix,kxsd9.yaml
> +++ b/Documentation/devicetree/bindings/iio/accel/kionix,kxsd9.yaml
> @@ -57,7 +57,6 @@ examples:
>           };
>       };
>     - |
> -    # include <dt-bindings/interrupt-controller/irq.h>
>       spi {
>           #address-cells = <1>;
>           #size-cells = <0>;
> diff --git a/Documentation/devicetree/bindings/iio/adc/adi,ad7091r5.yaml b/Documentation/devicetree/bindings/iio/adc/adi,ad7091r5.yaml
> index ddec9747436c..705adbe88def 100644
> --- a/Documentation/devicetree/bindings/iio/adc/adi,ad7091r5.yaml
> +++ b/Documentation/devicetree/bindings/iio/adc/adi,ad7091r5.yaml
> @@ -93,7 +93,6 @@ unevaluatedProperties: false
>   
>   examples:
>     - |
> -    #include <dt-bindings/gpio/gpio.h>
>       #include <dt-bindings/interrupt-controller/irq.h>
>       i2c {
>           #address-cells = <1>;
> diff --git a/Documentation/devicetree/bindings/iio/adc/adi,ad7173.yaml b/Documentation/devicetree/bindings/iio/adc/adi,ad7173.yaml
> index 21ee319d4675..62d906e24997 100644
> --- a/Documentation/devicetree/bindings/iio/adc/adi,ad7173.yaml
> +++ b/Documentation/devicetree/bindings/iio/adc/adi,ad7173.yaml
> @@ -379,7 +379,6 @@ unevaluatedProperties: false
>   examples:
>     # Example AD7173-8 with external reference connected to REF+/REF-:
>     - |
> -    #include <dt-bindings/gpio/gpio.h>
>       #include <dt-bindings/interrupt-controller/irq.h>
>   
>       spi {
> diff --git a/Documentation/devicetree/bindings/iio/adc/qcom,spmi-vadc.yaml b/Documentation/devicetree/bindings/iio/adc/qcom,spmi-vadc.yaml
> index c28db0d635a0..b9dc04b0d307 100644
> --- a/Documentation/devicetree/bindings/iio/adc/qcom,spmi-vadc.yaml
> +++ b/Documentation/devicetree/bindings/iio/adc/qcom,spmi-vadc.yaml
> @@ -278,7 +278,6 @@ examples:
>     - |
>       #include <dt-bindings/iio/qcom,spmi-adc7-pmk8350.h>
>       #include <dt-bindings/iio/qcom,spmi-adc7-pm8350.h>
> -    #include <dt-bindings/interrupt-controller/irq.h>
>   
>       pmic {
>           #address-cells = <1>;
> diff --git a/Documentation/devicetree/bindings/iio/adc/rohm,bd79104.yaml b/Documentation/devicetree/bindings/iio/adc/rohm,bd79104.yaml
> index 2a8ad4fdfc6b..f0a1347ba4db 100644
> --- a/Documentation/devicetree/bindings/iio/adc/rohm,bd79104.yaml
> +++ b/Documentation/devicetree/bindings/iio/adc/rohm,bd79104.yaml
> @@ -50,7 +50,6 @@ unevaluatedProperties: false
>   
>   examples:
>     - |
> -    #include <dt-bindings/interrupt-controller/irq.h>
>       spi {
>           #address-cells = <1>;
>           #size-cells = <0>;
> diff --git a/Documentation/devicetree/bindings/iio/adc/ti,adc128s052.yaml b/Documentation/devicetree/bindings/iio/adc/ti,adc128s052.yaml
> index 775eee972b12..044b66a3b00c 100644
> --- a/Documentation/devicetree/bindings/iio/adc/ti,adc128s052.yaml
> +++ b/Documentation/devicetree/bindings/iio/adc/ti,adc128s052.yaml
> @@ -44,7 +44,6 @@ unevaluatedProperties: false
>   
>   examples:
>     - |
> -    #include <dt-bindings/interrupt-controller/irq.h>
>       spi {
>           #address-cells = <1>;
>           #size-cells = <0>;
> diff --git a/Documentation/devicetree/bindings/iio/adc/ti,ads1298.yaml b/Documentation/devicetree/bindings/iio/adc/ti,ads1298.yaml
> index bf5a43a81d59..71f9f9b745cb 100644
> --- a/Documentation/devicetree/bindings/iio/adc/ti,ads1298.yaml
> +++ b/Documentation/devicetree/bindings/iio/adc/ti,ads1298.yaml
> @@ -59,7 +59,6 @@ unevaluatedProperties: false
>   
>   examples:
>     - |
> -    #include <dt-bindings/gpio/gpio.h>
>       #include <dt-bindings/interrupt-controller/irq.h>
>       spi {
>           #address-cells = <1>;
> diff --git a/Documentation/devicetree/bindings/iio/imu/adi,adis16460.yaml b/Documentation/devicetree/bindings/iio/imu/adi,adis16460.yaml
> index 4cacc9948726..3a725ece7ec4 100644
> --- a/Documentation/devicetree/bindings/iio/imu/adi,adis16460.yaml
> +++ b/Documentation/devicetree/bindings/iio/imu/adi,adis16460.yaml
> @@ -44,7 +44,6 @@ unevaluatedProperties: false
>   
>   examples:
>     - |
> -    #include <dt-bindings/gpio/gpio.h>
>       #include <dt-bindings/interrupt-controller/irq.h>
>       spi {
>           #address-cells = <1>;
> diff --git a/Documentation/devicetree/bindings/iio/imu/invensense,icm42600.yaml b/Documentation/devicetree/bindings/iio/imu/invensense,icm42600.yaml
> index d4d4e5c3d856..119e28a833fd 100644
> --- a/Documentation/devicetree/bindings/iio/imu/invensense,icm42600.yaml
> +++ b/Documentation/devicetree/bindings/iio/imu/invensense,icm42600.yaml
> @@ -74,7 +74,6 @@ unevaluatedProperties: false
>   
>   examples:
>     - |
> -    #include <dt-bindings/gpio/gpio.h>
>       #include <dt-bindings/interrupt-controller/irq.h>
>       i2c {
>           #address-cells = <1>;
> @@ -91,7 +90,6 @@ examples:
>           };
>       };
>     - |
> -    #include <dt-bindings/gpio/gpio.h>
>       #include <dt-bindings/interrupt-controller/irq.h>
>       spi {
>           #address-cells = <1>;
> diff --git a/Documentation/devicetree/bindings/iio/imu/nxp,fxos8700.yaml b/Documentation/devicetree/bindings/iio/imu/nxp,fxos8700.yaml
> index 688100b240bc..2930b3386703 100644
> --- a/Documentation/devicetree/bindings/iio/imu/nxp,fxos8700.yaml
> +++ b/Documentation/devicetree/bindings/iio/imu/nxp,fxos8700.yaml
> @@ -47,7 +47,6 @@ unevaluatedProperties: false
>   
>   examples:
>     - |
> -    #include <dt-bindings/gpio/gpio.h>
>       #include <dt-bindings/interrupt-controller/irq.h>
>       i2c {
>           #address-cells = <1>;
> @@ -63,7 +62,6 @@ examples:
>           };
>       };
>     - |
> -    #include <dt-bindings/gpio/gpio.h>
>       #include <dt-bindings/interrupt-controller/irq.h>
>       spi {
>           #address-cells = <1>;
> diff --git a/Documentation/devicetree/bindings/iio/light/st,vl6180.yaml b/Documentation/devicetree/bindings/iio/light/st,vl6180.yaml
> index 27c36ab7990d..8598fb631aac 100644
> --- a/Documentation/devicetree/bindings/iio/light/st,vl6180.yaml
> +++ b/Documentation/devicetree/bindings/iio/light/st,vl6180.yaml
> @@ -32,7 +32,6 @@ required:
>   
>   examples:
>     - |
> -    #include <dt-bindings/interrupt-controller/irq.h>
>       i2c {
>           #address-cells = <1>;
>           #size-cells = <0>;
> diff --git a/Documentation/devicetree/bindings/iio/magnetometer/voltafield,af8133j.yaml b/Documentation/devicetree/bindings/iio/magnetometer/voltafield,af8133j.yaml
> index b6ab01a6914a..ed42dc5afb99 100644
> --- a/Documentation/devicetree/bindings/iio/magnetometer/voltafield,af8133j.yaml
> +++ b/Documentation/devicetree/bindings/iio/magnetometer/voltafield,af8133j.yaml
> @@ -44,7 +44,6 @@ additionalProperties: false
>   
>   examples:
>     - |
> -    #include <dt-bindings/interrupt-controller/irq.h>
>       #include <dt-bindings/gpio/gpio.h>
>       i2c {
>           #address-cells = <1>;
> diff --git a/Documentation/devicetree/bindings/iio/pressure/bmp085.yaml b/Documentation/devicetree/bindings/iio/pressure/bmp085.yaml
> index 706b7e24f182..b9ea37317b53 100644
> --- a/Documentation/devicetree/bindings/iio/pressure/bmp085.yaml
> +++ b/Documentation/devicetree/bindings/iio/pressure/bmp085.yaml
> @@ -109,7 +109,6 @@ examples:
>       };
>     - |
>       # include <dt-bindings/gpio/gpio.h>
> -    # include <dt-bindings/interrupt-controller/irq.h>
>       spi {
>           #address-cells = <1>;
>           #size-cells = <0>;

-- 
David Heidelberg



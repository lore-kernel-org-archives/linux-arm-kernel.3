Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 841B4CD37B2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 16:02:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JfFjrNyr/CpA09b5boNae6Ajp7KSF8ePBWKWKTghPOs=; b=jBVaSPpfZDZbU9NpO/dScuv7f/
	sleW+XxtYu2OP3jys4szLERuNtcSRJZPpCfw71+g3Jqgl6B6eexRBYgpWoByBMBYxgYf/UhiLdQhg
	Uy75re174fxYCg6k4djklK4MJSpO5X6LjYeijZ+etvRV0cyskwMi0exYE2gBe4oX3A1c5FM2cR481
	bk+yeLD4AgIn8FCY+HfVVWvSZhAgnDywYt19MqSIArclXb5xMz8QfsbWclGZY3MNF+D9XzdH1bsyU
	yA+5hnwftzQPM8ocr4o53uti5xQ7a06zuJz87WQBL7gzt715vXgsvf69TIppvb21pZAR8zjh8it+5
	fiJHJTpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMT5Q-0000000E8UI-17GM;
	Mon, 11 May 2026 16:02:28 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMT5M-0000000E8TD-3SeX
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 May 2026 16:02:26 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AD43B16F3;
	Mon, 11 May 2026 09:02:15 -0700 (PDT)
Received: from [192.168.178.24] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 67AD03F836;
	Mon, 11 May 2026 09:02:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778515341; bh=d8WItIwthuDEpX/UiQlfKMc9royYtzyV+pGcQrzVbPU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=GvQN5vbEqBrW0wVLOoCaZCwYaB+zRsucAkYwhhEFXPQKUICM7t7svrPEDy5uaj+ns
	 koT6QL4ySkLHNb8hlT0lW7CUe/p8+ozsHkVDoem0J+IMLPLrb8zunUwkoguvPjtPiQ
	 LU6mDfZgyMRgjD6pA5Fr64Sd6Zr6hbl/BrrcWKu4=
Message-ID: <e7269822-afc4-4a80-8408-297f9dbd6791@arm.com>
Date: Mon, 11 May 2026 18:02:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: iio: adc: Add GPADC for Allwinner A523
To: Michal Piekos <michal.piekos@mmpsystems.pl>,
 Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>,
 =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Maksim Kiselev <bigunclemax@gmail.com>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20260510-sunxi-a523-gpadc-v1-0-4f6b0f4000fb@mmpsystems.pl>
 <20260510-sunxi-a523-gpadc-v1-1-4f6b0f4000fb@mmpsystems.pl>
Content-Language: en-US
From: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <20260510-sunxi-a523-gpadc-v1-1-4f6b0f4000fb@mmpsystems.pl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_090225_217794_B7642005 
X-CRM114-Status: GOOD (  22.00  )
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

Hi Michal,

thanks for adding this!

On 5/10/26 14:57, Michal Piekos wrote:
> Add support for the GPADC for the Allwinner A523. It differs from the
> D1/T113s/R329/T507 by having two clocks.
> 
> Signed-off-by: Michal Piekos <michal.piekos@mmpsystems.pl>
> ---
>   .../iio/adc/allwinner,sun20i-d1-gpadc.yaml         | 37 +++++++++++++++++++++-
>   1 file changed, 36 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/iio/adc/allwinner,sun20i-d1-gpadc.yaml b/Documentation/devicetree/bindings/iio/adc/allwinner,sun20i-d1-gpadc.yaml
> index da605a051b94..89da96cd705f 100644
> --- a/Documentation/devicetree/bindings/iio/adc/allwinner,sun20i-d1-gpadc.yaml
> +++ b/Documentation/devicetree/bindings/iio/adc/allwinner,sun20i-d1-gpadc.yaml
> @@ -17,6 +17,7 @@ properties:
>         - items:
>             - enum:
>                 - allwinner,sun50i-h616-gpadc
> +              - allwinner,sun55i-a523-gpadc
>             - const: allwinner,sun20i-d1-gpadc

As Jernej already mentioned, the A523 GPADC is not fully compatible, 
since it adds another clock. The question to ask is: Can a driver only 
knowing about the fallback device handle this new device? For which the 
answer here is: No, it misses a clock.
So add just a single entry for the A523 (plus adding it to the driver).

So looking at this I wonder if we should add some property to describe 
the number of supported channels, since they are slightly different 
between the SoCs:
- The D1 manual mentions 2 channels.
- The T113s manual (same die as the D1?) describes 1 channel only.
- The T507 manual (same die as the H616) reports 4 channels.
- The A733 has 6 channels.
- The A133 has 1 channel, but it's channel 1, not 0.

So all of this is somewhat covered as channels are described as child 
nodes, and have a reg property. Ideally non-existing channels just 
wouldn't be listed, but I don't know if we want to rely on that.

So I am wondering if we should introduce a limit, or rather a mask (to 
cover the A133 oddity)?
Either a DT property (channel-mask, as a single sell representing the 
bit mask), or derived in the driver from the compatible string.
The former would avoid introducing different compatible strings just 
because of that, though I think this type of property is somewhat 
discouraged?

Any thoughts?

>   
>     "#io-channel-cells":
> @@ -29,7 +30,12 @@ properties:
>       const: 0
>   
>     clocks:
> -    maxItems: 1
> +    minItems: 1
> +    maxItems: 2
> +
> +  clock-names:
> +    minItems: 1
> +    maxItems: 2
>   
>     interrupts:
>       maxItems: 1
> @@ -40,6 +46,35 @@ properties:
>     resets:
>       maxItems: 1
>   
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          items:
> +            - const: allwinner,sun55i-a523-gpadc
> +            - const: allwinner,sun20i-d1-gpadc
> +    then:
> +      properties:
> +        clocks:
> +          minItems: 2
> +          maxItems: 2
> +          items:
> +            - description: Bus clock
> +            - description: Module clock

I am not a YAML expert, but I think you can drop the min and max 
properties, if you just enumerate the cases. Same for the names.

Cheers,
Andre

> +        clock-names:
> +          minItems: 2
> +          maxItems: 2
> +          items:
> +            - const: bus
> +            - const: mod
> +      required:
> +        - clock-names
> +    else:
> +      properties:
> +        clocks:
> +          maxItems: 1
> +        clock-names: false
> +
>   patternProperties:
>     "^channel@[0-9a-f]+$":
>       $ref: adc.yaml
> 



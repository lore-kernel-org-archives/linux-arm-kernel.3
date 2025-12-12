Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F714D43379
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Dec 2025 07:51:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WDRM+Mcm+eaOgrPszSVJn6wMYj7R2OASXJPVQeqhico=; b=wdOyiD3VjXJ9WhP4oLdrEk8yxy
	aYqMfWS3Esi4+W6Velgx8iVi9SYyIwJvPz3xRYnVeCoAviVAuwt90VkJhtl72kYMyJqd10FUQCGP+
	utjlKVatPUctNiN1N62rzOtzwShHjBu7UQV7Nft6WSJBNCMcOKo8ZxjW6aOJPL+B/MLLI2RtL8kDc
	AyGsJdOqvIM0sYAVpk9rVPssNqHygoRi2Cj/3zkhPnjbDU0x7z1J5NC3SXPoAAo3q5TSoxpB3X4p6
	wR4XZEnCTtWmUi5B3JrKRsQsSfKC5wnHGuFQvjiNe4uTzI07laQ3WNVsQGEG60t/G4QtSUfTCu1KZ
	tIgOAYng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTxvQ-00000000EH2-3tWk;
	Fri, 12 Dec 2025 07:50:52 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTxvN-00000000EGM-0HVB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Dec 2025 07:50:51 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 5909BC1935D;
	Fri, 12 Dec 2025 07:50:13 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3839D606DF;
	Fri, 12 Dec 2025 07:50:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 20F8D103C8DF7;
	Fri, 12 Dec 2025 08:50:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1765525836; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=WDRM+Mcm+eaOgrPszSVJn6wMYj7R2OASXJPVQeqhico=;
	b=i61QUMSpjF3ehPjvtdhLBXiDK+nSX9ISYyXEt0WWu741UGA1f79yxdE7Sa6i/LvuOIEZlY
	Z7Qcc5tyZimRoBVA6HyoftzOZCv2JsQcYrZLOeyAFoar93NxsEe6VfjoHuEjvNbzlG4u60
	QBu1frPhcvkKZvDS375pi6bIof5vcVnbZeAvgZD3C4C97ciJV+Q02OiUSrdD7HXCW36In4
	amlB8XE/6uOMpylphGGF4VMDORIM49r+C06J9ZrfNWT/DZ1Y8jPatGIeTlrif5cizSaO3U
	ICx40/SR70zz0cHGx+hVpt/POSwEKUmlskokjb/3qWx+F/2lhqJpxrvtswNz0g==
Message-ID: <4d34658b-874d-4681-95c1-616f5b385550@bootlin.com>
Date: Fri, 12 Dec 2025 08:50:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] dt-bindings: pwm: sunxi: add PWM controller for
 Allwinner H616
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Philipp Zabel
 <p.zabel@pengutronix.de>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-pwm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20251205100239.1563353-1-richard.genoud@bootlin.com>
 <20251205100239.1563353-2-richard.genoud@bootlin.com>
 <20251208-gorgeous-capuchin-of-protection-4ad0c2@quoll>
From: Richard GENOUD <richard.genoud@bootlin.com>
Content-Language: en-US, fr
Organization: Bootlin
In-Reply-To: <20251208-gorgeous-capuchin-of-protection-4ad0c2@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251211_235049_264153_6B09077D 
X-CRM114-Status: GOOD (  21.50  )
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

Hi Krzysztof,

Le 08/12/2025 à 07:52, Krzysztof Kozlowski a écrit :
> On Fri, Dec 05, 2025 at 11:02:36AM +0100, Richard Genoud wrote:
>> Allwinner H616 SoC contains a PWM controller quite different from the A10.
>> It has 6 channels than can generate PWM waveforms or clocks if bypass is
>> enabled.
>>
>> Signed-off-by: Richard Genoud <richard.genoud@bootlin.com>
>> ---
>>   .../pwm/allwinner,sun50i-h616-pwm.yaml        | 67 +++++++++++++++++++
>>   1 file changed, 67 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/pwm/allwinner,sun50i-h616-pwm.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/pwm/allwinner,sun50i-h616-pwm.yaml b/Documentation/devicetree/bindings/pwm/allwinner,sun50i-h616-pwm.yaml
>> new file mode 100644
>> index 000000000000..b89735ad3a43
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/pwm/allwinner,sun50i-h616-pwm.yaml
>> @@ -0,0 +1,67 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/pwm/allwinner,sun50i-h616-pwm.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Allwinner H616 PWM
>> +
>> +maintainers:
>> +  - Richard Genoud <richard.genoud@bootlin.com>
>> +
>> +description: |
> 
> Do not need '|' unless you need to preserve formatting.
Ok, I was thinking that it was nicer with the formatting.

> 
>> +  Allwinner H616 PWM can generate standard PWM signals with variable pulse width
>> +  and period.
>> +  Also, instead of a PWM signal, a channel can be used to provide a clock.
>> +
>> +properties:
>> +  compatible:
>> +    const: allwinner,sun50i-h616-pwm
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  clocks:
>> +    items:
>> +      - description: Bus Clock
>> +
> 
> Are you sure there is no first clock? Really, really sure? If you add it
> later, I would be pretty sad, because that's unnecessary duplication of
> binidngs....
I surely don't want to make you sad :)

Having a second look at the sun4i binding, I think there's a way to use it.
The sun4i, as you said, has a module clock (OSC24M) and an optional bus 
clock.
Here, the bus clock is mandatory, but the H616 PWM uses OSC24M and APB1 
as clock sources.

So, I guess that if we add something like that:
    clocks:
      minItems: 1
      items:
        - description: Module Clock
        - description: Bus Clock
+      - description: APB Clock

    clock-names:
      minItems: 1
      items:
        - const: mod
        - const: bus
+      - const: apb

    resets:
      maxItems: 1

In the sun4i pwm binding, we could re-use it for the H616 pwm right?
(APB clock is maybe not the best name, could be secondary module clock)

> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> Best regards,
> Krzysztof
> 
Thanks for your review!

Regards,
Richard



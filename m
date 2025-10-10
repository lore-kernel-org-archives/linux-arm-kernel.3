Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2765CCA476
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Oct 2025 10:16:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n6HazN1sAWLIGVuPB5Q33kUmi4chDMBKIuv8XrJPLYE=; b=42y7nDRmFcMG/DJ3qDu3cRQxJa
	PVWsvqxMUZhEas4Smq1h7X1A71kuRIQnsxfpBbjWUFNJGtUWOn20CchpQyasUS2iICazI092wyiC1
	SeRMjMBce7Nh9DIZXXKYet6vfYGtqZlC5TrKzcKkTK0lSAXzL6zWVkee0zlGN5guAgNXZfPOINmr6
	MBwb0kFotIHIqH5nQltXpNXSyCJmzRRXo/CQOczjiMIuCg2XtLhks7Vt3By/F7N+k39vlWSkTaXKC
	+8XpPIvSYlG94p59TxMtFE3sg7WfrUInd3HGHfmXEtxH0fhulu46EFhJ99yQhjFO6SxN8HFmgj5sA
	y3x/2Yig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7AAq-00000008Eyq-1Qiv;
	Fri, 10 Oct 2025 10:16:32 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7AAn-00000008Ey3-14vT;
	Fri, 10 Oct 2025 10:16:31 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id BC1EB1A127A;
	Fri, 10 Oct 2025 10:16:24 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8BD1360667;
	Fri, 10 Oct 2025 10:16:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 154DD102F220B;
	Fri, 10 Oct 2025 12:16:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1760091383; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=n6HazN1sAWLIGVuPB5Q33kUmi4chDMBKIuv8XrJPLYE=;
	b=AA+qF05a9hf8XgayaG9t7T6DbV/WtbQkquFY9zFxQEJ/DdGBMziJQNqBRxPG5qTeOVSpvN
	uwzClc0Ux+cYTSI+IDMaAGevIWNlkkYOyDFH/CEnmBrAT1YW2OWmBceZlOu4MQAa+JOkUn
	u7Tw0fVKzGgHj3FQ96Ug3/TB6NJIkI5cMRN8pBNYi50mWGvk5RpbFpOIZispudvlRzSMnY
	JwoJMfpbikfmJrTEf8HhVzW3d3uc6uzk5hNLYAQbnvRqFAvm01uxxRA50uonqAeTKCkXn1
	LBqZsuSFzTrlLYLDlP5AhW5q1V96m4SjMuduf9sJ/J0KA1UAKq1WL+4J61gwYA==
Message-ID: <76033f73-4a8f-45c1-90a3-63a4eae2adaa@bootlin.com>
Date: Fri, 10 Oct 2025 12:16:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/15] dt-bindings: mtd: sunxi: Add new compatible
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>
Cc: Wentao Liang <vulab@iscas.ac.cn>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20251010084042.341224-1-richard.genoud@bootlin.com>
 <20251010084042.341224-3-richard.genoud@bootlin.com>
 <414c16db-cdd1-433d-b0ae-915e11d964f0@kernel.org>
From: Richard GENOUD <richard.genoud@bootlin.com>
Content-Language: en-US, fr
Organization: Bootlin
In-Reply-To: <414c16db-cdd1-433d-b0ae-915e11d964f0@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251010_031629_427104_44E0A1C1 
X-CRM114-Status: GOOD (  14.70  )
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

Le 10/10/2025 à 10:45, Krzysztof Kozlowski a écrit :
> On 10/10/2025 10:40, Richard Genoud wrote:
>> The H616 NAND controller is quite different from the A10 and A23 ones,
>> some registers offset changed, and some new one are introduced.
>> Also, the DMA handling is different (it uses chained descriptors)
>>
> 
> 
> Subject: not new compatible, but "H616" or whatever device is called.
> Otherwise every commit would be called like that making git log
> --oneline useless.
Indeed.

> 
>> So, introduce a new compatible to represent this version of the IP.
>>
>> Signed-off-by: Richard Genoud <richard.genoud@bootlin.com>
>> ---
>>   .../mtd/allwinner,sun4i-a10-nand.yaml         | 56 ++++++++++++++-----
>>   1 file changed, 43 insertions(+), 13 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/mtd/allwinner,sun4i-a10-nand.yaml b/Documentation/devicetree/bindings/mtd/allwinner,sun4i-a10-nand.yaml
>> index 054b6b8bf9b9..cc63091fe936 100644
>> --- a/Documentation/devicetree/bindings/mtd/allwinner,sun4i-a10-nand.yaml
>> +++ b/Documentation/devicetree/bindings/mtd/allwinner,sun4i-a10-nand.yaml
>> @@ -6,34 +6,64 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
>>   
>>   title: Allwinner A10 NAND Controller
>>   
>> -allOf:
>> -  - $ref: nand-controller.yaml
>> -
>>   maintainers:
>>     - Chen-Yu Tsai <wens@csie.org>
>>     - Maxime Ripard <mripard@kernel.org>
>>   
>> +allOf:
>> +  - $ref: nand-controller.yaml
> 
> 
> If moving it, can you place it like in example-schema, so at the bottom,
> above unevaluatedProps?
Yes, absolutely.

> 
>> +
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            enum:
>> +              - allwinner,sun4i-a10-nand
>> +              - allwinner,sun8i-a23-nand-controller
>> +    then:
>> +      properties:
>> +        clocks:
>> +          items:
>> +            - description: Bus Clock
>> +            - description: Module Clock
>> +        clock-names:
>> +          items:
>> +            - const: ahb
>> +            - const: mod
>> +
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            enum:
>> +              - allwinner,sun50i-h616-nand-controller
>> +    then:
>> +      properties:
>> +        clocks:
>> +          items:
>> +            - description: Bus Clock
>> +            - description: Module Clock
>> +            - description: ECC Clock
>> +            - description: MBus Clock
>> +        clock-names:
>> +          items:
>> +            - const: ahb
>> +            - const: mod
>> +            - const: ecc
>> +            - const: mbus
>> +
>>   properties:
>>     compatible:
>>       enum:
>>         - allwinner,sun4i-a10-nand
>>         - allwinner,sun8i-a23-nand-controller
>> +      - allwinner,sun50i-h616-nand-controller
>>     reg:
>>       maxItems: 1
>>   
>>     interrupts:
>>       maxItems: 1
>>   
>> -  clocks:
>> -    items:
>> -      - description: Bus Clock
>> -      - description: Module Clock
>> -
>> -  clock-names:
>> -    items:
>> -      - const: ahb
>> -      - const: mod
> 
> 
> You cannot remove it. Broadest constraints, see writing schema.
> 
> or my standard reference example:
> https://elixir.bootlin.com/linux/v6.11-rc6/source/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml#L127
Ok

Thanks!

> 
> 
> Best regards,
> Krzysztof


-- 
Richard Genoud, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


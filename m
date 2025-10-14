Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AE11CCD184
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Oct 2025 07:14:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1rQPGkIVi3ODkc5CC6srqTaTWUcBBf3OLgjQBFg0e8Q=; b=Opmo9TbppnyLRd97e3jqux2l7J
	CS9/XsgVcaGSUvy2OOP63CnnXjs8e6vFrnlqsa7ykvSd1rvgqDiEekh/nQ1VVrRH/w07ce0/c+ZI0
	zqFkXRq15rpXaA87BJsWYxyQsz6U25IHH8/NvKixt4qYjFJdkIUIIgKXldqoOIDBNmO3oMxUmxQLk
	0LnwdQgDJGcQ5iHEHaly6Nb1zI8oYhmBpkYhHzKPO0eM+7hgQifWA9BFSTz1zhqt1RqlLItQ9rlFp
	01YPC8xpwvZaQFLTn++0DiB3zqooKsfAjHCIgijUieu8CFDYFY5crOIVuPzWL31NlHxzMKAXFZFFE
	DdHHfYIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8ZEV-0000000FPYn-3eK1;
	Tue, 14 Oct 2025 07:14:07 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8ZES-0000000FPUV-0M1M
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Oct 2025 07:14:07 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 398441A135F;
	Tue, 14 Oct 2025 07:14:00 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 09945606EC;
	Tue, 14 Oct 2025 07:14:00 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B48C7102F224B;
	Tue, 14 Oct 2025 09:13:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1760426038; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=1rQPGkIVi3ODkc5CC6srqTaTWUcBBf3OLgjQBFg0e8Q=;
	b=ZZvdEf6IsnbwHKU53mCP/OJVvqaMjPPYJ6LVInAyhJAnoY5WHLT0aiiBaULt3scVtTDLfT
	MrlZ2yAeFbtlptpU58fw1BkWZsNgWzGhTJ53QT8KpCGw2yl/YYNSD3Q3ufDZmne+1ywRl5
	+7gNdp6rf94tvaKq84k92Xn+G5h3/XhB46xtaTO8T9w0Ln60XmksgF7Zne+VIN0SHmaltX
	Lm1J8uJKhiwBAJqKn7WReaj1cst9KJkCySbLwSdL0TEiEPXatY3WzkjuFpipKViGtJ+T1E
	NAcTO+x1RMvIk/TYApPpC2NoR5ozDBKtwvAZuoI/B9y6QBNHphj6Q6YLHYrMmQ==
Message-ID: <72d9b0f3-da27-4e30-b07b-d85be23b1407@bootlin.com>
Date: Tue, 14 Oct 2025 09:13:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 14/15] dt-bindings: mtd: sunxi: Add H616 compatible
To: Conor Dooley <conor@kernel.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 Wentao Liang <vulab@iscas.ac.cn>, Johan Hovold <johan@kernel.org>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20251013152645.1119308-1-richard.genoud@bootlin.com>
 <20251013152645.1119308-15-richard.genoud@bootlin.com>
 <20251013-parrot-sandpaper-4e31d2d1a6b3@spud>
From: Richard GENOUD <richard.genoud@bootlin.com>
Content-Language: en-US, fr
Organization: Bootlin
In-Reply-To: <20251013-parrot-sandpaper-4e31d2d1a6b3@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251014_001404_380150_8F44CF73 
X-CRM114-Status: GOOD (  15.28  )
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

Le 13/10/2025 à 21:44, Conor Dooley a écrit :
> On Mon, Oct 13, 2025 at 05:26:44PM +0200, Richard Genoud wrote:
>> The H616 NAND controller is quite different from the A10 and A23 ones,
>> some registers offset changed, and some new one are introduced.
>> Also, the DMA handling is different (it uses chained descriptors)
>>
>> So, introduce a new compatible to represent this version of the IP.
>>
>> Signed-off-by: Richard Genoud <richard.genoud@bootlin.com>
>> ---
>>   .../mtd/allwinner,sun4i-a10-nand.yaml         | 57 ++++++++++++++++---
>>   1 file changed, 48 insertions(+), 9 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/mtd/allwinner,sun4i-a10-nand.yaml b/Documentation/devicetree/bindings/mtd/allwinner,sun4i-a10-nand.yaml
>> index 054b6b8bf9b9..4b82de9fae17 100644
>> --- a/Documentation/devicetree/bindings/mtd/allwinner,sun4i-a10-nand.yaml
>> +++ b/Documentation/devicetree/bindings/mtd/allwinner,sun4i-a10-nand.yaml
>> @@ -6,9 +6,6 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
>>   
>>   title: Allwinner A10 NAND Controller
>>   
>> -allOf:
>> -  - $ref: nand-controller.yaml
>> -
>>   maintainers:
>>     - Chen-Yu Tsai <wens@csie.org>
>>     - Maxime Ripard <mripard@kernel.org>
>> @@ -18,6 +15,8 @@ properties:
>>       enum:
>>         - allwinner,sun4i-a10-nand
>>         - allwinner,sun8i-a23-nand-controller
>> +      - allwinner,sun50i-h616-nand-controller
>> +
>>     reg:
>>       maxItems: 1
>>   
>> @@ -25,14 +24,12 @@ properties:
>>       maxItems: 1
>>   
>>     clocks:
>> -    items:
>> -      - description: Bus Clock
>> -      - description: Module Clock
>> +    minItems: 2
>> +    maxItems: 4
>>   
>>     clock-names:
>> -    items:
>> -      - const: ahb
>> -      - const: mod
>> +    minItems: 2
>> +    maxItems: 4
> 
> The clock descriptions and names should remain out here, with your new
> min/max constraints, since they're identical at indices 0 and 1 to for
> both types of device. The if/then should only set the min to 4 for the
> new device and the max to 2 for the existing ones.

Indeed.

Thanks!

> 
> Cheers,
> Conor.
> 
> pw-bot: changes-requested
> 
>>   
>>     resets:
>>       maxItems: 1
>> @@ -85,6 +82,48 @@ required:
>>   
>>   unevaluatedProperties: false
>>   
>> +allOf:
>> +  - $ref: nand-controller.yaml
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
>>   examples:
>>     - |
>>       #include <dt-bindings/interrupt-controller/arm-gic.h>


-- 
Richard Genoud, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC910C35FF1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Mar 2025 10:57:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LDjucKYgDaPfFyv56RFmqZL83XSTQZVQ30iv1e6e2oU=; b=ZocyWgUNxxepmspDSbFFYS33Bz
	vm91/PMr20oM+svOV/ohonLaZbJ1rCVo+G/p0Norsp0UVvG6fnU2wBpV/YWNDmQVNi4527y8MuY/d
	QVlJaGbN/Owf7RXVDg9Vgijg5frRrQUnvWtEn6fNiAfaJo+1HZ+grRCDMsD3ktWktfhhtqZSEoqhH
	ZRRY0LkMADPqro3wYzy7VkNx18M7w8DoiK1ePTlEAcl/Xi36tu0GLgmBPOI5pq0kXs41LtWozftxq
	kqRMK6FOENq7AtMFJiKp7mdx9GyVp1UW13/08sFQxI+sjyy6HSkjcn9cI1ukNnyz6y1wGzBV023bi
	owI7weLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tt2j1-0000000DvA5-2rMY;
	Fri, 14 Mar 2025 10:57:11 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tt2OW-0000000Ds0F-08Gb;
	Fri, 14 Mar 2025 10:36:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1741948558;
	bh=LRk5FiXCZAm/QLOqWOprpG9wIHqysVDkW9SPn6Y74UY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=o8Jm4H0499PVZUsmP41hbpJxEZtW+GATf073GkU3+PVx0hzH0NaAHMax6kJ4rVO4R
	 p7OiUuBgIMoXxI7pQALVCzDvtwFNq/Tr4yyUMtScGddFL4MBsgNm5zrscSh3t7eA7S
	 PhSWlOTThdGgqc2sW2NL0i1AA1+WD3Es7980ZMTkQlcHnq1Q36Eph+Ny8n3DVltn8b
	 zyHKWwtgyL4jqKWxxN9amhMZ1kTBjV50WJcKgpD4uf3wBNpdKkyt9YCE0oEn92R/dC
	 8/RT3RrUKLY5dM+NfW1qZcWTrmLgoKztvozDvd0a5yW588jt1zRoJBgtK7YzIGWWMs
	 yHnNmzH52vTzg==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id F131717E0CA6;
	Fri, 14 Mar 2025 11:35:56 +0100 (CET)
Message-ID: <d4b3bc28-b96b-4b11-a99d-d3492ad19438@collabora.com>
Date: Fri, 14 Mar 2025 11:35:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] dt-bindings: pmic: mediatek: Add pmic documents
To: Krzysztof Kozlowski <krzk@kernel.org>, "Lu.Tang" <Lu.Tang@mediatek.com>,
 Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Lee Jones <lee@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Sean Wang <sean.wang@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, Chen Zhong <chen.zhong@mediatek.com>,
 Sen Chu <shen.chu@mediatek.com>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-gpio@vger.kernel.org, Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20250314073307.25092-1-Lu.Tang@mediatek.com>
 <20250314073307.25092-6-Lu.Tang@mediatek.com>
 <19ddb133-7f11-4c1b-b0e1-91523d42040c@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <19ddb133-7f11-4c1b-b0e1-91523d42040c@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_033600_226711_5DCF9F35 
X-CRM114-Status: GOOD (  24.34  )
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

Il 14/03/25 11:32, Krzysztof Kozlowski ha scritto:
> On 14/03/2025 08:32, Lu.Tang wrote:
> 
> Please use subject prefixes matching the subsystem. You can get them for
> example with `git log --oneline -- DIRECTORY_OR_FILE` on the directory
> your patch is touching. For bindings, the preferred subjects are
> explained here:
> https://www.kernel.org/doc/html/latest/devicetree/bindings/submitting-patches.html#i-for-patch-submitters
> 
> There is no subsystem "pmic".
> 
>> Add new pmic mfd and adc documents for mt8196
>>
>> Signed-off-by: Lu.Tang <Lu.Tang@mediatek.com>
> 
> Are you sure Latin transcription of your name includes '.' or you just
> copy-paste email address?
> 
> 
> ...
> 
>> +  - Lu Tang <lu.tang@mediatek.com>
>> +
>> +description:
>> +  The Auxiliary Analog/Digital Converter (AUXADC) is an ADC found
>> +  in some MediaTek PMICs, performing various PMIC related measurements
>> +  such as battery and PMIC internal voltage regulators temperatures,
>> +  other than voltages for various PMIC internal components.
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - mediatek,mt6363-auxadc
>> +      - mediatek,mt6373-auxadc
> 
> Just fold the device to the parent node.
> 
> 
> 
> ..
> 
> 
> 
>> diff --git a/Documentation/devicetree/bindings/mfd/mediatek,spmi-pmic.yaml b/Documentation/devicetree/bindings/mfd/mediatek,spmi-pmic.yaml
>> new file mode 100644
>> index 000000000000..a8f1231623cf
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/mfd/mediatek,spmi-pmic.yaml
> 
> Filename matching one of the compatibles, e.g. the oldest one.
> 

Yeah but besides that I don't see valid reasons why this should be a different
binding (and also why this should use a different driver, fwiw) - when it can
most probably just extend the current PMIC MFD driver... and the same goes for
the PMIC AUXADC: there's a mt6359-auxadc binding and driver that can be extended
to 6363 and 6373 rather easily.

There's nothing "really special" about those.....

Cheers

>> @@ -0,0 +1,173 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/mfd/mediatek,spmi-pmic.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: MediaTek SPMI PMICs multi-function device
>> +
>> +maintainers:
>> +  - Lu Tang <lu.tang@mediatek.com>
>> +
>> +description: |
>> +  Some Mediatek PMICs are interfaced to the chip via the SPMI (System Power
>> +  Management Interface) bus.
>> +
>> +  The Mediatek SPMI series includes the MT6363, MT6373, MT6316 and other
>> +  PMICs.Please see the sub-modules below for supported features.
>> +
>> +   MT6363/MT6373 is a multifunction device with the following sub modules:
>> +  - Regulators
>> +  - ADC
>> +  - GPIO
>> +  - Keys
>> +   MT6316 is a multifunction device with the following sub modules:
>> +  - Regulators
> 
> I don't get why they are in the same schema. It would result in
> unnecessary big if:then with half of children not applicable for other
> variants.
> 
>> +
>> +properties:
>> +  compatible:
>> +    oneOf:
>> +      - enum:
>> +          - mediatek,mt6363
>> +          - mediatek,mt6373
>> +          - mediatek,mt6316
> Sort these with alphanumeric order.
> 
> Best regards,
> Krzysztof





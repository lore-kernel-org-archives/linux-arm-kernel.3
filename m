Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5F1BCCF9EA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 10:24:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dyuFkNCjxxclxTbyr+qjWUT2XZrQ0mMN6TOS+mrIvkM=; b=iXiajlO3I6r9hp8IGqN9XuMcOm
	EZruUkY240//EuJyHiqDioMX2oIxIuCFXQpYCeDaW42SrzcTSHaB5sVDXQlqiUgSdwjK0zHp+UoQK
	A894R8iZFJiuVRTtEtoNlNh19xt9IyksGYZ69500tmN2IiW1SSsG0g3TeOWvA+6Oa28sdsPumhCmI
	zlKO5X3r7yDy+hUZzLWk8Uf39nbpBfGVrQw4/I3AyeKgSU9itm8rNu7VbVjjrsfgztpaSsqSdAHcI
	zIXb3kJDm6lgin2mUVz5Rlnn89gCRDK3Vn71vk9zMAU0ZcRLU8+p+zWVHBuCgDLH+BmvuOnrPKbJn
	MnQh44DA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDKOc-0000000DeOF-11JQ;
	Mon, 27 Oct 2025 10:24:14 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDKOZ-0000000DeNF-2WI6;
	Mon, 27 Oct 2025 10:24:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1761560649;
	bh=vTOgKCvRxuU4DjEERkogKbYBwYp5CJEVMp8MP00NiNA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Q/x+HhBGKnpTKn2N5nEE4FDydXMkf2mF7Es8DR3RffdoxC92ZTWgWqrrHpCDaCZuk
	 oIPsuFiydf4481020UeYYiimLYzj0qXpN0RMHnulqg9acGnOxUu7NgCSBD2Tn+0vUS
	 lhzb/YrkoCdluGk3mbqla60dMsoJJTmeeFZT+uFyUzggR3iq9rhpwTCRA9SWtKwQGN
	 YEKZe/l1nG5CT8Vky2wFRmPLhn6GYDO3kgm7esVXiXS/1iaLl06ulab1Xlh79VJ1Ti
	 bZNwvWwufZ8iPqwwMYmOA4iClBJ4EljDeZB9RRfEEXm3Jd8wejSZwITHLpgS4s+kJP
	 lyX80kJgnefkg==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7C1CB17E0DC0;
	Mon, 27 Oct 2025 11:24:08 +0100 (CET)
Message-ID: <e9de0c51-01f1-4aa2-8950-cbfa54347729@collabora.com>
Date: Mon, 27 Oct 2025 11:24:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 6/7] dt-bindings: clock: Describe MT6685 PM/Clock IC
 Clock Controller
To: Conor Dooley <conor@kernel.org>
Cc: sboyd@kernel.org, mturquette@baylibre.com, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com,
 laura.nao@collabora.com, nfraprado@collabora.com, wenst@chromium.org,
 y.oudjana@protonmail.com, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 kernel@collabora.com
References: <20251024083301.25845-1-angelogioacchino.delregno@collabora.com>
 <20251024083301.25845-7-angelogioacchino.delregno@collabora.com>
 <20251024-trophy-clause-7db540d073fa@spud>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20251024-trophy-clause-7db540d073fa@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_032411_793652_2264A2A9 
X-CRM114-Status: GOOD (  24.20  )
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

Il 24/10/25 18:25, Conor Dooley ha scritto:
> On Fri, Oct 24, 2025 at 10:33:00AM +0200, AngeloGioacchino Del Regno wrote:
>> Add bindings to describe the SCK_TOP clock controller embedded
>> in the MT6685 IC, reachable over the SPMI bus.
>>
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> ---
>>
>> NOTE: This does not contain any example because the MT6685 RTC
>>        will be added to the mfd binding for MediaTek SPMI PMICs
>>        and examples will be there.
>>
>> ** For reviewing purposes, this is how the example will look like: **
>>
>>    - |
>>      #include <dt-bindings/interrupt-controller/irq.h>
>>      #include <dt-bindings/spmi/spmi.h>
>>
>>      spmi {
>>        #address-cells = <2>;
>>        #size-cells = <0>;
>>
>>        pmic@9 {
>>          compatible = "mediatek,mt6363";
>>          reg = <0x9 SPMI_USID>;
>>          interrupts = <9 1 IRQ_TYPE_LEVEL_HIGH>;
>>          interrupt-controller;
>>          #address-cells = <1>;
>>          #interrupt-cells = <3>;
>>          #size-cells = <0>;
>>
>>          clock-controller@514 {
>>            compatible = "mediatek,mt6685-sck-top";
>>            reg = <0x514>;
>>            #clock-cells = <1>;
>>          };
>>
>>          rtc@580 {
>>            compatible = "mediatek,mt6685-rtc";
>>            reg = <0x580>;
>>            interrupts = <9 0 IRQ_TYPE_LEVEL_HIGH>;
>>          };
>>        };
>>      };
>>
>>   .../bindings/clock/mediatek,mt6685-clock.yaml | 37 +++++++++++++++++++
>>   .../dt-bindings/clock/mediatek,mt6685-clock.h | 17 +++++++++
>>   2 files changed, 54 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/clock/mediatek,mt6685-clock.yaml
>>   create mode 100644 include/dt-bindings/clock/mediatek,mt6685-clock.h
>>
>> diff --git a/Documentation/devicetree/bindings/clock/mediatek,mt6685-clock.yaml b/Documentation/devicetree/bindings/clock/mediatek,mt6685-clock.yaml
>> new file mode 100644
>> index 000000000000..5407ebf2f3b5
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/clock/mediatek,mt6685-clock.yaml
>> @@ -0,0 +1,37 @@
>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/clock/mediatek,mt6685-clock.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: MediaTek Clock Controller for MT6685 SPMI PM/Clock IC
>> +
>> +maintainers:
>> +  - AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> +
>> +description: |
>> +  The clock architecture in MediaTek PMICs+Clock ICs is structured like below:
>> +  Crystal(XO) or Internal ClockGen -->
>> +          dividers -->
>> +                      muxes
>> +                           -->
>> +                              clock gate
> 
> Is this the intended formatting? Looks weird with "dividers" being
> unaligned with the --> above it, but maybe you were just going for x
> number of spaces?
> 

Yeah I was just going for x number of spaces, otherwise that may become a bit
"too long"...

>> +
>> +  The device nodes provide clock gate control in different IP blocks.
> 
> I think this is more understandable as "This device provides clock gate
> control", if this sck-top is only doing gating. Otherwise, not clear if
> the dividers and muxes are here or elsewhere.

-> Datasheets are incomplete (sad-face-here) <-

Most of the information here is grabbed from more than one downstream kernel
for more than one SoC/device, and assembled together.

The XO/clockgen and dividers are not in SCKTOP - those should be partially in
the "TOP" portion (yeah, there's a top and a sck-top), and partially in another
block that controls only the clockgen.

I didn't want to implement those two, even though I almost precisely know how to
do that (and I did it in some local tests), because I could only gather partial
information and I didn't feel confident in upstreaming something that I'm not
entirely sure about.

Same goes for the MUX part: there's some here, some there, one in scktop as well
(but I didn't describe it because again incomplete info, and even downstream the
only mux in scktop seems to be unused).

So yeah - apart from one mux, anything before clock gate is elsewhere... I can
change that statement to the one you proposed, looks a bit better than what I
came up with, so thanks for that :-D

> 
>> +properties:
>> +  compatible:
>> +    const: mediatek,mt6685-sck-top
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  '#clock-cells':
>> +    const: 1
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - '#clock-cells'
>> +
>> +additionalProperties: false
>> diff --git a/include/dt-bindings/clock/mediatek,mt6685-clock.h b/include/dt-bindings/clock/mediatek,mt6685-clock.h
>> new file mode 100644
>> index 000000000000..acc5e2e15ce1
>> --- /dev/null
>> +++ b/include/dt-bindings/clock/mediatek,mt6685-clock.h
>> @@ -0,0 +1,17 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
>> +/*
>> + * Copyright (c) 2025 Collabora Ltd.
>> + *                    AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> + */
>> +
>> +#ifndef _DT_BINDINGS_CLK_MT6685_H
>> +#define _DT_BINDINGS_CLK_MT6685_H
>> +
>> +/* SCK_TOP_CKPDN */
>> +#define CLK_RTC_SEC_MCLK		0
>> +#define CLK_RTC_EOSC32			1
>> +#define CLK_RTC_SEC_32K			2
>> +#define CLK_RTC_MCLK			3
>> +#define CLK_RTC_32K			4
>> +
>> +#endif /* _DT_BINDINGS_CLK_MT6685_H */
>> -- 
>> 2.51.1
>>




Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E63BC7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Jun 2025 09:12:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KtKVbSUz1VOi/283k7utQcqq9R04NwSx8lEXZVhq1RI=; b=pHMYg7WLL+QQ/4Zz9emDVN5sPk
	DGKPhsDJzZ8VlAiDNfHQ/AT+dswXb4aJk5QpD9zb2unJdY+oeC7nl8UGXSflgogOKD0yKq71n8dNj
	i8MwD8XpgURmNltCAJTVxSpdTQHG9c170TSryBL64DkdDmZQlddvqGfLp2Hjmfd1YLsHkb/9bBREh
	/sCsNscSCjZpOeXhbZsNgF6ddBucJ5/u2d6LPY1uAcKVJetciJqIKyrL1PK5NHe1k7Cy9aDLWu3og
	glsd28uKhzJOOwcysPSU8o3HoqlUCPTXI3w6gvxXtiF0xPXk7eqXo812pbw/Y0ZQZLGjRPyn3+LJr
	WdKTT1oA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUMBG-000000085K1-368Q;
	Wed, 25 Jun 2025 09:12:34 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uULWp-00000007xjh-0lCY;
	Wed, 25 Jun 2025 08:30:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1750840245;
	bh=GoLMTJ5NvhpYjJ7hIqjrAw3zcslSPMdRspKOkp5l6d8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=G+acDOmu1pxZ24nxZJNj+sUs6llxBi8KdD/86tnqBI8for3Sjrio00+50/56aEAbH
	 EL5Z6lROPfzgq8sayOgsaJJcjE1PIbi7M7kjxfatHPdhdStTXIit/aWlub/jQXI5/e
	 /mWxbU90o2DkznZ2OcNdmC8gB8s2w4L1m8mb5gP1QZUFTQcFfKsx0/n8tqnp94Mg2u
	 8130KW+GT8DrTHkmHm9v+QipXb9aqLAUFrkadDcQB0OkMpSsf3LN6S64n+xzLuphnc
	 ydkIJ69GyiYUkn/AvhSB8caNAurghLHDI99hWaKhogjHE7oSse4jpLnGo9kqGg/9yE
	 ZooY3qML1Y2rw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E609917E017D;
	Wed, 25 Jun 2025 10:30:44 +0200 (CEST)
Message-ID: <40f07604-f4eb-4a7d-88b4-ed29e9242d6e@collabora.com>
Date: Wed, 25 Jun 2025 10:30:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/2] dt-bindings: mfd: Add binding for MediaTek MT6363
 series SPMI PMIC
To: Rob Herring <robh@kernel.org>
Cc: lee@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 matthias.bgg@gmail.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, kernel@collabora.com
References: <20250623120038.108891-1-angelogioacchino.delregno@collabora.com>
 <20250623120038.108891-2-angelogioacchino.delregno@collabora.com>
 <20250625005130.GA2106374-robh@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250625005130.GA2106374-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_013047_384122_73E3F755 
X-CRM114-Status: GOOD (  19.14  )
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

Il 25/06/25 02:51, Rob Herring ha scritto:
> On Mon, Jun 23, 2025 at 02:00:37PM +0200, AngeloGioacchino Del Regno wrote:
>> Add a binding for the MediaTek MT6363/6373 (and similar) multi
>> function PMICs connected over SPMI.
>>
>> These PMICs are found on board designs using newer MediaTek SoCs,
>> such as the Dimensity 9400 Smartphone chip, or the Chromebook
>> MT8196 chip.
>>
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> ---
>>   .../bindings/mfd/mediatek,mt6363.yaml         | 98 +++++++++++++++++++
>>   1 file changed, 98 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/mfd/mediatek,mt6363.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/mfd/mediatek,mt6363.yaml b/Documentation/devicetree/bindings/mfd/mediatek,mt6363.yaml
>> new file mode 100644
>> index 000000000000..2ce57e659d12
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/mfd/mediatek,mt6363.yaml
>> @@ -0,0 +1,98 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/mfd/mediatek,mt6363.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: MediaTek MT6363 series SPMI PMICs multi-function device
>> +
>> +maintainers:
>> +  - AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> +
>> +description: |
>> +  Some MediaTek Power Management ICs (PMICs) found in board designs with
>> +  the Helio, Dimensity and/or Kompanio series of SoCs are interfaced to
>> +  the chip via the System Power Management Interface (SPMI) bus.
>> +
>> +  These PMICs are multi-function devices with various sub modules.
>> +  For example, those may include one, or more of the following:
>> +  - Auxiliary ADC Controller
>> +  - Clock Controller
>> +  - eFuses
>> +  - GPIO Controller
>> +  - Interrupt Controller
>> +  - Keys
>> +  - LEDs Controller
>> +  - Regulators
>> +  - RTC
>> +
>> +properties:
>> +  compatible:
>> +    items:
>> +      - enum:
>> +          - mediatek,mt6363
>> +          - mediatek,mt6373
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  '#address-cells':
>> +    const: 0
>> +
>> +  '#size-cells':
>> +    const: 0
>> +
>> +  interrupts:
>> +    maxItems: 1
>> +
>> +  interrupt-controller: true
>> +
>> +  "#interrupt-cells":
>> +    const: 3
>> +
>> +  adc:
>> +    type: object
>> +    $ref: /schemas/iio/adc/mediatek,mt6359-auxadc.yaml#
>> +    unevaluatedProperties: false
>> +
>> +  regulators:
>> +    type: object
>> +    oneOf:
>> +      - $ref: /schemas/regulator/mediatek,mt6363-regulator.yaml#
>> +      - $ref: /schemas/regulator/mediatek,mt6373-regulator.yaml#
> 
> This causes the schemas to be applied 4 times (2 each). Better if you
> do:
> 
> properties:
>    compatible:
>      contains:
>        enum: [ the compatibles in those schemas ]
> 
> 

Noted, thanks!

>> +    additionalProperties: true
>> +
>> +  keys:
>> +    type: object
>> +    $ref: /schemas/input/mediatek,pmic-keys.yaml
>> +    unevaluatedProperties: false
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - '#address-cells'
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/interrupt-controller/irq.h>
>> +    #include <dt-bindings/spmi/spmi.h>
>> +
>> +    spmi {
>> +      #address-cells = <2>;
>> +      #size-cells = <0>;
>> +
>> +      pmic@4 {
>> +        compatible = "mediatek,mt6363";
>> +        reg = <0x4 SPMI_USID>;
>> +        interrupts = <4 64 IRQ_TYPE_LEVEL_HIGH>;
>> +        interrupt-controller;
>> +        #address-cells = <0>;
>> +        #interrupt-cells = <3>;
>> +
>> +        regulators {
>> +            compatible = "mediatek,mt6363-regulator";
>> +        };
> 
> Make the example complete. with adc and keys nodes.
> 

You mean just adding a

adc {
   compatible = xyz;
};

keys {
   compatible = xyz;
};

right?

I will add the full example in the next version :-)

Thank you!
Angelo

>> +      };
>> +    };
>> -- 
>> 2.49.0
>>




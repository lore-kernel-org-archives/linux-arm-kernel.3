Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71D9DCCF9EA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 10:24:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/NKXZxeacKGxOR1xtLh9538zKINcBqslvUDNS2+6+Rs=; b=qd/vxeAJMXLMO5XbmGLJajxXT5
	RAdJkzRVsvwm4QdwhlK5fjf2HaZbPHlv7eCz5sGxH8A0sgtLK6fSPIsaE2e0fj+QoW99r3vmVkTwT
	opKJORD2Chy3BWeugcjdqKcEIbvtURUUKe0krKDEJ9R6zmeSKyvDE8/oBzvEyMPL/iSpyDaLyP1As
	zsXYcXLaU1V4hAvqYhSSzeBEHS/5uY8LkF3/xcIRUt0f2WaKdEVp4QjG7n6CRTal19EVD+SUmzKWd
	S/TogbbtaBbtt67w9L92dh6i/9Gt3MjzOc7Sif58R4nG+5chzLBx9tVPWWrdwr7le1Gl1mfHZEFbu
	q2jwC94w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDKOM-0000000DeKP-2mJe;
	Mon, 27 Oct 2025 10:23:58 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDKOJ-0000000DeJd-2yTS;
	Mon, 27 Oct 2025 10:23:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1761560633;
	bh=aFMORePwcPTydUz6VlH0qFjjkLxDJNo9Sxr1SvlX4OI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Rd/JJOKkBJ6qfsuqB4Cgu8aRpKGVbvpGEx/Ba7CyBGBbgO/fIWdmBBkbySU5EtwKE
	 JB1+ywk2KG9+72spaR2LMlhL2l7fd2pGl0ExFMZtlMs6Rm9HSFqdQY3wpAAIH92QII
	 P5VqiphDEpMntKyHokuD4Qf9Wpblleqo2yNEhYJx1L42Z/4Z5NNP8S1nhOfEoC79Jr
	 YCIFr7qGrTUi2a6rcqUIclqQGQUk0Y/AM7XUsIj1oMHXABwIybSOWhYWw1eTikrc2+
	 6z0NZIp+EecFE2ZEuggIiVzqF/X+KkkGrYt6HgW05CMEZDfKT091+h2LpBzZxqAXbM
	 DSxMDfhXG5I8Q==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id AC55017E0DC0;
	Mon, 27 Oct 2025 11:23:52 +0100 (CET)
Message-ID: <305a2d9c-92c3-4608-b5f6-57f6db51c08e@collabora.com>
Date: Mon, 27 Oct 2025 11:23:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 1/9] dt-bindings: regulator: Document MediaTek MT6316
 PMIC Regulators
To: Conor Dooley <conor@kernel.org>
Cc: linux-mediatek@lists.infradead.org, lee@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com,
 lgirdwood@gmail.com, broonie@kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 kernel@collabora.com, wenst@chromium.org,
 igor.belwon@mentallysanemainliners.org
References: <20251024083221.25758-1-angelogioacchino.delregno@collabora.com>
 <20251024083221.25758-2-angelogioacchino.delregno@collabora.com>
 <20251024-think-handwoven-504634ca620d@spud>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20251024-think-handwoven-504634ca620d@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_032355_913173_FAB5B86A 
X-CRM114-Status: GOOD (  27.30  )
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

Il 24/10/25 18:29, Conor Dooley ha scritto:
> On Fri, Oct 24, 2025 at 10:32:13AM +0200, AngeloGioacchino Del Regno wrote:
>> Add bindings for the regulators found in the MediaTek MT6316 PMIC,
>> usually found in board designs using the MT6991 Dimensity 9400 and
>> on MT8196 Kompanio SoC for Chromebooks.
>>
>> This chip is fully controlled by SPMI and has multiple variants
>> providing different phase configurations.
>>
>> Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> ---
>>   .../regulator/mediatek,mt6316b-regulator.yaml | 78 +++++++++++++++++++
>>   .../regulator/mediatek,mt6316c-regulator.yaml | 78 +++++++++++++++++++
>>   .../regulator/mediatek,mt6316d-regulator.yaml | 77 ++++++++++++++++++
>>   3 files changed, 233 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/regulator/mediatek,mt6316b-regulator.yaml
>>   create mode 100644 Documentation/devicetree/bindings/regulator/mediatek,mt6316c-regulator.yaml
>>   create mode 100644 Documentation/devicetree/bindings/regulator/mediatek,mt6316d-regulator.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/regulator/mediatek,mt6316b-regulator.yaml b/Documentation/devicetree/bindings/regulator/mediatek,mt6316b-regulator.yaml
>> new file mode 100644
>> index 000000000000..65b70dd90728
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/regulator/mediatek,mt6316b-regulator.yaml
>> @@ -0,0 +1,78 @@
>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/regulator/mediatek,mt6316b-regulator.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: MediaTek MT6316 BP/VP SPMI PMIC Regulators
>> +
>> +maintainers:
>> +  - AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> +
>> +description:
>> +  The MediaTek MT6316BP/VP PMICs are fully controlled by SPMI interface, both
>> +  feature four step-down DC/DC (buck) converters, and provides 2+2 Phases,
>> +  joining Buck 1+2 for the first phase, and Buck 3+4 for the second phase.
>> +
>> +properties:
>> +  compatible:
>> +    const: mediatek,mt6316b-regulator
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +patternProperties:
>> +  "^vbuck(12|34)$":
>> +    type: object
>> +    $ref: regulator.yaml#
>> +    unevaluatedProperties: false
>> +    properties:
>> +      regulator-allowed-modes:
>> +        description: |
>> +          Allowed Buck regulator operating modes allowed. Valid values below.
>> +            0 - Normal mode with automatic power saving, reducing the switching
>> +                frequency when light load conditions are detected
>> +            1 - Forced Continuous Conduction mode (FCCM) for improved voltage
>> +                regulation accuracy with constant switching frequency but lower
>> +                regulator efficiency
>> +            2 - Forced Low Power mode for improved regulator efficiency, used
>> +                when no heavy load is expected, will shut down unnecessary IP
>> +                blocks and secondary phases to reduce quiescent current.
>> +                This mode does not limit the maximum output current but unless
>> +                only a light load is applied, there will be regulation accuracy
>> +                and efficiency losses.
>> +        minItems: 1
>> +        maxItems: 3
>> +        items:
>> +          enum: [ 0, 1, 2 ]
> 
> This property has no default, and the property is not required. Is one
> of these modes the default, or is there another mode beyond what's here
> that is used if the property is absent? Or are all modes allowed with no
> property?
> 

The default is what the bootloader sets before jumping to the kernel... this may
vary from one to the other.

Even though "in theory" the default should be 0, I can't guarantee that this will
really be the default for when Linux boots.... and "resetting" is not possible
(either as a real reset or forcing a default) because those are CPU regulators
and if anything goes wrong the CPUs may freeze execution.

It should be kinda safe to force the default to 0 at boot, but I'm not sure that
I should really take that assumption for granted - I prefer leaving this untouched
and without any "forced" default unless DT specifies some.

So, well, that's why there's no default, and that's why this is not a required
property at the end of the day.

>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - '#address-cells'
> 
> Why is address-cells required here? Your bucks don't have addresses.

Ugh. I forgot it there. No, that's not intentional.

The #address-cells makes no sense here.

> If it is actually required, Rob's bot has pointed out that the property
> isn't defined for the device anyway.
> 
> pw-bot: changes-requested
> 
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/spmi/spmi.h>
>> +
>> +    spmi {
>> +      #address-cells = <2>;
>> +      #size-cells = <0>;
>> +
>> +      pmic@8 {
>> +        compatible = "mediatek,mt6316b-regulator";
>> +        reg = <0x8 SPMI_USID>;
>> +        #address-cells = <0>;
>> +
>> +        vbuck12 {
>> +          regulator-name = "dvdd_core";
>> +          regulator-min-microvolt = <450000>;
>> +          regulator-max-microvolt = <965000>;
>> +          regulator-allowed-modes = <0 1 2>;
>> +          regulator-enable-ramp-delay = <256>;
>> +        };
>> +      };
>> +    };
>> +...




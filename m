Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECC25C28B20
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Apr 2025 09:33:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bZC0Nl3+aiKW4C375QVDYJwGyqTwRQuV77EoOWNqyjc=; b=N2DluIAncmqbNa6s1h2e03fOep
	sChILyXTR0sxUt1znRM52V82fIodKTlayzFoGXJYKsOdEoUg3mbZzGChMjq0/BDlaTV/6s3XYgxmt
	SKzjKkB5DBen7Qu2kd1acwLFj2cH5ajqmBtemZYwz2ilVB3OzHlimWqbieu5DIFwmosjBBpZ25+iq
	VtnEEONw+puyLROhZyclTRvlR3mzdwIOJBdgHzM1EYdrNabwdYI9IiJwy/47SowzaXUnbelhtGXkM
	D97B8F3Awi54BumKxGCRMY004c8rEvlRphS72QpGtHp1sG4yWeWujmG2EXl5nhuIV9xDJSlzYQCTP
	K0Ew6DCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzuTU-00000005hRD-0qzB;
	Wed, 02 Apr 2025 09:33:32 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzuKb-00000005g9v-10oc;
	Wed, 02 Apr 2025 09:24:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1743585859;
	bh=C3XotoUexJAu0axISvav3t2Bl12OZSkmJVdzrk20j4w=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=f9Bo4ohS74A0fke56j5NVf6RcpCx5zkYMAxEJF5Dnfou5QXznemiAIk6JbS4moAyD
	 mEZCgWFbe9JUN8phOpckNscZ0Y0zXq2aBPm1+uOrQ8ZoHhx+DBiubzcV50DkdT9EBD
	 KHcJDHdiKOl42PYvNiJc11RTmRRWeSj+SR8qU9UJU17NoJdxjTpixnsn7DBp7ERUrm
	 pBJmZacGxqKfH26R/U0Gckw6zCnpXOleu+eRvhTyNgNYJyFXCU9a3y7e2OWj9rohOM
	 4zaq9uhtzPX3ez5ma4WRMOv8kmrnkuQ0LlOyGBIiQCkQIMZH9309cd06pkCJWJTkQO
	 IXii4fbJyBeIQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1E5BC17E0809;
	Wed,  2 Apr 2025 11:24:19 +0200 (CEST)
Message-ID: <30ff6b8c-befc-4233-8e61-c131b1f037ff@collabora.com>
Date: Wed, 2 Apr 2025 11:24:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v3,1/2] dt-bindings: memory-controllers: Add MediaTek DRAM
 controller interface
To: =?UTF-8?B?Q3J5c3RhbCBHdW8gKOmDreaZtik=?= <Crystal.Guo@mediatek.com>,
 "robh@kernel.org" <robh@kernel.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "krzk@kernel.org" <krzk@kernel.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>
Cc: "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
References: <20250326063041.7126-1-crystal.guo@mediatek.com>
 <20250326063041.7126-2-crystal.guo@mediatek.com>
 <fb154077-e650-480e-a4d7-0a141b563dfc@collabora.com>
 <4bad42c867a838da413154fa0a779547d642642c.camel@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <4bad42c867a838da413154fa0a779547d642642c.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250402_022421_436505_A41C074F 
X-CRM114-Status: GOOD (  15.46  )
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

Il 02/04/25 05:51, Crystal Guo (郭晶) ha scritto:
> On Wed, 2025-03-26 at 11:18 +0100, AngeloGioacchino Del Regno wrote:
>> External email : Please do not click links or open attachments until
>> you have verified the sender or the content.
>>
>>
>> Il 26/03/25 07:30, Crystal Guo ha scritto:
>>> A MediaTek DRAM controller interface to provide the current DDR
>>> data rate.
>>>
>>> Signed-off-by: Crystal Guo <crystal.guo@mediatek.com>
>>> ---
>>>    .../memory-controllers/mediatek,dramc.yaml    | 44
>>> +++++++++++++++++++
>>>    1 file changed, 44 insertions(+)
>>>    create mode 100644 Documentation/devicetree/bindings/memory-
>>> controllers/mediatek,dramc.yaml
>>>
>>> diff --git a/Documentation/devicetree/bindings/memory-
>>> controllers/mediatek,dramc.yaml
>>> b/Documentation/devicetree/bindings/memory-
>>> controllers/mediatek,dramc.yaml
>>> new file mode 100644
>>> index 000000000000..8bdacfc36cb5
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/memory-
>>> controllers/mediatek,dramc.yaml
>>
>> The filename should be "mediatek,mt8196-dramc.yaml"
>>
> 
> For other MediaTek SOCs, the method of calculating current ddr data
> rate is similar to that of MT8196. After changing "mediatek,dramc.yaml"
> to "mediatek,mt8196-dramc.yaml", would future Mediatek SOCs need to add
> a separate yaml file again? or could they reuse mediatek,mt8196-
> dramc.yaml? Thank you for your guidance.
> 

Other MediaTek SoC will be able to reuse mediatek,mt8196-dramc.yaml if the
hardware is similar.

Cheers,
Angelo

> Best regards,
> Crystal
> 
>>
>>> @@ -0,0 +1,44 @@
>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>> +# Copyright (c) 2025 MediaTek Inc.
>>> +%YAML 1.2
>>> +---
>>> +$id:
>>> https://urldefense.com/v3/__http://devicetree.org/schemas/memory-controllers/mediatek,dramc.yaml*__;Iw!!CTRNKA9wMg0ARbw!gH5hMTJ34ZcYfNMfLUNL-dH9SMyQGr06kJ4jij1anezByF7IBOSbkYNdqysgHoz-rSRNwM9r6RaaTC1MO2882ojif26oaBzg$
>>> +$schema:
>>> https://urldefense.com/v3/__http://devicetree.org/meta-schemas/core.yaml*__;Iw!!CTRNKA9wMg0ARbw!gH5hMTJ34ZcYfNMfLUNL-dH9SMyQGr06kJ4jij1anezByF7IBOSbkYNdqysgHoz-rSRNwM9r6RaaTC1MO2882ojifw8f6sUH$
>>> +
>>> +title: MediaTek DRAM Controller (DRAMC)
>>> +
>>> +maintainers:
>>> +  - Crystal Guo <crystal.guo@mediatek.com>
>>> +
>>> +description:
>>> +  A MediaTek DRAM controller interface to provide the current data
>>> rate of DRAM.
>>> +
>>> +properties:
>>> +  compatible:
>>> +    items:
>>> +      - enum:
>>> +          - mediatek,mt8196-dramc
>>
>> P.S.: bindings maintainers: this driver is expected to get more
>> compatibles soon.
>>
>> Cheers,
>> Angelo
>>
>>
>>> +
>>> +  reg:
>>> +    items:
>>> +      - description: anaphy registers
>>> +      - description: ddrphy registers
>>> +
>>> +additionalProperties: false
>>> +
>>> +required:
>>> +  - compatible
>>> +  - reg
>>> +
>>> +examples:
>>> +  - |
>>> +    soc {
>>> +        #address-cells = <2>;
>>> +        #size-cells = <2>;
>>> +
>>> +        memory-controller@10236000 {
>>> +            compatible = "mediatek,mt8196-dramc";
>>> +            reg = <0 0x10236000 0 0x2000>,
>>> +                  <0 0x10238000 0 0x2000>;
>>> +        };
>>> +    };
>>
>>


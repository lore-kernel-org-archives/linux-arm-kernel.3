Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15C96C83030
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Jul 2025 09:09:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kwiVJneQVf/VtDHcWot/MPQfEPz0Z500X9dQlHVEMzQ=; b=aktU3KLkGtm4SOwSjjlG5mvYyR
	+vGmVzfgCuuMPe5Qxm6OVILB3B+3UfBl6SDGj+qqyIGBB9wRzAkQyqpWAOM2ZnStCDwcF3Hw/ZrZo
	9eJvgNAXujxx8q0FBej3EN6jgf01NJc3y+O8JuT1bcbkgloX4uV774Obcu6VQeMJ+br1r7C4NgOts
	j7a3jZBzXFFSojGMx/75AEkPd5fJvZHz6Qim0fDskyMphyckHvHp4bG/dVcLPuIHxezG7egFXb/xf
	YbzJsy+cc8Q+yZsXOvWKHprq1nkPxoUh/ZzDJQNXnVS2U0kuTFakUKN5HMz3L6bCH4508wvFdUn9S
	EK84NGhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXFwJ-0000000AmOG-3RbC;
	Thu, 03 Jul 2025 09:09:07 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXFtF-0000000Am2S-1GSc;
	Thu, 03 Jul 2025 09:06:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1751533554;
	bh=o7ihHA2Q35n6QKlFvsZKa9COyquLcNt5mCn8m+1tFU8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=jD2rqfu8XGYNUbVU7GBmmeROYTve58GYtMAlKIznmihPhxQr0RthkFGL10O/fgbFc
	 2y2G6+HFHYkbohoVTDR5PxfvNLW9FNZUG/VqqnE4jt2ysvXAbflmEYHyBNVjDGwPhn
	 sDzox8Wisz+jgc5HOP1FKtgMQWaHZDqsBeFbzGqYDK2T6h2Lpla3Uu4bVtzomaboIK
	 jp7edKX2qlTrbS828NQJyFrZ+92m1WG+FPbD3bOYBixS7kDsYyg93bMVhVXCLx6ms5
	 c5WAF9pukJnAm4c7UMVSZLa0xpv2PaKE+RlHmVMSvwse7uMlC4hdj1IW92x646BqMl
	 6DrvKRLIb0LCw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 807BB17E07C9;
	Thu,  3 Jul 2025 11:05:53 +0200 (CEST)
Message-ID: <61784658-c71d-458b-8934-5f5db2330bc0@collabora.com>
Date: Thu, 3 Jul 2025 11:05:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: dsp: mediatek: add mt8196 dsp
 document
To: Krzysztof Kozlowski <krzk@kernel.org>,
 "hailong.fan" <hailong.fan@mediatek.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 sound-open-firmware@alsa-project.org, linux-sound@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20250703075632.20758-1-hailong.fan@mediatek.com>
 <20250703075632.20758-2-hailong.fan@mediatek.com>
 <defd70cb-4351-4b0b-b4d0-dd1ff831615c@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <defd70cb-4351-4b0b-b4d0-dd1ff831615c@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_020557_521404_030BA8DF 
X-CRM114-Status: GOOD (  17.45  )
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

Il 03/07/25 10:08, Krzysztof Kozlowski ha scritto:
> On 03/07/2025 09:56, hailong.fan wrote:
>> From: Hailong Fan <hailong.fan@mediatek.com>
>>
>> This patch adds mt8196 dsp document. The dsp is used for Sound Open
> 
> Please do not use "This commit/patch/change", but imperative mood. See
> longer explanation here:
> https://elixir.bootlin.com/linux/v5.17.1/source/Documentation/process/submitting-patches.rst#L95
> 
>> Firmware driver node. It includes registers,  clocks, memory regions,
>> and mailbox for dsp.
>>
>> Signed-off-by: Hailong Fan <hailong.fan@mediatek.com>
>> ---
>>   .../bindings/sound/mediatek,mt8196-dsp.yaml   | 95 +++++++++++++++++++
>>   1 file changed, 95 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/sound/mediatek,mt8196-dsp.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/sound/mediatek,mt8196-dsp.yaml b/Documentation/devicetree/bindings/sound/mediatek,mt8196-dsp.yaml
>> new file mode 100644
>> index 000000000000..68f594f476e8
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/sound/mediatek,mt8196-dsp.yaml

Wrong folder; this should go to dsp/mediatek,mt8196-dsp.yaml ....

...but then I don't get why MT8196 wasn't simply added to mediatek,mt8186-dsp.yaml.

>> @@ -0,0 +1,95 @@
>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/sound/mediatek,mt8196-dsp.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: MediaTek mt8196 DSP core
>> +
>> +maintainers:
>> +  - Hailong Fan <hailong.fan@mediatek.com>
>> +
>> +description: The MediaTek mt8196 SoC mt8196 contain a DSP core used for advanced
> 
> Missing blank line. Look at other bindings. Also does not look wrapped
> at 80 (see Linux coding style doc).
> 

There's also a typo, "mt8196 SoC mt8196"

> 
>> +  pre- and post- audio processing.
>> +
>> +properties:
>> +  compatible:
>> +    const: mediatek,mt8196-dsp
>> +
>> +  reg:
>> +    items:
>> +      - description: DSP configuration registers
>> +      - description: DSP SRAM
>> +      - description: DSP secure registers
>> +      - description: DSP bus registers
>> +
>> +  reg-names:
>> +    items:
>> +      - const: cfg
>> +      - const: sram
>> +      - const: sec
>> +      - const: bus
>> +
>> +  clocks:
>> +    items:
>> +      - description: mux for dsp clock
>> +      - description: 26M clock
>> +      - description: ADSP PLL clock
>> +
>> +  clock-names:
>> +    items:
>> +      - const: adsp_sel
> 
> Isn't this called audiodsp in other bindings?
> 
>> +      - const: clk26m
> 
> Don't use frequencies. How is the pin or input called in datasheet? How
> other devices call it?

In the datasheet, this is called.... CLK26M (really).

Cheers,
Angelo

> 
>> +      - const: adsppll
>> +
>> +  power-domains:
>> +    maxItems: 1
>> +
> Best regards,
> Krzysztof




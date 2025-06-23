Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C180EC7115B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Jun 2025 15:55:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ADz6F7CrU2KqMVcYLuKYCByXywfkZmHQX21wBOfuK50=; b=h9Cui9N682/ICUak+BK/P/EpO4
	BvDvXMJvlSprjmxkMXvikbDXT08vJmGGcYZan75zqNB9azJu4Ww7xZ4MvD5ik19suVtYJprzNbcgc
	POIjj9Kw2ay4a4vWbUp44hf/Osng6EKLfEi5RqD3RRcs9dMzM7O6bX+CEwb315DZdcv1hTQ4ynJem
	afIKRfHxULNHMLVcg2K3YfERzF7/Lfpq8woQ8zIzoF2m+cqipaYWCBt3WM0ZtNrqqxVzqK9fUTRC/
	30U/PK4JAGi1PGNPj7+JA21TzdPiIC72Wr5FuHaUOKsCiKnDWOdDE/NZyYHff8Anj+2sQ5yHk2Yn5
	37Tz8H/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTjW1-00000003K4P-2z1r;
	Mon, 23 Jun 2025 15:55:25 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTgHR-00000002glg-0cET;
	Mon, 23 Jun 2025 12:28:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1750681687;
	bh=L3lwm4Q79M0itc0l84wAC7ShG2c5tjBD0AKvgW2+PHg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=A1PlZFFGfM1WxjDwRSi2gG2bnXsvodBiTa3IQX1Iaqlw1rzqHEZu4rjeDYU7YymrS
	 TCWH9rVwp06kgswjOGnb6hXnZoKxsBD3wwoRVboOoKyYG9BRPbGmeImTCUHH/rsYwI
	 0nfJV9ok/6U9iROToQz4yqnQys6R9wgSe9qii2e4SiRvlX/JS6NPa8W345gEgv4q+m
	 vwxFXZJWXf14HR0LFYOmY5BQnht6y1p5dKbKvSH+ey94HnIFGcVWrRO9bp2Sd0qway
	 NQqHJP+VZ6+ezTOPKrU94Y+6QHfpovYna7+oXgpTfuiGcBrcofvC1Xmr7UmAbWf1Ol
	 MHpyJe1JyCnJg==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id BBA1417E05BD;
	Mon, 23 Jun 2025 14:28:06 +0200 (CEST)
Message-ID: <b21b9865-7344-45ab-8f03-09cbd8b961b5@collabora.com>
Date: Mon, 23 Jun 2025 14:28:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/30] dt-bindings: clock: mediatek: Describe MT8196
 peripheral clock controllers
To: Krzysztof Kozlowski <krzk@kernel.org>, Laura Nao
 <laura.nao@collabora.com>, mturquette@baylibre.com, sboyd@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 matthias.bgg@gmail.com, p.zabel@pengutronix.de, richardcochran@gmail.com
Cc: guangjie.song@mediatek.com, wenst@chromium.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
 kernel@collabora.com
References: <20250623102940.214269-1-laura.nao@collabora.com>
 <20250623102940.214269-10-laura.nao@collabora.com>
 <ef64816f-0ba2-4a12-bef8-aa10e44793e1@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <ef64816f-0ba2-4a12-bef8-aa10e44793e1@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_052809_342496_A8218022 
X-CRM114-Status: GOOD (  15.01  )
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

Il 23/06/25 14:12, Krzysztof Kozlowski ha scritto:
> On 23/06/2025 12:29, Laura Nao wrote:
>> +properties:
>> +  compatible:
>> +    items:
>> +      - enum:
>> +          - mediatek,mt8196-adsp
>> +          - mediatek,mt8196-imp-iic-wrap-c
>> +          - mediatek,mt8196-imp-iic-wrap-e
>> +          - mediatek,mt8196-imp-iic-wrap-n
>> +          - mediatek,mt8196-imp-iic-wrap-w
>> +          - mediatek,mt8196-mdpsys0
>> +          - mediatek,mt8196-mdpsys1
>> +          - mediatek,mt8196-pericfg-ao
>> +          - mediatek,mt8196-pextp0cfg-ao
>> +          - mediatek,mt8196-pextp1cfg-ao
>> +          - mediatek,mt8196-ufscfg-ao
>> +          - mediatek,mt8196-vencsys
>> +          - mediatek,mt8196-vencsys-c1
>> +          - mediatek,mt8196-vencsys-c2
>> +          - mediatek,mt8196-vdecsys
>> +          - mediatek,mt8196-vdecsys-soc
>> +      - const: syscon
> 
> Why everything is syscon?
> 
> 
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  '#clock-cells':
>> +    const: 1
>> +
>> +  '#reset-cells':
>> +    const: 1
>> +
>> +  mediatek,hardware-voter:
>> +    $ref: /schemas/types.yaml#/definitions/phandle
>> +    description: A phandle of the hw voter node
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - '#clock-cells'
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    pericfg_ao: clock-controller@16640000 {
>> +        compatible = "mediatek,mt8196-pericfg-ao", "syscon";
>> +        reg = <0x16640000 0x1000>;
>> +        mediatek,hardware-voter = <&scp_hwv>;
>> +        #clock-cells = <1>;
>> +    };
>> +  - |
>> +    pextp0cfg_ao: clock-controller@169b0000 {
>> +        compatible = "mediatek,mt8196-pextp0cfg-ao", "syscon";
>> +        reg = <0x169b0000 0x1000>;
>> +        #clock-cells = <1>;
>> +        #reset-cells = <1>;
>> +    };
>> diff --git a/Documentation/devicetree/bindings/clock/mediatek,mt8196-sys-clock.yaml b/Documentation/devicetree/bindings/clock/mediatek,mt8196-sys-clock.yaml
>> new file mode 100644
>> index 000000000000..363ebe87c525
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/clock/mediatek,mt8196-sys-clock.yaml
>> @@ -0,0 +1,76 @@
>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/clock/mediatek,mt8196-sys-clock.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: MediaTek System Clock Controller for MT8196
>> +
>> +maintainers:
>> +  - Guangjie Song <guangjie.song@mediatek.com>
>> +  - Laura Nao <laura.nao@collabora.com>
>> +
>> +description: |
>> +  The clock architecture in MediaTek SoCs is structured like below:
>> +  PLLs -->
>> +          dividers -->
>> +                      muxes
>> +                           -->
>> +                              clock gate
>> +
>> +  The apmixedsys, apmixedsys_gp2, vlpckgen, armpll, ccipll, mfgpll and ptppll
>> +  provide most of the PLLs which are generated from the SoC's 26MHZ crystal oscillator.
>> +  The topckgen, topckgen_gp2 and vlpckgen provide dividers and muxes which
>> +  provide the clock source to other IP blocks.
>> +
>> +properties:
>> +  compatible:
>> +    items:
>> +      - enum:
>> +          - mediatek,mt8196-apmixedsys
>> +          - mediatek,mt8196-armpll-b-pll-ctrl
>> +          - mediatek,mt8196-armpll-bl-pll-ctrl
>> +          - mediatek,mt8196-armpll-ll-pll-ctrl
>> +          - mediatek,mt8196-apmixedsys-gp2
>> +          - mediatek,mt8196-ccipll-pll-ctrl
>> +          - mediatek,mt8196-mfgpll-pll-ctrl
>> +          - mediatek,mt8196-mfgpll-sc0-pll-ctrl
>> +          - mediatek,mt8196-mfgpll-sc1-pll-ctrl
>> +          - mediatek,mt8196-ptppll-pll-ctrl
>> +          - mediatek,mt8196-topckgen
>> +          - mediatek,mt8196-topckgen-gp2
>> +          - mediatek,mt8196-vlpckgen
>> +      - const: syscon
> 
> Why everything is syscon?

Like all other MediaTek SoCs - each sub-IP has its own clock controller, and all
of those sub-IPs have part of the system controller.

It's just a MediaTek SoC being a... MediaTek SoC.

> 
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  '#clock-cells':
>> +    const: 1
>> +
>> +  mediatek,hardware-voter:
>> +    $ref: /schemas/types.yaml#/definitions/phandle
>> +    description: A phandle of the hw voter node
> 
> Do not copy property name to description, but say something useful - for
> what? And why this cannot be or is not a proper interconnect?
> 

Laura, please check the commit description of my power domains HWV patches
here: 20250623120154.109429-8-angelogioacchino.delregno@collabora.com

...and follow what krzk just said which... well, my bad for not complaining
about this during internal reviewing.

>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - '#clock-cells'
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    apmixedsys_clk: syscon@10000800 {
>> +        compatible = "mediatek,mt8196-apmixedsys", "syscon";
>> +        reg = <0x10000800 0x1000>;
>> +        #clock-cells = <1>;
>> +    };
>> +  - |
>> +    topckgen: syscon@10000000 {
>> +        compatible = "mediatek,mt8196-topckgen", "syscon";
>> +        reg = <0x10000000 0x800>;
>> +        mediatek,hardware-voter = <&scp_hwv>;
>> +        #clock-cells = <1>;
>> +    };
>> +
> 
> 
> 
>> +#define CLK_OVL1_DLO9					56
>> +#define CLK_OVL1_DLO10					57
>> +#define CLK_OVL1_DLO11					58
>> +#define CLK_OVL1_DLO12					59
>> +#define CLK_OVL1_OVLSYS_RELAY0				60
>> +#define CLK_OVL1_OVL_INLINEROT0				61
>> +#define CLK_OVL1_SMI					62
>> +
>> +
>> +/* VDEC_SOC_GCON_BASE */
>> +#define CLK_VDE1_LARB1_CKEN				0
>> +#define CLK_VDE1_LAT_CKEN				3
> 
> IDs increment by 1, not 3.

Thank you, Krzysztof - sharp as always!

Cheers,
Angelo



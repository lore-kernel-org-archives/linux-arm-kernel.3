Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C5EECA0EE8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 12:10:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b/dE4mp9T9g6U5Crnwn6t09oySveukwlgTiFOIkpsyE=; b=yZa3kQNCcXFZB56I8HAJ3mVDUc
	+aNDJvMbZV9AVgpt1ZcwiqWttv8DPIVQxZMhGpBCgjc1gMsSOFQdx0B32dN6Xamj05Imz9Q6QHFpQ
	nhuV8TB3lj7s290p4oVyP6IEKI24w2py9L3wfOhnLa1L+Kc5oErCRb42Uv2WnCSfxtGw73nRXfhQv
	gwXKffzIhUiHY4PsRM2FarBwBQnlNMl/caRuAn+EcX8h0T9S2l+4yNIAtCho8rQTH6lTBPHGtqOQ5
	aj64TXyf9mvPWnnYuPApHckUB33GWihH6U5oKkGdmOMBPc/8N35C3dMEv+XvwucSkjUT+DVU2oIlb
	yTcPB+pQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyqzc-0000000BEzb-11Dg;
	Wed, 17 Sep 2025 12:10:36 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyqzZ-0000000BEyH-1xGc;
	Wed, 17 Sep 2025 12:10:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1758111031;
	bh=hAQ+KeN3VG0PfLLgQCMRkpaPl35eqWnQFwZD5PcHz08=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=TYpfTG8XL04KY+XUYVK5Pt3SCSUH1lzm0/hI+mgoqyqL112T0nyZ6rLa8C25X+UWL
	 iAAVy3iy+8cpCsXvrYWFgak7/mX8B+81nXiklDmwuU0PxzmQJRdJLEDYMLOoCeFB3P
	 lVS4LfZU2Th2Qzf3j63PABPdxjFUHoxD02UdtvtTPSXkPnPEpeYejsYEEEa/rAX+fX
	 kpE5h1nFpPE4FqkvYX6ytwMw8t8Q6k6Fvo1abiDIOx2iSYJmFAd13U8GeXnUR09u+V
	 EgQhybbOQ5ehgsY3v7KYNzom+RDroDzs5A8UZNY4Xbz9wkiXh/cRIn8tDte3Hg1+IJ
	 DNMSCBaqS7MWA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5909917E00EC;
	Wed, 17 Sep 2025 14:10:30 +0200 (CEST)
Message-ID: <27deb3bf-7b93-4049-b3a4-b0c9bfcb5c43@collabora.com>
Date: Wed, 17 Sep 2025 14:10:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] dt-bindings: dsp: mediatek: add mt8196 dsp
 document
To: "hailong.fan" <hailong.fan@mediatek.com>, Rob Herring <robh@kernel.org>,
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
References: <20250917075336.5985-1-hailong.fan@mediatek.com>
 <20250917075336.5985-2-hailong.fan@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250917075336.5985-2-hailong.fan@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_051033_668399_E9D3B333 
X-CRM114-Status: GOOD (  19.16  )
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

Il 17/09/25 09:53, hailong.fan ha scritto:
> From: Hailong Fan <hailong.fan@mediatek.com>
> 
> Add device tree binding documentation for the MediaTek
> MT8196 DSP. The DSP is used by the Sound Open Firmware
> driver node and includes registers, clocks, memory regions,
> and a mailbox for DSP communication.
> 
> Signed-off-by: Hailong Fan <hailong.fan@mediatek.com>
> ---
>   .../bindings/dsp/mediatek,mt8196-dsp.yaml     | 98 +++++++++++++++++++
>   1 file changed, 98 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/dsp/mediatek,mt8196-dsp.yaml
> 
> diff --git a/Documentation/devicetree/bindings/dsp/mediatek,mt8196-dsp.yaml b/Documentation/devicetree/bindings/dsp/mediatek,mt8196-dsp.yaml
> new file mode 100644
> index 000000000000..af0f9d71200f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/dsp/mediatek,mt8196-dsp.yaml
> @@ -0,0 +1,98 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/dsp/mediatek,mt8196-dsp.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek mt8196 DSP core

mt->MT (MT8196)

> +
> +maintainers:
> +  - Hailong Fan <hailong.fan@mediatek.com>
> +
> +description: |

Drop the colon |, you don't need it.


> +  The MediaTek mt8196 SoC contains a DSP core used for advanced pre-

mt->MT (MT8196)

Also document *which* DSP core this SoC contains. Specifically, say that this SoC
contains a dual-core Cadence HiFi5 Audio Engine DSP - because this is what it is.

> +  and post-audio processing. This DSP is typically used by the Sound
> +  Open Firmware (SOF) driver and requires registers, clocks, memory
> +  regions, and a mailbox for communication.

..snip..

> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/mt8196-clk.h>
> +    #include <dt-bindings/power/mt8196-power.h>

Before including binding headers with the same names as downstream, refer to the
series that are currently on the mailing lists, because that's what will ultimately
get upstream.

dt-bindings/clock/mediatek,mt8196-clock.h
dt-bindings/power/mediatek,mt8196-power.h

> +    adsp@1a000000 {
> +        compatible = "mediatek,mt8196-dsp";
> +        reg = <0x1a000000 0x5000>,
> +              <0x1a210000 0x80000>,
> +              <0x1a345000 0x300>,
> +              <0x1a00f000 0x1000>;
> +        reg-names = "cfg", "sram", "sec", "bus";
> +        clocks = <&cksys_clk CLK_CK_ADSP_SEL>,
> +                 <&cksys_clk CLK_CK_TCK_26M_MX9>,
> +                 <&cksys_clk CLK_CK_ADSPPLL>;

and use the upstream names for those clocks.

<&topckgen CLK_TOP_ADSP>,
<&clk26m>,
<&apmixedsys CLK_APMIXED_ADSPPLL>,

> +        clock-names = "audiodsp",
> +                      "sys_clk",
> +                      "adsppll";

clock-names fit in one line; plus, please "sys-clk" instead.

> +        power-domains = <&scpsys MT8196_POWER_DOMAIN_ADSP_TOP_DORMANT>;

power-domains = <&spm MT8196_POWER_DOMAIN_ADSP_TOP_DORMANT>;

> +        mboxes = <&adsp_mailbox0>, <&adsp_mailbox1>;
> +        mbox-names = "rx", "tx";
> +    };

Regards,
Angelo


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 805DCC28B30
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Mar 2025 07:51:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uIwzt+9VCsNE+L08cEPAM8E0m07suyLl/olOGPNabFU=; b=edD+26yIflVmw4UCOmSukh5w01
	M1M+bM+WcMBPDIQ/ovBmZRPR546ZflvXr8QQVTVgu5p1m9RnMtplQ4oYjJJxFFs4V6WRaIZbggZ8h
	+SlD9nr7Pawijxv1RUgLHwWMw2DpsjH8XQaigeBTiOBakNcEfhpR+o0BvXaNYtYXY/zojbZeNs9tM
	e6ATTowEdzjzQ1zPycp6azHpmo28fbYf202ga1liZD5PJnM1kKyerOkWxGgiKo0W6qy/muKAbtXa6
	+MDki8q/S5ODbED3rLg4fa2R6XU2qzNpAYC5ILa/AkLsrCczlFmlszxzmjTYwvlpVvlgHN8OTvDaP
	8cngly6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvAgY-0000000BSX8-3Hih;
	Thu, 20 Mar 2025 07:51:26 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvAeq-0000000BRto-2oQo;
	Thu, 20 Mar 2025 07:49:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id EF1A55C118F;
	Thu, 20 Mar 2025 07:47:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0A72C4CEDD;
	Thu, 20 Mar 2025 07:49:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742456979;
	bh=CuA49i30/31eyy2ImyzsQrPw/ocmxxknakwwfXAeSt0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=snS1grv8KtR8otHUudpGt37sgc1u2VrceAhX+ZFxSovi1HqKAm1OE7NRuF2nPjR4L
	 auW1qKfYw3vIvn5+AcBSMWOJv6O7Z896sGVvssMBsUk0mx2XkbvxAVHjkNYiiRmVuj
	 9UduaACNpOb9Og9PLSRuGxK/sspaJHfS0DJV2+sJDUpovUaheyJ7gVxzVkotQ5WP2R
	 /gh+fRBeiEBBjN0cllZ5JM7F2hUEIG5KgYGoe/HOwQscrVbB8DTRbMoi+4kwcrkcvs
	 KhKgIUNJRgad22N/A21ryTSgOUNrEx1Lnzojut2FRu+jG3mbSYKKs4++tq6I7LjVZs
	 CLOeHT0LZmC4A==
Date: Thu, 20 Mar 2025 08:49:36 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: "hailong.fan" <hailong.fan@mediatek.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, Bard Liao <yung-chuan.liao@linux.intel.com>, 
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, Daniel Baluta <daniel.baluta@nxp.com>, 
	Kai Vehmanen <kai.vehmanen@linux.intel.com>, Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, 
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	sound-open-firmware@alsa-project.org, linux-sound@vger.kernel.org, 
	Project_Global_Chrome_Upstream_Group@mediatek.com, Jjian.Zhou@mediatek.com, Xiangzhi.Tang@mediatek.com
Subject: Re: [PATCH 2/2] dt-bindings: dsp: mediatek: add mt8196 dsp document
Message-ID: <20250320-divergent-soft-bird-bcd938@krzk-bin>
References: <20250320031753.13669-1-hailong.fan@mediatek.com>
 <20250320031753.13669-3-hailong.fan@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250320031753.13669-3-hailong.fan@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250320_004940_817913_FF194191 
X-CRM114-Status: GOOD (  20.77  )
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

On Thu, Mar 20, 2025 at 11:17:25AM +0800, hailong.fan wrote:
> This patch adds mt8196 dsp document. The dsp is used for Sound Open
> Firmware driver node. It includes registers,  clocks, memory regions,
> and mailbox for dsp.
> 
> Signed-off-by: hailong.fan <hailong.fan@mediatek.com>

Don't use login as full name, but proper Latin-alphabet transcription or
original name in UTF.

This cannot be tested due to dependency, so limited review.

> ---
>  .../bindings/dsp/mediatek,mt8196-dsp.yaml     | 96 +++++++++++++++++++

Don't grow dsp directory. Either this is remoteproc or some sound
component, so place it accordingly.

>  1 file changed, 96 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/dsp/mediatek,mt8196-dsp.yaml
> 
> diff --git a/Documentation/devicetree/bindings/dsp/mediatek,mt8196-dsp.yaml b/Documentation/devicetree/bindings/dsp/mediatek,mt8196-dsp.yaml
> new file mode 100644
> index 000000000000..62bcd97bd0f4
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/dsp/mediatek,mt8196-dsp.yaml
> @@ -0,0 +1,96 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/dsp/mediatek,mt8196-dsp.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Mediatek mt8196 DSP core
> +
> +maintainers:
> +  - Hailong Fan <hailong.fan@mediatek.com>
> +
> +description: |

Do not need '|' unless you need to preserve formatting.

> +  Some boards from mt8196 contain a DSP core used for

Boards or MT8196? If boards, how is this related to SoC in the first
place? Thus wrong compatible.

> +  advanced pre- and post- audio processing.
> +
> +properties:
> +  compatible:
> +    const: mediatek,mt8196-dsp

If this is part of the SoC, then wrong description.

> +
> +  reg:
> +    items:
> +      - description: Address and size of the DSP Cfg registers

s/Address and size of the//

Write concise and accurate description. This cannot be anything else, so
no need to state obvious.

> +      - description: Address and size of the DSP SRAM
> +      - description: Address and size of the DSP secure registers
> +      - description: Address and size of the DSP bus registers
> +
> +  reg-names:
> +    items:
> +      - const: cfg
> +      - const: sram
> +      - const: sec
> +      - const: bus
> +
> +  clocks:
> +    items:
> +      - description: mux for dsp clock
> +      - description: 26M clock
> +      - description: ADSP PLL clock
> +
> +  clock-names:
> +    items:
> +      - const: adsp_sel
> +      - const: clk26m
> +      - const: adsppll
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  mboxes:
> +    items:
> +      - description: mailbox for receiving audio DSP requests.
> +      - description: mailbox for transmitting requests to audio DSP.
> +
> +  mbox-names:
> +    items:
> +      - const: rx
> +      - const: tx
> +
> +  memory-region:
> +    items:
> +      - description: dma buffer between host and DSP.
> +      - description: DSP system memory.
> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - clocks
> +  - clock-names
> +  - power-domains
> +  - mbox-names
> +  - mboxes
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/mt8196-clk.h>
> +    #include <dt-bindings/power/mt8196-power.h>
> +    adsp: adsp@1a000000 {

Drop unused label

> +        compatible = "mediatek,mt8196-dsp";
> +        reg = <0x1a000000 0x5000>,
> +              <0x1a210000 0x80000>,
> +              <0x1a345000 0x300>,
> +              <0x1a00f000 0x1000>;
> +        reg-names = "cfg", "sram", "sec", "bus";
> +        power-domains = <&scpsys MT8196_POWER_DOMAIN_ADSP_TOP_DORMANT>;
> +        clocks = <&cksys_clk CLK_CK_ADSP_SEL>,
> +                 <&cksys_clk CLK_CK_TCK_26M_MX9>,
> +                 <&cksys_clk CLK_CK_ADSPPLL>;
> +        clock-names = "adsp_sel",
> +                      "clk26m",
> +                      "adsppll";
> +        mbox-names = "rx", "tx";
> +        mboxes = <&adsp_mailbox0>, <&adsp_mailbox1>;

Reverse order of mboxes and mbox-names properties. xxx-names follows the
xxx.

Best regards,
Krzysztof



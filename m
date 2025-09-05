Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC131CA1013
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  6 Sep 2025 00:14:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LtsMrUNIkQ4zM9Z4X+nbHG1Dt3TB9t+rJKx/WZzZMfg=; b=BqGw00K12tUM8vc6rh5R8NlNCi
	p1l96wbu3JK5MuVcd5CbN9KQhA95SIlXu2+ixJ224aHEI0OpqGS0kuQ2x3Gc/Aqt2pIWOS5FC2q4B
	C8uAE4K3vN2FzxO4JP9NQErUjfv0Egvd3w3ilhm3CCjeN950/qL3LszsLYe7ljAH4/V0pzDUOMpBX
	K41NdpvlaRZFEqnAGqFvJTR0XxF89Z79PS2uCVJJqvY825Un98l6PksjYx1uyGS22541Dpgig/JG2
	VZM2Cwqjm9I5Y0M4xH15lmiXwaT9y4YgjcIMAgLv2zsOig6p/IMzZG4WOr8EXwhmYWYs+/bIEF1ti
	jJBJEP8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uugZL-00000005YMO-2dWW;
	Sat, 06 Sep 2025 00:14:15 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uufHl-000000057m9-42Y5;
	Fri, 05 Sep 2025 22:52:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 406C341AE5;
	Fri,  5 Sep 2025 22:52:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E45ADC4CEF1;
	Fri,  5 Sep 2025 22:52:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757112721;
	bh=l60dkoYMQd6R7LAx2baVP55rb2TCT2FRvS6OPwDjEa0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cClxvj29M2e3KDkIgkmiYUfSDXzkuWy5oUvjb5kkZYK7M+gMzJfrS+K8ugUEG/Are
	 3bDD/BJtCbkpp1dm7GZ6CNvMR5U2Duvz0eauHAYO7fDOofXFT7WmKtFFCcAB+NhYTd
	 tbmrsKNllGTVtO4Eh7QYGJdtwZE/FHsAB0wc4FONERWLlShJz4UeLO9KHH9Zud3JJS
	 xQeiwoxfwPFDmhnoMB7LWQJgaOKwkd8ukuEjN/8KvGWk7tgN0/A8MQ/fNkp5bAGaNO
	 HnE8IbzwVitZTLFh7drome8VLwXrSDe5rMUaHfOJcP3G2MwvDjx+irD+T0JM5EzTGu
	 Ghrt/79VY4Oeg==
Date: Fri, 5 Sep 2025 17:52:00 -0500
From: Rob Herring <robh@kernel.org>
To: Cyril Chao <Cyril.Chao@mediatek.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Darren Ye <darren.ye@mediatek.com>, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v2 09/10] ASoC: dt-bindings: mediatek,mt8189-nau8825: add
 mt8189-nau8825 document
Message-ID: <20250905225200.GA1355628-robh@kernel.org>
References: <20250905071659.25805-1-Cyril.Chao@mediatek.com>
 <20250905071659.25805-10-Cyril.Chao@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250905071659.25805-10-Cyril.Chao@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250905_155202_050297_FBF6283A 
X-CRM114-Status: GOOD (  17.84  )
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

On Fri, Sep 05, 2025 at 03:15:54PM +0800, Cyril Chao wrote:
> Add document for mt8189 board with nau8825.
> 
> Signed-off-by: Cyril Chao <Cyril.Chao@mediatek.com>
> ---
>  .../sound/mediatek,mt8189-nau8825.yaml        | 101 ++++++++++++++++++
>  1 file changed, 101 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/mediatek,mt8189-nau8825.yaml
> 
> diff --git a/Documentation/devicetree/bindings/sound/mediatek,mt8189-nau8825.yaml b/Documentation/devicetree/bindings/sound/mediatek,mt8189-nau8825.yaml
> new file mode 100644
> index 000000000000..db3a70c0b9d1
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/mediatek,mt8189-nau8825.yaml
> @@ -0,0 +1,101 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/mediatek,mt8189-nau8825.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek MT8189 ASoC sound card
> +
> +maintainers:
> +  - Darren Ye <darren.ye@mediatek.com>
> +  - Cyril Chao <cyril.chao@mediatek.com>
> +
> +allOf:
> +  - $ref: sound-card-common.yaml#
> +
> +properties:
> +  compatible:
> +    enum:
> +      - mediatek,mt8189-nau8825
> +      - mediatek,mt8189-rt5650
> +      - mediatek,mt8189-rt5682s
> +      - mediatek,mt8189-rt5682i
> +
> +  mediatek,platform:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: The phandle of MT8189 ASoC platform.
> +
> +patternProperties:
> +  "^dai-link-[0-9]+$":
> +    type: object
> +    description:
> +      Container for dai-link level properties and CODEC sub-nodes.
> +
> +    properties:
> +      link-name:
> +        description:
> +          This property corresponds to the name of the BE dai-link to which
> +          we are going to update parameters in this node.
> +        items:

Only 1 name? If so, drop 'items'.

> +          enum:
> +            - TDM_DPTX_BE
> +            - I2SOUT0_BE
> +            - I2SIN0_BE
> +            - I2SOUT1_BE
> +
> +      codec:
> +        description: Holds subnode which indicates codec dai.
> +        type: object
> +        additionalProperties: false

blank line

> +        properties:
> +          sound-dai:
> +            minItems: 1
> +            maxItems: 2
> +        required:
> +          - sound-dai
> +
> +      dai-format:
> +        description: audio format.
> +        items:

Drop items

> +          enum:
> +            - i2s
> +            - right_j
> +            - left_j
> +            - dsp_a
> +            - dsp_b
> +
> +      mediatek,clk-provider:
> +        $ref: /schemas/types.yaml#/definitions/string
> +        description: Indicates dai-link clock master.
> +        enum:
> +          - cpu
> +          - codec
> +
> +    additionalProperties: false
> +
> +    required:
> +      - link-name
> +
> +required:
> +  - compatible
> +  - mediatek,platform
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    sound {
> +        compatible = "mediatek,mt8189-nau8825";
> +        model = "mt8189_rt9123_8825";
> +        mediatek,platform = <&afe>;
> +        dai-link-0 {
> +            link-name = "I2SOUT1_BE";
> +            dai-format = "i2s";
> +            mediatek,clk-provider = "cpu";
> +            codec {
> +                sound-dai = <&nau8825>;
> +            };
> +        };
> +    };
> +
> +...
> -- 
> 2.45.2
> 


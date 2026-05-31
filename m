Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24F40CD5BD1
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 31 May 2026 12:45:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gC7FGBCpOWE8WjlFTBs+odeMD/y+jDDq2vTzWmg11Uc=; b=46HT/4qV04SldHjBiQoXF9c+po
	dppCm4ue+tKD10virE9kUDgSGhRVMmB63yghFp/SD5wrYcja+ENl0oCTWdDDTBIwBDJAdfvFAksmZ
	2pMzEXAjWtaCt0nGnXEIBiAdFxeE1GFU37pmSI50ELGcEICPZcALmoT2snlO+la3TCqGtozJs7ivP
	sAizduuQnPO+UITNjTP0RPoON6maefPAg2m+ndK1pSyryReb6mg21ITDtesIg78COc+cBlDGLBaBc
	3wjcEbVMuLqMzqBZBW+6wApdUX7dfzEuCHlwHyZ8EJSYqT9xGBgMFWuB0CMwzR7GJyUnndrrwu6fY
	BPIRsSgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTfXq-00000009bII-3eQ6;
	Sun, 31 May 2026 12:45:34 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTfXo-00000009bHs-13FT;
	Sun, 31 May 2026 12:45:33 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 93B59409BC;
	Sun, 31 May 2026 12:45:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F22C71F00893;
	Sun, 31 May 2026 12:45:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780231531;
	bh=gC7FGBCpOWE8WjlFTBs+odeMD/y+jDDq2vTzWmg11Uc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=MRVQANP5ZCmoB+ChcTpt0dfDi03BobhYrHFPntQQ18rwFD1ZgucagCxBUtSysO07u
	 KeTnY9qLElXGoClNbK61DaR93hghI3pssrOvLl6RNZDK/Bd7XPWLj2up+4ondYl5es
	 njSfaPcTaGkpVLT8O1lMHxTmBEqb5jSCHveBlF78RKfOX0GwoCwB3U2gOVedrxx2sr
	 d0ZZhUiHOrV4kzWgF08zNq5YltDPy6/Sg1/Q1ipPbgCLaEbNVTDxHBoue6doCOWhrc
	 9c2RLMKlT3y5Kzph9LAWDv+s2k4/efv1Sd5BkrO0YRw+cprm4/2sBAfgUPZnL/knIN
	 wfEinLVCJ0sWg==
Date: Sun, 31 May 2026 14:45:23 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Cyril Chao <Cyril.Chao@mediatek.com>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	Chen-Yu Tsai <wenst@chromium.org>, linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v3 2/4] ASoC: dt-bindings: Add Airoha AN7581 AFE with
 WM8960 Codec schema
Message-ID: <20260531-chirpy-carp-of-promise-ec7dac@quoll>
References: <20260528174840.28644-1-ansuelsmth@gmail.com>
 <20260528174840.28644-3-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260528174840.28644-3-ansuelsmth@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260531_054532_332272_19238D8D 
X-CRM114-Status: GOOD (  18.31  )
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

On Thu, May 28, 2026 at 07:48:30PM +0200, Christian Marangi wrote:
> Add YAML schema for Airoha AN7581 AFE with the specific WM8960 i2c Codec.

DT schema. There is no YAML schema.

Also, looks like sound card, not AFE... but previous patch said it is
a sound card (while it was AFE), so completely confusing...

> 
> This gives example on how to define and connect the AFE driver with the
> WM9860 for full functionality.
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---
>  .../bindings/sound/airoha,an7581-wm8960.yaml  | 71 +++++++++++++++++++
>  1 file changed, 71 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/airoha,an7581-wm8960.yaml
> 
> diff --git a/Documentation/devicetree/bindings/sound/airoha,an7581-wm8960.yaml b/Documentation/devicetree/bindings/sound/airoha,an7581-wm8960.yaml
> new file mode 100644
> index 000000000000..b637c294657f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/airoha,an7581-wm8960.yaml
> @@ -0,0 +1,71 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/airoha,an7581-wm8960.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Airoha AN7581 sound card with WM8960 codec
> +
> +maintainers:
> +  - Christian Marangi <ansuelsmth@gmail.com>
> +
> +allOf:
> +  - $ref: sound-card-common.yaml#
> +
> +properties:
> +  compatible:
> +    const: airoha,an7581-wm8960-sound
> +
> +  platform:
> +    type: object
> +

additionalProperties go here. Looks at other Mediatek sound cards.

> +    properties:
> +      sound-dai:
> +        items:
> +          - description: The phandle of AN7581 platform.
> +
> +    required:
> +      - sound-dai
> +
> +    additionalProperties: false
> +
> +  codec:
> +    type: object
> +
> +    properties:
> +      sound-dai:
> +        items:
> +          - description: The phandle of WM8960 i2c codec.
> +
> +    required:
> +      - sound-dai
> +
> +    additionalProperties: false
> +
> +unevaluatedProperties: false

This goes after "required:".


> +
> +required:
> +  - compatible

Best regards,
Krzysztof



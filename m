Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A314DCCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 09:39:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AzF1wv7OgUKBuoRH1tQc4XrNP7Nk1RBu9PVX/fUvc6w=; b=x1SYsYwXqCOeRVniik4dfFdEzU
	QydUXlBwVDl/IiQ4w6AC+NhM7Lt9RD2ETTvCfUlCw1kR5QR2bMlmMI4nmNGbdjdpQ5R24Xun8K+Oz
	rpHoQXaXPyVTYq5bpTds/wI0z+5jc+BsGEyJisWxtcwHYvEPpvqQKoMXU0T/E4K36OHi1/8vF8LO3
	mANEVXpGbiWpeuxS5w5WF7PQIsMWHDipT4fup7iDnpe3g7pZ/OLDTJONJRXuKJzmqBuykYXc1mmtL
	n+6ZRjx0q9LUKDuihht6Zqffy60ZjnAEURtGoujrnE4kfDlen6dppoE6ajbz1YTF/LotcHFCU6x+f
	o08nZr6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFr2E-00000009Wgx-34Bn;
	Mon, 03 Nov 2025 09:39:34 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFr2D-00000009Wgn-2lUq;
	Mon, 03 Nov 2025 09:39:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7CC6560055;
	Mon,  3 Nov 2025 09:39:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3542C4CEFD;
	Mon,  3 Nov 2025 09:39:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762162772;
	bh=74xTa1alepkXuLAJggdVWdu19FLOXxI8tg4rxRqpq10=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aWxrWply1t/qhJLrulY0PUa6pjoYucGLbqzRzXOYHGA7T2aNuhDZgBWJyTPk+KgbF
	 YL5RaPIgr3MwZHw+7/KFDKWYNaJlnECOhrwvH5xoVIqkcXafleWxGaDAPT/E5YFUNZ
	 DYBI4IukWOwTI+ATD91xP1V3n5IS+Vi0/K/GAjN860CoLntKpLd71X4E5Fi4G/Nqa0
	 46wtYNsfddKPkHt8f4LCSFrucRsmOQPYgPOs0i898jRRyUIUu38ziU5v30xaVcvLyL
	 TW8bWqQOXx78nB1+A8crUEmN2ciaXtN7MbpLzFHh43oeOlkdjb3+vRWRwqqSPGzpIi
	 VORLel3UFeyhQ==
Date: Mon, 3 Nov 2025 10:39:29 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Cyril Chao <Cyril.Chao@mediatek.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v3 09/10] ASoC: dt-bindings: mediatek,mt8189-nau8825: add
 mt8189-nau8825 document
Message-ID: <20251103-handsome-fractal-stoat-8b82ca@kuoka>
References: <20251031073216.8662-1-Cyril.Chao@mediatek.com>
 <20251031073216.8662-10-Cyril.Chao@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251031073216.8662-10-Cyril.Chao@mediatek.com>
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

On Fri, Oct 31, 2025 at 03:32:03PM +0800, Cyril Chao wrote:
> +  mediatek,platform:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: The phandle of MT8189 ASoC platform.
> +
> +patternProperties:
> +  "^dai-link-[0-9]+$":
> +    type: object
> +    description:
> +      Container for dai-link level properties and CODEC sub-nodes.

<placeholder (see further)>

> +
> +    properties:
> +      link-name:
> +        description:
> +          This property corresponds to the name of the BE dai-link to which
> +          we are going to update parameters in this node.
> +        enum:
> +          - TDM_DPTX_BE
> +          - I2SOUT0_BE
> +          - I2SIN0_BE
> +          - I2SOUT1_BE
> +
> +      codec:
> +        description: Holds subnode which indicates codec dai.
> +        type: object
> +        additionalProperties: false
> +
> +        properties:
> +          sound-dai:
> +            minItems: 1
> +            maxItems: 2
> +        required:
> +          - sound-dai
> +
> +      dai-format:
> +        description: audio format.
> +        enum:
> +          - i2s
> +          - right_j
> +          - left_j
> +          - dsp_a
> +          - dsp_b
> +
> +      mediatek,clk-provider:
> +        $ref: /schemas/types.yaml#/definitions/string
> +        description: Indicates dai-link clock master.
> +        enum:
> +          - cpu
> +          - codec
> +
> +    additionalProperties: false

If there is going to be a new version please move this one above to
earlier place - after "description:", to the placeholder place (but of
course keep indentation level, just ordering).

Also
A nit, subject: drop second/last, redundant "document". The
"dt-bindings" prefix is already stating that this is documentation.
See also:
https://elixir.bootlin.com/linux/v6.17-rc3/source/Documentation/devicetree/bindings/submitting-patches.rst#L18

No need to resend just for that.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof



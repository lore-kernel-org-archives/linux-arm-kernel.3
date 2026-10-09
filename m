Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40AB4CA6015
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 14:16:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5mp4RnMe0TQZxUQ96A2OqhWXQwIeoTHhlaxX50LfJic=; b=WwxxIooy64jTGcQLvHdWDMdDkS
	rqovfUsDrnRUe1hyubXawoRtHt9as3KEXeWH2ENnB/Frvb/z/Oxf/+KWpTzvW7FGqm9HdJf1+vUaj
	mWhJbCO883i6lKuwYGdionMHvED+pETS6x9UrxJZ37JYC9VqQbzYF9vooCw3xydg1+lTkbrsODNw2
	9YwTj+X6IP2PWvHUfeFOO/1jLWtV+AZgedlOH85LwQiheOMKvBMfvMhBzZurChh+QHI2wbMmHGjs8
	p3NAhoNxF+T9xFRMrg8UU+AnX3CrN8L506pESfn4RoisddUg3wBtsQy1hiE0c/DhaY/AOOYmwfJKQ
	2jXZE4hQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFBOL-00000006RIk-3611;
	Fri, 09 Oct 2026 14:16:09 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFBOL-00000006RIN-02ZW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Oct 2026 14:16:09 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 14DCF60A55;
	Fri,  9 Oct 2026 14:16:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F4051F00899;
	Fri,  9 Oct 2026 14:16:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791555367;
	bh=5mp4RnMe0TQZxUQ96A2OqhWXQwIeoTHhlaxX50LfJic=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=NhUolgjdT4xFpIJaLDiSOW9Fx/3UcRQiVWOExlWtRlCM+JExiGowDMCEGSwHEtnfG
	 ph4wqLPlHYk3yHyFYgdaKKtAyhZlxIg5rePCMSle3N1m4N5jiRI0F+rgc0gximz4gE
	 HGwESaoEV9h/0JQAZUI08YZSUbHyZ9sFXY+BChVjyCiyX6qDSXiKnPPVk/kEPsgUkK
	 r7ufkRbdRpisjOQFOJjrKaEfoBU9kyzf3L/GYQ6wamC0qP+2zHNBbCo6JhBEByZiy2
	 X8dhIJURzCuVSDrzN8zUtJzynOeqbp1KMhhSh7ZxwHKdzTKNBeMKGugL3GqLWPcaHp
	 WL8H+/u39/mpA==
Date: Fri, 9 Oct 2026 09:16:06 -0500
From: Rob Herring <robh@kernel.org>
To: joakim.zhang@cixtech.com
Cc: lgirdwood@gmail.com, broonie@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, perex@perex.cz, tiwai@suse.com,
	p.zabel@pengutronix.de, cix-kernel-upstream@cixtech.com,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 1/4] ASoC: dt-bindings: Add Cadence I2S-SC controller
Message-ID: <20261009141606.GB1631855-robh@kernel.org>
References: <20261009092552.2377960-1-joakim.zhang@cixtech.com>
 <20261009092552.2377960-2-joakim.zhang@cixtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261009092552.2377960-2-joakim.zhang@cixtech.com>
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

On Fri, Oct 09, 2026 at 05:25:49PM +0800, joakim.zhang@cixtech.com wrote:
> From: Joakim Zhang <joakim.zhang@cixtech.com>
> 
> Add the DT binding for the Cadence I2S-SC controller integrated in
> the CIX SKY1 audio subsystem. I2S-SC is a full-duplex stereo
> controller supporting standard I2S, left/right-justified and DSP
> formats, plus TDM operation with up to 16 slots.
> 
> Signed-off-by: Joakim Zhang <joakim.zhang@cixtech.com>
> ---
>  .../bindings/sound/cix,sky1-i2s-sc.yaml       | 93 +++++++++++++++++++
>  1 file changed, 93 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/cix,sky1-i2s-sc.yaml
> 
> diff --git a/Documentation/devicetree/bindings/sound/cix,sky1-i2s-sc.yaml b/Documentation/devicetree/bindings/sound/cix,sky1-i2s-sc.yaml
> new file mode 100644
> index 000000000000..3fdf2334c492
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/cix,sky1-i2s-sc.yaml
> @@ -0,0 +1,93 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/cix,sky1-i2s-sc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Cadence I2S-SC controller
> +
> +maintainers:
> +  - Joakim Zhang <joakim.zhang@cixtech.com>
> +
> +description: |
> +  The Cadence I2S-SC controller integrated in the CIX SKY1 audio subsystem.
> +  It supports full-duplex stereo playback and capture in standard I2S,
> +  left/right-justified and DSP modes, as well as TDM operation with up to
> +  16 slots. The transmitter and receiver are started and stopped together
> +  by the controller.
> +
> +allOf:
> +  - $ref: dai-common.yaml#
> +
> +properties:
> +  compatible:
> +    const: cix,sky1-i2s-sc
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 4
> +
> +  clock-names:
> +    items:
> +      - const: hst
> +      - const: i2s
> +      - const: audio-clk0
> +      - const: audio-clk2
> +
> +  resets:
> +    maxItems: 1
> +
> +  dmas:
> +    minItems: 1
> +    maxItems: 2
> +    description:
> +      One DMA channel for instances wired for a single direction, either
> +      "tx" or "rx", or two channels for both transmit and receive.
> +
> +  dma-names:
> +    minItems: 1
> +    maxItems: 2
> +    items:
> +      enum: [ tx, rx ]

Address the sashiko comment.

Rob


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6DEECA6015
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 14:18:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P1xT8kIEPQsNlllxKNcDEkZl+24WAzqvZIpeRT/H2QA=; b=EyyZjFH5oxo0RMpU8hfRcCdVS1
	gGKhZLh+vOrvJT3sOe0ljJl5u+sv14VeNyMaiXpTNBoVJhauk4LPC9p9dSPSEzxT/MxvRaeiGsZ1i
	Egk5vvXpjUNFYSHMj2x6xQHvFPE5ZrwZgJnkbmfinm04rJS0lhyJ7WRR5hnobaGfKwmUKqPR0J036
	B3Mvgcb/nHA/KpU6W1jqxd37VT+pY9m8Iki6JHFl6mP9tUUxxd7MI33NA5c6zHyCcmhKM0oPvS7Z3
	SOAPo1hTYKn/2BesEzP2iFoIpDCxMyYDPrlFvd5xqpB2nVeo/gTQQoea1AGQOmIhNu4IyrvAMIvdh
	h23TdqcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFBQn-00000006RST-08QP;
	Fri, 09 Oct 2026 14:18:41 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFBQl-00000006RSL-1a4z
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Oct 2026 14:18:39 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 8E64E60098;
	Fri,  9 Oct 2026 14:18:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 181D41F00893;
	Fri,  9 Oct 2026 14:18:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791555518;
	bh=P1xT8kIEPQsNlllxKNcDEkZl+24WAzqvZIpeRT/H2QA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=CUKv80xnqp9wtqp/jx9LsP21bSwE648OTT9sAp5YbntX3nG+YcSdwSUC/oIJgxYjQ
	 CVpIrzIVLMcr0c0CCWD5b0spCReKAv7PYYXrA1x9ZTGU9emPu838Y4V7yNfIXGTf0V
	 pPpiJADOxFvVy4UwSGBNUWloJhrtFh2Ec2HCeHBzXNoGiDAP06ZNDFfC6t2AT5sbsU
	 hCwyfTQElhCcuQ2FI017sAQ5p22kKts54V6y5gF73ERYcoVw4O5vIymsMnfKP1/Zwp
	 X0mC34uWjb4q+EudakKEqTgcT/l/Jcryj/+026ANJciKsXVQCfrZtko1pR24VpLuNj
	 /+MbZTfmEGg1g==
Date: Fri, 9 Oct 2026 09:18:37 -0500
From: Rob Herring <robh@kernel.org>
To: joakim.zhang@cixtech.com
Cc: lgirdwood@gmail.com, broonie@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, perex@perex.cz, tiwai@suse.com,
	p.zabel@pengutronix.de, cix-kernel-upstream@cixtech.com,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 1/4] ASoC: dt-bindings: Add Cadence I2S-SC controller
Message-ID: <20261009141837.GA1661224-robh@kernel.org>
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
> +
> +  "#sound-dai-cells":
> +    const: 0
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - clock-names
> +  - resets
> +  - dmas
> +  - dma-names
> +  - "#sound-dai-cells"
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    audss_dmac: dma-controller {
> +        #dma-cells = <1>;
> +    };

Drop. We don't put providers in examples. What example made you think 
you needed it? And if you do, why not the clock, reset, and interrupt 
providers?

Rob


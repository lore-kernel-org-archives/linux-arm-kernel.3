Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B6A4D6CFAB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Jan 2026 23:27:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OI5Zzcu5PLB56mLbbcI7OiEBblJuA1GoxdpgX6al2Is=; b=WzOjJ4VvmmUP4rq2IWVfQm3YFK
	cWDf0gSo+tbPo1poBuu9Q7i+pWL8LFpBgNXECseOmxNfHJzScvdl3xhwdWdcwnCABRYEEs1g40FCD
	VHhgv80curEtanjDuvoDD1EUJHdkHoJeuYcr7IAu56IiaJUIhSLqwhvimY7tnEInrY6/ByjJLhqWA
	jgb+FJ4ijzyoNHzdxh59YqGXoo1u4ujscVOhtCn3EfLNCVG+UQbUT0JdjtP47dGoKYWcZOCqNhOuZ
	uWYUPnUi6r7mrLFu/+yimahzuScELk8CF6NPYXRLTxNNm7Km1IY9Tctq2ZX67AeftntjOnV3NLddG
	RpZILQ/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vj458-00000007soA-34z1;
	Thu, 22 Jan 2026 23:27:18 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vj456-00000007sno-0I90
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Jan 2026 23:27:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 377BA43688;
	Thu, 22 Jan 2026 23:27:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4DFDC116C6;
	Thu, 22 Jan 2026 23:27:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769124435;
	bh=g4X4NiMw4g2aJIlWWZ8K6GREeTKA9Q39VjtINDFcpus=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bz4B6+6DnyfDwpOblmzI5vT+Ih4jJyusVTQsEqJpQatOqhBjRXvWgY4A4C+vy+bFR
	 8SOJ0xSaNtFLSIJjwz5Es1Op15kRs4n3EGcpbGsaJ70z76ywwfpNivN1sp+TyVFzLP
	 JeN7nX1R0Lhilh70ksL2HF2FVdFqfQWgCfpN1UoGkampentNwKPHfKhycqsETUco2c
	 hFHsKyPzh7cnwOcamotLjEKv+SPz/QZO5hAXJMzdC0XmxcdU0Ch8D/rzC9GgE+rUsl
	 vAcuKnKEDEJTHFR6VxCwsbu/MYbMbv9g6dSUAB+4ieerWfF1QBxRTjwQM+IOb6Pd18
	 1VG0sh70EukKw==
Date: Thu, 22 Jan 2026 17:27:14 -0600
From: Rob Herring <robh@kernel.org>
To: Aniket Limaye <a-limaye@ti.com>
Cc: Vignesh Raghavendra <vigneshr@ti.com>, u-kumar1@ti.com,
	Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>,
	Santosh Shilimkar <ssantosh@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, j-mcarthur@ti.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: interrupt-controller: ti,sci-intr:
 Per-line interrupt-types
Message-ID: <20260122232714.GA3721563-robh@kernel.org>
References: <20260122-ul-driver-i2c-j722s-v3-0-4ec3478f3866@ti.com>
 <20260122-ul-driver-i2c-j722s-v3-1-4ec3478f3866@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260122-ul-driver-i2c-j722s-v3-1-4ec3478f3866@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_152716_168100_2B0B4CCC 
X-CRM114-Status: GOOD (  24.97  )
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

On Thu, Jan 22, 2026 at 10:49:13PM +0530, Aniket Limaye wrote:
> Update the bindings to allow setting per-line interrupt-types.
> 
> Some Interrupt Router instances can only work with a specific trigger
> type (edge or level), while others act as simple passthroughs that
> preserve the source interrupt type unchanged.
> 
> Make "ti,intr-trigger-type" property optional, with its absence
> indicating that the router acts as a passthrough. When absent,
> "#interrupt-cells" must be 2 to allow each interrupt source to specify
> its trigger type per-line.
> 
> Signed-off-by: Aniket Limaye <a-limaye@ti.com>
> ---
> Changes in v3:
> - Avoid new redundant value IRQ_TYPE_DEFAULT for "ti,intr-trigger-type"
>   when "#interrupt-cells"==2. Instead, make this property optional and
>   check for its absence to use the per-line interrupt-type setting.
> - Link to v2:
> https://lore.kernel.org/r/20260120-ul-driver-i2c-j722s-v2-1-832097c6b64f@ti.com
> 
> Changes in v2:
> - Reword Commit msg to better describe the patch
> - Link to v1:
> https://lore.kernel.org/r/20260116-ul-driver-i2c-j722s-v1-1-c28e8ba38a9e@ti.com
> ---
>  .../bindings/interrupt-controller/ti,sci-intr.yaml | 44 +++++++++++++++++++---
>  1 file changed, 38 insertions(+), 6 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/ti,sci-intr.yaml b/Documentation/devicetree/bindings/interrupt-controller/ti,sci-intr.yaml
> index c99cc7323c71..8156ce6d2ab4 100644
> --- a/Documentation/devicetree/bindings/interrupt-controller/ti,sci-intr.yaml
> +++ b/Documentation/devicetree/bindings/interrupt-controller/ti,sci-intr.yaml
> @@ -15,8 +15,7 @@ allOf:
>  description: |
>    The Interrupt Router (INTR) module provides a mechanism to mux M
>    interrupt inputs to N interrupt outputs, where all M inputs are selectable
> -  to be driven per N output. An Interrupt Router can either handle edge
> -  triggered or level triggered interrupts and that is fixed in hardware.
> +  to be driven per N output.
>  
>                                     Interrupt Router
>                                 +----------------------+
> @@ -54,19 +53,28 @@ properties:
>      $ref: /schemas/types.yaml#/definitions/uint32
>      enum: [1, 4]
>      description: |
> -      Should be one of the following.
> +      Optional property - should be one of the following:

optional or required is defined by the schema. No need to say it here.

>          1 = If intr supports edge triggered interrupts.
>          4 = If intr supports level triggered interrupts.
>  
> +      If this property is present, #interrupt-cells must be 1.
> +      If this property is absent, #interrupt-cells must be 2 and interrupt
> +      source must specify the trigger type in the second cell.

The schema says most of this too.

> +
>    reg:
>      maxItems: 1
>  
>    interrupt-controller: true
>  
>    '#interrupt-cells':
> -    const: 1
> +    enum: [1, 2]
>      description: |
> -      The 1st cell should contain interrupt router input hw number.
> +      Number of cells in interrupt specifier. Depends on ti,intr-trigger-type:
> +      - If ti,intr-trigger-type is present: must be 1
> +        The 1st cell should contain interrupt router input hw number.
> +      - If ti,intr-trigger-type is absent: must be 2
> +        The 1st cell should contain interrupt router input hw number.
> +        The 2nd cell should contain interrupt trigger type (preserved by router).
>  
>    ti,interrupt-ranges:
>      $ref: /schemas/types.yaml#/definitions/uint32-matrix
> @@ -82,9 +90,22 @@ properties:
>          - description: |
>              "limit" specifies the limit for translation
>  
> +if:
> +  required:
> +    - ti,intr-trigger-type
> +then:
> +  properties:
> +    '#interrupt-cells':
> +      const: 1
> +      description: Interrupt ID only. Interrupt type is specified globally
> +else:
> +  properties:
> +    '#interrupt-cells':
> +      const: 2
> +      description: Interrupt ID and corresponding interrupt type
> +
>  required:
>    - compatible
> -  - ti,intr-trigger-type
>    - interrupt-controller
>    - '#interrupt-cells'
>    - ti,sci
> @@ -105,3 +126,14 @@ examples:
>          ti,sci-dev-id = <131>;
>          ti,interrupt-ranges = <0 360 32>;
>      };
> +
> +  - |
> +    main_gpio_intr1: interrupt-controller1 {

Drop unused label and node name should be 'interrupt-controller'.

With those fixed,

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

> +        compatible = "ti,sci-intr";
> +        interrupt-controller;
> +        interrupt-parent = <&gic500>;
> +        #interrupt-cells = <2>;
> +        ti,sci = <&dmsc>;
> +        ti,sci-dev-id = <131>;
> +        ti,interrupt-ranges = <0 360 32>;
> +    };
> 
> -- 
> 2.52.0
> 


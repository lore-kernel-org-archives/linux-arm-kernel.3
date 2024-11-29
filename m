Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DAC9D6EBE3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 Nov 2024 07:21:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U1VQx0OS79LPiPKD5j2CmvzA1DqCao/g5qumxGLEFCM=; b=2mC7FI3bgnaA0Fk26wfLSofVi8
	9qwFrlXXxZpt8AAak4WBdkR2mnsn7lg5jlv9cpRA+rs1+tuZJwTtL+SGefYLOTxmpZbYmnzCPM7nD
	fLuGhajIcRC2IZqh/2OYrnL+sF8U2pvSrXkXfzRN2XYP/7rZBpSF4rpqxCUWNcifGnOWaT7gilTpd
	AEVELlsZGQYms+ashPyu7nFp9CjSSRG5ompukkyy+RBp2Uffv3yOqIVCQQt58jHjjjl/Ee2Ii4cUN
	+1I3/Y9XVAiRJk/xHzQSmB9TPIL3kHcYYQgdL3lmjypCGO2UcWoFM1+VGUQSnUiRJ5/v3qrymGxxv
	y+ZpQ5bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGvJR-0000000H49g-1fGI;
	Fri, 29 Nov 2024 07:21:13 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGvIS-0000000H445-398c
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 Nov 2024 07:20:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id DBE685C2458;
	Fri, 29 Nov 2024 07:19:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 464C2C4CECF;
	Fri, 29 Nov 2024 07:20:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732864811;
	bh=f5K7i1Tg3ZRRth7tKZoWQuEu/Q0cKzBkqzpXHnSj30I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=E3auW3c1D7g2OnfW0zxlaGz+VnEVe0MCoZTpLvcH6B9G6ew1dDAd3wpTK3sVHcQYq
	 q60LnPtWyeJVczx7yxjhZG2BIV5OUAuYcVR1iUlpwHM+qmIzpWAyAZrkubtKDIM8vv
	 Rs41J8fBJi4LVu6xiJGe5zubQ2zG5drEcvnq0MZvgJjcLgFm6gPr4IEKA3z643ff6F
	 207rFsAanfxSzmUr7iaQtkqcVlt5VREJDTUHPSdmXacMQQ+amOyknnIzvq2QmYYLED
	 +Cd2zUuMEj3A3p/InDtwR4HLslNxMWi7KSTu62o40z8H0tCi2SKRl+o2D4bCmXtGEF
	 4BEAYOv2hBLuQ==
Date: Fri, 29 Nov 2024 08:20:08 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Neha Malcom Francis <n-francis@ti.com>
Cc: nm@ti.com, vigneshr@ti.com, kristo@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, u-kumar1@ti.com
Subject: Re: [PATCH 1/2] dt-bindings: misc: bist: Add BIST dt-binding for TI
 K3 devices
Message-ID: <ho7ktcnbtl7mvamfthqho23co2fc4z7bgjha7pu4wivxm6ndhu@tfbpveonhckz>
References: <20241128140825.263216-1-n-francis@ti.com>
 <20241128140825.263216-2-n-francis@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241128140825.263216-2-n-francis@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241128_232012_914296_D2D18D45 
X-CRM114-Status: GOOD (  17.27  )
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

On Thu, Nov 28, 2024 at 07:38:24PM +0530, Neha Malcom Francis wrote:
> Document the binding for TI K3 BIST (Built-In Self Test) block.
> 

A nit, subject: drop second/last, redundant "dt-binding". The
"dt-bindings" prefix is already stating that these are bindings.
See also:
https://elixir.bootlin.com/linux/v6.7-rc8/source/Documentation/devicetree/bindings/submitting-patches.rst#L18

> Signed-off-by: Neha Malcom Francis <n-francis@ti.com>
> ---
>  .../bindings/misc/ti,j784s4-bist.yaml         | 66 +++++++++++++++++++
>  1 file changed, 66 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/misc/ti,j784s4-bist.yaml

soc directory, not misc.

> 
> diff --git a/Documentation/devicetree/bindings/misc/ti,j784s4-bist.yaml b/Documentation/devicetree/bindings/misc/ti,j784s4-bist.yaml
> new file mode 100644
> index 000000000000..bd1b42734b3d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/misc/ti,j784s4-bist.yaml
> @@ -0,0 +1,66 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +# Copyright (C) 2024 Texas Instruments Incorporated
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/misc/ti,j784s4-bist.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Texas Instruments K3 BIST
> +
> +maintainers:
> +  - Neha Malcom Francis <n-francis@ti.com>
> +
> +description:
> +  The BIST (Built-In Self Test) module is an IP block present in K3 devices
> +  that support triggering of BIST tests, both PBIST (Memory BIST) and LBIST
> +  (Logic BIST) on a core. Both tests are destructive in nature. At boot, BIST
> +  is executed by hardware for the MCU domain automatically as part of HW POST.
> +
> +properties:
> +  compatible:
> +    const: ti,j784s4-bist
> +
> +  reg:
> +    minItems: 2

Drop minItems

> +    maxItems: 2
> +
> +  reg-names:
> +    items:
> +      - const: cfg
> +      - const: ctrl_mmr
> +
> +  clocks:
> +    maxItems: 1
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  ti,bist-instance:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      the BIST instance in the SoC represented as an integer

No instance indices are allowed. Drop.

> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - ti,bist-instance
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/soc/ti,sci_pm_domain.h>
> +    bus {
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +        bist@33c0000 {

Node names should be generic. See also an explanation and list of
examples (not exhaustive) in DT specification:
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation

Come with something, don't just use device name.

> +            compatible = "ti,j784s4-bist";
> +            reg = <0x00 0x033c0000 0x00 0x400>,
> +            <0x00 0x0010c1a0 0x00 0x01c>;

Misaligned code.

Best regards,
Krzysztof



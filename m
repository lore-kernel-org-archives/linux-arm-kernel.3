Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1193E77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jan 2025 16:00:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AU8xPrZjOtMUZQmqrGLmeYzG73tpLwMZrx1ob+eEhTQ=; b=mBM72piTOs3SMlaMFO4+J7/JG0
	dLhwqJixTL0yqIFy5ewtTdP0sgMT9GWlJQCEDFbfYtvo2AvrT05mdGG2Eyf7v1/6OkHKmvjT8p2qU
	i3bowLZ6XyerWHYNkdLw3PKJxg0fbjcPKyuqoxJN80HDbv9/ryoI+9k9RpbYspQ/KCakCg12amNx9
	QWNiT9xGsdgY33bAinh0tf5Tf7l1iTzqVvnvDxKF4P9sYmlcr2gF7R+Y5pnPs7RjBinra5l+avfyE
	s379bOTKPlrIm8YN7zBlLOqpeS+gBAFS7sHYRs8jZ7C3C/jvHHjFMed/c/xs/ADRrEeOtr8pwCbpb
	/xH3CX3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWHQY-0000000G7tT-2B5o;
	Fri, 10 Jan 2025 16:00:02 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWH2g-0000000Fy7W-3eXf
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jan 2025 15:35:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 5BBA7A42140;
	Fri, 10 Jan 2025 15:33:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 461A5C4CEE1;
	Fri, 10 Jan 2025 15:35:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736523321;
	bh=PFQQnbTdjkTsQINXUX4WtvC8+Xl/XUqNkaTRSn+p8PQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tr47FpyBJmQsGet8LoZu8CpuYHhZzU947dmY3I1J/2GgLqsHFvC32EQvwd1IwhBhl
	 Fy9yxBkEYX35vs6OqZI2ytHSAefQ1c8LXLNkJuojd36+Lc50YVtcl92pwS2skeEtbN
	 BhdowyGEDk/pQs3HK01iO0c7xSgXMMyrrTqAOdI39LEnuM5RXXfim5TTCMCkUqsLZx
	 ZfTeMwvdVgqdyIu82hx9bPap9fozYDJdTtZpC/kh0u8FZIc7Go5KQL/6Vx6lPG/16h
	 s0g14EI5QPYlinHWifbJPv7iCA0MbNPnb/CYQZbXEWJTIF8Rr5ymwrCF40aTIXzOun
	 eW7J5juF3q1+Q==
Date: Fri, 10 Jan 2025 09:35:20 -0600
From: Rob Herring <robh@kernel.org>
To: Romain Naour <romain.naour@smile.fr>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-omap@vger.kernel.org, conor+dt@kernel.org, krzk+dt@kernel.org,
	kristo@kernel.org, vigneshr@ti.com, nm@ti.com, afd@ti.com,
	Romain Naour <romain.naour@skf.com>
Subject: Re: [PATCH v5 1/2] dt-bindings: mfd: syscon: Add
 ti,j721e-acspcie-proxy-ctrl compatible
Message-ID: <20250110153520.GA2904744-robh@kernel.org>
References: <20250110100331.1642242-1-romain.naour@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250110100331.1642242-1-romain.naour@smile.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_073523_054711_5F9693E9 
X-CRM114-Status: GOOD (  22.91  )
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

On Fri, Jan 10, 2025 at 11:03:30AM +0100, Romain Naour wrote:
> From: Romain Naour <romain.naour@skf.com>
> 
> The ACSPCIE_PROXY_CTRL registers within the CTRL_MMR space of TI's J721e
> SoC are used to drive the reference clock to the PCIe Endpoint device via
> the PAD IO Buffers. Add the compatible for allowing the PCIe driver to
> obtain the regmap for the ACSPCIE_CTRL register within the System
> Controller device-tree node in order to enable the PAD IO Buffers.
> 
> Using the ti,j721e-acspcie-proxy-ctrl compatible imply to use "Proxy1"
> address (1A090h) instead of "Proxy0" (18090h) to access
> CTRLMMR_ACSPCIE0_CTRL register:
> 
>   CTRLMMR_ACSPCIE0_CTRL Register (Proxy0 Offset = 18090h; Proxy1 Offset = 1A090h)
> 
> "Proxy0" is used as the default access path that can be locked with the
> help of "CTRLMMR_LOCK0_KICK0" and "CTRLMMR_LOCK0_KICK1" registers.
> 
> The Technical Reference Manual for J721e SoC with details of the
> ASCPCIE_CTRL registers is available at:
> https://www.ti.com/lit/zip/spruil1
> 
> Signed-off-by: Romain Naour <romain.naour@skf.com>
> ---
> v5:
>   - Add missing change to the J721e system controller binding
>     to avoid DT check warning when the new acspcie0_proxy_ctrl (syscon)
>     will be added to J721e system controller node (Andrew Davis).
> 
>   https://lore.kernel.org/linux-devicetree/90f47fae-a493-471d-8fe6-e7df741161be@ti.com/
> 
>   - Explain why "Proxy1" address (1A090h) should be used while using
>     ti,j721e-acspcie-proxy-ctrl compatible (Siddharth Vadapalli).
> 
>   https://lore.kernel.org/linux-devicetree/begojbvvrpyjfr3pye7mqwiw73ucw5ynepdfujssr4jx4vs33a@pwahnph3qesl/
> 
> v4: Add missing change in the second list (From Andrew Davis) [1]
>   Rebase after the ti,j784s4-acspcie-proxy-ctrl compatible fix [2]
>   [1] https://lore.kernel.org/linux-devicetree/20250103174524.28768-1-afd@ti.com/
>   [2] https://lore.kernel.org/linux-devicetree/20250103174524.28768-2-afd@ti.com/
> 
> v3: new commit
> ---
>  Documentation/devicetree/bindings/mfd/syscon.yaml           | 2 ++
>  .../bindings/soc/ti/ti,j721e-system-controller.yaml         | 6 ++++++
>  2 files changed, 8 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mfd/syscon.yaml b/Documentation/devicetree/bindings/mfd/syscon.yaml
> index 0e68c69e7bc9..1f3e67f432e7 100644
> --- a/Documentation/devicetree/bindings/mfd/syscon.yaml
> +++ b/Documentation/devicetree/bindings/mfd/syscon.yaml
> @@ -115,6 +115,7 @@ select:
>            - ti,am625-dss-oldi-io-ctrl
>            - ti,am62p-cpsw-mac-efuse
>            - ti,am654-dss-oldi-io-ctrl
> +          - ti,j721e-acspcie-proxy-ctrl
>            - ti,j784s4-acspcie-proxy-ctrl
>            - ti,j784s4-pcie-ctrl
>            - ti,keystone-pllctrl
> @@ -213,6 +214,7 @@ properties:
>            - ti,am625-dss-oldi-io-ctrl
>            - ti,am62p-cpsw-mac-efuse
>            - ti,am654-dss-oldi-io-ctrl

> +          - ti,j721e-acspcie-proxy-ctrl
>            - ti,j784s4-acspcie-proxy-ctrl

How do these 2 compare? Are they compatible?

>            - ti,j784s4-pcie-ctrl
>            - ti,keystone-pllctrl
> diff --git a/Documentation/devicetree/bindings/soc/ti/ti,j721e-system-controller.yaml b/Documentation/devicetree/bindings/soc/ti/ti,j721e-system-controller.yaml
> index 378e9cc5fac2..16929218d611 100644
> --- a/Documentation/devicetree/bindings/soc/ti/ti,j721e-system-controller.yaml
> +++ b/Documentation/devicetree/bindings/soc/ti/ti,j721e-system-controller.yaml
> @@ -68,6 +68,12 @@ patternProperties:
>      description:
>        The node corresponding to SoC chip identification.
>  
> +  "^syscon@[0-9a-f]+$":
> +    type: object
> +    $ref: /schemas/mfd/syscon.yaml#
> +    description:
> +      This is the ASPCIe control region.

So this is a syscon child of a syscon. The primary reason for 'syscon' 
compatible is to create a regmap. Why can't you use the parent's syscon?

Rob


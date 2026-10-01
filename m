Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2AEFCA5FA5
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 06:17:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yvPInNVMUowwCsvJI/H0YVtLjuxYlHv6SPUDpD5X1Uc=; b=Rkfg+m5vMlyMgVRcR99lVWr7sb
	gQbx8ZdZrSNGZ+U58ek7nz5hveEYcs2qndrU4hSeWRaMnPbXuJgJBE9z+Ug1PRZCeQLbCK5hZfMke
	JKdkfXuvdmupCKJYhxKhl5JKsCm7KdUorIG8cS/kjVZ7qeoqsaC+DSpo2zMv9qS+h+3CXeBLCR9SF
	LSqCmG0ieN/9Z0I/v9MGhlldOCoepU6nq+wf83eT3K6/xa8kuPxGZel7NjVRD9qHdtTh6Dr7Ggx8v
	SxaRK6Cgyfthz9om89IiIQfkC8t5cHSwRVspw+G+vUbUSB4iodt/wQq8rzIn4zkpC9XsP/21bBJu6
	af+QTYpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCA6W-00000007sOr-12z9;
	Thu, 01 Oct 2026 06:17:16 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCA6V-00000007sOg-0E50
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 06:17:15 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 24E76601F6;
	Thu,  1 Oct 2026 06:17:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D0DB1F000FF;
	Thu,  1 Oct 2026 06:17:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790835433;
	bh=yvPInNVMUowwCsvJI/H0YVtLjuxYlHv6SPUDpD5X1Uc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=SO/13ZUPRnFCpA3vLkxwYxUXn9YBDekZZ131RC3yPAIu468TZOTuyfR9uaG/ngt5b
	 yQHZJ/hAWCCNCtFpqF2aW35Da9Bx2s9GmsBx9z5cweqVQXTBTNOiefh8c0oPJNKpvQ
	 XC8iuQ2+T5hXGib6JrZvKZfB6NU1bwDCVTTpDjif9qqvrSJw4CqHJkLF6l1jsHav0K
	 1QD8D6j2UQZViiX3adhLjB7hcAfTl5vJUfHtNR7g/UoTVRQMUUY/nbc88AFs4GFemX
	 9yOM+rIzNW3zvVfrpwJDIrqI4GqcrhbKjBViwUp47cdFibHl3YJA+ncN4aZiC9K93d
	 ctFwKg6215aOg==
Date: Thu, 1 Oct 2026 08:17:09 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Tim Michals <tcmichals@gmail.com>
Cc: linux-sunxi@lists.linux.dev, linux-remoteproc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, wens@kernel.org, jernej.skrabec@gmail.com, samuel@sholland.org, 
	andersson@kernel.org, mathieu.poirier@linaro.org, jassisinghbrar@gmail.com, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Subject: Re: [PATCH v2 4/7] dt-bindings: remoteproc: add Allwinner
 sun55i-rproc schema
Message-ID: <20261001-armored-wild-saiga-c5c3ae@quoll>
References: <20260922034711.190253-1-tcmichals@gmail.com>
 <20260927002021.797069-1-tcmichals@gmail.com>
 <20260927002021.797069-5-tcmichals@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260927002021.797069-5-tcmichals@gmail.com>
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

On Sat, Sep 26, 2026 at 07:20:13PM -0500, Tim Michals wrote:
> Add Device Tree binding schema for the Allwinner XuanTie E907 RISC-V
> remote processor subsystem integrated into Allwinner A523, A527, and
> T527 (sun55i) SoCs.
> 
> The binding defines the memory resources (configuration registers,
> SRAM Space 0, SRAM Space 1, and optional remap controller), clocks,
> resets, reserved memory regions, and hardware mailbox channels.
> 
> Signed-off-by: Tim Michals <tcmichals@gmail.com>
> ---
>  .../remoteproc/allwinner,sun55i-rproc.yaml    | 146 ++++++++++++++++++
>  1 file changed, 146 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/remoteproc/allwinner,sun55i-rproc.yaml
> 
> diff --git a/Documentation/devicetree/bindings/remoteproc/allwinner,sun55i-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/allwinner,sun55i-rproc.yaml
> new file mode 100644
> index 000000000000..53e3f4faaa76
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/remoteproc/allwinner,sun55i-rproc.yaml
> @@ -0,0 +1,146 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/remoteproc/allwinner,sun55i-rproc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Allwinner XuanTie E906/E907 RISC-V Remoteproc
> +
> +maintainers:
> +  - Jernej Skrabec <jernej.skrabec@gmail.com>
> +  - Samuel Holland <samuel@sholland.org>
> +  - Tim Michals <tcmichals@gmail.com>
> +
> +description:
> +  The Allwinner T527, A527, and A523 (sun55i) SoCs integrate a T-Head
> +  (XuanTie) E906 or E907 RISC-V co-processor alongside the ARM Cortex-A55
> +  cluster. The co-processor runs bare-metal firmware loaded and lifecycle-
> +  managed by the Linux remoteproc framework.
> +
> +  The driver controls CCU-integrated clocks (bus, core) and resets
> +  (cfg, core), programs the hardware boot-vector register, maps
> +  internal SRAM (SRAM_A3) windows, and connects to the Allwinner
> +  hardware mailbox (CPUX_MSGBOX) for VirtIO RPMsg IPC.
> +
> +properties:
> +  compatible:
> +    const: allwinner,sun55i-a523-rproc
> +
> +  reg:
> +    minItems: 1
> +    maxItems: 4
> +    description:
> +      Memory-mapped register regions. The following named regions are
> +      supported (all optional except at least one of r_sram or r_sram1) -
> +      "cfg" for RISC-V core control and boot-vector registers,
> +      "r_sram" for dedicated MCU SRAM Space 0,
> +      "r_sram1" for switchable MCU SRAM Space 1,
> +      "remap" for the hardware remap control register.
> +
> +  reg-names:
> +    minItems: 1
> +    maxItems: 4
> +    items:
> +      enum:
> +        - cfg
> +        - r_sram
> +        - r_sram1
> +        - remap

So you completely ignored my feedback and sent exactly the same.

Best regards,
Krzysztof



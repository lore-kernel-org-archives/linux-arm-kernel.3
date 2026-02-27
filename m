Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B02CFD5306
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Feb 2026 07:10:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0Vpg5MT/uJia7N5MMZ/7BXUU57HnV5goJapelioLMeI=; b=AE8Yjcf2WLzsDuBJmg+VR+/kwL
	7gpzYrUJ3WT0nh7hmIPCBSDFzo5isTTQb6SUg3fVPpuhEs76ov65XZWPaJsHyyyHOp4nMEAzx/xpH
	6R1tHN2KSHlb7qr4vvPxr91j5a/23ldUumImCqQW7R5wj4vyXA+TUfL+mZobKuLc4/TkOp+OztD+W
	wkUyQj8naQ55tq9EijUTO+e8KPT2Qhx8UMmPMlaLOPNZrYjL9RC/3qsAGXsKRThp2AuTcHROfknoW
	UaAbTpr4QwZxlZilwetto0mZNyc+qhSl6w+bWrHq7bK7cX1XjQDGEl2QF0R0nMj/uFjvBBzCp+Hdf
	1J0zHO/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvrzP-00000007qmI-3lbZ;
	Fri, 27 Feb 2026 07:10:19 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvrzM-00000007qly-0CSN
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Feb 2026 07:10:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BB7E343BD8;
	Fri, 27 Feb 2026 07:10:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0EB63C116C6;
	Fri, 27 Feb 2026 07:10:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772176215;
	bh=93SPmf8E1jF/TUfDZS9PtOn4hN3P8OgjiQA0WaPpkyc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lOqvjHTIbBmGaLmKo7MKt67M5+Af+GJ86NRwN2OlqEJLzdbtTezhxOjbSjJZP+xAs
	 SOZErT7krFSIlClMQH0xvETYKDJOpapuDbdCtTZSTSWGC8nt8nqpJNkgapfjQQDACw
	 d1Lx7lLoAcgJOYBlHEMNH0OU7AKP/WTMdKXZyYZzcx0ytP6la3SlCiXC3fH9WOEbJw
	 oFi2oLFSaoUuE+grq3S68v8jO7xA6iCmPBD5ny1o2eGrcvZhBJXjb3t3YxumCGQIAg
	 CTL5f2NtnpBhwgj1RoEpk/UyD1mf0sMQWtZJ6As3q0P8c3K8caAMYahDY0HMawDNcv
	 EuQGP1TFrpOyw==
Date: Fri, 27 Feb 2026 08:10:13 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ryan Chen <ryan_chen@aspeedtech.com>
Cc: jk@codeconstruct.com.au, andriy.shevchenko@linux.intel.com, 
	Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
	Benjamin Herrenschmidt <benh@kernel.crashing.org>, Rayn Chen <rayn_chen@aspeedtech.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	openbmc@lists.ozlabs.org
Subject: Re: [PATCH v25 1/4] dt-bindings: i2c: Split AST2600 binding into a
 new YAML
Message-ID: <20260227-fragrant-industrious-aardwark-bdb63b@quoll>
References: <20260225-upstream_i2c-v25-0-9f4bdd954f3f@aspeedtech.com>
 <20260225-upstream_i2c-v25-1-9f4bdd954f3f@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260225-upstream_i2c-v25-1-9f4bdd954f3f@aspeedtech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_231016_999891_C3BFF972 
X-CRM114-Status: GOOD (  22.09  )
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

On Wed, Feb 25, 2026 at 05:19:38PM +0800, Ryan Chen wrote:
> The AST2600 I2C controller introduces a completely new register layout
> with separate controller and target register blocks, unlike the mixed
> register layout used by AST2400/AST2500.
> 
> To describe this properly, split out the AST2600 I2C binding into its
> own YAML file. The compatible string remains unchanged.

But you made other changes in the binding. You must list them, because
otherwise it sounds like you only SPLIT. It's not true. You actually
changed the binding in at least two places, maybe more.

> 
> The example section is updated to reflect the actual AST2600 SoC
> register layout and interrupt configuration (aspeed-g6.dtsi,
> lines 885-897):
> 
> - I2C bus and buffer register offsets
>   - AST2600 I2C controller register base starts at 0x80, and the
>     buffer region is located at 0xc00, per the AST2600 SoC register map.
> 
> - Interrupt configuration
>   - AST2600 I2C controllers are connected to the ARM GIC, not the legacy
>     internal interrupt controller.

Example is irrelevant, don't mention it. We discuss here binding.

> 
> Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
> ---
>  .../bindings/i2c/aspeed,ast2600-i2c.yaml           | 62 ++++++++++++++++++++++
>  .../devicetree/bindings/i2c/aspeed,i2c.yaml        |  3 +-
>  2 files changed, 63 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/i2c/aspeed,ast2600-i2c.yaml b/Documentation/devicetree/bindings/i2c/aspeed,ast2600-i2c.yaml
> new file mode 100644
> index 000000000000..077be85137c9
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/i2c/aspeed,ast2600-i2c.yaml
> @@ -0,0 +1,62 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/i2c/aspeed,ast2600-i2c.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: ASPEED I2C on the AST26XX SoCs

s/26XX/2600/ probably

> +
> +maintainers:
> +  - Ryan Chen <ryan_chen@aspeedtech.com>
> +
> +allOf:
> +  - $ref: /schemas/i2c/i2c-controller.yaml#
> +
> +properties:
> +  compatible:
> +    enum:
> +      - aspeed,ast2600-i2c-bus
> +
> +  reg:
> +    items:
> +      - description: controller registers
> +      - description: controller buffer space
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  clock-frequency:
> +    description: Desired operating frequency of the I2C bus in Hz.
> +    minimum: 500
> +    maximum: 4000000
> +    default: 100000
> +
> +  resets:
> +    maxItems: 1
> +
> +required:
> +  - reg
> +  - compatible
> +  - clocks
> +  - resets
> +  - interrupts
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/aspeed-clock.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    i2c@80 {
> +      #address-cells = <1>;
> +      #size-cells = <0>;

Please follow DTS coding style.

Best regards,
Krzysztof



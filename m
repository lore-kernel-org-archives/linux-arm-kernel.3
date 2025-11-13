Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFDADCCFA18
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Nov 2025 08:01:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OGzk/NRGfq8NtTrbMxnWq8fnT7IBrxgexYVyf86wUgY=; b=SykhtJZP3eiAozPgCKNCx3sxFz
	aX6+j+5UXXgdblXmOgt/p6hIQ7nYK08DpDBoFS8YhfKJ5zudCxbUmXEHbZ4kcEFTwu+XNdQZLQFvE
	RyS+TbQSlL0G6U+e4+Ge5Qm8E/7IGcuFWm3+IXubCGLr9YALv/6gWm/np/sVPnxmEDFgmF7iCojcL
	XI5zLfDuYXumIuYC4Jg/SJnILIvqPdtO9HzbJcMIRdDRv/Tqok8St/0Qh7hOgCfb2hcpFluS9rCgI
	eE9oE3HvwcoZZLJ5Zx4/PvdWTswZeqHaz6icBMgdfWraIfJMsbb00cjTWEz3KVIi0vg9TVeiLhC6i
	+pYSkH7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJSGE-0000000A2mi-3Fvz;
	Thu, 13 Nov 2025 08:00:54 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJSGC-0000000A2m3-2pfy
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Nov 2025 08:00:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0058644050;
	Thu, 13 Nov 2025 08:00:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D933C4CEF8;
	Thu, 13 Nov 2025 08:00:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763020851;
	bh=WmqkW3UkMPxJ2hqmmHl3aY1fYJJukh2KzhzojgxvCVw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MvngG+gP69SHM63Z5iI4/xBcHcRs5CX3CfTI4J8cHRSjueLzf1e79gBMCBFR16cDe
	 pW0tfxhuQ9L76KNMppP5d6rV1Vl5AjD1q2qhwkSoLbHEqj6OC3R27NLlZEqXJzyV0X
	 yc4nRv7c4ySqJKX4+z/EVNbxvMlPHMZerq8edYClXV1ka6zr7npFiBQWJGaIFmGiQr
	 YK62ZoCZu9cXjNk6cUzPSKAUh9nJQ65kNcp7PgOslvJDq0oYMKh5nYXJLizxnxrhxH
	 5Wk1hoq7bTIePtEoeYN6Mzy1J0YbKpIN9KOo+ZMScmRR2K9DYCkXrpPZDYPrHpDscU
	 VF5xF+BI5UbOg==
Date: Thu, 13 Nov 2025 09:00:49 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ryan Chen <ryan_chen@aspeedtech.com>
Cc: bmc-sw@aspeedtech.com, benh@kernel.crashing.org, joel@jms.id.au, 
	andi.shyti@kernel.org, jk@codeconstruct.com.au, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, andrew@codeconstruct.com.au, p.zabel@pengutronix.de, 
	andriy.shevchenko@linux.intel.com, naresh.solanki@9elements.com, linux-i2c@vger.kernel.org, 
	openbmc@lists.ozlabs.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v22 1/4] dt-bindings: i2c: Split AST2600 binding into a
 new YAML
Message-ID: <20251113-waxbill-of-awesome-fame-8a84d1@kuoka>
References: <20251112085649.1903631-1-ryan_chen@aspeedtech.com>
 <20251112085649.1903631-2-ryan_chen@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251112085649.1903631-2-ryan_chen@aspeedtech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_000052_755057_78877265 
X-CRM114-Status: GOOD (  23.12  )
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

On Wed, Nov 12, 2025 at 04:56:46PM +0800, Ryan Chen wrote:
> The AST2600 I2C controller introduces a completely new register
> map and Separate control/target register sets, unlike the mixed
> layout used in AST2400/AST2500.
> 
> In addition, at new AST2600 configuration registers and transfer
> modes require new DT properties, which are incompatible with
> existing bindings. Therefore, this creates a dedicated binding
> file for AST2600 to properly describe these new hardware
> capabilities.
> 
> A subsequent change will modify this new binding to properly
> describe the AST2600 hardware.
> 
> The example section updated to reflect the actual AST2600 SoC
> register layout and interrupt configuration.
> Reference: aspeed-g6.dtsi (lines 885-897)
> 
> -I2C bus and buffeset address offsets
>  - AST2600 I2C controller register base starts from 0x80, and the
>    buffer region is located at 0xc00, as defined in AST2600 SOC
>    register map.
> 
> -Interrupt configuration
>  - AST2600 U2C controller are connected to ARM GIC interrupt
>    controller rather than the legacy internal interrupt controller.
> 
> Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
> ---
>  .../bindings/i2c/aspeed,ast2600-i2c.yaml      | 67 +++++++++++++++++++
>  .../devicetree/bindings/i2c/aspeed,i2c.yaml   |  3 +-
>  2 files changed, 68 insertions(+), 2 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/i2c/aspeed,ast2600-i2c.yaml
> 
> diff --git a/Documentation/devicetree/bindings/i2c/aspeed,ast2600-i2c.yaml b/Documentation/devicetree/bindings/i2c/aspeed,ast2600-i2c.yaml
> new file mode 100644
> index 000000000000..e6ed84c53639
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/i2c/aspeed,ast2600-i2c.yaml
> @@ -0,0 +1,67 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/i2c/aspeed,ast2600-i2c.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: ASPEED I2C on the AST26XX SoCs
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
> +    minItems: 1
> +    maxItems: 2
> +    description:
> +      The first region covers the controller registers.
> +      The optional second region covers the controller's buffer space.

1. List the items instead. We discussed this already and this had
correct format in the past and now it is getting to some odd style. Why?

2. How region can be optional? Device either has it or does not have it.
Please explain me how one, same SoC has optional IO address space? I
asked to explain WHY this is flexible.

You never replied.

NAK, we are discussing same over and over again. I am not reviewing the
rest. Go to previous versions and read the feedback again.

Best regards,
Krzysztof



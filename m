Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BC0DCA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 09:37:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MR0mGwVaP63tprA30EW/NWo/9dDiP1xCdBvs4/l8hWc=; b=lCx4uHycXRzIEbyoi3Hnfg/aKO
	hoDNFeFu/IaoloxBEJy0u9uuQzCvixD3O0uoilE8LYhCUGUSKqqd0PD3O8BlZCjwLbZW4RLTgFCtF
	qk80nXQTFWU7Y/Y//mrcsOFB5TYaUpraDAVSeWEFikP1kN9E7fLBE0KDwVCzAnpDkpqWwDPiIh6Fr
	4zVgTIF3+2oDSYaElTxU84Jhzd7lCVFC5oWzd2x/jmipXj3QLlnDrDVlD7Mum7AnSvfBRgQJyuUkx
	LVbLiyswJtXZKJ8mDzXJvs6G0HT7Gk6Eb7OLWAb4WefrPYHFdm/TfvNxxAtJQLAhH6Kx9LcIFry7O
	oDsCo22g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuSt7-00000000mwx-0zu3;
	Fri, 05 Sep 2025 09:37:45 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuRcb-00000000IBt-3MwS
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Sep 2025 08:16:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 88FCE4020F;
	Fri,  5 Sep 2025 08:16:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDA29C4CEF1;
	Fri,  5 Sep 2025 08:16:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757060197;
	bh=0+i54Si2cMI9nBtLp8I1HNyZ8djprDv/KS3WoyWPmOE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=D8bJ3+ykwQH5VksbMEcM5VcdAdKja9Ie/6gP3kW3ShfMCYvV54eoW/lUuryOeqoZ5
	 WzObbEp5u6lQOLzmhqRwMlvOQcINIQdnrJDQmcSFacwlirQv6BzJuq2Mms9r1iR20L
	 qaOpx7kRJksiamSajB5X73CLtcajkWyOC/Fnd7U2Yb1bFWMiDFLX+lWZcNThiWpck3
	 dncnKrdemaBMYWDMdcotIGiqEnIBapC/m/MC+4BYHe+OPvKn34IlVTXj5aPuWDXz4u
	 1P1TlUMQidi+x2eKCTNhqgGY5w9BLDKRBjEsE3kq6yQz1FaoHlQ0pxIIkUjdV438xB
	 Dzsg9mNvLZfQQ==
Date: Fri, 5 Sep 2025 10:16:34 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Billy Tsai <billy_tsai@aspeedtech.com>
Cc: lee@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, joel@jms.id.au, andrew@codeconstruct.com.au, 
	linus.walleij@linaro.org, brgl@bgdev.pl, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	openbmc@lists.ozlabs.org, linux-gpio@vger.kernel.org, BMC-SW@aspeedtech.com
Subject: Re: [PATCH v2 2/4] dt-bindings: pinctrl: aspeed: Add support for
 AST27xx
Message-ID: <20250905-monumental-camouflaged-butterfly-01faed@kuoka>
References: <20250904103401.88287-1-billy_tsai@aspeedtech.com>
 <20250904103401.88287-3-billy_tsai@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250904103401.88287-3-billy_tsai@aspeedtech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250905_011637_881029_9F825113 
X-CRM114-Status: GOOD (  16.89  )
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

On Thu, Sep 04, 2025 at 06:33:59PM +0800, Billy Tsai wrote:
> Add bindings for the pin controller found in the ASPEED AST27xx SoC.
> The ASPEED AST2700 SoC contains two separate pin controllers, each
> managed by a distinct System Control Unit (SCU).
> Because these two controllers have different register maps, control
> different sets of pins, support different pin configuration options, and
> implement different multi-function switch logic, they are not compatible.
> Therefore, two separate device tree bindings,'aspeed,ast2700-soc0-pinctrl'
> and 'aspeed,ast2700-soc1-pinctrl', are introduced.
> 
> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
> ---
>  .../pinctrl/aspeed,ast2700-soc0-pinctrl.yaml  | 115 +++++
>  .../pinctrl/aspeed,ast2700-soc1-pinctrl.yaml  | 435 ++++++++++++++++++
>  2 files changed, 550 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/aspeed,ast2700-soc0-pinctrl.yaml
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/aspeed,ast2700-soc1-pinctrl.yaml
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/aspeed,ast2700-soc0-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/aspeed,ast2700-soc0-pinctrl.yaml
> new file mode 100644
> index 000000000000..0fee62259250
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/aspeed,ast2700-soc0-pinctrl.yaml
> @@ -0,0 +1,115 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pinctrl/aspeed,ast2700-soc0-pinctrl.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: ASPEED AST2700 SoC0 Pin Controller
> +
> +maintainers:
> +  - Billy Tsai <billy_tsai@aspeedtech.com>
> +
> +description: |

Drop |

> +  Bindings for the ASPEED AST2700 SoC0 Pin Controller.

You should explain here hardware, not say what bindings are (we know
what bindings are) or copy title, either.

> +
> +properties:
> +  compatible:
> +    const: aspeed,ast2700-soc0-pinctrl
> +
> +additionalProperties:

You should restrict nodes with pattern to common suffix or prefix, e.g.
group, state, pins. See other pinctrl bindings for examples.


> +  $ref: pinmux-node.yaml#
> +  additionalProperties: false
> +
> +  properties:
> +    function:
> +      enum:
> +        - EMMC
> +        - VGADDC
> +        - USB3A
> +        - USB2A
> +        - USB3B
> +        - USB2B
> +        - JTAG0
> +        - PCIERC
> +
> +    groups:
> +      enum:
> +        - EMMCG1
> +        - EMMCG4
> +        - EMMCG8
> +        - EMMCWPN
> +        - EMMCCDN
> +        - VGADDC
> +        - USB3AXHD
> +        - USB3AXHPD
> +        - USB3AXH
> +        - USB3AXHP
> +        - USB3AXH2B
> +        - USB3AXHP2B
> +        - USB2AXHD1
> +        - USB2AXHPD1
> +        - USB2AD1
> +        - USB2AXH
> +        - USB2AXHP
> +        - USB2AXH2B
> +        - USB2AXHP2B
> +        - USB2AHPD0
> +        - USB2AD0
> +        - USB2AH
> +        - USB2AHP
> +        - USB3BXHD
> +        - USB3BXHPD
> +        - USB3BXH
> +        - USB3BXHP
> +        - USB3BXH2A
> +        - USB3BXHP2A
> +        - USB2BXHD1
> +        - USB2BXHPD1
> +        - USB2BD1
> +        - USB2BXH
> +        - USB2BXHP
> +        - USB2BXH2A
> +        - USB2BXHP2A
> +        - USB2BHPD0
> +        - USB2BD0
> +        - USB2BH
> +        - USB2BHP
> +        - JTAGM0
> +        - PSP
> +        - SSP
> +        - TSP
> +        - DDR
> +        - USB3A
> +        - USB3B
> +        - PCIEA
> +        - PCIEB
> +        - PCIERC0PERST
> +        - PCIERC1PERST
> +
> +    pins:
> +      $ref: /schemas/types.yaml#/definitions/string-array
> +    drive-strength:
> +      minimum: 0
> +      maximum: 15
> +
> +allOf:
> +  - $ref: pinctrl.yaml#
> +
> +required:
> +  - compatible
> +
> +examples:
> +  - |
> +    pinctrl0: pinctrl{

DTS coding style - missing space.

Unused label.

And you did not implement Rob's comment.


Best regards,
Krzysztof



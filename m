Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7393AC77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Jun 2025 22:47:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xVaMRohSFRgmSbPZ4apQogUHqXg6LrB2kywGldJUPUk=; b=dj7R4l6InLmYzkd31fvV4fuUL8
	RKlUl3J7cwCDHpDrJH9FJpp/v7dOeareYpQWoIYTsoMsla+WVQFl/xdfR1CJ7P6JwmEhJG4t3NZ8D
	IruKKayQJa25YwJmQBw6+cDka6Fx766klwwwuQsIenHMHQvWW8JW8wVU9Oj2Dr8iow/DHa4ErNcV0
	gTniBl1CIf5sbDd0wHc8TUfUjqPQ0nWgQhN/X9Sn1Qxwbqzukt5QzTvX1UdVoXX72OfNTm+9wWMcc
	Oa55dAqfuEwCf0PU8qd/DoJe7S5MXYZPUOm0QuhLDki+fmihaEhkcEkHzYv92OhG4ZYemtBLQfoxp
	ecMF7HZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUYtO-0000000A6HQ-2qxO;
	Wed, 25 Jun 2025 22:46:58 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUXIg-00000009wAh-1SrF;
	Wed, 25 Jun 2025 21:05:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 648325C5D32;
	Wed, 25 Jun 2025 21:02:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DDAFC4CEEA;
	Wed, 25 Jun 2025 21:04:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750885497;
	bh=TwGs9xcqNKKZwXveR38XoItJjJjoTUCut41NngfDuik=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fcsXt6oS90PgQatLapdwcdjg5ia5EOeRBAAxyHyXaqEq509DGgKqAH4YB16oiKVbi
	 gCHFaQ6danRokdU3VaXQHaDBpqN/4H24MIIog8UlfyAJYxnzu99ooq2/0+YXRDMXjk
	 a9h+XgpAz6LVGHwkYUTGPmFSqAw6Rfoq3exAjLjg2aU6Zz53xULEhZAIRc0t8jhoT9
	 keXTLpmUQpCKAziaUZLLNRHIFLP9x6Qp6neDgp5c2sLkHaPj7K9hMh7DOMSGfE1WEI
	 Dn4XES7ca5/ZSM6IXyhhIwbx4CwW+gZ1caGsKqpyzW1G/Hnkz0ubIxFbpmYQvQhnkv
	 O3QPMeeYOd9Og==
Date: Wed, 25 Jun 2025 16:04:56 -0500
From: Rob Herring <robh@kernel.org>
To: Jacky Chou <jacky_chou@aspeedtech.com>
Cc: bhelgaas@google.com, lpieralisi@kernel.org, kwilczynski@kernel.org,
	mani@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	joel@jms.id.au, andrew@codeconstruct.com.au, vkoul@kernel.org,
	kishon@kernel.org, linus.walleij@linaro.org, p.zabel@pengutronix.de,
	linux-aspeed@lists.ozlabs.org, linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
	openbmc@lists.ozlabs.org, linux-gpio@vger.kernel.org,
	elbadrym@google.com, romlem@google.com, anhphan@google.com,
	wak@google.com, yuxiaozhang@google.com, BMC-SW@aspeedtech.com
Subject: Re: [PATCH 3/7] dt-bindings: pci: Add document for ASPEED PCIe RC
Message-ID: <20250625210456.GA2177479-robh@kernel.org>
References: <20250613033001.3153637-1-jacky_chou@aspeedtech.com>
 <20250613033001.3153637-4-jacky_chou@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250613033001.3153637-4-jacky_chou@aspeedtech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_140458_471156_870B7F79 
X-CRM114-Status: GOOD (  15.50  )
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

On Fri, Jun 13, 2025 at 11:29:57AM +0800, Jacky Chou wrote:
> Add device tree binding documentation for the ASPEED PCIe Root Complex
> controller. This binding describes the required and optional properties
> for configuring the PCIe RC node, including support for syscon phandles,
> MSI, clocks, resets, and interrupt mapping. The schema enforces strict
> property validation and provides a comprehensive example for reference.
> 
> Signed-off-by: Jacky Chou <jacky_chou@aspeedtech.com>
> ---
>  .../devicetree/bindings/pci/aspeed-pcie.yaml  | 159 ++++++++++++++++++
>  1 file changed, 159 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pci/aspeed-pcie.yaml
> 
> diff --git a/Documentation/devicetree/bindings/pci/aspeed-pcie.yaml b/Documentation/devicetree/bindings/pci/aspeed-pcie.yaml
> new file mode 100644
> index 000000000000..5b50a9e2d472
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pci/aspeed-pcie.yaml
> @@ -0,0 +1,159 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pci/aspeed-pcie.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: ASPEED PCIe Root Complex Controller
> +
> +maintainers:
> +  - Jacky Chou <jacky_chou@aspeedtech.com>
> +
> +description: |
> +  Device tree binding for the ASPEED PCIe Root Complex controller.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - aspeed,ast2600-pcie
> +      - aspeed,ast2700-pcie
> +
> +  device_type:
> +    const: pci
> +
> +  reg:
> +    maxItems: 1
> +
> +  ranges:
> +    minItems: 2
> +    maxItems: 2
> +
> +  interrupts:
> +    description: IntX and MSI interrupt
> +
> +  resets:
> +    items:
> +      - description: Module reset
> +      - description: PCIe PERST
> +
> +  reset-names:
> +    items:
> +      - const: h2x
> +      - const: perst
> +
> +  msi-parent: true
> +
> +  msi_address:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: MSI address

What's this for?

> +
> +  aspeed,ahbc:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: Phandle to ASPEED AHBC syscon.
> +
> +  aspeed,pciecfg:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: Phandle to ASPEED PCIe configuration syscon.
> +
> +  aspeed,pciephy:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: Phandle to ASPEED PCIe PHY syscon.

Use the phy binding and make the phy control a separate driver.

Rob


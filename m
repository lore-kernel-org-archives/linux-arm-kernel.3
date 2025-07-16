Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6E40C83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Jul 2025 08:40:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zMqIeYsdByrg0V4XfdLCEiDMy3FizptbIRYnCCNLKvU=; b=x7rjK27kUxGpeWoM44uv2dY1r7
	oJgv2tXg8S+D68zDBVItOv8xW4bvXi+xFXwQXYLNDUQDcSt0Fvmamt+h92mU5mqaViDTGRCNWOP81
	2er482yzWTa3Mj8ysTOnoAKsYnpxOJnEP/yzolXoVZfrmaMDRbk8fp8jL9ynFEV8oJVTVR9+tGftg
	f8tYav6/7PDgPsJO/YSQJcVJu0+BeJzb/uPFtuZi94DTrYrxK6crtdqqmM7x7CjDNq2mq7Hpr6A3U
	8KPcHF2uX8RvUVD0S+nRac7Nb5zBMWZnvk8LHYaWAMaFceEY/ggcIxGatfataXquWx8k0rzTh//7d
	sYZRGRIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubxgv-00000007CC2-0bhK;
	Wed, 16 Jul 2025 08:40:41 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubxQR-000000079zy-3AdQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Jul 2025 08:23:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3FCFD5C5674;
	Wed, 16 Jul 2025 08:23:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A6F9C4CEF0;
	Wed, 16 Jul 2025 08:23:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752654218;
	bh=cp2m1cQPpeNT2d53wsl0tGzY5ODL2sh/xGBe89ivRr4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OsuSqHmDg5QaUkjKR88pXkBRjXFiGTJmpqIR2xTr5Z9U1Ok9P/L5vM+a06yTG3toz
	 at3wk0tkzeoEdt0BukhNBUIqcbPqs732/P+an+XUDciRV3hHnaPzyNPpyHmN8OXYWc
	 BfRruYWHr+/kBdTkHGaGdfGb+meDtFsBpDNxR8r2f82JlPhK7gakGM2tsl+l0OjIcU
	 sPZL6T47LdaQ43C70ikZe6EPoBxS36V78shXEYhmf5W5W03iRjAkjgrj8TRd3Atm+c
	 WmPx1C5+9MA91F/pTTKGPiALFC+YTLSWiyrLEBh89IIL12Ks8wyLQ+BJCGLvU8rGQb
	 MpkLR0taXi9CA==
Date: Wed, 16 Jul 2025 10:23:36 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jacky Chou <jacky_chou@aspeedtech.com>
Cc: bhelgaas@google.com, lpieralisi@kernel.org, kwilczynski@kernel.org, 
	mani@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	joel@jms.id.au, andrew@codeconstruct.com.au, linux-aspeed@lists.ozlabs.org, 
	linux-pci@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org, linux-gpio@vger.kernel.org, 
	linus.walleij@linaro.org, p.zabel@pengutronix.de, BMC-SW@aspeedtech.com
Subject: Re: [PATCH v2 02/10] dt-bindings: soc: aspeed: Add ASPEED PCIe PHY
 support
Message-ID: <20250716-innocent-satisfied-pug-9ecc15@krzk-bin>
References: <20250715034320.2553837-1-jacky_chou@aspeedtech.com>
 <20250715034320.2553837-3-jacky_chou@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250715034320.2553837-3-jacky_chou@aspeedtech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250716_012339_876881_91D04638 
X-CRM114-Status: GOOD (  22.40  )
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

On Tue, Jul 15, 2025 at 11:43:12AM +0800, Jacky Chou wrote:
> This PHY is used by many modules. In our design, our
> PCIe has RC and EP funcitons. On the different function,
> each driver will use configure and get some information
> from the PHY interface to do somting that it wants to.
> Getting link status, setting syscon credits and so on.
> Therefore, define it as syscon for all modules.
> 
> Signed-off-by: Jacky Chou <jacky_chou@aspeedtech.com>
> ---
>  .../bindings/soc/aspeed/aspeed,pcie-phy.yaml  | 44 +++++++++++++++++++
>  1 file changed, 44 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/aspeed/aspeed,pcie-phy.yaml

Phys go to phy, not soc directory. Soc is not a dumping ground.

> 
> diff --git a/Documentation/devicetree/bindings/soc/aspeed/aspeed,pcie-phy.yaml b/Documentation/devicetree/bindings/soc/aspeed/aspeed,pcie-phy.yaml
> new file mode 100644
> index 000000000000..5fa585d63ca6
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/aspeed/aspeed,pcie-phy.yaml
> @@ -0,0 +1,44 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/soc/aspeed/aspeed,pcie-phy.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: ASPEED PCIe PHY
> +
> +maintainers:
> +  - Jacky Chou <jacky_chou@aspeedtech.com>
> +
> +description:
> +  The ASPEED PCIe PHY provides the physical layer interface for PCIe
> +  controllers in the SoC. This node represents the register block for the PCIe
> +  PHY, which is typically accessed by PCIe Root Complex or Endpoint drivers
> +  via syscon. It is used to configure and get the status of the PCIe PHY
> +  hardware, including power management, link training, and other PHY-specific
> +  operations.
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - aspeed,pcie-phy

No, see writing bindings.

> +      - const: syscon

It's not a syscon, but phy. I don't think you understood previous
feedback. Go back to v1. You just send something to pass the review
instead of reworking to make it correct.

> +
> +  reg:
> +    maxItems: 1
> +
> +  "#phy-cells":
> +    const: 0
> +
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    syscon@1e6ed200 {

wrong name, that's a phy

> +      compatible = "aspeed,pcie-phy", "syscon";
> +      reg = <0x1e6ed200 0x100>;

Incomplete

> +    };
> -- 
> 2.43.0
> 


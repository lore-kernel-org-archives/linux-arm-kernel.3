Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C1CEC3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 21:11:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aewh3b7GMeLdDn5jmZVCGfzbPDgaytOAuYTwY1fjbMo=; b=IQoBY5VFFtpwE/f74IHVlBUfrQ
	7nPpNaVMaE6JMMNm/lhhYXarH1ItNNj2IgPyK3ALToplHkdNu6UT2cQDZ1cDK2c09JfK2QMZ3bfE4
	PctkG54nHIH3PL2U813jEfQrejbzK2kGSzX2itisbj3ZarWD3aI2ZyP50k3rcKK8t3GSQ0KbAQbRL
	SnTca/WBdsTo4Vat49xRfwEQD0vfAjBr/rR1zUrUxvOsFtHCJPMxqUmmJS62qxV2JkWOWx7NU3a3j
	65NxYjtNsur9qx2oSSgvCJmDeF7N1g6F1w2BvmsK1mLKXRTRbaTzlM9WJbtMrm38UvbbqS4TqtMqQ
	EiHWb2sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDUzi-00000004wBY-1AoX;
	Fri, 09 May 2025 21:10:58 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDUwu-00000004uU4-0pfj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 May 2025 21:08:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 465FDA4C5F5;
	Fri,  9 May 2025 21:08:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A72E5C4CEE4;
	Fri,  9 May 2025 21:08:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746824882;
	bh=CAxTMPR8YPvt69jMr9a/HnbcXSU4cctemxa+AVtAFbs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=N1We5LSVZ15+LhFsS3loTqYybJgPreqHIReEJy176pHa414yKvrmoykEIuRo4INxJ
	 9tmo0mlpg82B/zeb1OcfORrFivYHERRq75Yv6Vdp/9dgYqcoYwSuJlecEw/gLS4BAu
	 oSCsEwzKgHF9HBs2Wy5dS2QnW5SLLZ/GJVCTDyqvKxK/F1/6FRX8KiMgHoTWG3qC6a
	 6N4Y4bwzkA6EOkV5ULEsiXW5ej77xwcstcqJeCw4VJGmbphc8g9GFR9AnDCy0WqWdM
	 ZJ2Pgnklq9pxgw2YzALlThXNoxta6p5G+xD9OaEgPPtXQVnhs2Q/5Due7BvPpALYOv
	 FlUOoI4RB3oGA==
Date: Fri, 9 May 2025 16:08:00 -0500
From: Rob Herring <robh@kernel.org>
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: bhelgaas@google.com, lpieralisi@kernel.org, kw@linux.com,
	manivannan.sadhasivam@linaro.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, geert+renesas@glider.be, magnus.damm@gmail.com,
	mturquette@baylibre.com, sboyd@kernel.org, saravanak@google.com,
	p.zabel@pengutronix.de, linux-pci@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: Re: [PATCH 4/8] dt-bindings: PCI: renesas,r9a08g045s33-pcie: Add
 documentation for the PCIe IP on Renesas RZ/G3S
Message-ID: <20250509210800.GB4080349-robh@kernel.org>
References: <20250430103236.3511989-1-claudiu.beznea.uj@bp.renesas.com>
 <20250430103236.3511989-5-claudiu.beznea.uj@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250430103236.3511989-5-claudiu.beznea.uj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_140804_387902_B27EA510 
X-CRM114-Status: GOOD (  23.31  )
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

On Wed, Apr 30, 2025 at 01:32:32PM +0300, Claudiu wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> 
> The PCIe IP available on the Renesas RZ/G3S complies with the PCI Express
> Base Specification 4.0. It is designed for root complex applications and
> features a single-lane (x1) implementation. Add documentation for it.
> The interrupts, interrupt-names, resets, reset-names, clocks, clock-names
> description were obtained from the hardware manual.
> 
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> ---
>  .../pci/renesas,r9a08g045s33-pcie.yaml        | 242 ++++++++++++++++++
>  1 file changed, 242 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pci/renesas,r9a08g045s33-pcie.yaml
> 
> diff --git a/Documentation/devicetree/bindings/pci/renesas,r9a08g045s33-pcie.yaml b/Documentation/devicetree/bindings/pci/renesas,r9a08g045s33-pcie.yaml
> new file mode 100644
> index 000000000000..354f9c3be139
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pci/renesas,r9a08g045s33-pcie.yaml
> @@ -0,0 +1,242 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pci/renesas,r9a08g045s33-pcie.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Renesas RZ/G3S PCIe host controller
> +
> +maintainers:
> +  - Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> +
> +description:
> +  Renesas RZ/G3S PCIe host controller complies with PCIe Base Specification
> +  4.0 and supports up to 5 GT/s (Gen2).
> +
> +properties:
> +  compatible:
> +    const: renesas,r9a08g045s33-pcie # RZ/G3S
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    items:
> +      - description: System error interrupt
> +      - description: System error on correctable error interrupt
> +      - description: System error on non-fatal error interrupt
> +      - description: System error on fatal error interrupt
> +      - description: AXI error interrupt
> +      - description: INTA interrupt
> +      - description: INTB interrupt
> +      - description: INTC interrupt
> +      - description: INTD interrupt
> +      - description: MSI interrupt
> +      - description: Link bandwidth interrupt
> +      - description: PME interrupt
> +      - description: DMA interrupt
> +      - description: PCIe event interrupt
> +      - description: Message interrupt
> +      - description: All interrupts
> +
> +  interrupt-names:
> +    items:
> +      - description: int_serr
> +      - description: int_ser_cor
> +      - description: int_serr_nonfatal
> +      - description: int_serr_fatal
> +      - description: axi_err_int
> +      - description: inta_rc
> +      - description: intb_rc
> +      - description: intc_rc
> +      - description: intd_rc
> +      - description: intmsi_rc

Isn't every interrupt for the root complex?

> +      - description: int_link_bandwidth
> +      - description: int_pm_pme
> +      - description: dma_int
> +      - description: pcie_evt_int
> +      - description: msg_int
> +      - description: int_all

'int_' or '_int' is redundant (and inconsistent). Drop.

> +
> +  clocks:
> +    items:
> +      - description: System clock
> +      - description: PM control clock
> +
> +  clock-names:
> +    items:
> +      - description: aclk
> +      - description: clkl1pm

'l1pm' or 'pm'

> +
> +  resets:
> +    items:
> +      - description: AXI2PCIe Bridge reset
> +      - description: Data link layer/transaction layer reset
> +      - description: Transaction layer (ACLK domain) reset
> +      - description: Transaction layer (PCLK domain) reset
> +      - description: Physical layer reset
> +      - description: Configuration register reset
> +      - description: Configuration register reset
> +
> +  reset-names:
> +    items:
> +      - description: aresetn
> +      - description: rst_b
> +      - description: rst_gp_b
> +      - description: rst_ps_b
> +      - description: rst_rsm_b
> +      - description: rst_cfg_b
> +      - description: rst_load_b
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  dma-ranges:
> +    description:
> +      A single range for the inbound memory region.
> +    maxItems: 1
> +
> +  renesas,sysc:
> +    description: System controller phandle
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +
> +  vendor-id:
> +    const: 0x1912
> +
> +  device-id:
> +    const: 0x0033
> +
> +  legacy-interrupt-controller:
> +    description: Interrupt controller node for handling legacy PCI interrupts
> +    type: object
> +
> +    properties:
> +      "#address-cells":
> +        const: 0
> +
> +      "#interrupt-cells":
> +        const: 1
> +
> +      interrupt-controller: true
> +
> +      interrupts:
> +        items:
> +          - description: INTA interrupt
> +          - description: INTB interrupt
> +          - description: INTC interrupt
> +          - description: INTD interrupt
> +
> +    required:
> +      - "#address-cells"
> +      - "#interrupt-cells"
> +      - interrupt-controller
> +      - interrupts
> +
> +    additionalProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - resets
> +  - reset-names
> +  - interrupts
> +  - interrupt-names
> +  - interrupt-map
> +  - interrupt-map-mask
> +  - power-domains
> +  - "#address-cells"
> +  - "#size-cells"
> +  - "#interrupt-cells"
> +  - renesas,sysc
> +  - vendor-id
> +  - device-id
> +
> +allOf:
> +  - $ref: /schemas/pci/pci-host-bridge.yaml#
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/r9a08g045-cpg.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    bus {
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +
> +        gic: interrupt-controller {
> +            interrupt-controller;
> +            #interrupt-cells = <3>;
> +        };

Drop. Don't need to show provider nodes for the example.

> +
> +        pcie@11e40000 {
> +            compatible = "renesas,r9a08g045s33-pcie";
> +            reg = <0 0x11e40000 0 0x10000>;
> +            ranges = <0x03000000 0 0x30000000 0 0x30000000 0 0x8000000>;
> +            dma-ranges = <0x42000000 0 0x48000000 0 0x48000000 0 0x8000000>;
> +            bus-range = <0x0 0xff>;
> +            clocks = <&cpg CPG_MOD R9A08G045_PCI_ACLK>,
> +                     <&cpg CPG_MOD R9A08G045_PCI_CLKL1PM>;
> +            clock-names = "aclk", "clkl1pm";
> +            resets = <&cpg R9A08G045_PCI_ARESETN>,
> +                     <&cpg R9A08G045_PCI_RST_B>,
> +                     <&cpg R9A08G045_PCI_RST_GP_B>,
> +                     <&cpg R9A08G045_PCI_RST_PS_B>,
> +                     <&cpg R9A08G045_PCI_RST_RSM_B>,
> +                     <&cpg R9A08G045_PCI_RST_CFG_B>,
> +                     <&cpg R9A08G045_PCI_RST_LOAD_B>;
> +            reset-names = "aresetn", "rst_b", "rst_gp_b", "rst_ps_b",
> +                          "rst_rsm_b", "rst_cfg_b", "rst_load_b";
> +            interrupts = <GIC_SPI 395 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 396 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 397 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 398 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 399 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 400 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 401 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 402 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 403 IRQ_TYPE_LEVEL_HIGH>,

It is very odd that you have the INTx interrupts here and below.

As I mentioned in the driver, you don't need the legacy node any more. 
Just add 'interrupt-controller' to this node and point interrupt-map to 
this node.

> +                         <GIC_SPI 404 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 405 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 406 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 407 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 408 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 409 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 410 IRQ_TYPE_LEVEL_HIGH>;
> +            interrupt-names = "int_serr", "int_serr_cor", "int_serr_nonfatal",
> +                              "int_serr_fatal", "axi_err_int", "inta_rc",
> +                              "intb_rc", "intc_rc", "intd_rc",
> +                              "intmsi_rc", "int_link_bandwidth", "int_pm_pme",
> +                              "dma_int", "pcie_evt_int", "msg_int",
> +                              "int_all";
> +            #interrupt-cells = <1>;
> +            interrupt-map-mask = <0 0 0 7>;
> +            interrupt-map = <0 0 0 1 &pcie_intx 0>, /* INT A */
> +                            <0 0 0 2 &pcie_intx 1>, /* INT B */
> +                            <0 0 0 3 &pcie_intx 2>, /* INT C */
> +                            <0 0 0 4 &pcie_intx 3>; /* INT D */
> +            device_type = "pci";
> +            num-lanes = <1>;
> +            #address-cells = <3>;
> +            #size-cells = <2>;
> +            power-domains = <&cpg>;
> +            renesas,sysc = <&sysc>;
> +            vendor-id = <0x1912>;
> +            device-id = <0x0033>;
> +
> +            pcie_intx: legacy-interrupt-controller {
> +                interrupt-controller;
> +                #interrupt-cells = <1>;
> +                #address-cells = <0>;
> +                interrupt-parent = <&gic>;
> +                interrupts = <GIC_SPI 400 IRQ_TYPE_LEVEL_HIGH>,
> +                             <GIC_SPI 401 IRQ_TYPE_LEVEL_HIGH>,
> +                             <GIC_SPI 402 IRQ_TYPE_LEVEL_HIGH>,
> +                             <GIC_SPI 403 IRQ_TYPE_LEVEL_HIGH>;
> +            };
> +        };
> +    };
> +
> +...
> -- 
> 2.43.0
> 


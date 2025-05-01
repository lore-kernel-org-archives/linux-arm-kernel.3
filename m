Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E050C3ABA3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 May 2025 20:18:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=2WbpSpq/aUJby5n8Ief87MwRRWQoETGUDk+4NXduHso=; b=ubFIc96qP5/NcN
	4DGICX19nwZqo5OsZZnrgsogQukwZzLrDko85HTIEZw5LbD2MFjBtBTY4A7Q+2+Um5mgsUn/JYHIw
	u2cbNbFWrcGsLl4hd626XGUndqkSyJ/C0ufUEvG4RSFbmbDH5kM7nDcp5Ez+lgqqeLbZt9uo3R5kG
	c8S3nLC6hb6ywgzhrfgCdIHYmm+SktJ/L2gUvBvvFQUgC0glZKmIZpHqlzT8Qhq7YZwqQvme653VY
	nn9y3EJrHS//7hZ4MITMai7lsxz+/XEHSebiLV+C+3IP0IToE/2IhEEngCZw0b10sBMKoYONqlwAj
	q1L9Eeo+Kd2ZJHOFe00w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAaMe-0000000GYo9-0rkg;
	Thu, 01 May 2025 20:18:36 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAaKk-0000000GYev-3tDX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 May 2025 20:16:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 41E3768443;
	Thu,  1 May 2025 20:16:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4F42C4CEE3;
	Thu,  1 May 2025 20:16:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746130597;
	bh=KoIajoRz9IIzv7lT16of5mH6bxXX5L+gMybdGmXBBSQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=cSCOLayyPXHMXW6DFbd4VTZPc3lActGhKMtSSoII+zQsqJjKi2NFi+Fk8YWgA8GqC
	 5h3WXxQRPwGtI0WoleXbD6cvgQEtlKJfKzJRXZK648EwHI3v23Rfxnn2PKJD+fzhOJ
	 K15uPciAYyslWymvlf/U1LwvmGKSejYbV9IU1wNgx117X7AAywqOwOGUwAEw/k7hkg
	 ly1EqeZNy1WAw3SVRczv5/ioOybmbBDf78di1aNQlbvqgTrpXkymNE/4fxATrkY508
	 zzQZ07w2wHcz0mvzZZDHr/nAFFPGTf+W1axo3+D2Jgbc9X9sFu77oVENr9crrut4LW
	 p3loHmdDpBIGw==
Date: Thu, 1 May 2025 15:16:36 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: bhelgaas@google.com, lpieralisi@kernel.org, kw@linux.com,
	manivannan.sadhasivam@linaro.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, geert+renesas@glider.be,
	magnus.damm@gmail.com, mturquette@baylibre.com, sboyd@kernel.org,
	saravanak@google.com, p.zabel@pengutronix.de,
	linux-pci@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: Re: [PATCH 4/8] dt-bindings: PCI: renesas,r9a08g045s33-pcie: Add
 documentation for the PCIe IP on Renesas RZ/G3S
Message-ID: <20250501201636.GA776341@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250430103236.3511989-5-claudiu.beznea.uj@bp.renesas.com>
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

Could this be structured in a way that separates the shared Root
Complex properties from the ones that are specific to the Root Port?
I know the current hardware only supports a single Root Port, but I
think we should plan to be able to support multiple Root Ports.

> +            interrupts = <GIC_SPI 395 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 396 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 397 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 398 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 399 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 400 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 401 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 402 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 403 IRQ_TYPE_LEVEL_HIGH>,
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


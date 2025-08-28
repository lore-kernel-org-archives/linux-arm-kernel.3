Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69CAFCA1003
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Aug 2025 23:25:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=PBzjGpAAJo/6ZJ+HRXM+0vHpHN431x4Dx3aSdSjOJNc=; b=4Y/ndZ0uYAqwNd
	RZ8s4cuENKb6BZ70pY4GjFj3vL5k5YKDbmcWc+s8eJz1vLPYD470qpeUnhTtmViAln/SWi/bK9efg
	mEn2g7tjgnMAgi0I+GqvJmR3rQf3gYTL1zE0gI6lgWFlPyhK3l+m+sWvY+Mx2FKT9JpSZkXxWcbJ6
	jYmfBompvgsf0Q/0caNm4sKnt5R23GjG5gmNLcc6P4XT4jnR1deQayYOs0FS1sHOUzozyz+32NW36
	Ac2HOZDn7oykYamLrcS8SFBp9ChOEwxdsi/zTkuYiLeGwy8/ZrSBdvZh9OZsi8RdO6ZTHgFdizQiR
	XTNZaau8KzQKJTbWQiMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urlzG-00000003dCh-0OUB;
	Thu, 28 Aug 2025 23:24:58 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uriPn-0000000330L-3Vob
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Aug 2025 19:36:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7DD7B4403E;
	Thu, 28 Aug 2025 19:36:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28BAFC4CEEB;
	Thu, 28 Aug 2025 19:36:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756409767;
	bh=OsoMClZ8zewBYWl+159+qqnGdVkEoyGDB7GLoGNd/TE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=k6xyCKSoZHCUN/xb2z1hgFOpvBNITDPTdgB/yNo+zgp+wzg0/iCiJo313C+gRx6h0
	 HcQRVMWJv+p7GyZcF4lkNyo1IhHCryoTndR8pxNezLRB6xdp0BxXIBdug9ximJv9op
	 veZe0kDGL2U/PXwytNoTGTTgrk9IjbRW8dbi7d3jO6uJdxcQkgVi4dYV41k1Lc6/Qb
	 MMyCWu4LHphr6dE/ylm5ADQgfCm4S3q7xdbPVif24gg9urwiyLJn2YzVbPotpgf5OG
	 tvI+G1KlGDdQgp+C3poxlb9FCsK1f54ZjN+/oTWLayzytev8Vg6rdzUWSQGEDoz69W
	 hQ7LVKCq3Sllw==
Date: Thu, 28 Aug 2025 14:36:05 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: claudiu beznea <claudiu.beznea@tuxon.dev>
Cc: bhelgaas@google.com, lpieralisi@kernel.org, kwilczynski@kernel.org,
	mani@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, geert+renesas@glider.be, magnus.damm@gmail.com,
	catalin.marinas@arm.com, will@kernel.org, mturquette@baylibre.com,
	sboyd@kernel.org, p.zabel@pengutronix.de, lizhi.hou@amd.com,
	linux-pci@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: Re: [PATCH v3 4/9] dt-bindings: PCI: renesas,r9a08g045s33-pcie: Add
 documentation for the PCIe IP on Renesas RZ/G3S
Message-ID: <20250828193605.GA957994@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fe7afeb5-e009-4f68-a3a8-58ff967d3780@tuxon.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_123607_918580_EA536719 
X-CRM114-Status: GOOD (  14.74  )
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

On Thu, Aug 28, 2025 at 10:11:55PM +0300, claudiu beznea wrote:
> On 8/8/25 14:25, Claudiu Beznea wrote:
> > On 08.07.2025 19:34, Bjorn Helgaas wrote:
> > > On Fri, Jul 04, 2025 at 07:14:04PM +0300, Claudiu wrote:
> > > > From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> > > > 
> > > > The PCIe IP available on the Renesas RZ/G3S complies with the PCI Express
> > > > Base Specification 4.0. It is designed for root complex applications and
> > > > features a single-lane (x1) implementation. Add documentation for it.
> ...

> Renesas HW team replied to me that there are no clock, reset, or interrupt
> signals dedicated specifically to the Root Port. All these signals are
> shared across the PCIe system.
> 
> Taking this and your suggestions into account, I have prepared the following
> device tree:
> 
> pcie: pcie@11e40000 {
> 	compatible = "renesas,r9a08g045-pcie";
> 	reg = <0 0x11e40000 0 0x10000>;
> 	ranges = <0x02000000 0 0x30000000 0 0x30000000 0 0x8000000>;
> 	/* Map all possible DRAM ranges (4 GB). */
> 	dma-ranges = <0x42000000 0 0x40000000 0 0x40000000 0x1 0x0>;
> 	bus-range = <0x0 0xff>;
> 	interrupts = <GIC_SPI 395 IRQ_TYPE_LEVEL_HIGH>,
> 		     <GIC_SPI 396 IRQ_TYPE_LEVEL_HIGH>,
> 		     <GIC_SPI 397 IRQ_TYPE_LEVEL_HIGH>,
> 		     <GIC_SPI 398 IRQ_TYPE_LEVEL_HIGH>,
> 		     <GIC_SPI 399 IRQ_TYPE_LEVEL_HIGH>,
> 		     <GIC_SPI 400 IRQ_TYPE_LEVEL_HIGH>,
> 		     <GIC_SPI 401 IRQ_TYPE_LEVEL_HIGH>,
> 		     <GIC_SPI 402 IRQ_TYPE_LEVEL_HIGH>,
> 		     <GIC_SPI 403 IRQ_TYPE_LEVEL_HIGH>,
> 		     <GIC_SPI 404 IRQ_TYPE_LEVEL_HIGH>,
> 		     <GIC_SPI 405 IRQ_TYPE_LEVEL_HIGH>,
> 		     <GIC_SPI 406 IRQ_TYPE_LEVEL_HIGH>,
> 		     <GIC_SPI 407 IRQ_TYPE_LEVEL_HIGH>,
> 		     <GIC_SPI 408 IRQ_TYPE_LEVEL_HIGH>,
> 		     <GIC_SPI 409 IRQ_TYPE_LEVEL_HIGH>,
> 		     <GIC_SPI 410 IRQ_TYPE_LEVEL_HIGH>;
> 	interrupt-names = "serr", "serr_cor", "serr_nonfatal",
> 			  "serr_fatal", "axi_err", "inta",
> 			  "intb", "intc", "intd", "msi",
> 			  "link_bandwidth", "pm_pme", "dma",
> 			  "pcie_evt", "msg", "all";
> 	#interrupt-cells = <1>;
> 	interrupt-controller;
> 	interrupt-map-mask = <0 0 0 7>;
> 	interrupt-map = <0 0 0 1 &pcie 0 0 0 0>, /* INTA */
> 			<0 0 0 2 &pcie 0 0 0 1>, /* INTB */
> 			<0 0 0 3 &pcie 0 0 0 2>, /* INTC */
> 			<0 0 0 4 &pcie 0 0 0 3>; /* INTD */
> 	clocks = <&cpg CPG_MOD R9A08G045_PCI_ACLK>,
> 		 <&cpg CPG_MOD R9A08G045_PCI_CLKL1PM>;
> 	clock-names = "aclk", "pm";
> 	resets = <&cpg R9A08G045_PCI_ARESETN>,
> 		 <&cpg R9A08G045_PCI_RST_B>,
> 		 <&cpg R9A08G045_PCI_RST_GP_B>,
> 		 <&cpg R9A08G045_PCI_RST_PS_B>,
> 		 <&cpg R9A08G045_PCI_RST_RSM_B>,
> 		 <&cpg R9A08G045_PCI_RST_CFG_B>,
> 		 <&cpg R9A08G045_PCI_RST_LOAD_B>;
> 	reset-names = "aresetn", "rst_b", "rst_gp_b", "rst_ps_b",
> 		      "rst_rsm_b", "rst_cfg_b", "rst_load_b";
> 	power-domains = <&cpg>;
> 	device_type = "pci";
> 	#address-cells = <3>;
> 	#size-cells = <2>;
> 	renesas,sysc = <&sysc>;
> 	status = "disabled";
> 
> 	pcie_port0: pcie@0,0 {
> 		reg = <0x0 0x0 0x0 0x0 0x0>;
> 		ranges;
> 		clocks = <&versa3 5>;
> 		clock-names = "ref";
> 		device_type = "pci";
> 		vendor-id = <0x1912>;
> 		device-id = <0x0033>;
> 		bus-range = <0x1 0xff>;

I don't think you need this bus-range.  The bus range for the
hierarchy below a Root Port is discoverable and configurable via
config space.

> 		#address-cells = <3>;
> 		#size-cells = <2>;
> 	};
> };


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BDACC5B572
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Aug 2026 17:27:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X6unJMePX+K+G6UtKC9LusLtaB7WxEVlPppAaRZx69A=; b=3k7DPuEVnvLNFfQGgk9aH0+g6S
	aX9eMh7pLNIOdXhG3zUmbxOrEd13UKHrifdlreRfgodVv44fXGE7LvgEyCqi4hZLb3V6ax68ya9Af
	qIZcX33neGrQ1tYOqOPrnLBzmG6V+d2uHy3Ssa+ha95BGx/4wiAAcUAFfCAb0sv3lkKdjhV0+Osil
	4WSu07TP0K5IhnVyJFglZtzTxK6In2NMOX/+mjxWTFokdZfrvdhWzMl2h2AFejSFuxCp5uWNUQjtv
	B3ZdDSc62CD5/+2c8hV46DujvfCYnNj1nvzGPzUbnTf1Ne++eFp0enoXg482Inb8pZxOG7+4Rlqbe
	ZCu3xuJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtqGK-0000000Eebt-3smi;
	Tue, 11 Aug 2026 17:27:40 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtqGI-0000000EeaH-3MaL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Aug 2026 17:27:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=X6unJMePX+K+G6UtKC9LusLtaB7WxEVlPppAaRZx69A=; b=dHIbC/Z7jK2W2BT1ODRFHDm/mo
	W/rCIu8JLYBIsdw+/SXaafcw9nC6FxCp5O6s82jP2HdKOaqTiKurj+yUy/4N7P18hPV7AcF09fqVC
	nfVTvzI2TMM61QhhjWThHUIgVXWRlIKzKmmHcpIkJD0DeURjiigpK1VKwIeFtPQkvn8E=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1wtqFu-00H8Ed-KB; Tue, 11 Aug 2026 19:27:14 +0200
Date: Tue, 11 Aug 2026 19:27:14 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: yueqiang_fan <yueqiang_fan@foxmail.com>
Cc: netdev@vger.kernel.org, Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [RFC PATCH] net: stmmac: dwmac-generic: add ACPI support for
 Phytium FT-2000/4 and D2000
Message-ID: <42fa592a-0504-45c2-8255-ba43f07a28f5@lunn.ch>
References: <tencent_CB2C11C8304ACE90A0A38744ACAA1BF8060A@qq.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tencent_CB2C11C8304ACE90A0A38744ACAA1BF8060A@qq.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260811_102738_842196_75F2D390 
X-CRM114-Status: GOOD (  28.65  )
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

On Tue, Aug 11, 2026 at 03:56:44AM +0000, yueqiang_fan wrote:
> Hi all,

Please don't spam the list with three copies.

https://www.kernel.org/doc/html/latest/process/maintainer-netdev.html

Note the bit about waiting 24 hours.

> The Phytium FT-2000/4 and D2000 SoCs integrate a DesignWare GMAC that
> is exposed to ACPI as "FTGM0001" / "PHYT0004".  The generic dwmac
> platform driver only supports DT and legacy platform data, so on ACPI
> (UEFI) firmware the MACs are never probed and there is no network
> device.  Kylin ships a vendor patch for this; this RFC proposes an
> upstream version.
> 
> Patch (also available at):
> https://github.com/Bitllion/phytium-d2000-netfix/blob/main/upstream/0001-net-stmmac-dwmac-generic-ACPI-support-for-Phytium.patch
> 
> Summary of the change to drivers/net/ethernet/stmicro/stmmac/dwmac-generic.c:
> 
> - Add an ACPI device ID table (FTGM0001 / PHYT0004).
> - Add dwmac_generic_acpi_probe_config(): mirrors the generic
>   "snps,dwmac" DT defaults, with values from the vendor (Kylin)
>   firmware DTB:
>   * phy-mode rgmii-txid.  Both SoC MACs share the same two RTL8211F

https://elixir.bootlin.com/linux/v6.15/source/Documentation/devicetree/bindings/net/ethernet-controller.yaml#L287

>     PHYs on a common MDIO wiring (each bus sees both PHYs at addr 0
>     and 7), so pin each MAC to its own PHY address (0 for instance
>     :00, 7 for :01) instead of scanning.

If there is one MDIO bus, you should only instantiate one bus, and use
the ACPI equivalent of a phandle for phy-handle to point to the
correct device. If both devices have an MDIO bus, but one is unused,
it is O.K. to instantiate the unused bus, but again, you need to use
ACPI equivelents of phy-handle to point to the PHYs on the one used bus.

>   * single DMA channel (dwmac1000-compatible core): use one TX/RX
>     queue.  The netdev is always allocated with MTL_MAX_TX/RX_QUEUES
>     queues, but the per-queue DMA arrays are only set up for
>     tx/rx_queues_to_use queues and stmmac_xmit() has no
>     queue >= tx_queues_to_use guard.  With real_num_tx_queues = 1,
>     stmmac_select_queue() reduces every frame to queue 0, so the
>     missing guard is never hit.
>   * has_gmac (dwmac1000 hwif; the dwmac4 hwif fails MDIO on this
>     core), AXI burst lengths 16/8/4, pbl 16 with fixed burst, FIFO
>     sizes 0x1000.
> - All values can be overridden through ACPI _DSD properties
>   (phy-mode, phy-addr, tx/rx-queues-to-use, snps,pbl).
> 
> Tested on a Phytium D2000 board (JWIPC IF24TH01) with Ubuntu 24.04 /
> kernel 6.8.0:

You need to be working on net-next, if you want this merged.

both MACs probe (PHYT0004:00/01), interfaces
> enaphyt4i0/1 are created, and cable link-up + DHCP work with no
> transmit watchdog and no kernel panic.
> 
> Two questions for the list:
> 1. Is an ACPI match table + hardcoded platform defaults acceptable for
>    dwmac-generic, or would a separate dwmac-phytium.c (like
>    dwmac-intel.c) be preferred?

By using a name like dwmac-generic, you are saying that any other
vendor wanting to use ACPI has to be 100% compatible to what you are
doing. I doubt that is going to work.

What might help you is first getting the hardware working using DT.
You then have a reference to all the properties you need, and can
consider how to do the same in ACPI.

Think about what is specific to your board/Soc, and what is generic to
the licensed IP. This is how the stmmac DT binding works,
snps,dwmac.yaml describes the IP core, and then we have a number of
SoC specific .yaml files.

You need to create similar ACPI binding, and put documentation for the
binding in Documentation/firmware-guide/acpi/dsd. Take a look at
phy.rst, you will need to describe the PHYs you have using that
binding.

Note, this is going to be a lot of work. ACPI is not used much in
networking. A quick and simple hack will not be accepted, you need to
do this properly. Do a deep dive into how DT describes all things
networking, network-class.yaml, ethernet-controller.yaml, mdio.yaml,
ethernet-phy.yaml.


	 Andrew


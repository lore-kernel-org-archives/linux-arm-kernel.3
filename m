Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75759C88E53
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 10:38:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a2S43gZ+Z4GLxwUc2U/ohzo0POnp48zJYLuNtpBSwOs=; b=PDfdcYpbzFKLw1Cco8NDU3Uun1
	khtSVOHhe8Bx2wZjoFbtjKl9/7lpNTd2ScLATYN98GLAe+S4oPGTGY3qLHy9LTc5igyuxvDlFNOPG
	duQQmcGX83LRNb8lSFmA9E9kGyFhC4qweiOvIc3SWerR3/13R9Wetsn4j4E3H8yyEjTyA/kUFPK6U
	+QlbBScQ3msLrRZNZFwRmQyz97GDiccxfpg6s+GvpN+gWNnPub9W1X4n+Q2q/QeEqeqiS0p6mqDz7
	PKm2FYF4g9dD5Gt4RDVbr63NbYIhElkIO8mnP+e+h/7KdZVuurCJ5SK0gIXTTfgsVoLEGn3i6jSVH
	ha6JcPow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6QYe-00000005wc9-0VPH;
	Tue, 15 Sep 2026 10:38:36 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6QYb-00000005wbb-40uj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 10:38:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1789468713; x=1821004713;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=6Z7LHkwKIg/aizSm5IBUYf9WN5Apkphn9MXg6XOx3UA=;
  b=yLEzdJccxGHUxTWcVt4qq/PjuSjEABxsFJawfDcqtf2omYyGjubknkIr
   E41qwKxrGCDnkoK2hXTjBLKtagk83tuI8Ule7b1fTp1PUIFrnoyytFxhm
   efSUXmbUZ10Qw1Ztxlob1h22KyFHFC/OlPm6pxHPmSnLmJ8EljguWg0oJ
   dK7jj9p7T5F/WrN6B8g9SP5jZXmwWUWygFfYoNjSbXZNWcE7TI7dcbiGW
   6zMc+tSQVsqeqUd6t+EuuiiwGqzex7x4Pge8LKgH/sh1dwKUgGgwhCuip
   4kcLM3laLPpH5G7IzRnFHE6MC9k4upQHliS1BoO/9pRrpFiozXZdQBEkf
   A==;
X-CSE-ConnectionGUID: QLRapTREQOWHwcpXAKqUcQ==
X-CSE-MsgGUID: Ah/Kj6ePR4mQOYNSo0Qy0Q==
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="62696875"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 15 Sep 2026 03:38:32 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Tue, 15 Sep 2026 03:38:32 -0700
Received: from DEN-DL-M70577.microsemi.net (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Tue, 15 Sep 2026 03:38:28 -0700
Date: Tue, 15 Sep 2026 12:38:27 +0200
From: Daniel Machon <daniel.machon@microchip.com>
To: <netdev-bot+sashiko@kernel.org>
CC: <andrew+netdev@lunn.ch>, <davem@davemloft.net>, <edumazet@google.com>,
	<kuba@kernel.org>, <pabeni@redhat.com>, <horatiu.vultur@microchip.com>,
	<steen.hegelund@microchip.com>, <UNGLinuxDriver@microchip.com>,
	<ast@kernel.org>, <daniel@iogearbox.net>, <hawk@kernel.org>,
	<john.fastabend@gmail.com>, <sdf@fomichev.me>, <herve.codina@bootlin.com>,
	<arnd@arndb.de>, <gregkh@linuxfoundation.org>, <mohsin.bashr@gmail.com>,
	<richardcochran@gmail.com>, <netdev@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <bpf@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH net-next v6 13/14] misc: lan966x-pci: dts: extend cpu reg
 to cover PCIE DBI space
Message-ID: <20260915103827.mbq6jcqb65og4zzv@DEN-DL-M70577.microsemi.net>
References: <20260909-lan966x-pci-fdma-v6-13-6f48dab9d671@microchip.com>
 <178904555304.219967.9327319194988391867@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <178904555304.219967.9327319194988391867@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_033834_082119_B6403467 
X-CRM114-Status: GOOD (  26.34  )
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

> Thank you for your contribution! Sashiko AI review found 1 potential
> issue(s) to consider:
> 
> Critical: 0 · High: 0 · Medium: 0 · Low: 1
> 
> - [Low] Claimed patch-ordering / bisectability bug: the "cpu" reg window
>   is enlarged from 0x100000 to 0x800000 only in this commit, while the…
> 
> --
> 
> misc: lan966x-pci: dts: extend cpu reg to cover PCIE DBI space
> 
> This grows the "cpu" register window of the switch node in the lan966x PCI
> device tree overlay from 0x100000 to 0x800000 so that the PCIE DBI and iATU
> registers at offset 0x400000+ are covered. Those registers are programmed
> when the FDMA engine sets up the ATU outbound windows.
> 
> No Link: tags in the commit header.
> 
> > diff --git a/drivers/misc/lan966x_pci.dtso b/drivers/misc/lan966x_pci.dtso
> > index 7b196b0a0eb6..7bb726550caf 100644
> > --- a/drivers/misc/lan966x_pci.dtso
> > +++ b/drivers/misc/lan966x_pci.dtso
> > @@ -135,7 +135,7 @@ lan966x_phy1: ethernet-lan966x_phy@2 {
> >
> >                               switch: switch@e0000000 {
> >                                       compatible = "microchip,lan966x-switch";
> > -                                     reg = <0xe0000000 0x0100000>,
> > +                                     reg = <0xe0000000 0x0800000>,
> >                                             <0xe2000000 0x0800000>;
> >                                       reg-names = "cpu", "gcb";
> 
> [Severity: Low]
> 
> This isn't a bug, just a question about the ordering of the series.
> 
> The earlier commits "net: lan966x: add PCIe FDMA support", "net: lan966x: add
> PCIe FDMA MTU change support" and "net: lan966x: add PCIe FDMA XDP support"
> already derive regs[TARGET_PCIE_DBI] from the "cpu" base plus 0x400000, and
> fdma_pci_atu_init() writes at DBI + 0x300000 + idx * 0x200:
> 
> drivers/net/ethernet/microchip/fdma/fdma_pci.c
> static void __iomem *fdma_pci_atu_addr_get(void __iomem *addr, int offset, int idx)
> {
>         return addr + FDMA_PCI_ATU_ADDR + FDMA_PCI_ATU_IDX_SIZE * idx + offset;
> }
> 
> That lands roughly 0x700000 from the "cpu" base, i.e. outside the 0x100000
> mapping that exists until this commit. Would it be clearer to move this
> overlay change before the driver commits that compute the DBI offset, so
> that the mapping is never smaller than the offsets the driver derives from
> it?

Yes, intentional: the window is widened here and only the next commit names the
"fdma" interrupt that lets anything use it.

> 
> For what it is worth, the intermediate commits do look safe in practice,
> since the ATU access in lan966x_fdma_pci_init() is gated:
> 
> drivers/net/ethernet/microchip/lan966x/lan966x_fdma_pci.c
>         if (!lan966x->fdma)
>                 return 0;
>         ...
>         fdma_pci_atu_init(&lan966x->atu, lan966x->regs[TARGET_PCIE_DBI]);
> 
> and lan966x->fdma is only set when the node names an "fdma" interrupt in
> lan966x_probe():
> 
>         lan966x->fdma_irq = platform_get_irq_byname(pdev, "fdma");
>         if (lan966x->fdma_irq > 0) {
>                 ...
>                 lan966x->fdma = true;
>         }
> 
> The overlay here still carries only interrupt-names = "xtr", "ana", and the
> "fdma" interrupt is added by the following commit, so the enlarged window is
> in place before the FDMA path can be enabled. Is that ordering intentional?

Yes.

> 
> --
> Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260909-lan966x-pci-fdma-v6-0-6f48dab9d671%40microchip.com


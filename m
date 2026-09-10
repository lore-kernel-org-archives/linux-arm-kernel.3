Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66721C79FB9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 13:06:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MEARMROxwEnqR/mfCzYtDxrp/hAYhtP/dZwuqgrxQ9A=; b=0IfgYMfyYX71oDHUgWWbiaNqch
	kYi6a4jkISulSDuCfFqenapPIoHBhWpCkpMlHYCiH0K/5HcMdkZOJULBw/00K8sDxF85EjQBFDzdI
	kS4EpkvHLJw3g/Obo36s1xmu+9Oxat4EEAxMOON3yMjPabAX6O4vaqMP6CxygQaapDh8gvR7rlWTK
	gZ16d/hHPCTcLBFEZcJ/ZnOgyfktQKZOQYs0UHorKzKDl9j8J8DiTS4nle8q9LHufu/EWIBj9kggg
	Pa27aF0NzdWr0QrxAslKx+An42Di7AtQMwPBpdTH36u2s2LXcuNZhbnG729iqUWp91fgbhdgT93wt
	TSMnvjDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4eTX-0000000EQYN-1HaY;
	Thu, 10 Sep 2026 13:05:59 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4eTS-0000000EQVy-3uFH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 13:05:54 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id AD0A743955;
	Thu, 10 Sep 2026 13:05:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 752C71F000FF;
	Thu, 10 Sep 2026 13:05:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789045554;
	bh=MEARMROxwEnqR/mfCzYtDxrp/hAYhtP/dZwuqgrxQ9A=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=eMVbN06tBehl96YDs0m9/79PxxoZaGFh947PiTzoibfVrQKRRFR5AuoCpxIY59NJS
	 qquiHZI+ox8WyjtWuSIskE5zP/xZmciimZFH0IhAGPQSWgIhhlAvZWiw/GWIQnQXxg
	 nZlCEzrVEDQ4CtnnWpAq1dlcg2nMYvBeSsd3ivl/vVqqd9/fcTblmq8dfodcHqMDEX
	 HnuVwr7bqBuwIucK/Bk/XEysXy+JF3Ze9F9a15QvS60pA/9/Yrpky6W4LG3TvGjuej
	 dX3zUGDl46gXMkGHGSJvAPK1JGpivGJg14DEu6e35XUms5sFS1ixQ5ggzvJ1VTC8pZ
	 kkSfKGwQzJ6HA==
Subject: Re: [PATCH net-next v6 13/14] misc: lan966x-pci: dts: extend cpu reg
 to cover PCIE DBI space
From: netdev-bot+sashiko@kernel.org
To: daniel.machon@microchip.com
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, horatiu.vultur@microchip.com,
 steen.hegelund@microchip.com, UNGLinuxDriver@microchip.com, ast@kernel.org,
 daniel@iogearbox.net, hawk@kernel.org, john.fastabend@gmail.com,
 sdf@fomichev.me, herve.codina@bootlin.com, arnd@arndb.de,
 gregkh@linuxfoundation.org, mohsin.bashr@gmail.com, richardcochran@gmail.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, bpf@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Date: Thu, 10 Sep 2026 13:05:53 +0000
Message-ID: <178904555304.219967.9327319194988391867@kernel.org>
In-Reply-To: <20260909-lan966x-pci-fdma-v6-13-6f48dab9d671@microchip.com>
References: <20260909-lan966x-pci-fdma-v6-13-6f48dab9d671@microchip.com>
X-sashiko-severity: Low
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
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

Thank you for your contribution! Sashiko AI review found 1 potential
issue(s) to consider:

Critical: 0 · High: 0 · Medium: 0 · Low: 1

- [Low] Claimed patch-ordering / bisectability bug: the "cpu" reg window
  is enlarged from 0x100000 to 0x800000 only in this commit, while the…

--

misc: lan966x-pci: dts: extend cpu reg to cover PCIE DBI space

This grows the "cpu" register window of the switch node in the lan966x PCI
device tree overlay from 0x100000 to 0x800000 so that the PCIE DBI and iATU
registers at offset 0x400000+ are covered. Those registers are programmed
when the FDMA engine sets up the ATU outbound windows.

No Link: tags in the commit header.

> diff --git a/drivers/misc/lan966x_pci.dtso b/drivers/misc/lan966x_pci.dtso
> index 7b196b0a0eb6..7bb726550caf 100644
> --- a/drivers/misc/lan966x_pci.dtso
> +++ b/drivers/misc/lan966x_pci.dtso
> @@ -135,7 +135,7 @@ lan966x_phy1: ethernet-lan966x_phy@2 {
>  
>  				switch: switch@e0000000 {
>  					compatible = "microchip,lan966x-switch";
> -					reg = <0xe0000000 0x0100000>,
> +					reg = <0xe0000000 0x0800000>,
>  					      <0xe2000000 0x0800000>;
>  					reg-names = "cpu", "gcb";

[Severity: Low]

This isn't a bug, just a question about the ordering of the series.

The earlier commits "net: lan966x: add PCIe FDMA support", "net: lan966x: add
PCIe FDMA MTU change support" and "net: lan966x: add PCIe FDMA XDP support"
already derive regs[TARGET_PCIE_DBI] from the "cpu" base plus 0x400000, and
fdma_pci_atu_init() writes at DBI + 0x300000 + idx * 0x200:

drivers/net/ethernet/microchip/fdma/fdma_pci.c
static void __iomem *fdma_pci_atu_addr_get(void __iomem *addr, int offset, int idx)
{
	return addr + FDMA_PCI_ATU_ADDR + FDMA_PCI_ATU_IDX_SIZE * idx + offset;
}

That lands roughly 0x700000 from the "cpu" base, i.e. outside the 0x100000
mapping that exists until this commit. Would it be clearer to move this
overlay change before the driver commits that compute the DBI offset, so
that the mapping is never smaller than the offsets the driver derives from
it?

For what it is worth, the intermediate commits do look safe in practice,
since the ATU access in lan966x_fdma_pci_init() is gated:

drivers/net/ethernet/microchip/lan966x/lan966x_fdma_pci.c
	if (!lan966x->fdma)
		return 0;
	...
	fdma_pci_atu_init(&lan966x->atu, lan966x->regs[TARGET_PCIE_DBI]);

and lan966x->fdma is only set when the node names an "fdma" interrupt in
lan966x_probe():

	lan966x->fdma_irq = platform_get_irq_byname(pdev, "fdma");
	if (lan966x->fdma_irq > 0) {
		...
		lan966x->fdma = true;
	}

The overlay here still carries only interrupt-names = "xtr", "ana", and the
"fdma" interrupt is added by the following commit, so the enlarged window is
in place before the FDMA path can be enabled. Is that ordering intentional?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260909-lan966x-pci-fdma-v6-0-6f48dab9d671%40microchip.com


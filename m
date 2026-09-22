Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31F6FC98304
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 13:01:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WFwTVnJi02mjfIgr5QoGfThRyGwmOlxJuM0wJDAdo9M=; b=At3N8gcpc2SMED79Dcrgk7mYlr
	8TluVSSJFFEk8QwUtb8Qse5IpY6KHoHD9cu6X+qT8ei9/TQJzGWBxbPD2dBOdJu4wBGPcRuXJGbH6
	3VXmIuabckcZTfXRwvIhcCsu6uvekTAAK1jjqyEMMFNSjuqzbFE+CfW8afnYigWH+i4+yD3MoqLhS
	bGXCQgTXKhH9NtG3jpxc9PolIxDW79Oz0aQM0XxSu528PdfE6Ps6/Kf6D1OlfqLUJsj+9YXvqpBKJ
	q/VgTYkzZpiEIl+QsAdz2nONn0QPjaUe9/ziiFoGPXEdCvFsp+Sqe56y/iwV8ids5qzz7VggkKJhG
	xrveddzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x907w-00000005PVI-2pTP;
	Tue, 22 Sep 2026 13:01:40 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x907J-00000005PDW-1fD2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 13:01:01 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 28ED5431DC;
	Tue, 22 Sep 2026 13:01:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE0551F008A7;
	Tue, 22 Sep 2026 13:00:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790082061;
	bh=WFwTVnJi02mjfIgr5QoGfThRyGwmOlxJuM0wJDAdo9M=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=e37JHfksb2icoaT+Q32VrrzC0lU/t8K+26CLfF2t4cb61wNxn7kqXGBK8Nzmjru0d
	 u7Bn5x+ADUKOeFdDmrtdoNvhD+sQROCIWXcYJTcpd3Gz7C90ozKPqDQZu85exPmTi7
	 Tv31dQHNCz0ATMdKhulfn/gPfIsC3UV0RTqnQlY2xmlMvnb7Zbvmytz9geZKen4ZFe
	 wlUSfLlBom8V8IYxqtTSq81TYVnbocadczji6ph6CzyAk5wk7o5K8Fs6EWgBFavOYh
	 WTSpp5Fj0QEAR13zvQd1SL5vdyd1yne9MtwWZnNIasdFz7khRSY/O5cQTejdnemJ9N
	 mrWvn8wuai3nw==
Subject: Re: [PATCH net-next v7 14/14] misc: lan966x-pci: dts: add fdma
 interrupt to overlay
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
Date: Tue, 22 Sep 2026 13:00:59 +0000
Message-ID: <179008205925.2160803.1332329555699452493@kernel.org>
In-Reply-To: <20260918-lan966x-pci-fdma-v7-14-0ecc179c8a2c@microchip.com>
References: <20260918-lan966x-pci-fdma-v7-14-0ecc179c8a2c@microchip.com>
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

Thank you for your contribution! Sashiko AI review found more severe
issue(s) in other patches of this series. This mail is only an FYI, in case
you want to address the nit picks below when you respin.

Low priority / nit picks for your consideration:

- [Low] Concern retained for combined policy, but my verification says
  FALSE POSITIVE.

--

misc: lan966x-pci: dts: add fdma interrupt to overlay

This adds OIC interrupt 14 to the switch node of the lan966x PCI device tree
overlay and names it "fdma". With the name present, the lan966x driver picks
up the FDMA interrupt and uses the FDMA-based injection/extraction path for
PCIe instances.

> diff --git a/drivers/misc/lan966x_pci.dtso b/drivers/misc/lan966x_pci.dtso
> index 7bb726550caf..5bb12dbc0843 100644
> --- a/drivers/misc/lan966x_pci.dtso
> +++ b/drivers/misc/lan966x_pci.dtso
> @@ -141,8 +141,9 @@ switch: switch@e0000000 {
>  
>  					interrupt-parent = <&oic>;
>  					interrupts = <12 IRQ_TYPE_LEVEL_HIGH>,
> +						     <14 IRQ_TYPE_LEVEL_HIGH>,
>  						     <9 IRQ_TYPE_LEVEL_HIGH>;
> -					interrupt-names = "xtr", "ana";
> +					interrupt-names = "xtr", "fdma", "ana";

[Severity: Low]
This isn't a bug, but would it be worth spelling out in the commit message
that this line alone changes behaviour for every existing PCIe deployment?

The overlay is built into the module (drivers/misc/Makefile adds
lan966x_pci.dtbo.o and lan966x_pci_load_overlay() applies it from
__dtbo_lan966x_pci_begin), so there is no way for a user to opt out of the
new name.

In lan966x_probe() the presence of the name is the only thing that selects
the data path:

	lan966x->fdma_irq = platform_get_irq_byname(pdev, "fdma");
	if (lan966x->fdma_irq > 0) {
		...
		lan966x->fdma = true;

and lan966x_probe_port() then derives the advertised MTU ceiling from it:

	dev->max_mtu = lan966x_is_pci(lan966x) && lan966x->fdma ?
		       FDMA_PCI_MAX_MTU : ETH_MAX_MTU;

So after this patch PCIe ports report FDMA_PCI_MAX_MTU instead of
ETH_MAX_MTU, and ndo_change_mtu rejects values above that cap.

FDMA_PCI_MAX_MTU is derived from PAGE_SIZE << MAX_PAGE_ORDER, which the
preceding commit "net: lan966x: add PCIe FDMA MTU change support" documents
as 15498 on a 4KB-page, MAX_PAGE_ORDER=10 build, i.e. above any practical
jumbo value, so the change looks intentional and harmless in practice.
Would a sentence in this commit message noting the switch to FDMA and the
resulting max_mtu change make the series easier to bisect against later?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260918-lan966x-pci-fdma-v7-0-0ecc179c8a2c%40microchip.com


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B978AC98321
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Sep 2026 20:52:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=353HfQj5FOKGy7pbXaUa1dI43Nsk1+vvyw9cak9tZIo=; b=2kXM2a836QtH2CQcyS0XoADN5P
	vj6B7yg7l84TvzTC9ukYyt8UAOYlaNGwLYzepb55OracnoqzNGxr32828oARajaGKbD3ZfHRVA2q4
	Q0xowFPEyUaRfemIe6QmFICA6FqrSn55gVWgWdLEFwxv1gneUI1jhH56RwDsaIsdiQq/hBQa5MKxZ
	WdQs8/PHTGcgwSduAzRrAoCfrLme2t21fi2YADCyTJzhQRInXiXmJnlSIBpKa1GXiBcnlIDYBnQDh
	Vl/nswYCPs6LQh2C6b6+SU19aZtJ6yfLpAfhzKf6C+dYeIdfO0Cg/cWa5oqLD7tijeVq6CQ9Y5sTz
	OEGcOEkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xACuB-0000000EQQU-42Wb;
	Fri, 25 Sep 2026 20:52:27 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xACuB-0000000EQQG-1FUd
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Sep 2026 20:52:27 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 726F660239;
	Fri, 25 Sep 2026 20:52:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCA281F00893;
	Fri, 25 Sep 2026 20:52:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790369546;
	bh=353HfQj5FOKGy7pbXaUa1dI43Nsk1+vvyw9cak9tZIo=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=kitOV04JdiuVhTuxvXe/x6EzW8iEciA5V9TYYSNJ7SR5beBnjShlCx769bG6MGMXX
	 NThJuTVDy5Qxq60ZRAkNwMIKIAoDt3Hz0cc4gVMGvb2omlNmacw7XJj8lSsA3wKAFE
	 EGI+70KRgbQgVtpkpWkhYT7vAt+m+jELOJvUj8wxp5SG5SsdeaAqGYwGb4noW0+bge
	 v6ulttDg7YKrhxvjGbTlZUKLZ4Y5JVgm+iHf3I0JS24jkB2iH5QXYRRH8AMHBnNQ+u
	 MJpTG1pYOot3+lW0UBcgkZd5+7kwZaNhsn1eMdQnNV+ntvv5mrMbg3qBiDL8ph2PSh
	 YAsoKQXDX1fyA==
Subject: Re: [PATCH net-next v8 09/15] net: lan966x: clear FDMA interrupt
 stickies after switch reset
From: netdev-bot+sashiko@kernel.org
To: daniel.machon@microchip.com
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, horatiu.vultur@microchip.com,
 steen.hegelund@microchip.com, UNGLinuxDriver@microchip.com, ast@kernel.org,
 daniel@iogearbox.net, hawk@kernel.org, john.fastabend@gmail.com,
 sdf@fomichev.me, herve.codina@bootlin.com, arnd@arndb.de,
 gregkh@linuxfoundation.org, mohsin.bashr@gmail.com, horms@kernel.org,
 richardcochran@gmail.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, bpf@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Date: Fri, 25 Sep 2026 20:52:24 +0000
Message-ID: <179036954445.2160803.16038583471069470630@kernel.org>
In-Reply-To: <20260924-lan966x-pci-fdma-v8-9-201c7b707d8b@microchip.com>
References: <20260924-lan966x-pci-fdma-v8-9-201c7b707d8b@microchip.com>
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

- [Low] The commit message and the new comment in lan966x_reset_switch()
  (drivers/net/ethernet/microchip/lan966x/lan966x_main.c) describe a…

--

net: lan966x: clear FDMA interrupt stickies after switch reset

This commit clears the FDMA_ERRORS, FDMA_INTR_ERR and FDMA_INTR_DB sticky
registers in lan966x_reset_switch() right after the switch reset. The aim
is to stop spurious bits that the GCB soft reset latches in PCI mode from
triggering the FDMA IRQ handler, and its WARN, during probe.

> When in PCI mode, the GCB soft reset issued by the reset controller
> can latch spurious bits in the FDMA error stickies. The latched bits
> sit in FDMA_INTR_ERR until the FDMA IRQ is requested later in probe,
> at which point the handler fires immediately and WARNs.

> diff --git a/drivers/net/ethernet/microchip/lan966x/lan966x_main.c b/drivers/net/ethernet/microchip/lan966x/lan966x_main.c
> index 6e6c08bb8eeab..259d81e759076 100644
> --- a/drivers/net/ethernet/microchip/lan966x/lan966x_main.c
> +++ b/drivers/net/ethernet/microchip/lan966x/lan966x_main.c
> @@ -1067,6 +1067,15 @@ static int lan966x_reset_switch(struct lan966x *lan966x)
>  
>  	reset_control_reset(switch_reset);
>  
> +	/* When in PCI mode, the GCB soft reset issued by the reset
> +	 * controller can latch spurious bits in the FDMA error and
> +	 * data-block stickies. Clear them before request_irq hooks up the
> +	 * FDMA IRQ line, otherwise the handler fires immediately on probe.
> +	 */

[Severity: Low]
This isn't a bug, but can the WARN described in the commit message and in
this comment actually be hit in PCI mode at this commit?

The PCI overlay describes only two interrupts for the switch node:

drivers/misc/lan966x_pci.dtso:
	interrupt-names = "xtr", "ana";

lan966x_probe() requests the FDMA IRQ only when an "fdma" interrupt is
described:

	lan966x->fdma_irq = platform_get_irq_byname(pdev, "fdma");
	if (lan966x->fdma_irq > 0) {
		err = devm_request_irq(&pdev->dev, lan966x->fdma_irq,
				       lan966x_fdma_irq_handler, 0,
	...

So in PCI mode lan966x_fdma_irq_handler() is never registered, and its
WARN() cannot fire. That changes only with later patches in the series,
"net: lan966x: add PCIe FDMA support" and "misc: lan966x-pci: dts: add fdma
interrupt to overlay", which add "fdma" to the overlay.

The series ordering itself looks fine. Would it be clearer to say that the
clear is done in preparation for enabling the FDMA IRQ in PCI mode? As
written, it reads as a fix for a WARN that can be hit today.

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260924-lan966x-pci-fdma-v8-0-201c7b707d8b%40microchip.com


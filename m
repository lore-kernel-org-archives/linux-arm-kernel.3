Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52D23CA5FE0
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 07:33:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3BjN0OCuIf+BRdCjvbUlNLExAIBz7E3bTqo3QP/EbX0=; b=phtcWWembttXOTSRAE22Crvb61
	hFhaiMPNwPn21rNs9/Q4V58fXaTQ9JTJrhOnELwaS06P+0VUPUxUyew37LWVdrPYIEYMNcjOZU0RK
	UdOba1kRFvvMoFj58jxIQYlBQ4rEmCuhxjPjQ1WcmnJjEdnqmA/0GebluFWixoq42KyKgxGreIe1c
	N5jeX9dxEnqEFCg7TOoBoWj4o0dh1aUjPij5yv/0RPabx24a59vph9thVfyhpabHIeOeBHQNkpAdE
	zPu4jd0XGDrpQgzyiaCNn3HTC1wR+E5AsY3gUnc3kE7Vn6rMIqY8Py1c3CpZ9JZGjE8QVvBu/4Cjf
	ou3ZAJwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCXm7-0000000Apyf-0Qfw;
	Fri, 02 Oct 2026 07:33:47 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCXm5-0000000Apx9-2dRx
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 07:33:45 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 579E9400AF;
	Fri,  2 Oct 2026 07:33:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC00D1F00893;
	Fri,  2 Oct 2026 07:33:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790926425;
	bh=3BjN0OCuIf+BRdCjvbUlNLExAIBz7E3bTqo3QP/EbX0=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=dHV+jEL2AGkhsdC0MeRmNrwoK24E+0fqrGB0s04HDzSWovLqkc+18VMyWgNXhU6u+
	 i5u1S5rvHLpC8llheftHaNut6r17EkVFROFnNFXyyzyX7HFBf3xq4olULtaFkeN+76
	 ojngKR2nFoZcnodwSSCsKIXobvp75JoYCYAM2YA93T+NEB6EBQYmXFXb6CO+OjDUQn
	 75Bedi45rcb0xI6HG7vDiuGMhbaWU59dz0vb79UajINmEmfuI+1Y58sgP5z9e3nNuP
	 ZEnczKrwoqc8DlnVzghkNAbC4bbvGlf8aZAngfgpcoJAaiGIkiI/W/Sr31nXKB6ICF
	 6mzGsv7JaNmxg==
Subject: Re: [PATCH net-next v9 14/15] misc: lan966x-pci: dts: extend cpu reg
 to cover PCIE DBI space
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
Date: Fri, 02 Oct 2026 07:33:43 +0000
Message-ID: <179092642350.434549.17324722648905629320@kernel.org>
In-Reply-To: <20260928-lan966x-pci-fdma-v9-14-a17caf60f89a@microchip.com>
References: <20260928-lan966x-pci-fdma-v9-14-a17caf60f89a@microchip.com>
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

- [Low] At this commit, the switch@e0000000 node in
  drivers/misc/lan966x_pci.dtso gets an 8MB "cpu" reg for the PCIe…

--

misc: lan966x-pci: dts: extend cpu reg to cover PCIE DBI space

This commit grows the "cpu" reg region of the switch@e0000000 node in the
lan966x PCI overlay from 1MB to 8MB. The FDMA engine programs its ATU
outbound windows through registers at offset 0x400000 and above, and the
larger mapping covers the PCIe DBI and iATU space that holds them.

> diff --git a/drivers/misc/lan966x_pci.dtso b/drivers/misc/lan966x_pci.dtso
> index 7b196b0a0eb65..7bb726550cafd 100644
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
This isn't a bug, but is the larger mapping used at this point in the
series?

At this commit the same node still has only two interrupts:

    interrupts = <12 IRQ_TYPE_LEVEL_HIGH>,
                 <9 IRQ_TYPE_LEVEL_HIGH>;
    interrupt-names = "xtr", "ana";

lan966x_probe() enables FDMA only when the named "fdma" interrupt exists:

    lan966x->fdma_irq = platform_get_irq_byname(pdev, "fdma");

Without it, lan966x->fdma stays false and lan966x_fdma_pci_init() returns
before the ATU is programmed:

    if (!lan966x->fdma)
        return 0;

So nothing touches the extra DBI/iATU space until the next patch in the
series, "misc: lan966x-pci: dts: add fdma interrupt to overlay". That
patch adds <14 IRQ_TYPE_LEVEL_HIGH> as "fdma" between "xtr" and "ana",
which matches the binding order.

The in-between state is not a regression, because the driver keeps using
register-based extraction. This is only about how the series is split.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260928-lan966x-pci-fdma-v9-0-a17caf60f89a%40microchip.com


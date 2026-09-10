Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5F7FC79F9F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 13:05:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gOi0B08jroi+7YK16BHAVZKLiDfFvFzht6sMRqtKgtk=; b=JPJ8q9X44WZouVuLEhQzJ7StlB
	IduceULo1DX9jvVyHZ7lLIqBhKm7IL6TAehICTQA+gNZ7d23yVbwXicbC55jU365zkzGvOpmo2Ad/
	h+7K3MXuCcV6MdYBXINAPMnt1R+n28ip18ZY/fEgnuvEXTC1oq8QJD2x0NIcQug8D9aiHPXt3hMKc
	JyayLlcG2anHK0WfQLazalgNv1FMQlQdKKYkb01AmQK05GVyVIuAZE3mMP6rPc7oeBtxFf2ri/J94
	u2a5pJxapNPGQJ3ypgYR0S0khILl3EJ5B933nK3e18Ozj9UATgLIq5bgaG/MR/AJ3nQNdsevBaI8o
	GhXbfnPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4eTN-0000000EQSq-34db;
	Thu, 10 Sep 2026 13:05:49 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4eTK-0000000EQRW-25Sw
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 13:05:46 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id EAD76600E2;
	Thu, 10 Sep 2026 13:05:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CEDD1F00893;
	Thu, 10 Sep 2026 13:05:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789045545;
	bh=gOi0B08jroi+7YK16BHAVZKLiDfFvFzht6sMRqtKgtk=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=m4c7sph70DFrARJ9f/ZMcI/d15wCGz0ci9wqGNd/uOBcnpQDhhrTjyrmhNAv2wZb9
	 Si687zXj4iJTBVolRj/a6RUQvp9lv14LTFlV7ccna97Cr63304HTQiMqhtQe0SVkS1
	 acaqnY5rtbAXciTxOpqwhhY4Iyc6OGOJpPo30a/UyGLX4PLs8jHdQoI41MIm9A/v5l
	 N/M4A8viB/kex3qkocwFkwdFcoignGPnTouI1S7IPEr7enpzWbH8fU2fMLIFdoNvnr
	 h3PKrdlQOughnzjPHlU9A2/VhjmGTOtZQ2uy6Kc+PmjyD6hPDwMo2L3LNzEMNnil6e
	 Ml9q66GP8+YiA==
Subject: Re: [PATCH net-next v6 08/14] net: lan966x: clear FDMA interrupt
 stickies after switch reset
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
Date: Thu, 10 Sep 2026 13:05:43 +0000
Message-ID: <178904554399.219967.11177166628090236711@kernel.org>
In-Reply-To: <20260909-lan966x-pci-fdma-v6-8-6f48dab9d671@microchip.com>
References: <20260909-lan966x-pci-fdma-v6-8-6f48dab9d671@microchip.com>
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

- [Low] Commit-message/comment vs. reachability at this revision: the
  added FDMA sticky clear in lan966x_reset_switch()…

--

net: lan966x: clear FDMA interrupt stickies after switch reset

The patch acks FDMA_ERRORS, FDMA_INTR_ERR and FDMA_INTR_DB right after
reset_control_reset() in lan966x_reset_switch(), so that spurious sticky
bits latched by the GCB soft reset in PCI mode do not make the FDMA IRQ
handler fire as soon as the IRQ is requested. The clear is unconditional and
is described as a no-op on the platform path.

> diff --git a/drivers/net/ethernet/microchip/lan966x/lan966x_main.c b/drivers/net/ethernet/microchip/lan966x/lan966x_main.c
> index 6e6c08bb8eea..11094a381ec2 100644
> --- a/drivers/net/ethernet/microchip/lan966x/lan966x_main.c
> +++ b/drivers/net/ethernet/microchip/lan966x/lan966x_main.c
> @@ -1067,6 +1067,15 @@ static int lan966x_reset_switch(struct lan966x *lan966x)
>  
>  	reset_control_reset(switch_reset);
>  
> +	/* When in PCI mode, the GCB soft reset issued by the reset
> +	 * controller can latch spurious bits in the FDMA error stickies.
> +	 * Clear them before request_irq hooks up the FDMA IRQ line,
> +	 * otherwise the handler fires immediately on probe.
> +	 */
> +	lan_wr(lan_rd(lan966x, FDMA_ERRORS), lan966x, FDMA_ERRORS);
> +	lan_wr(lan_rd(lan966x, FDMA_INTR_ERR), lan966x, FDMA_INTR_ERR);
> +	lan_wr(lan_rd(lan966x, FDMA_INTR_DB), lan966x, FDMA_INTR_DB);

[Severity: Low]
This isn't a bug in the register writes themselves, but is the failure
described in the changelog reachable at this point in the series?

The commit message says the latched bits "sit in FDMA_INTR_ERR until the FDMA
IRQ is requested later in probe, at which point the handler fires immediately
and WARNs". In lan966x_probe() the FDMA handler is only installed when a named
"fdma" interrupt exists:

	lan966x->fdma_irq = platform_get_irq_byname(pdev, "fdma");
	if (lan966x->fdma_irq > 0) {
		err = devm_request_irq(&pdev->dev, lan966x->fdma_irq,
				       lan966x_fdma_irq_handler, 0,
				       "fdma irq", lan966x);
		...
		lan966x->fdma = true;
	}

At this commit the PCI overlay in drivers/misc/lan966x_pci.dtso does not
describe that interrupt:

	interrupts = <12 IRQ_TYPE_LEVEL_HIGH>,
		     <9 IRQ_TYPE_LEVEL_HIGH>;
	interrupt-names = "xtr", "ana";

so platform_get_irq_byname(pdev, "fdma") fails and lan966x_fdma_irq_handler()
is never requested on the PCI path.

The overlay also disagrees with the positional list in
Documentation/devicetree/bindings/net/microchip,lan966x-switch.yaml, where the
second entry is reserved for "fdma":

	interrupt-names:
	  minItems: 1
	  items:
	    - const: xtr
	    - const: fdma
	    - const: ana

Both points are resolved later in the same series by "misc: lan966x-pci: dts:
add fdma interrupt to overlay", which switches the overlay to
interrupts <12>,<14>,<9> and interrupt-names = "xtr", "fdma", "ana", so this is
only an observation about the ordering of the changelog against the code state
here rather than an actionable defect.

Would it help to mention in the commit message that the WARN only becomes
reachable once the overlay gains the "fdma" interrupt?

>  	/* Don't reinitialize the switch core, if it is already initialized. In
>  	 * case it is initialized twice, some pointers inside the queue system
>  	 * in HW will get corrupted and then after a while the queue system gets

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260909-lan966x-pci-fdma-v6-0-6f48dab9d671%40microchip.com


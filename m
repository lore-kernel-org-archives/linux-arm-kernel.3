Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 115C4CA101F
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  7 Sep 2025 16:42:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=40wP9f/YhEUIfCxR1Q1LmZDAxZVYGotLKQrasi7CHmQ=; b=HYlDRn6TbfvnPlnF+gMBiFetgE
	pXOXIUGG0+61wtQhYqK8Roqevp0BRh51Nh/+Q9uABX6A97Ovz2eNEhDEu9dLZPfSYtdD7RL12lmit
	qnluvkU35VJQaWgTR6fuWT1Foemsh3Yck9vOJKCuhayQGBOgEc22r1FE/i0wohLsJVBcPaGFHrP7r
	vYKmfeLB7++xvGCBA/Wi//WXe2YmwvpGSq82ssO0JHMrUyQToC5BeYTQco/4Jb7Y25RHuonQM2cFa
	BdkBpZOQd7QVltFj8HXAd0lJY/ObMT0LMdRVqyaP3ygXKTBIBIcaeY6RMt8V9LrjhMwh9bFcqvbTe
	kpLzbUSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvISt-0000000Bvr8-1hGf;
	Sun, 07 Sep 2025 16:42:07 +0000
Received: from mout-p-201.mailbox.org ([2001:67c:2050:0:465::201])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvIQ3-0000000BvLX-2OZT
	for linux-arm-kernel@lists.infradead.org;
	Sun, 07 Sep 2025 16:39:12 +0000
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4cKbQ05cM2z9skk;
	Sun,  7 Sep 2025 18:39:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1757263144;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=40wP9f/YhEUIfCxR1Q1LmZDAxZVYGotLKQrasi7CHmQ=;
	b=XDpWLxFn5y9us7+fiif9TulGafz/oIO6bKURlwX2wSWcE3tD1nXK5BjY9lbFE/gdwNVPi6
	enaAK66H729Q2LQHOKzR9tJ11wdcC+Pbsdw+iVsxjcHSJacPvbC7p/lT2IWd26wjVRoVeP
	zbOXfjSVqf8jz2cDqiCwVvkFDRFATIPQ9QdgF9UhM/u8Hcqqj9X6Z94fNQQH/7VJFOK+XA
	J/1y52SJgpNQ6MYF8t1x8xqhfje4E0xbNoVydVX2v0WthJBK6ipf1UMpll78fA+5AzqcB7
	M0w1DUP703mm1QQojuMD9DFtEw+sEGeGyWRSD7jipB8zwuuHmd4QxbpFByGXeA==
Date: Sun, 7 Sep 2025 18:38:54 +0200
From: =?UTF-8?B?xYF1a2Fzeg==?= Majewski <lukasz.majewski@mailbox.org>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, davem@davemloft.net, Eric Dumazet
 <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
 <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Richard Cochran
 <richardcochran@gmail.com>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, Stefan Wahren
 <wahrenst@gmx.net>, Simon Horman <horms@kernel.org>
Subject: Re: [net-next v19 4/7] net: mtip: Add net_device_ops functions to
 the L2 switch driver
Message-ID: <20250907183854.06771a13@wsk>
In-Reply-To: <20250827082512.438fd68a@kernel.org>
References: <20250824220736.1760482-1-lukasz.majewski@mailbox.org>
	<20250824220736.1760482-5-lukasz.majewski@mailbox.org>
	<20250827082512.438fd68a@kernel.org>
Organization: mailbox.org
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MBO-RS-ID: cb5fdf42c49e3c3911f
X-MBO-RS-META: ae8q84kuxhxo8rx8jjccadeoch6emkey
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250907_093911_760099_3D70C344 
X-CRM114-Status: GOOD (  30.38  )
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

Hi Jakub,

Sorry for late reply.

> On Mon, 25 Aug 2025 00:07:33 +0200 Lukasz Majewski wrote:
> > +	/* Set buffer length and buffer pointer */
> > +	bufaddr =3D skb->data; =20
>=20
> You can't write (swap) skb->data if the skb is a clone..

I do use skb =3D buld_skb() which, "builds" the SKB around the memory
page (from pool).

Then, I "pass" this data (and swap it) to upper layer of the network
stack.

The same approach is used in the fec_main.c driver:
https://elixir.bootlin.com/linux/v6.17-rc3/source/drivers/net/ethernet/free=
scale/fec_main.c#L1853

>=20
> > +	bdp->cbd_datlen =3D skb->len;
> > +
> > +	/* On some FEC implementations data must be aligned on
> > +	 * 4-byte boundaries. Use bounce buffers to copy data
> > +	 * and get it aligned.spin
> > +	 */
> > +	if ((unsigned long)bufaddr & MTIP_ALIGNMENT) { =20
>=20
> add=20
> 	.. ||
> 	(fep->quirks & FEC_QUIRK_SWAP_FRAME && skb_cloned(skb))
>=20
> here to switch to the local buffer for clones ?

Please see the above comment.

>=20
> > +		unsigned int index;
> > +
> > +		index =3D bdp - fep->tx_bd_base;
> > +		memcpy(fep->tx_bounce[index], skb->data, skb->len);
> > +		bufaddr =3D fep->tx_bounce[index];
> > +	}
> > +
> > +	if (fep->quirks & FEC_QUIRK_SWAP_FRAME)
> > +		swap_buffer(bufaddr, skb->len); =20
>=20
> > +	if (unlikely(dma_mapping_error(&fep->pdev->dev,
> > bdp->cbd_bufaddr))) {
> > +		dev_err(&fep->pdev->dev,
> > +			"Failed to map descriptor tx buffer\n"); =20
>=20
> All per-packet prints must be rate limited

Ok. I will update it globally.

>=20
> > +		/* Since we have freed up a buffer, the ring is no
> > longer
> > +		 * full.
> > +		 */
> > +		if (fep->tx_full) {
> > +			fep->tx_full =3D 0;
> > +			if (netif_queue_stopped(dev))
> > +				netif_wake_queue(dev);
> > +		} =20
>=20
> I must say I'm still quite confused by the netdev management in this
> driver. You seem to have 2 netdevs, one per port.

Yes.

> There's one
> set of queues and one NAPI.

Yes.

> Whichever netdev gets up first gets the
> NAPI.

Yes.

What I'm trying to do - is to model the HW which I do have...

When switch is enabled I do have ONE uDMA0 which works for both eth
ports (lan0 and lan1).

That is why I do have only one NAPI queue.

> What makes my head spin is that you seem to record which
> netdev/port was doing Rx _last_ and then pass that netdev to
> mtip_switch_tx(). Why?

You may have port =3D=3D 1 || port =3D=3D 2 when you receive packet from in=
gres
ports.
You may also have port =3D=3D 0xFF when you first time encounter the SA on
the port and port =3D=3D 0 when you send/receive data from the "host"
interface.

When port 1/2 is "detected" then the net dev for this particular port
is used. In other cases the one for NAPI is used (which is one of those
two - please see comment above).

This was the approach from original NXP (Freescale) driver. It in some
way prevents from "starvation" from net devices when L2 switch is
disabled and I need to provide port separation.

(port separation in fact is achieved by programming L2 switch registers
and is realized in HW).

> Isn't the dev that we're completing Tx for is
> best read from skb->dev packet by packet?

It may be worth to try.... I think that the code, which we do have now,
tries to reuse some kind of "locality".

> Also this wake up logic
> looks like it will wake up _one_ netdev's queue and then set tx_full
> =3D 0, so presumably it will not wake the other port if both ports
> queues were stopped. Why keep tx_full state in the first place? Just
> check if the queues is stopped..?

As I said - we do have only ONE queue, which corresponds to uDMA0 when
the switch is enabled. This single queue is responsible for handling
transmission for both ports (this is how the HW is designed).



--=20
Best regards,

=C5=81ukasz Majewski


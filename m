Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E4BDCA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Sep 2025 21:16:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tjx6bzhgaZSThneUIBKarI3qmWFn4xvZnpdL5ylUG7w=; b=Dh0gA9j+xdHdzr2FiP/8zR2OsR
	vi3w7vICqDiH53SS5IVT+L3DKbgLwMphPnm1kEi/uFxK6iE1Z3rVndNWPz8nieJqx0jLid+TYQKgH
	87vHxUuvo/G2LByQ4s7BvwQYCD0zvHPpuCO9TFbeNJ5T8+iXb3m2NvePZ/1JkZTo3XlqaJAQaY8Jr
	El6LA1ix6qeJp5MqMjJ7hCJDVMjw+ss1Lrj0qnPIpI3Dk60BzSnUXaHrPRS1sGwNMHYOi6imC6rjG
	XexLx285b7LAe8Fzk5KgUiz5mGPQ3c1IJyix3Cya1x7r6lNhdES1hB1dYja7tc8wlZLGsN/CUsWow
	SGjoGf8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwSAo-0000000Gokw-0UQ5;
	Wed, 10 Sep 2025 21:16:14 +0000
Received: from mout-p-103.mailbox.org ([80.241.56.161])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwSAk-0000000GokT-3qMK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Sep 2025 21:16:12 +0000
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4cMYQ56kdcz9tjH;
	Wed, 10 Sep 2025 23:15:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1757538958;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tjx6bzhgaZSThneUIBKarI3qmWFn4xvZnpdL5ylUG7w=;
	b=HsWouMaDxvO5kZSfsHDYrlxHEDbSuO9Jg2YIiprzN+B7FWu+qeRwkjz058Vuh2GD8hDLWE
	8ON3dD8kuS+pzxEY+OK2k8gKJWaPXghq+QZz7rKcreG9PmwDVpVUgAPVCIoNLt/6GgeGhN
	EGj12jdg0GGFpGWM5pC38TaEDcUbA4bP66daNj0T79pyyFraG9ZJ2wtV65aiUGX1lYWcsc
	s1GGiYW7tkuZRZXPeclek9eKazfmyHRszk8TXyxKZBIH8GQHjUKvWruNo6psv0Pi68hX66
	+Vib/3ZaRUHASebP4WtDpYwbOFaeJVsZpXEmg54DVpzO+JU2/wUI57wIX35pQA==
Date: Wed, 10 Sep 2025 23:15:52 +0200
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
Message-ID: <20250910231552.13a5d963@wsk>
In-Reply-To: <20250908180535.4a6490bf@kernel.org>
References: <20250824220736.1760482-1-lukasz.majewski@mailbox.org>
	<20250824220736.1760482-5-lukasz.majewski@mailbox.org>
	<20250827082512.438fd68a@kernel.org>
	<20250907183854.06771a13@wsk>
	<20250908180535.4a6490bf@kernel.org>
Organization: mailbox.org
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MBO-RS-ID: 1f4e2a91b7373f1fed9
X-MBO-RS-META: mhcmdwkhfcjinncdtkghi8nuxi54qqe5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_141611_110911_0F222808 
X-CRM114-Status: GOOD (  47.28  )
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

> On Sun, 7 Sep 2025 18:38:54 +0200 =C5=81ukasz Majewski wrote:
> > > On Mon, 25 Aug 2025 00:07:33 +0200 Lukasz Majewski wrote:   =20
> > > > +	/* Set buffer length and buffer pointer */
> > > > +	bufaddr =3D skb->data;     =20
> > >=20
> > > You can't write (swap) skb->data if the skb is a clone..   =20
> >=20
> > I do use skb =3D buld_skb() which, "builds" the SKB around the memory
> > page (from pool).
> >=20
> > Then, I "pass" this data (and swap it) to upper layer of the network
> > stack.
> >=20
> > The same approach is used in the fec_main.c driver:
> > https://elixir.bootlin.com/linux/v6.17-rc3/source/drivers/net/ethernet/=
freescale/fec_main.c#L1853
> > =20
>=20
> I probably cut out too much context. I think I was quoting from Tx,
> indeed on Rx this is not an issue.

Ok. No adjustments needed then. Good :)

>=20
> > What I'm trying to do - is to model the HW which I do have...
> >=20
> > When switch is enabled I do have ONE uDMA0 which works for both eth
> > ports (lan0 and lan1).
> >=20
> > That is why I do have only one NAPI queue.
> >  =20
> > > What makes my head spin is that you seem to record which
> > > netdev/port was doing Rx _last_ and then pass that netdev to
> > > mtip_switch_tx(). Why?   =20
> >=20
> > You may have port =3D=3D 1 || port =3D=3D 2 when you receive packet from
> > ingres ports.
> > You may also have port =3D=3D 0xFF when you first time encounter the SA
> > on the port and port =3D=3D 0 when you send/receive data from the "host"
> > interface.
> >=20
> > When port 1/2 is "detected" then the net dev for this particular
> > port is used. In other cases the one for NAPI is used (which is one
> > of those two - please see comment above).
> >=20
> > This was the approach from original NXP (Freescale) driver. It in
> > some way prevents from "starvation" from net devices when L2 switch
> > is disabled and I need to provide port separation.
> >=20
> > (port separation in fact is achieved by programming L2 switch
> > registers and is realized in HW). =20
>=20
> But what if we have mixed traffic from port 1 and 2?
> Does the current code correctly Rx the packets from port 1 on the
> netdev from port 1 and packets from port 2 on the netdev from port 2?

Yes, it does.

In the mtip_rx_napi() you have call to mtip_switch_rx() which accepts
pointer to port variable.

It sets it according to the information provided by the switch IP block
HW and also adjust the skb's ndev.

I'm just wondering if the snippet from mtip_rx_napi():
-------8<--------
if ((port =3D=3D 1 || port =3D=3D 2) && fep->ndev[port - 1]
	mtip_switch_tx(fep->ndev[port - 1]);
else
	mtip_switch_tx(napi->dev);
------->8--------

could be replaced just with mtip_switch_tx(napi->dev);
as TX via napi->dev shall be forward to both ports if required.

I will check if this can be done in such a way.

>=20
> > > Isn't the dev that we're completing Tx for is
> > > best read from skb->dev packet by packet?   =20
> >=20
> > It may be worth to try.... I think that the code, which we do have
> > now, tries to reuse some kind of "locality".
> >  =20
> > > Also this wake up logic
> > > looks like it will wake up _one_ netdev's queue and then set
> > > tx_full =3D 0, so presumably it will not wake the other port if
> > > both ports queues were stopped. Why keep tx_full state in the
> > > first place? Just check if the queues is stopped..?   =20
> >=20
> > As I said - we do have only ONE queue, which corresponds to uDMA0
> > when the switch is enabled. This single queue is responsible for
> > handling transmission for both ports (this is how the HW is
> > designed). =20
>=20
> Right but kernel has two SW queues.

You mean a separate SW queues for each devices? This is not supported
in the MTIP L2 switch driver. Maybe such high level SW queues
management is available in the upper layers?

> Which can be independently
> stopped.

It supports separate RX and TX HW queues (i.e. ring buffers for
descriptors) for the uDMA0 when switch is enabled.

When you want to send data (no matter from which lan[01] device) the
same mtip_start_xmit() is called, the HW TX descriptor is setup and is
passed via uDMA0 to L2 switch IP block.

For next TX transmission (even from different port) we assign another
descriptor from the ring buffer.

> So my concerns is that for example port 1 is very busy so
> the queue is full of packets for port 1, port 1's netdev's queue gets
> stopped. Then port 2 tries to Tx, queue is shared, and is full, so
> netdev 2's SW queue is also stopped. Then we complete the packets,
> because packets were for port 1 we wake the queue for port 1. But
> port 2 also got stopped, even tho it never put a packet on the ring..
>=20

As fair as I can tell - both ports call mtip_start_xmit(), their data
is serialized to the TX queue (via descriptors).

Queued descriptors are sent always at some point (or overridden if
critical error encountered).

> Long story short I think you need to always stop and start queues from
> both netdevs.. There's just 2 so not too bad of a hack.

Maybe there are some peculiarities in for example bridge code (or upper
network stack layers in general), but I think, that I don't need any
extra "queue" management for TX code of MTIP L2 switch.

--=20
Best regards,

=C5=81ukasz Majewski


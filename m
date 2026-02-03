Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C32BE83076
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Feb 2026 10:04:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I/WLesTWjIpwef38SdQ4JX0gdMp0IJsjyMkm8xAgFWc=; b=gBTyHhA1wQgxmHTfW+CXsRK7lJ
	VoXl4QOkshjcnqfjvtqO/ECzeI4hli5y3gD9fv1giG8nfBXLBglT1Cxz82+1w83C11lzU/im+7DWU
	8SRtmSEWvdmdBUYrgAruKUhdaWnFl4PhNtwBnFq/dDKi5jVEZKNc0wQpOKbQmp0QeZg/bNTb5nOdh
	ypZxP0TgxrzMpBb3ndnANK3robdg0NBh/3qb0+fHo4lLccedqjYQrzz00iC9vfnbo24qM327GwMpM
	6uy98xgPi1cYoTgpji5YcyTU1bBt+GSvh7NGi8udQsjDy+Vp9GyhuwQyVdyjvOdoQN24ttZoXAyx+
	7IutzZKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnDGc-00000006RRK-2KwF;
	Tue, 03 Feb 2026 10:04:18 +0000
Received: from mout-p-101.mailbox.org ([80.241.56.151])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnDGa-00000006RQS-1G2D
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Feb 2026 10:04:17 +0000
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4f4zbH658Rz9thY;
	Tue,  3 Feb 2026 11:03:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1770113036;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=I/WLesTWjIpwef38SdQ4JX0gdMp0IJsjyMkm8xAgFWc=;
	b=kIGWXhrH/fv5Z6UEAwBwiKWnU1HgR++qoAwUtaSjL0r2h36xtP6PXwALTo9+2xHpHvNDpX
	7zzG/igQFe7TZlu/681yxRxR8YlgD6kHLF6QuhXJseIxd0hRuJkjd7lHXb4skFBFEXqdzh
	jgCyWStCK5A94b3tELO/6fl8zgCGCNMb/s3//jcJUMlZV/K5Pr/H1HM+uH6cHsMNb0K0+p
	dqlec2zoPzHAwiMB28GejqjFcDd7uK3S7/EQdz1XjIryuXQq9Qs4emeM15JzfeIKdplYVO
	6p1jwz37A7xjGvN5mW8FZ4tYdhEKjcGECe2yHgo5PKxvwsyUKjSv9jnrfNM/XA==
Date: Tue, 3 Feb 2026 11:03:41 +0100
From: =?UTF-8?B?xYF1a2Fzeg==?= Majewski <lukasz.majewski@mailbox.org>
To: Jakub Kicinski <kuba@kernel.org>
Cc: andrew@lunn.ch, shawnguo@kernel.org, krzk+dt@kernel.org,
 linux-kernel@vger.kernel.org, edumazet@google.com, netdev@vger.kernel.org,
 pabeni@redhat.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 conor+dt@kernel.org, horms@kernel.org, richardcochran@gmail.com,
 robh@kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, wahrenst@gmx.net, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com
Subject: Re: [net-next,v22,4/7] net: mtip: Add net_device_ops functions to
 the L2 switch driver
Message-ID: <20260203110341.1ce21455@wsk>
In-Reply-To: <20260203014247.824561-2-kuba@kernel.org>
References: <20260131233459.1625279-5-lukasz.majewski@mailbox.org>
	<20260203014247.824561-2-kuba@kernel.org>
Organization: mailbox.org
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MBO-RS-ID: fe9904b47499ae8f7ea
X-MBO-RS-META: zwqoyhezb5rx5qmpyzoc4ik3614jqbee
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_020416_484021_F908BDA0 
X-CRM114-Status: GOOD (  24.63  )
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

> This is an AI-generated review of your patch. The human sending this
> email has considered the AI review valid, or at least plausible.
>=20
> For local reproduction steps see
> https://netdev-ai.bots.linux.dev/ai-local.html ---
> net: mtip: Add net_device_ops functions to the L2 switch driver
>=20
> This patch adds net_device_ops callbacks for the MTIP L2 switch
> driver, including transmit, multicast configuration, MAC address
> handling, and timeout recovery functions.
>=20
> > diff --git a/drivers/net/ethernet/freescale/mtipsw/mtipl2sw.c
> > b/drivers/net/ethernet/freescale/mtipsw/mtipl2sw.c ---
> > a/drivers/net/ethernet/freescale/mtipsw/mtipl2sw.c +++
> > b/drivers/net/ethernet/freescale/mtipsw/mtipl2sw.c =20
>=20
> [ ... ]
>=20
> > +static netdev_tx_t mtip_start_xmit_port(struct sk_buff *skb,
> > +					struct net_device *dev,
> > int port) +{
> > +	struct mtip_ndev_priv *priv =3D netdev_priv(dev);
> > +	struct switch_enet_private *fep =3D priv->fep;
> > +	unsigned short status;
> > +	unsigned int index;
> > +	struct cbd_t *bdp;
> > +	void *bufaddr;
> > +
> > +	spin_lock_bh(&fep->hw_lock); =20
>=20
> [ ... ]
>=20
> > +	/* Save skb pointer. */
> > +	fep->tx_skbuff[index] =3D skb; =20
>=20
> mtip_start_xmit_port() stores sk_buffs in fep->tx_skbuff[index] and
> creates DMA mappings, but mtip_switch_tx() which should complete TX
> operations is empty:
>=20
> static void mtip_switch_tx(struct switch_enet_private *fep)
> {
> }
>=20
> The NAPI poll handler mtip_rx_napi() calls mtip_switch_tx() to reclaim
> transmitted buffers. Since it does nothing, won't every transmitted
> packet leak the skb and DMA mapping? Also, dirty_tx is never
> advanced, so the TX ring will fill (cur_tx =3D=3D dirty_tx) and stop
> accepting packets.
>=20
> jakub: maybe add a TODO comment transiently here, since later patch
> implements the cleanup?

The mtip_switch_tx() is empty as we have agreed, that I will divide
this driver to several patches to ease the review.

Adding TODO seems to only make AI review happy, as:

- The patch which adds support for FEC_MTIP_L2SW in Kconfig will be
  sent after the driver is accepted to net-next

- Those commits are even now bisectable when FEC_MTIP_L2SW is
  enabled (when I test the setup).

Anyway, if you still would like to have the TODO comment, then please
give me a hint how it shall be written to make the AI happy...



And maybe a few my thoughts:

1. AI review seems to bring each time different issues - even the
"grammatic" ones were not provided with the first AI generated review.

2. I have tried to setup claudie> to run the patch set through it -
however, it requires a paid account on a cloud/AI vendor (and I guess
that different vendors' AI engines produce different output for the same
"AI prompt")?


Anyway, I do appreciate the AI review - it provides very deep insights
through the code.

>=20
> > +static void mtip_timeout(struct net_device *dev, unsigned int
> > txqueue) +{
> > +	struct mtip_ndev_priv *priv =3D netdev_priv(dev);
> > +
> > +	dev->stats.tx_errors++; =20
>=20
> Jakub Kicinski noted in v16 review that tx_errors are already counted
> by the network stack, and the statistic is exposed per-queue in
> sysfs. Does incrementing tx_errors here double-count timeout events?
>=20
> https://lore.kernel.org/all/20250725151618.0bc84bdb@kernel.org/
>=20

Yes, this shall been removed.

> > +	DO_ONCE(mtip_print_hw_state, dev);
> > +
> > +	schedule_work(&priv->tx_timeout_work);
> > +} =20



--=20
Best regards,

=C5=81ukasz Majewski


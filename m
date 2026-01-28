Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5345D46C06
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Jan 2026 21:56:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eBZD4epMES0NdK+WxDlXWeM4FddXXNNOQ9YNWAox1JI=; b=lrcW1afXGUz7XIociuXGulR8Ks
	Z3+KI6KebiJUyOJW4uDdo6WZQQgOaSX8sg/U9A9VFWejom/haYrciXpNgXc3t1rQBy6zMKk3dmkGC
	PSx3PKou9OgyWpFTnHP8LTW46DXLGnvN89MB3NvHQnG+LM2ahDe38YjAWfu7XCya8xSBBcrb1qasg
	KUkJTKZUySZspTVvXyhADiJ1FzaNRb1ZlxAP9f1GbBXlYJg33U7EEAjBWRPgTqWrKTPVZ5+jI48k3
	2UEqFKVnwubxKaQo6jRUOrea/JBPyOVHt0Li1kZUCy6pY9QyZ60duKVYsomrpB/ZTauxdZdO+EE6a
	qZyKIEQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlDVw-0000000GrXd-1dkN;
	Wed, 28 Jan 2026 21:55:52 +0000
Received: from mout-p-101.mailbox.org ([80.241.56.151])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlDVq-0000000GrXG-3D15
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Jan 2026 21:55:50 +0000
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4f1bgK6bvKz9tRk;
	Wed, 28 Jan 2026 22:55:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1769637341;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eBZD4epMES0NdK+WxDlXWeM4FddXXNNOQ9YNWAox1JI=;
	b=TaJgEHQlYscWxauinYwsmlhF2sJliF0ML/RKfyh0FeGPnYJ23Pg4U8+quRx3YpICZdsvwL
	hEjlSryZJ3JHzgW5WdshCJG+41enbyqom9M5kz+x7xoEYMEbkaPCcHfFofE8oeIAuf30NT
	ghTJvCQIN0rYoB9GbTUu823V3S64+M20mUSW1lEn0lBjt6sgWc1ptI0OpxWHUHkWbR6sc+
	s85lSEUwBQ4gvRxkr+545gMeUC94wTLIuRccJdoK2XVSSYD4DGAXkEVaMSZ2EhWATCL+iV
	gj6bITMHm6BV0beA0wKJiAIe8WJUIjG/Od9CmffBDkdjp7pbRF8vE6RSHnJ3OQ==
Date: Wed, 28 Jan 2026 22:55:33 +0100
From: =?UTF-8?B?xYF1a2Fzeg==?= Majewski <lukasz.majewski@mailbox.org>
To: Jakub Kicinski <kuba@kernel.org>
Cc: festevam@gmail.com, linux-arm-kernel@lists.infradead.org,
 s.hauer@pengutronix.de, kernel@pengutronix.de, horms@kernel.org,
 shawnguo@kernel.org, imx@lists.linux.dev, linux-kernel@vger.kernel.org,
 conor+dt@kernel.org, devicetree@vger.kernel.org, wahrenst@gmx.net,
 pabeni@redhat.com, davem@davemloft.net, netdev@vger.kernel.org,
 richardcochran@gmail.com, edumazet@google.com, andrew+netdev@lunn.ch,
 robh@kernel.org, krzk+dt@kernel.org, andrew@lunn.ch
Subject: Re: [net-next,v20,4/7] net: mtip: Add net_device_ops functions to
 the L2 switch driver
Message-ID: <20260128225533.39665c74@wsk>
In-Reply-To: <20260128022558.4151582-1-kuba@kernel.org>
References: <20260126103400.1683125-5-lukasz.majewski@mailbox.org>
	<20260128022558.4151582-1-kuba@kernel.org>
Organization: mailbox.org
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MBO-RS-ID: 7d006a684c6f407a7af
X-MBO-RS-META: z11xxedxwyc1eh8qc7t7nd5s3ut5si6k
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_135547_649022_265AB32B 
X-CRM114-Status: GOOD (  21.62  )
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
> This patch adds the net_device_ops callback implementations for the
> MTIP L2 switch driver including transmit, timeout handling, multicast
> setup, MAC address configuration, and port parent ID retrieval.
>=20
> > diff --git a/drivers/net/ethernet/freescale/mtipsw/mtipl2sw.c
> > b/drivers/net/ethernet/freescale/mtipsw/mtipl2sw.c index
> > 9c21a3d29c1c..a6424ee1a9d9 100644 ---
> > a/drivers/net/ethernet/freescale/mtipsw/mtipl2sw.c +++
> > b/drivers/net/ethernet/freescale/mtipsw/mtipl2sw.c =20
>=20
> [ ... ]
>=20
> > +static netdev_tx_t mtip_start_xmit_port(struct sk_buff *skb,
> > +					struct net_device *dev,
> > int port) +{ =20
>=20
> [ ... ]
>=20
> > +	/* Push the data cache so the CPM does not get stale memory
> > +	 * data.
> > +	 */
> > +	bdp->cbd_bufaddr =3D dma_map_single(&fep->pdev->dev, bufaddr,
> > +					  MTIP_SWITCH_TX_FRSIZE,
> > +					  DMA_TO_DEVICE); =20
>=20
> The dma_map_single() call here creates a DMA mapping, but
> mtip_switch_tx() at this point in the series is an empty stub that
> never calls dma_unmap_single().

Yes.

> Is the intention for this to be
> resolved by a later patch in the series? Looking ahead, a4c3fa1c66c9
> ("net: mtip: Add mtip_switch_{rx|tx} functions to the L2 switch
> driver") does add the full TX completion handler with the
> dma_unmap_single() call. However, this commit on its own could cause
> DMA resource exhaustion if used standalone (e.g., during bisection).
>=20

The MTIP Kconfig define would not be available at this point of the
series.

The split is done as part of the agreement of how that large driver
shall be added.

The mtip_switch_rx|tx is a stub at this point to ease the review.

> Would it make sense to merge these two patches together, or at minimum
> have a note in the commit message explaining the dependency?
>=20

@Jakub - If possible I would keep things as they are now.

> [ ... ]



--=20
Best regards,

=C5=81ukasz Majewski


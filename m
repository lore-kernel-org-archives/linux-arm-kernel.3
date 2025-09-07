Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24DE4CA101F
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  7 Sep 2025 16:56:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2/AOkrt/MSyoLioZagXRkbG/LjuV+caGTuc51pKFPCE=; b=i1ZfLSeYzgcg+YqT53Nbji4Byk
	euP7KE/jcP6OEO/il8wVcJ56nh0dE1Ll/xeUKRK38aXumbHQMXuIJvyF8Ttp+uTW3EsoJ8uzwlKVI
	wLeiFnzmWLnqzPe8uWSY1acjZaY2GZ6VkA1LYToNLNliR1whSSTC+I77+DTDp7WfGPeG9p+5bkYmf
	ONpKQko4toqkKVMKrr2l8I8cWGFhKhW6vrbulcFnLie4ENQ7BTch0BayEq7BVg6Cb6pzUQKwRJnIL
	Z9OH1TmbJZ3/PYwkM3GYWwzMyCfFB5cKQBFH9MaYxDnqu3kUolUGFOsdPoyLTBOc6Yu7pSvMvvp84
	dOW4Xx4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvIgY-0000000BzYP-1wt8;
	Sun, 07 Sep 2025 16:56:14 +0000
Received: from mout-p-201.mailbox.org ([2001:67c:2050:0:465::201])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvIZc-0000000BxtV-3mX2
	for linux-arm-kernel@lists.infradead.org;
	Sun, 07 Sep 2025 16:49:06 +0000
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4cKbdS3xSvz9v2f;
	Sun,  7 Sep 2025 18:49:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1757263740;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2/AOkrt/MSyoLioZagXRkbG/LjuV+caGTuc51pKFPCE=;
	b=AXWC0GTIHrcKwR34c/D7uMv62ZAkeM5QSPsKsITkLmhF7Mfe4CEq6b0xAL1LWhtqh7HY4c
	gVDGdKSc2bXpA/VsMocV4HnYzlR6w0ZQCk3xboqC2yRU+dlo828P3H35UNdW2bWMz2Fu08
	lNoeuM+Amon6h9FfvIZLf4mwl80RzWGEui9xzxaKCTAQaw8cRfsZbKFxud7GgYEGk1RY3v
	ZM9Er/sumnT2IHnjMljR6hdvQbixf67YxRnFipQdvMnC0wbUulTdXgSF4yq7w44QHqEWHm
	IiTMoYMFpj3Zp8UtzAivsP6mYhgseqUuAreoIFD10zxTQs9UEK6rdRgFxyDPEg==
Date: Sun, 7 Sep 2025 18:48:53 +0200
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
Subject: Re: [net-next v19 5/7] net: mtip: Add mtip_switch_{rx|tx} functions
 to the L2 switch driver
Message-ID: <20250907184853.76a5ff5e@wsk>
In-Reply-To: <20250827082517.01a3bdfa@kernel.org>
References: <20250824220736.1760482-1-lukasz.majewski@mailbox.org>
	<20250824220736.1760482-6-lukasz.majewski@mailbox.org>
	<20250827082517.01a3bdfa@kernel.org>
Organization: mailbox.org
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MBO-RS-ID: 8e9e25c0ec1635d0afa
X-MBO-RS-META: ssgamybgoy3knbawbojmr3bd5bptxf3q
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250907_094905_088528_0D06B569 
X-CRM114-Status: GOOD (  11.84  )
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

> On Mon, 25 Aug 2025 00:07:34 +0200 Lukasz Majewski wrote:
> >  static void mtip_switch_tx(struct net_device *dev)
> >  {
> > +	struct mtip_ndev_priv *priv =3D netdev_priv(dev);
> > +	struct switch_enet_private *fep =3D priv->fep;
> > +	unsigned short status;
> > +	struct sk_buff *skb;
> > +	struct cbd_t *bdp; =20
>=20
> > +		} else {
> > +			dev->stats.tx_packets++;
> > +		}
> > +
> > +		if (status & BD_ENET_TX_READY)
> > +			dev_err(&fep->pdev->dev,
> > +				"Enet xmit interrupt and
> > TX_READY.\n"); =20
>=20
> per-pkt print, needs rl

+1

>=20
> > +		/* Free the sk buffer associated with this last
> > transmit */
> > +		dev_consume_skb_irq(skb); =20
>=20
> why _irq()? this now runs from NAPI, so it's in BH. Just stick=20
> to dev_comsume_skb_any(), it's the safest choice..

Ok, I will change it.

--=20
Best regards,

=C5=81ukasz Majewski


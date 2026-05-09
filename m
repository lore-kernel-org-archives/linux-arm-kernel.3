Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEA97CD3447
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  9 May 2026 06:18:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Enet1MZVyjxpmpnAeiiDC5Nc0oVBCuRW8qMcM+mqBfQ=; b=GmbrphDydx4QA108rjvGUZ+cGZ
	10btSSutT/oJHEcEChFYeMDHpefeJk0sXFSTavoFealhHBMJ69j8BeYZ549Fn+n3h84AIslkHbH3t
	Lb89tJtcc1xMUL9xvbAm03Usx4J8cXVzM74fNmJq3Cx6De3RGUkvuLOeHRmuiCeuNkXPEVUGT2cjH
	QQ7qRhoUCMhdmrfgohel7pq08uAUVosvuY56WlhwQBOOdAjegS0uSDmBYak9GHBwBBDLfnsznQchs
	PUA3OqsXLKRVWRxkCeois7GzYOMDwPrJ6YFa7uxDLCLTnX3F62jJRW4FpHLPapbHlo3M24JhgFlGR
	tjPVEynA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLb0i-00000008Nbd-1Awc;
	Sat, 09 May 2026 06:18:00 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLb0f-00000008Nb5-3eSF;
	Sat, 09 May 2026 06:17:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E78AE405E9;
	Sat,  9 May 2026 06:17:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E5F6C2BCC9;
	Sat,  9 May 2026 06:17:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778307475;
	bh=Ha3F77ZzJvbbXJghzBav9RP08S2XsFPL0mAqPG3sWq0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YKBSGwRpYqyD70zhjanuhZJpXWzniSsj3lj4xs9kAwAdNzvRphOehTmcqOPy6XqoM
	 8y2aY+nbxABHNT37pO5bABH4KMlDQalClOqrFXpJXe72croYHlC675k1O+duTX8Ci1
	 OrwRrGpu9nkfGlLhb5VYqeHqH+kPHR5JWoutoOQj8sk3jeVeeVlxnydqHv7ZG99xMI
	 DACWFQXov4WRp1oeuwdEy/u9oE0DBzD7PIYzH7JmrZNkoZ/IcjP4IVxwhTrthOwFvY
	 WbC5XdRr/R1SNjlrtrCvZ3EMo/ztqsvS/LLBToxtJigIcay6F1yjhsefLOKDXN1HI4
	 8qLsRGzsTC3bQ==
Date: Sat, 9 May 2026 08:17:53 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Jakub Kicinski <kuba@kernel.org>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, ansuelsmth@gmail.com,
	benjamin.larsson@genexis.eu, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, madhur.agrawal@airoha.com
Subject: Re: [PATCH net-next v4 03/10] net: airoha: Move airoha_qdma pointer
 in airoha_gdm_dev struct
Message-ID: <af7Rkf5Awk1q6lQo@lore-desk>
References: <20260507-airoha-eth-multi-serdes-v4-3-af613b61ae02@kernel.org>
 <20260509014606.3558018-1-kuba@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="CKkjltz6LSKR9NjK"
Content-Disposition: inline
In-Reply-To: <20260509014606.3558018-1-kuba@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260508_231757_995693_E05894B2 
X-CRM114-Status: GOOD (  23.24  )
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


--CKkjltz6LSKR9NjK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> This is an AI-generated review of your patch. The human sending this
> email has considered the AI review valid, or at least plausible.
> ---
> Subject: net: airoha: Move airoha_qdma pointer in airoha_gdm_dev struct
>=20
> This patch moves the airoha_qdma pointer from struct airoha_gdm_port into
> struct airoha_gdm_dev, as a preparation for allowing multiple net_devices
> to share the same GDM{3,4} port via an external hw arbiter.
>=20
> > diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/eth=
ernet/airoha/airoha_eth.c
> > index 4af64f182968..1798b4a6cf5d 100644
> > --- a/drivers/net/ethernet/airoha/airoha_eth.c
> > +++ b/drivers/net/ethernet/airoha/airoha_eth.c
>=20
> [ ... ]
>=20
> > @@ -854,7 +855,8 @@ static void airoha_qdma_wake_netdev_txqs(struct air=
oha_queue *q)
> >  		if (!port)
> >  			continue;
> > =20
> > -		if (port->qdma !=3D qdma)
> > +		dev =3D port->dev;
> > +		if (dev->qdma !=3D qdma)
> >  			continue;
> > =20
> >  		dev =3D port->dev;
>=20
> [Low]
> The resulting loop body assigns dev =3D port->dev; twice with nothing in
> between that could change port->dev:
>=20
> 	dev =3D port->dev;
> 	if (dev->qdma !=3D qdma)
> 		continue;
>=20
> 	dev =3D port->dev;
> 	for (j =3D 0; j < dev->dev->num_tx_queues; j++) {

ack, I will fix it in v5.

>=20
> Is the second dev =3D port->dev; intentional, or leftover from the
> refactor that should be removed?
>=20
> [Medium]
> Can the new dev->qdma dereference run while port->dev is still NULL?
>=20
> Looking at airoha_alloc_gdm_port(), eth->ports[p] =3D port is stored befo=
re
> airoha_alloc_gdm_device() runs, and airoha_alloc_gdm_device() only sets
> port->dev =3D dev at its very end, after several failure points
> (devm_alloc_etherdev_mqs, netif_set_real_num_tx_queues,
> of_get_ethdev_address).
>=20
> The existing cleanup in airoha_probe's error_napi_stop path and in
> airoha_remove guards accesses with if (dev && ...) when reading
> port->dev, which suggests port->dev can legitimately be NULL while
> eth->ports[i] is non-NULL.
>=20
> Before the patch the equivalent check read port->qdma (an embedded field
> zeroed by devm_kzalloc), so the compare was NULL-tolerant. After the
> patch:
>=20
> 	struct airoha_gdm_port *port =3D eth->ports[i];
> 	struct airoha_gdm_dev *dev;
> 	...
> 	if (!port)
> 		continue;
>=20
> 	dev =3D port->dev;
> 	if (dev->qdma !=3D qdma)
> 		continue;
>=20
> would dereference a NULL dev if port->dev has not yet been assigned when
> airoha_qdma_wake_netdev_txqs() runs. Would a NULL check on port->dev (or
> reverting to the original port-field-based test) be appropriate here to
> preserve the prior robustness?

Even if this is not a real issue since it will be fixed by a following patc=
h=20
in the series ("Support multiple net_devices for a single FE GDM port "), I
will fix it in v5.

Regards,
Lorenzo

--CKkjltz6LSKR9NjK
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCaf7RkQAKCRA6cBh0uS2t
rEvZAPwNLCYo6gifsw7IBi5TUpI/fYB0BDXDjZOQY4h9opH7RQEAy70E8bmN0A9P
Q3BudcGBRukuFAKQ9nclWBOKAlm0hwo=
=plcV
-----END PGP SIGNATURE-----

--CKkjltz6LSKR9NjK--


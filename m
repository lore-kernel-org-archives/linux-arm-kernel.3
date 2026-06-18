Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05E2FCD98F2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Jun 2026 10:03:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Iom3D6FWo9fllJWbYMA89UYN58mi46iOwnkKnoRIuIM=; b=YIHwcV677v4663B2wQW85jjUlA
	4RAqM8WMZLQXlRAiQqHmy6mUvC6E1ovSJmXdivrLAHUX2P8BCGFA9SVYRi+Kvf51NSvuEHWUaFG2v
	J3yhxxwDfd4b/MnxRg+fPNjrAOaoaQ3QV4/VtWPYpj0xrSPZhcehMx/jE2Bnbp8J1cG8ikmkqBkSC
	bWCmceKNgsuUoIyB0jGUb+tpDOJcnF1MW5oEivCQErsTNSaxqsPJazrGqeNnKcEUXtJnr2RH0mwRK
	vejkknxvu7LnLWYn81gNQJbUZwMmsGj8I8K+b1cqb46PucphPaIfBVQNog2xu8dGgTV9EB6bKZ/cO
	uaLOu9nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wa9bA-000000012gH-2cV2;
	Thu, 18 Jun 2026 10:03:48 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wa9b9-000000012fN-28Yh;
	Thu, 18 Jun 2026 10:03:47 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id CB872601E0;
	Thu, 18 Jun 2026 10:03:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01D581F000E9;
	Thu, 18 Jun 2026 10:03:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781777026;
	bh=Iom3D6FWo9fllJWbYMA89UYN58mi46iOwnkKnoRIuIM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=PcHZq7Xu9Xos5Y3JaTW2tn+d3FghRtNMdMfvmEfcLw8GZUqArX/N8qgIINhrHwH1K
	 41cxCdFC4XeJs6V8D1RiXf00+K1KtH1X327h+wwu8t8TzHRi2uUJ8hvoRAghdpvA+l
	 xMff8g0GJVhjEYOexJO3+AX3ceM3GlrlzITsVneMFECtu+mn1pEG/loVMxOZHCPj5A
	 ibMwbjroxJbNccIjlA/KYICTDI0h+fc4UbdUESm9t14QWbLUgoGGJjYdZgriu5Ulfv
	 qF2MA++Gdpv917gr9nBmsipqQrar0TB7IrOLhC4iTk5RkqPY88QKnXPDvqTMqG8c+Z
	 U0mSLnUtZhYyg==
Date: Thu, 18 Jun 2026 12:03:44 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Wayen Yan <win847@gmail.com>, netdev@vger.kernel.org, horms@kernel.org,
	pabeni@redhat.com, edumazet@google.com, andrew+netdev@lunn.ch,
	angelogioacchino.delregno@collabora.com, matthias.bgg@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net v3] net: airoha: Fix skb->priority underflow in
 airoha_dev_select_queue()
Message-ID: <ajPCgH7E_ke6Fdur@lore-desk>
References: <178161373805.2167512.2544164327472822616@gmail.com>
 <20260617161951.52abe413@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="y49npv9b6mmAWoJY"
Content-Disposition: inline
In-Reply-To: <20260617161951.52abe413@kernel.org>
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


--y49npv9b6mmAWoJY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> On Sun, 14 Jun 2026 07:30:54 +0800 Wayen Yan wrote:
> > In airoha_dev_select_queue(), the expression:
> >=20
> >   queue =3D (skb->priority - 1) % AIROHA_NUM_QOS_QUEUES;
> >=20
> > implicitly converts to unsigned arithmetic: when skb->priority is 0
> > (the default for unclassified traffic), (0u - 1u) wraps to UINT_MAX,
> > and UINT_MAX % 8 =3D 7, routing default best-effort packets to the
> > highest-priority QoS queue. This causes QoS inversion where the
> > majority of traffic on a PON gateway starves actual high-priority
> > flows (VoIP, gaming, etc.).
> >=20
> > Fix by guarding the subtraction: when priority is 0, map to queue 0
> > (lowest priority), otherwise apply the original (priority - 1) % 8
> > mapping.
> >=20
> > Fixes: 2b288b81560b ("net: airoha: Introduce ndo_select_queue callback")
> > Acked-by: Lorenzo Bianconi <lorenzo@kernel.org>
> > Reviewed-by: Joe Damato <joe@dama.to>
> > Signed-off-by: Wayen Yan <win847@gmail.com>
> > ---
> >  drivers/net/ethernet/airoha/airoha_eth.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/eth=
ernet/airoha/airoha_eth.c
> > index 31cdb11cd7..d476ef83c3 100644
> > --- a/drivers/net/ethernet/airoha/airoha_eth.c
> > +++ b/drivers/net/ethernet/airoha/airoha_eth.c
> > @@ -1933,7 +1933,7 @@ static u16 airoha_dev_select_queue(struct net_dev=
ice *dev, struct sk_buff *skb,
> >  	 */
> >  	channel =3D netdev_uses_dsa(dev) ? skb_get_queue_mapping(skb) : port-=
>id;
> >  	channel =3D channel % AIROHA_NUM_QOS_CHANNELS;
> > -	queue =3D (skb->priority - 1) % AIROHA_NUM_QOS_QUEUES; /* QoS queue */
> > +	queue =3D skb->priority ? (skb->priority - 1) % AIROHA_NUM_QOS_QUEUES=
 : 0;
>=20
> Hi Lorenzo, is there a reason we're subtracting 1 here in the first
> place? Could be just me, but may be worth adding a comment here.
>=20
> Intuitively if we are "narrowing" 16 prios to 8 queues it'd make most
> sense to group the adjacent ones -- divide by two.
>=20
> Please respin with some sort of an explanation..

IIRC this is a leftover of the ETS offload support.
I agree it is righ to just do:

	queue =3D skb->priority % AIROHA_NUM_QOS_QUEUES; /* QoS queue */

@Wayen: can you please respin fixing the issue? Please add even my Acked-by:

Acked-by: Lorenzo Bianconi <lorenzo@kernel.org>

Regards,
Lorenzo

>=20
> >  	queue =3D channel * AIROHA_NUM_QOS_QUEUES + queue;
> > =20
> >  	return queue < dev->num_tx_queues ? queue : 0;
> --=20
> pw-bot: cr

--y49npv9b6mmAWoJY
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCajPCgAAKCRA6cBh0uS2t
rEPCAQCqDCrcwKyucjgOFBgvz0L4RGD7O8nbPLHaiOpvjvOwjAD9GhOOU9yIs2ZA
nE8h3U0jkTu24u7OOiE+sJeJpIjNIg8=
=8RTw
-----END PGP SIGNATURE-----

--y49npv9b6mmAWoJY--


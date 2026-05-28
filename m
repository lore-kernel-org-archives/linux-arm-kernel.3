Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABE0ACD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 May 2026 16:09:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h9g24AMvHPC82wp8alB06zIO1bChAGUywmcXHfgLSzg=; b=xXNlklwKMsBlIHK/AiJoeVSV2h
	4Z3x5eruURXWohRZDCgug7qUz39+hY3CLIpX4nmXRHUFx4sMuV8yUkS4NxWnGzsiGjE3BKyo/ruNp
	KUr3GV8ztZQQzSZFGl7a319Vjb77WwDCc4VVEDxn48RXYN9p8/qy4CQT0ljXxWz+jT6FxwPx7jlWv
	Zu7M0JhGdJo367u3XhQhEUfWw03xlhcp4aLBxQjSfsb9Vv3MeglzQI189avlSRJUJgOIoTM90+ySR
	Vl2sf+vN3pUIT8rufj9rhPzonRWlIWYoNv4jxaJtxTiZSd0y6jk+beeYxlL9AfEu1uR0pCd4MS8Ac
	1h1ZGJsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSdIB-00000005yEz-1D9j;
	Thu, 28 May 2026 16:09:07 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSdIA-00000005yEn-0Qga;
	Thu, 28 May 2026 16:09:06 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 343AF6014B;
	Thu, 28 May 2026 16:09:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61A811F000E9;
	Thu, 28 May 2026 16:09:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779984544;
	bh=h9g24AMvHPC82wp8alB06zIO1bChAGUywmcXHfgLSzg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=aJmerr5Yu9DJXjrB1+R/OUCZIzguGkJ/2WMfRBhgFoxct9tb2XG91s3oB39rcM2m0
	 YtEKW/mkJqXUq4NRZeuTrt4+3AlJT+iG53E6oRjTiCkkQVDg/LT3NHtoJd77RTeu8K
	 8AMi1+Kffv391i74QGAdoDZ/h4imuM9BmBk8r4HYv7MIDAJV5A8EJ6QOmvRgUSh+YI
	 BowZSjMQZLGe2qx3zO74GvLfPJjQywX4Q/Rw16zMj0iJ86Ah6yT8O+u8jZnVymUC2m
	 jXt4EF4W5+Qhjo7xcjqaM9GJncHXHKaTFyo6sqZu8oz64/dVfKzNIiz9NhvbOmMDuv
	 18Pqv/t9U1tbg==
Date: Thu, 28 May 2026 18:09:02 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Alexander Lobakin <aleksander.lobakin@intel.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	Xuegang Lu <xuegang.lu@airoha.com>
Subject: Re: [PATCH net-next 1/6] net: airoha: Introduce airoha_gdm_dev struct
Message-ID: <ahhonoI-oJ6gJqZ0@lore-desk>
References: <20260527-airoha-eth-multi-serdes-preliminary-v1-0-ec6ed73ef7fc@kernel.org>
 <20260527-airoha-eth-multi-serdes-preliminary-v1-1-ec6ed73ef7fc@kernel.org>
 <433b9d9a-bd7c-44ad-b387-a789b326488e@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Nb9J8kMZwq4Zf3k2"
Content-Disposition: inline
In-Reply-To: <433b9d9a-bd7c-44ad-b387-a789b326488e@intel.com>
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


--Nb9J8kMZwq4Zf3k2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On May 28, Alexander Lobakin wrote:
> From: Lorenzo Bianconi <lorenzo@kernel.org>
> Date: Wed, 27 May 2026 12:21:15 +0200
>=20
> > EN7581 and AN7583 SoCs support connecting multiple external SerDes to G=
DM3
> > or GDM4 ports via a hw arbiter that manages the traffic in a TDM manner.
> > As a result multiple net_devices can connect to the same GDM{3,4} port
> > and there is a theoretical "1:n" relation between GDM port and
> > net_devices.
> > Introduce airoha_gdm_dev struct to collect net_device related info (e.g.
> > net_device and external phy pointer). Please note this is just a
> > preliminary patch and we are still supporting a single net_device for
> > each GDM port. Subsequent patches will add support for multiple net_dev=
ices
> > connected to the same GDM port.
> >=20
> > Tested-by: Xuegang Lu <xuegang.lu@airoha.com>
> > Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
>=20
> [...]
>=20
> > diff --git a/drivers/net/ethernet/airoha/airoha_eth.h b/drivers/net/eth=
ernet/airoha/airoha_eth.h
> > index d3781103abb5..c78cabbec753 100644
> > --- a/drivers/net/ethernet/airoha/airoha_eth.h
> > +++ b/drivers/net/ethernet/airoha/airoha_eth.h
> > @@ -535,10 +535,15 @@ struct airoha_qdma {
> >  	struct airoha_queue q_rx[AIROHA_NUM_RX_RING];
> >  };
> > =20
> > +struct airoha_gdm_dev {
> > +	struct airoha_gdm_port *port;
> > +	struct net_device *dev;
>=20
> Nit: we now have priv_to_netdev() (I hope I remember its name
> correctly), so that we no longer need to store a netdev backpointer in
> netdev_priv structures.
> Just an option, up to you.

I think you mean netdev_from_priv(), right?
I guess I can fix if I need to repost, otherwise I will fix with with a
dedicated patch. Agree?

Regards,
Lorenzo

>=20
> > +	struct airoha_eth *eth;
> > +};
> > +
> >  struct airoha_gdm_port {
> >  	struct airoha_qdma *qdma;
> > -	struct airoha_eth *eth;
> > -	struct net_device *dev;
> > +	struct airoha_gdm_dev *dev;
> >  	int id;
> >  	int nbq;
> > =20
> Thanks,
> Olek

--Nb9J8kMZwq4Zf3k2
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCahhongAKCRA6cBh0uS2t
rCn3AP9L3HrDZO+dHLvad0WYopiz4hGx0009SRdHy+w2Kx7BBAEAjqX2Bemdw09X
zNug8X2AKnTJnbKmtQJzquIA+MePbAw=
=Fj6G
-----END PGP SIGNATURE-----

--Nb9J8kMZwq4Zf3k2--


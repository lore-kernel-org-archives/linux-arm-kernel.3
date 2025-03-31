Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF04FC3600B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Mar 2025 16:58:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=74X5vC3hjxFSLXi5Yoy1ibDp5gCwkjqcm1KGeR03tKU=; b=XkAEQnCzxuK1a2gOUNqxca4KU3
	EJkjFQZqUkk+ZvvWdddoc4yj/XRq2/AGO8esE/CiJ86Vh6JcspYdg3f8jwqSFkry7g73MYASlWb74
	6/46eTx8rR0a2UnhkzTkTJLdPc/KaWd+Xc6PBY5KBFiMWQgbYg3SAelJ9Q27Wo5JqXsY6ePayXumr
	DVMt9e3RaLHKMEjc1J4Zu7dDHAZmzEhDg4EyBSazPa9GdfZDdOJLq51baquFPOlbVuUcTGbwgyXXn
	PLGvgfwUOu11uxYne63rfeL31rBg9srl1ttsf2H1h/UHRThaHaWhHwg7lUEU4dF4AcOObN4+CsVOv
	mY21VKqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzISa-0000000120N-0wTm;
	Mon, 31 Mar 2025 16:58:04 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzIQt-000000011pL-0RE0;
	Mon, 31 Mar 2025 16:56:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D71856112F;
	Mon, 31 Mar 2025 16:56:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CADC5C4CEE3;
	Mon, 31 Mar 2025 16:56:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743440178;
	bh=RZ7ydlQ9XRAWxzYa5+iA1hQqe+NZFUE7I2l0BCYJgCE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=terbX22XrdWsmwWJcCJsBDj96OmRLwPQatsCyXk1qHgBE6Txepzq0rO1Lx89VgXEm
	 TRMu4Zqw9868jJB2dCSfP5UC4T43DuAqaBq0TwPnLapSe4yWAWi98f/OBWb+6moLQm
	 7quxX76j24MJeVyz0LYs1jQM+9l91Hch+GXORhc9BhLUq2PyF7uAz68ttWqZka/SAU
	 iFSyH4YAZwOh7wdvamYbmTDG1XqQASi2nDwB3vy12pGunM72DKNC70qLtoTbb/Pg/k
	 tosUcwA+DlGb7uAqLmoDqaQbnmEdizGatyP8nM2H/NxITRLtuAtxEYmeqfDD2zG5HS
	 Z2r/nlam5hehQ==
Date: Mon, 31 Mar 2025 18:56:15 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Simon Horman <horms@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [PATCH net v3] net: airoha: Validate egress gdm port in
 airoha_ppe_foe_entry_prepare()
Message-ID: <Z-rJL6oFZa5jpjlo@lore-desk>
References: <20250331-airoha-validate-egress-gdm-port-v3-1-c14e6ba9733a@kernel.org>
 <20250331162841.GD185681@horms.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="WLQ37arbkRhRFFOB"
Content-Disposition: inline
In-Reply-To: <20250331162841.GD185681@horms.kernel.org>
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


--WLQ37arbkRhRFFOB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> On Mon, Mar 31, 2025 at 12:14:09PM +0200, Lorenzo Bianconi wrote:
> > Device pointer in airoha_ppe_foe_entry_prepare routine is not strictly
> > necessary a device allocated by airoha_eth driver since it is an egress
>=20
> nit: I think it would be clearer if "necessary" was dropped from the line
>      above.

ack, I will fix it in v4.

>=20
> > device and the flowtable can contain even wlan, pppoe or vlan devices.
> > E.g:
> >=20
> > flowtable ft {
> >         hook ingress priority filter
> >         devices =3D { eth1, lan1, lan2, lan3, lan4, wlan0 }
> >         flags offload                               ^
> >                                                     |
> >                      "not allocated by airoha_eth" --
> > }
> >=20
> > In this case airoha_get_dsa_port() will just return the original device
> > pointer and we can't assume netdev priv pointer points to an
> > airoha_gdm_port struct.
> > Fix the issue validating egress gdm port in airoha_ppe_foe_entry_prepare
> > routine before accessing net_device priv pointer.
> >=20
> > Fixes: 00a7678310fe ("net: airoha: Introduce flowtable offload support")
> > Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> > ---
> > Changes in v3:
> > - Rebase on top of net tree
> > - Fix commit log
> > - Link to v2: https://lore.kernel.org/r/20250315-airoha-flowtable-null-=
ptr-fix-v2-1-94b923d30234@kernel.org
> >=20
> > Changes in v2:
> > - Avoid checking netdev_priv pointer since it is always not NULL
> > - Link to v1: https://lore.kernel.org/r/20250312-airoha-flowtable-null-=
ptr-fix-v1-1-6363fab884d0@kernel.org
> > ---
> >  drivers/net/ethernet/airoha/airoha_eth.c | 13 +++++++++++++
> >  drivers/net/ethernet/airoha/airoha_eth.h |  3 +++
> >  drivers/net/ethernet/airoha/airoha_ppe.c | 10 ++++++++--
> >  3 files changed, 24 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/eth=
ernet/airoha/airoha_eth.c
> > index c0a642568ac115ea9df6fbaf7133627a4405a36c..bf9c882e9c8b087dbf5e907=
636547a0117d1b96a 100644
> > --- a/drivers/net/ethernet/airoha/airoha_eth.c
> > +++ b/drivers/net/ethernet/airoha/airoha_eth.c
> > @@ -2454,6 +2454,19 @@ static void airoha_metadata_dst_free(struct airo=
ha_gdm_port *port)
> >  	}
> >  }
> > =20
> > +int airoha_is_valid_gdm_port(struct airoha_eth *eth,
> > +			     struct airoha_gdm_port *port)
>=20
> nit: given the name of the function, perhaps returning a bool is more
>      appropriate.

ack, I will fix it in v4.

Regards,
Lorenzo

>=20
> > +{
> > +	int i;
> > +
> > +	for (i =3D 0; i < ARRAY_SIZE(eth->ports); i++) {
> > +		if (eth->ports[i] =3D=3D port)
> > +			return 0;
> > +	}
> > +
> > +	return -EINVAL;
> > +}
> > +
>=20
> ...

--WLQ37arbkRhRFFOB
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCZ+rJLwAKCRA6cBh0uS2t
rBLSAP9UEa4AlC0xp38CK2U7eV98AhByHX1GfKqwttBsg5mJQAEAvkLibzEGjviY
QH1WrF5Qi0JosMaranAOU2y7FBUcGwc=
=51Xz
-----END PGP SIGNATURE-----

--WLQ37arbkRhRFFOB--


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55819CCD194
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Oct 2025 08:37:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v1IiUUN9Ud/KHBOb3nqfzYJG0UONQx1yooJ1UPkaeMA=; b=j7zb3ZFNtijF2ISbv7zJEItDYg
	YcgZfFvITOwxgupS/WEHmDKy3ORnIqz4Z+VRYnLvWWwLQIOTEtEKFu1IIlmJ5KcQkkCh6Zg6XKtZ2
	Fg+g2S31doLj7ylTMbKMHt0yisaH0MfI21odYU8E1SRgkuFKjs5NLBT7CvUODU6zEzQvlYWBnsdBW
	A3CnmsJSkhuequL1eR6wibCpEoPsr3CzowC6SEZBv46Y/fCjqVCQWgFQU7I1tMHgqPIlE4gKwyXCH
	YLdDKsqYPP9L5iC7KUKR4v/fOdzYYktfntkxcWJ3DaU5CGULSf3ROBym3HHvWMGC5Kjkigj26FGd8
	1jwSxM7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9JTi-00000003yj5-3L6D;
	Thu, 16 Oct 2025 08:36:54 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9JTh-00000003yi6-0Xn3;
	Thu, 16 Oct 2025 08:36:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8CCA66039A;
	Thu, 16 Oct 2025 08:36:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8CC6C4CEF1;
	Thu, 16 Oct 2025 08:36:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760603812;
	bh=MuVT8F29Xlc5XO/utltXz470EZDUUeT2p+kzo7sBpCc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lSxiCumns7EpzNLOIgT/81hEQX9eA2qS1y/SDwq4SEuMAG5jL16PWcY1aeG8GdOH+
	 QcclVkiqrcTwaToa4hGCK0J7pXlx1HsGlbj5wBXQLlQ3Ab/o4pTbThi9acFoCR/eLo
	 65WmTLCEw20m71CvOHv/ZoA19nC1E7uORPjfXxifwEFKC0SVlCgfAVjl3ZuQNkjdc9
	 m5gILegWqx67jDRS1rqorVr1lthwCEn9rHUNhS4KdtrXH2DojZ+YT+BCTGwFBrYSLR
	 TD70OsqTNs0/v9YvrtLSrwrmpLX6/tnnXmj8+J22+D3sWTU+KKzkaJkRW8Vdg70GYH
	 e7htLXVq29SVw==
Date: Thu, 16 Oct 2025 10:36:49 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Simon Horman <horms@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH net-next 11/12] net: airoha: Refactor src port
 configuration in airhoha_set_gdm2_loopback
Message-ID: <aPCuoR8ukM23d71i@lore-desk>
References: <20251015-an7583-eth-support-v1-0-064855f05923@kernel.org>
 <20251015-an7583-eth-support-v1-11-064855f05923@kernel.org>
 <aO_GOE0jPMlcP-VR@horms.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="njSAvnTeCku01lzf"
Content-Disposition: inline
In-Reply-To: <aO_GOE0jPMlcP-VR@horms.kernel.org>
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


--njSAvnTeCku01lzf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> On Wed, Oct 15, 2025 at 09:15:11AM +0200, Lorenzo Bianconi wrote:
> > AN7583 chipset relies on different definitions for source-port
> > identifier used for hw offloading. In order to support hw offloading
> > in AN7583 controller, refactor src port configuration in
> > airhoha_set_gdm2_loopback routine and introduce get_src_port_id
> > callback.
> >=20
> > Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> > ---
> >  drivers/net/ethernet/airoha/airoha_eth.c  | 75 +++++++++++++++++++++--=
--------
> >  drivers/net/ethernet/airoha/airoha_eth.h  | 11 +++--
> >  drivers/net/ethernet/airoha/airoha_regs.h |  5 +--
> >  3 files changed, 60 insertions(+), 31 deletions(-)
> >=20
> > diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/eth=
ernet/airoha/airoha_eth.c
> > index 5f6b5ab52e0265f7bb56b008ca653d64e04ff2d2..76c82750b3ae89a9fa81c64=
d3b7c3578b369480c 100644
> > --- a/drivers/net/ethernet/airoha/airoha_eth.c
> > +++ b/drivers/net/ethernet/airoha/airoha_eth.c
> > @@ -1682,11 +1682,14 @@ static int airoha_dev_set_macaddr(struct net_de=
vice *dev, void *p)
> >  	return 0;
> >  }
> > =20
> > -static void airhoha_set_gdm2_loopback(struct airoha_gdm_port *port)
> > +static int airhoha_set_gdm2_loopback(struct airoha_gdm_port *port)
> >  {
> >  	u32 pse_port =3D port->id =3D=3D 3 ? FE_PSE_PORT_GDM3 : FE_PSE_PORT_G=
DM4;
> >  	struct airoha_eth *eth =3D port->qdma->eth;
> >  	u32 chan =3D port->id =3D=3D 3 ? 4 : 0;
> > +	/* XXX: handle XSI_USB_PORT and XSI_PCE1_PORT */
> > +	u32 nbq =3D port->id =3D=3D 3 ? 4 : 0;
> > +	int src_port;
>=20
> I think this code could benefit for names (defines) for port ids.
> It's a bit clearer in airoha_en7581_get_src_port_id(). But the
> numbers seem kind of magic in this function.

ack, I will fix it in v2.

Regards,
Lorenzo

>=20
> > =20
> >  	/* Forward the traffic to the proper GDM port */
> >  	airoha_set_gdm_port_fwd_cfg(eth, REG_GDM_FWD_CFG(2), pse_port);
> > @@ -1709,29 +1712,23 @@ static void airhoha_set_gdm2_loopback(struct ai=
roha_gdm_port *port)
> >  	airoha_fe_clear(eth, REG_FE_VIP_PORT_EN, BIT(2));
> >  	airoha_fe_clear(eth, REG_FE_IFC_PORT_EN, BIT(2));
> > =20
> > -	if (port->id =3D=3D 3) {
> > -		/* FIXME: handle XSI_PCE1_PORT */
> > -		airoha_fe_rmw(eth, REG_FE_WAN_PORT,
> > -			      WAN1_EN_MASK | WAN1_MASK | WAN0_MASK,
> > -			      FIELD_PREP(WAN0_MASK, HSGMII_LAN_PCIE0_SRCPORT));
> > -		airoha_fe_rmw(eth,
> > -			      REG_SP_DFT_CPORT(HSGMII_LAN_PCIE0_SRCPORT >> 3),
> > -			      SP_CPORT_PCIE0_MASK,
> > -			      FIELD_PREP(SP_CPORT_PCIE0_MASK,
> > -					 FE_PSE_PORT_CDM2));
> > -	} else {
> > -		/* FIXME: handle XSI_USB_PORT */
> > +	src_port =3D eth->soc->ops.get_src_port_id(port, nbq);
> > +	if (src_port < 0)
> > +		return src_port;
> > +
> > +	airoha_fe_rmw(eth, REG_FE_WAN_PORT,
> > +		      WAN1_EN_MASK | WAN1_MASK | WAN0_MASK,
> > +		      FIELD_PREP(WAN0_MASK, src_port));
> > +	airoha_fe_rmw(eth, REG_SP_DFT_CPORT(src_port >> 3),
> > +		      SP_CPORT_MASK(src_port & 0x7),
> > +		      FE_PSE_PORT_CDM2 << __ffs(SP_CPORT_MASK(src_port & 0x7)));
>=20
> Likewise, 3 and 0x7 a bit magical here.
>=20
> > +
> > +	if (port->id !=3D 3)
> >  		airoha_fe_rmw(eth, REG_SRC_PORT_FC_MAP6,
> >  			      FC_ID_OF_SRC_PORT24_MASK,
> >  			      FIELD_PREP(FC_ID_OF_SRC_PORT24_MASK, 2));
>=20
> ... and 2 here.
>=20
> > -		airoha_fe_rmw(eth, REG_FE_WAN_PORT,
> > -			      WAN1_EN_MASK | WAN1_MASK | WAN0_MASK,
> > -			      FIELD_PREP(WAN0_MASK, HSGMII_LAN_ETH_SRCPORT));
> > -		airoha_fe_rmw(eth,
> > -			      REG_SP_DFT_CPORT(HSGMII_LAN_ETH_SRCPORT >> 3),
> > -			      SP_CPORT_ETH_MASK,
> > -			      FIELD_PREP(SP_CPORT_ETH_MASK, FE_PSE_PORT_CDM2));
> > -	}
> > +
> > +	return 0;
> >  }
>=20
> ...
>=20
> > @@ -3055,11 +3057,38 @@ static const char * const en7581_xsi_rsts_names=
[] =3D {
> >  	"xfp-mac",
> >  };
> > =20
> > +static int airoha_en7581_get_src_port_id(struct airoha_gdm_port *port,=
 int nbq)
> > +{
> > +	switch (port->id) {
> > +	case 3:
> > +		/* 7581 SoC supports PCIe serdes on GDM3 port */
> > +		if (nbq =3D=3D 4)
> > +			return HSGMII_LAN_7581_PCIE0_SRCPORT;
> > +		if (nbq =3D=3D 5)
> > +			return HSGMII_LAN_7581_PCIE1_SRCPORT;
> > +		break;
> > +	case 4:
> > +		/* 7581 SoC supports eth and usb serdes on GDM4 port */
> > +		if (!nbq)
> > +			return HSGMII_LAN_7581_ETH_SRCPORT;
> > +		if (nbq =3D=3D 1)
> > +			return HSGMII_LAN_7581_USB_SRCPORT;
> > +		break;
> > +	default:
> > +		break;
> > +	}
> > +
> > +	return -EINVAL;
> > +}
>=20
> ...

--njSAvnTeCku01lzf
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCaPCuoQAKCRA6cBh0uS2t
rCOOAQDMDIpF364/MbSzib3j8d9uEzbbNEXLxP3luCc3gqQiqwEA742hYnGMwq6H
kCa9nehAixoGaVR15kULJyL3ZZAxHgc=
=NNc+
-----END PGP SIGNATURE-----

--njSAvnTeCku01lzf--


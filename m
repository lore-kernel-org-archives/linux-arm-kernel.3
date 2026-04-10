Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 629A5F44842
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Apr 2026 11:51:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jAbh96kURybP3B1FnJBvblEKWrZ1OrTJN0UaRwHzHJ8=; b=sLvpaY8vJB3hXB2JT8uJk5fMJ3
	oQZhCtrscmsMJjVaV/19FWnnlwFrDWmbFnokivRFneH9t7/dwmqRS2gFU3Zx/ZjO9TNq5SaCZr6ZA
	6TS79CJq53xlzMBkQmsSBdfuqf4KYKih6PnoPkhPjlW8CBpA+rSIddYP6oEblRR9ZA7Jy3KquKArF
	Ya1i/NZs3X9ishpmkVIJvpSEvp0rQxsW9jyssxpM3o7vIq/7kINBKGf+a6iKlILzEZXHzbOuMVk5s
	ygBUf9b4yxwjqFvWtm6+rqC+GZYZTHGQylCkEd8YQnZNLByvT6Qcaq5PYAjm0BO/A+qiEB3thoLqg
	6juL9J1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBAOZ-0000000C6aS-15we;
	Fri, 10 Apr 2026 11:51:31 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBAOX-0000000C6Zz-0DZ3;
	Fri, 10 Apr 2026 11:51:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 34A1943C6C;
	Fri, 10 Apr 2026 11:51:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 941C8C19421;
	Fri, 10 Apr 2026 11:51:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775821888;
	bh=/v9RdEAhzS37lCkkSXoeeZkAOF1mvH24IcozDlYc1Sk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KQeciTH0wbDVxWHCfhuS6Y+LIbp5to6StlVHunODdUah0VDc4u/jwg+o7W3Voy080
	 LkSxAjQphEBPvs0gRrMpCLXGplUiVEvBLQuC9fAuPy79tEjvwAtQ7DqzCKvDt7Al+g
	 K79MgjIo4vgMuGGAWor9mF8IVp4WtYDlqN8NSJtIEHMTjHnLgloM1Y49UxTuSpknrL
	 sWTf+er889DEsqaUIQebfp3BgNbwgnS/4+3JGbDSQR9INnlrnBuJ0WQX90BWIxZmyo
	 YlFy+6K7ZW9UkTSYQ9DMaS0eX9fHNMO9zf4IRWOIIZnmF4D93WmJPT7xNwCP6QpkiJ
	 RtN2KLgdUMx/w==
Date: Fri, 10 Apr 2026 13:51:25 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Jakub Kicinski <kuba@kernel.org>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, ansuelsmth@gmail.com,
	benjamin.larsson@genexis.eu, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH net-next v3 04/12] net: airoha: Rely on net_device
 pointer in HTB callbacks
Message-ID: <adjkPSK-qR5UAuA-@lore-desk>
References: <20260406-airoha-eth-multi-serdes-v3-4-ab6ea49d59ff@kernel.org>
 <20260410025722.1809973-1-kuba@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7W5gcngAA2i51Gam"
Content-Disposition: inline
In-Reply-To: <20260410025722.1809973-1-kuba@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260410_045129_132124_0BF3947F 
X-CRM114-Status: GOOD (  26.03  )
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


--7W5gcngAA2i51Gam
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> This is an AI-generated review of your patch. The human sending this
> email says "For your consideration."
> ---
> net: airoha: Introduce WAN device flag
>=20
> This commit introduces a WAN flag to specify whether a device is used to
> transmit or receive WAN or LAN traffic. It enables specifying multiple LAN
> devices but limits the configuration to a single WAN device.
>=20
> > diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/eth=
ernet/airoha/airoha_eth.c
> > index 5b0cd37b155e4..9988011dca53f 100644
> > --- a/drivers/net/ethernet/airoha/airoha_eth.c
> > +++ b/drivers/net/ethernet/airoha/airoha_eth.c
> > @@ -1796,36 +1796,77 @@ static int airoha_set_gdm2_loopback(struct airo=
ha_gdm_dev *dev)
>=20
> [ ... ]
>=20
> > +static int airoha_dev_init(struct net_device *netdev)
> > +{
> > +	struct airoha_gdm_dev *dev =3D netdev_priv(netdev);
> > +	struct airoha_gdm_port *port =3D dev->port;
> > =20
> >  	switch (port->id) {
> >  	case AIROHA_GDM3_IDX:
> > -	case AIROHA_GDM4_IDX:
> > -		/* If GDM2 is active we can't enable loopback */
> > -		if (!eth->ports[1]) {
> > -			int err;
> > +	case AIROHA_GDM4_IDX: {
> > +		struct airoha_eth *eth =3D dev->eth;
> > =20
> > -			err =3D airoha_set_gdm2_loopback(dev);
> > -			if (err)
> > -				return err;
> > -		}
> > +		if (eth->ports[1] || airoha_get_wan_gdm_dev(eth))
> > +			break;
>=20
> If a board's Device Tree enables both GDM3 and GDM4, and GDM2 is not pres=
ent,
> does this sequence permanently assign the WAN role to GDM3 since it is
> initialized first? Is there a Device Tree property or fallback configurat=
ion
> mechanism to allow users to specify GDM4 as the WAN port instead?

This issue will be fixed with following series that allows to dynamically
select LAN or WAN configuration at runtime.

>=20
> > +		fallthrough;
> > +	}
> > +	case AIROHA_GDM2_IDX:
> > +		/* GDM2 is always used as wan */
> > +		dev->flags |=3D PRIV_FLAG_WAN;
> >  		break;
> >  	default:
> >  		break;
> >  	}
> > =20
> > -	for (i =3D 0; i < eth->soc->num_ppe; i++)
> > -		airoha_ppe_set_cpu_port(dev, i, airoha_get_fe_port(dev));
> > +	airoha_dev_set_qdma(dev);
> > +	airoha_set_macaddr(dev, netdev->dev_addr);
>=20
> Since the commit message notes it is possible to specify multiple LAN
> devices, does unconditionally calling airoha_set_macaddr() for each
> device overwrite the single shared hardware LAN MAC register?
>=20
> If so, could this cause only the last initialized LAN device to have its =
MAC
> correctly programmed into the hardware, leading to dropped unicast
> packets for the other LAN interfaces?
>=20
> > +
> > +	if (!airoha_is_lan_gdm_dev(dev) &&
> > +	    (port->id =3D=3D AIROHA_GDM3_IDX || port->id =3D=3D AIROHA_GDM4_I=
DX)) {
> > +		int err;
>=20
> [ ... ]

--7W5gcngAA2i51Gam
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCadjkPQAKCRA6cBh0uS2t
rHwtAQCeVEB7opEH1jTAFAZgyCK8krbgv67AHGuqZexgJaekzQEApxT1RtXkOtbj
ZispmFs1Ej3NlAgqNDlkItlht8fBzwM=
=cCJU
-----END PGP SIGNATURE-----

--7W5gcngAA2i51Gam--


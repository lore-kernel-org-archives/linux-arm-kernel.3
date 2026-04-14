Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E8B7F9D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Apr 2026 13:04:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K8pBh4398RDoCeTIQR+5NhGbtRQ52nIfk084bkMFoO8=; b=tVLDX2Y833A2my4d9NVpHXSCC9
	/KSNneMk9yO6TVKKqa5AdE/yYRFycmhSFSeHgpVU2SjEMm2KoMxpJH8fHPjzuqWxQAGOt9goD3sEH
	1yGqk6naxvSGjAuhuJuX81F5EmTwpZyFi7F12u1nvgE6uOEPtjsX9J0jd2nD/HODy+zLLkasBL+6u
	o7SLizaxMRGdolgNntU2sPCUT+e3OhoEUSf/NdTo/9g6RlBhqTubD2DZUAccvO2WWVsVp8b4c0lH7
	Vo+gvuaLZjsZfVY1Rsv/LpsVRe1B3TcZr4pyKiXT1SP5L4XupKTEFr0vfqQmW5ZaE+OIlEzqwNEj2
	iHxooLtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCdR5-0000000HL9Z-42np;
	Tue, 14 Apr 2026 13:04:11 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCdR4-0000000HL95-0bHG;
	Tue, 14 Apr 2026 13:04:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2CE5E60018;
	Tue, 14 Apr 2026 13:04:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64FCFC19425;
	Tue, 14 Apr 2026 13:04:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776171848;
	bh=+SdxuvV++RW3Au9ENkYe7TDMNH7gu+U+TpzaE8EMu60=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=h9oAJT39GRuHqt8X4CzT3FAocKIXUrycPfF479DhSGQ9lDYjqZdrVJMMal/khypft
	 uiE8m/T/lSLmTIrK4QZWNc34kZjGFlo/wt5DEA2oaCJcSw7k68zV185MyRzvJ0gf77
	 gmQqDnU+8WShfOA5yrhzQaTFUgVOE0lRhPJjt6Rbi8PFzGeQSJHVv86Spki/3gY24c
	 a85V+kaLHRCLxXfBwiuGHLaMEVADYE/07rb4xmJQpgYmq0hFqSlY/90+VLZQGnF00L
	 OzZEGAoHbm7cCiw6TAahbBkkvoG2JfZYlUQvV1HFlpnClg1Ukpzqq3uefkRNX+JbU4
	 dNrPfidGe3fKg==
Date: Tue, 14 Apr 2026 15:04:06 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Simon Horman <horms@kernel.org>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [PATCH net] net: airoha: Fix max TX packet length configuration
Message-ID: <ad47Rn6O3zxMGvga@lore-desk>
References: <20260412-airoha-fix-max-mtu-v1-1-333030d0a564@kernel.org>
 <20260414124011.751922-1-horms@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Q+gggKPI9waM/m7U"
Content-Disposition: inline
In-Reply-To: <20260414124011.751922-1-horms@kernel.org>
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


--Q+gggKPI9waM/m7U
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> From: 'Simon Horman' <horms@kernel.org>
>=20
> This is an AI-generated review of your patch. The human sending this
> email has considered the AI review valid, or at least plausible.
> Full review at: https://sashiko.dev
> ---
> net: airoha: Fix max TX packet length configuration
>=20
> This commit fixes the MTU configuration for the Airoha driver by removing
> ETH_FCS_LEN from the maximum TX packet length, matching the hardware
> documentation which states the register does not include the FCS length.
>=20
> > diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/eth=
ernet/airoha/airoha_eth.c
> > index c14cdce588a7c..a81ffda72b39f 100644
> > --- a/drivers/net/ethernet/airoha/airoha_eth.c
> > +++ b/drivers/net/ethernet/airoha/airoha_eth.c
> > @@ -1629,9 +1629,9 @@ static void airoha_update_hw_stats(struct airoha_=
gdm_port *port)
> > =20
> >  static int airoha_dev_open(struct net_device *dev)
> >  {
> > -	int err, len =3D ETH_HLEN + dev->mtu + ETH_FCS_LEN;
> >  	struct airoha_gdm_port *port =3D netdev_priv(dev);
> >  	struct airoha_qdma *qdma =3D port->qdma;
> > +	int err, len =3D ETH_HLEN + dev->mtu;
>=20
> Does this regression cause MTU-sized VLAN-tagged frames to be dropped by =
the
> hardware?
>=20
> By limiting the frame size to ETH_HLEN + dev->mtu, the maximum allowed le=
ngth
> becomes 1514 bytes for a standard 1500 MTU. An Ethernet frame containing a
> standard 802.1Q VLAN tag and a maximum-sized 1500-byte IP payload require=
s an
> 18-byte L2 header, making the total frame size 1518 bytes (excluding FCS).
>=20
> Previously, the inclusion of ETH_FCS_LEN inadvertently provided the 4-byte
> headroom needed to accommodate a single VLAN tag.=20
>=20
> Could the configuration explicitly account for VLAN headers using VLAN_ET=
H_HLEN
> instead?

ack, thx for pointing this out. I will fix it in v2.

Regards,
Lorenzo

>=20
> [ ... ]

--Q+gggKPI9waM/m7U
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCad47RgAKCRA6cBh0uS2t
rPLDAP9Q5H7Gu+YaELSGXFfA19Ve/ujnBdFo02w+qdtwsV1EiwEAz8wT7BGV5Axj
dQ8zS8efuQJZOHb4yYvA+gf5P4uGIQ8=
=4+Tn
-----END PGP SIGNATURE-----

--Q+gggKPI9waM/m7U--


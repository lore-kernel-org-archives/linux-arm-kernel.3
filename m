Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D048CD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 16:43:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wrQB+CqOBdI/ARCQHNMs8ehEw+gtEWGdQDI/WVWbBF4=; b=aR8SZYJ2Su+6IFNi4p2V/JJdpb
	ifnSchn2xpN1I9GuPObzUcYlvTsfMREfnU2Z07o5BFTvmLtlGHb95ycEJynhikqZ78lIXZeVnFY1D
	E1XX942cN1HFe6AZvmDFQuFnj3b35bLpOrk/iXPg1pftLvVJIAbPO1iJ7hPMcAfBqhWM8pI7K3oHP
	+G/SUhSzv5ghgaOnsHSysqK/ZOFuHXqohiyxj8h4y2flxGhEGK466xM0XZnShJe76duaofO1f9u6S
	tWC2jcn6nygpTeOtbsHa+OPOad1Rxt9Qpn2EYoI6oSe5uqcuNexbQ1EAMmyNFdWoAVyQDNBEQesR0
	GCGKKneA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wT0JG-00000007ux8-1zbw;
	Fri, 29 May 2026 16:43:46 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wT0JE-00000007uvv-0oNl;
	Fri, 29 May 2026 16:43:45 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 4E60841838;
	Fri, 29 May 2026 16:43:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A77B11F00893;
	Fri, 29 May 2026 16:43:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780073023;
	bh=wrQB+CqOBdI/ARCQHNMs8ehEw+gtEWGdQDI/WVWbBF4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ndKXwALELUBevwh5WUv1/CJV81w4hrP15MegiMKygG3MM39QE7bMIFmh4Ax2iMc04
	 7SmT3BoCys9EKsL5izlcxcwpOVOgpP9Y9fh33xJji6iehutnpl8E8kwh/klubnLiBI
	 p5Hf4A+9DTFClXSkVqrNyfBSDegMv8VxCq4KEKU3OEr4wrR/rgBYMntoLvBIrehSz3
	 ey6X6Pr3EkX2waPDLAYKJrnWvnTKTBzhc3MzlZ8dVyzP8X0CNAJoh3oqETflmnjY2h
	 qYJsorlmNqbLzkupPw5NlwLLICtFEVn3R+1fgnIAfSB7ReLNyHdALDGjd/U5DC4FPN
	 2+E2mAsz65SFw==
Date: Fri, 29 May 2026 18:43:40 +0200
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
Message-ID: <ahnCPDuEATzJdln3@lore-desk>
References: <20260527-airoha-eth-multi-serdes-preliminary-v1-0-ec6ed73ef7fc@kernel.org>
 <20260527-airoha-eth-multi-serdes-preliminary-v1-1-ec6ed73ef7fc@kernel.org>
 <433b9d9a-bd7c-44ad-b387-a789b326488e@intel.com>
 <ahhonoI-oJ6gJqZ0@lore-desk>
 <722f177c-0578-4b0b-b2fa-2acd45b2e299@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3d3Dnappu0EpMzD8"
Content-Disposition: inline
In-Reply-To: <722f177c-0578-4b0b-b2fa-2acd45b2e299@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_094344_272124_7829173A 
X-CRM114-Status: GOOD (  25.01  )
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


--3d3Dnappu0EpMzD8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> From: Lorenzo Bianconi <lorenzo@kernel.org>
> Date: Thu, 28 May 2026 18:09:02 +0200
>=20
> > On May 28, Alexander Lobakin wrote:
> >> From: Lorenzo Bianconi <lorenzo@kernel.org>
> >> Date: Wed, 27 May 2026 12:21:15 +0200
> >>
> >>> EN7581 and AN7583 SoCs support connecting multiple external SerDes to=
 GDM3
> >>> or GDM4 ports via a hw arbiter that manages the traffic in a TDM mann=
er.
> >>> As a result multiple net_devices can connect to the same GDM{3,4} port
> >>> and there is a theoretical "1:n" relation between GDM port and
> >>> net_devices.
> >>> Introduce airoha_gdm_dev struct to collect net_device related info (e=
=2Eg.
> >>> net_device and external phy pointer). Please note this is just a
> >>> preliminary patch and we are still supporting a single net_device for
> >>> each GDM port. Subsequent patches will add support for multiple net_d=
evices
> >>> connected to the same GDM port.
> >>>
> >>> Tested-by: Xuegang Lu <xuegang.lu@airoha.com>
> >>> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> >>
> >> [...]
> >>
> >>> diff --git a/drivers/net/ethernet/airoha/airoha_eth.h b/drivers/net/e=
thernet/airoha/airoha_eth.h
> >>> index d3781103abb5..c78cabbec753 100644
> >>> --- a/drivers/net/ethernet/airoha/airoha_eth.h
> >>> +++ b/drivers/net/ethernet/airoha/airoha_eth.h
> >>> @@ -535,10 +535,15 @@ struct airoha_qdma {
> >>>  	struct airoha_queue q_rx[AIROHA_NUM_RX_RING];
> >>>  };
> >>> =20
> >>> +struct airoha_gdm_dev {
> >>> +	struct airoha_gdm_port *port;
> >>> +	struct net_device *dev;
> >>
> >> Nit: we now have priv_to_netdev() (I hope I remember its name
> >> correctly), so that we no longer need to store a netdev backpointer in
> >> netdev_priv structures.
> >> Just an option, up to you.
> >=20
> > I think you mean netdev_from_priv(), right?
>=20
> Yep, priv_to_netdev() is something I used in the past locally, it went
> to the kernel as netdev_from_priv() from a different author.

ack

>=20
> > I guess I can fix if I need to repost, otherwise I will fix with with a
> > dedicated patch. Agree?
>=20
> Sure, up to you anyway whether to use it. Most drivers still use
> backpointers to netdev in their private structures.
> From the optimization PoV, netdev_from_priv() should generate a bit
> better code as it's then clear that it's just a fixed offset from the
> private structure, not a separate piece of memory.

ack, I am fine with that. I will post a dedicated patch when the current se=
ries
is merged (if there are no other comments).

Regards,
Lorenzo

>=20
> >=20
> > Regards,
> > Lorenzo
>=20
> Thanks,
> Olek

--3d3Dnappu0EpMzD8
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCahnCPAAKCRA6cBh0uS2t
rAzjAQDaKZufazE0WT4IMiu3/d0c5nm66K6Tv59vaHCvvZ9EqQD+PXMx8the4UVh
QdwUfhAlYgeCwft32GFenWENmnYHzwM=
=EHuC
-----END PGP SIGNATURE-----

--3d3Dnappu0EpMzD8--


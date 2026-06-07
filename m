Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45348CD8C89
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  7 Jun 2026 18:07:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qi2ck4KPgoc5FG6O8jbWnIUyAELMxFVIS/GHtqRzVs4=; b=orRNRKAp5Y5F+M8DIkIbkefLxd
	X+Hp/YuCx0ViRk03XNyVOEqAOHO56bXiYr0qgdIHlB0dveYS5ugg6kP3hYWv/bXoj9gbbgnMPs5KR
	d0U+2J4ct2fzGWr6VY4P29pOXgCxoVmg4a1mqzSLwmHMa/dss4P13JVi6V5asfIsTCl2XAonqmsKh
	YyVwpZyyage2iw+lLiwxFTk4q0V++Tk69/zQKw1Ouzta2GEkZ2w1Z59bMvW2fvdJhTimVEZInSfSZ
	IV3beKi57pPUnMOz5x/8IC8K53Cpq93loCBdS0gDHLoOPUJHfXs/IFhD5sKxcymp/m5y4s76sR6DC
	IHSoZb3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWHuP-00000002PAc-4AbV;
	Sun, 07 Jun 2026 18:07:42 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWHuO-00000002PAT-2nnl;
	Sun, 07 Jun 2026 18:07:40 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 1BF7642E59;
	Sun,  7 Jun 2026 18:07:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7438F1F00893;
	Sun,  7 Jun 2026 18:07:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780855660;
	bh=qi2ck4KPgoc5FG6O8jbWnIUyAELMxFVIS/GHtqRzVs4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=I4Yl6IzYIbSWSpv3sD5o/fo+Uc87bLpZUzq1wVqWHOIo36fhbZ0br5jXODPptLCi+
	 kD+34FnAivaxqA77xZzX0Rr0E5XVqP2VU4FHNWVSkJ82oyVat1x58btX3ramkcKvTv
	 2YoMfCNb9ql3jZwh3xN958p4y6O+DXufoeAFsE4UquJ5h/wXYlJdfCVTD1Za78sMUT
	 +To3CBtsBnNh63tTeP1ogeT14u6t36JUO9ziVqk7WXcIfoxXlhW5dLR4GvrNz4H0rs
	 dfhqGioicQC+oXa2RAb9cpA4MOfEsxWNpoXkmwh251djGic5+AcVAc3QoJ4pXaZjUX
	 WZ0oR7wKC96sQ==
Date: Sun, 7 Jun 2026 20:07:37 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	Madhur Agrawal <madhur.agrawal@airoha.com>
Subject: Re: [PATCH net-next v2] net: airoha: add ethtool priv_flags support
 for LAN/WAN and GDM2 loopback
Message-ID: <aiWzaV1f1Fpc2rhJ@lore-desk>
References: <20260607-airoha-ethtool-priv_flags-v2-1-742c7aa1e182@kernel.org>
 <33c3a87d-ad97-4f6a-8f76-ebab80c496ac@lunn.ch>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="FDYc2oFp0P5PYaqK"
Content-Disposition: inline
In-Reply-To: <33c3a87d-ad97-4f6a-8f76-ebab80c496ac@lunn.ch>
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


--FDYc2oFp0P5PYaqK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> > When a GDM3/GDM4 port is set to WAN mode, enable GDM2 loopback to
> > support hardware QoS. Conversely, when switching back to LAN mode,
> > disable the GDM2 loopback and restore the default forwarding
> > configuration.
>=20
> Why not just use the presence of an off loadable qdisc as the
> indicator to change mode?

Hi Andrew,

Interesting, can you please provide more details about you mean?

Regards,
Lorenzo

>=20
> 	  Andrew

--FDYc2oFp0P5PYaqK
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCaiWzaQAKCRA6cBh0uS2t
rBgqAQCqcFqDzywecN1kArDNW6bODjr34Zqph7c6FCUcVU4HRQD/aSPSKpVPnX+5
N3ol6cuoilM77IyMeZX43ObBeGoPrAs=
=QEdK
-----END PGP SIGNATURE-----

--FDYc2oFp0P5PYaqK--


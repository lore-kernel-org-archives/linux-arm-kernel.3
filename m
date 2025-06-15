Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3445EC61CE8
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Jun 2025 10:15:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8fGj+shvHeJXid2ebT0vFopIzj+fkr4/961VjV4bUlQ=; b=kirwUazjX+/zRVob6Y9Jq6yi2A
	/UPykTcmMu0kQziVHhMID+8Kh0qc7WI49kCcLTG47uul2XDiYqcak5+YiXihiDs3Z9bvTn7aRT1PX
	VmOU9oCqbR3+d7mw0CWNrGX8apRYo918/6ZFnTaslzWFmSB1bNQGjfXbJ7JmeVwC+1ZTpaKe6JYKG
	wB2h62bx9XQvnM/goZ0GLoQCfdeubOA7SOPQfKWPXgJBpcX44L7viPkLu1WqBbbWwdpfa3Ah9zCNU
	29HFLes9wjj8dmjY8zLVrKGEwT0vUoOSeIBPLbR0uQn9tNlB7OLgpLAaZNUSZ/n/Dr9ZtBC07tcmk
	6yJyzN9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQkOz-00000002QFR-0kXC;
	Sun, 15 Jun 2025 10:15:49 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQkMl-00000002Q7H-2DYf;
	Sun, 15 Jun 2025 10:13:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DF031438A8;
	Sun, 15 Jun 2025 10:13:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38415C4CEE3;
	Sun, 15 Jun 2025 10:13:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749982410;
	bh=zKQku6o0q3P5txBFLBWiKo5vZY670ZgyClTPpDf7UPs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oSZsaBJH/SwcdVwN5JSUFt/uwKkNCS6OeUhMpChIg+g/2XonSDPRvp+sY/E9AQGdH
	 LPiPK4AyqVOLC802DHBeORVSqX75WeYJLhOPeiU8SpYpYlavEo9s+UMDgimcODNWdh
	 QycYFNr17FOIT8ruJ5EEBreENjAA/otDqruFOWJY1L+QTQUXUayU1pby9L7vxHqhaX
	 9XbZdzibohYDYRnaTPNCPJBb8MgF4wANCakWqZCFrvl+l4fdeP6InV/TLz1K4r5PBU
	 0XrOE94MrDy/+Mb3tnNcRgGpaiGlzarOl+7YBxZv/oMX8sTFuHH+1SdcxyEuZfd9g0
	 FdpnXndUwsuLg==
Date: Sun, 15 Jun 2025 12:13:28 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: "Frank Wunderlich (linux)" <linux@fw-web.de>
Cc: Daniel Golle <daniel@makrotopia.org>, Felix Fietkau <nbd@nbd.name>,
	Sean Wang <sean.wang@mediatek.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Frank Wunderlich <frank-w@public-files.de>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, Simon Horman <horms@kernel.org>
Subject: Re: [PATCH v2] net: ethernet: mtk_eth_soc: support named IRQs
Message-ID: <aE6cyHC39IV27PcF@lore-desk>
References: <20250615084521.32329-1-linux@fw-web.de>
 <aE6K-d0ttAnBzcNg@lore-desk>
 <d4781d559e3f72b0bcde88e6b04ed8e5@fw-web.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="oVrPlAnEQ6cDmmnL"
Content-Disposition: inline
In-Reply-To: <d4781d559e3f72b0bcde88e6b04ed8e5@fw-web.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250615_031331_613713_91CFD433 
X-CRM114-Status: GOOD (  47.17  )
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


--oVrPlAnEQ6cDmmnL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Am 2025-06-15 10:57, schrieb Lorenzo Bianconi:
> > > From: Frank Wunderlich <frank-w@public-files.de>
> > >=20
> > > Add named interrupts and keep index based fallback for exiting
> > > devicetrees.
> > >=20
> > > Currently only rx and tx IRQs are defined to be used with mt7988, but
> > > later extended with RSS/LRO support.
> > >=20
> > > Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> > > Reviewed-by: Simon Horman <horms@kernel.org>
> >=20
> > Hi Frank,
> >=20
> > I guess my comments on v1 apply even in v2. Can you please take a look?

sure

>=20
> adding your comments (and mine as context) from v1 here:
>=20
> Am 2025-06-15 10:57, schrieb Lorenzo Bianconi:
> > > From: Frank Wunderlich <frank-w@public-files.de>
>=20
> > > I had to leave flow compatible with this:
> > >=20
> > > <https://github.com/frank-w/BPI-Router-Linux/blob/bd7e1983b9f0a69cf47=
cc9b9631138910d6c1d72/drivers/net/ethernet/mediatek/mtk_eth_soc.c#L5176>
> >=20
> > I guess the best would be to start from 0 even here (and wherever it is
> > necessary) and avoid reading current irq[0] since it is not actually
> > used for
> > !shared_int devices (e.g. MT7988).  Agree?
> >=20
> > >=20
> > > Here the irqs are taken from index 1 and 2 for
> > >  registration (!shared_int else only 0). So i avoided changing the
> > >  index,but yes index 0 is unset at this time.
> > >=20
> > > I guess the irq0 is not really used here...
> > > I tested the code on bpi-r4 and have traffic
> > >  rx+tx and no crash.
> > >  imho this field is not used on !shared_int
> > >  because other irq-handlers are used and
> > >  assigned in position above.
> >=20
> > agree. I have not reviewed the code in detail, but this is why
> > I think we can avoid reading it.
>=20
> i areee, but imho it should be a separate patch because these are 2
> different changes

I am fine to have it in a separate patch but I would prefer to have this pa=
tch
in the same series, I think it is more clear.

>=20
> > > It looks like the irq[0] is read before...there is a
> > >  message printed for mediatek frame engine
> > >  which uses index 0 and shows an irq 102 on
> > >  index way and 0 on named version...but the
> > >  102 in index way is not visible in /proc/interrupts.
> > > So imho this message is misleading.
> > >=20
> > > Intention for this patch is that irq 0 and 3 on
> > >  mt7988 (sdk) are reserved (0 is skipped on
> > > !shared_int and 3 never read) and should imho
> > >  not listed in devicetree. For further cleaner
> > >  devicetrees (with only needed irqs) and to
> > >  extend additional irqs for rss/lro imho irq
> > >  names make it better readable.
> >=20
> > Same here, if you are not listing them in the device tree, you can
> > remove them
> > in the driver too (and adjust the code to keep the backward
> > compatibility).
>=20
> afaik i have no SHARED_INT board (only mt7621, mt7628) so changing the
> index-logic will require testing on such boards too.

I think the change will not heavily impact SHARED_INT devices.

Regards,
Lorenzo

>=20
> i looked a bit into it and see mt7623 and mt7622 have 3 IRQs defined
> (!SHARED_INT) and i'm not 100% sure if the first is also skipped (as far =
as
> i understood code it should always be skipped).
>=20
> In the end i would change the irq-index part in separate patch once this =
is
> accepted to have clean changes and not mixing index with names (at least =
to
> allow a revert of second in case of regression).
>=20
> Am 2025-06-15 11:26, schrieb Daniel Golle:
> > In addition to Lorenzo's comment to reduce the array to the actually
> > used
> > IRQs, I think it would be nice to introduce precompiler macros for the
> > irq
> > array index, ie. once the array is reduce to size 2 it could be
> > something
> > like
> >=20
> > #define MTK_ETH_IRQ_SHARED 0
> > #define MTK_ETH_IRQ_TX 0
> > #define MTK_ETH_IRQ_RX 1
> > #define __MTK_ETH_IRQ_MAX MTK_ETH_IRQ_RX
> >=20
> > That would make all the IRQ code more readable than having to deal with
> > numerical values.
>=20
> makes sense, i will take this into the second patch.
>=20
> I hope you can agree my thoughts about not mixing these 2 parts :)
>=20
> regards Frank

--oVrPlAnEQ6cDmmnL
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCaE6cxwAKCRA6cBh0uS2t
rJJ0AQCF7N7EGGGmdCWiswfJnsbpS1FE5H/ZMgT6lUi1gJ/XqAD/YbauPgAy5ONu
BTFp/8Gr6q73o9av+Tuz8j8d7KQ6Mg4=
=tSdA
-----END PGP SIGNATURE-----

--oVrPlAnEQ6cDmmnL--


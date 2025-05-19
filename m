Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B45AC3ABDD
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 May 2025 19:57:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d5+GpqYlRnvy9j99rtBZRRfevga+7sc0qw0iNVxAEAA=; b=ir0ndazLEbT+dmc3R7OGAfvHg4
	NMY6HZ3arp8ChufziXyjmUlwcInz83Wh/6bel4IAB0+DIZ4x97q5jpd4r1LJ6d5c+apn8jNw/mxts
	Lj/g+x3yD6qcSs/fnfBPiAr+muhikA2gW+wNLqKhjmiQYxgmAZOocqhDP5r53bHc4yKDrJFB5bnWR
	aWX+u30fXTUoiQEnu/9W/zBsbdaLypNf9NzwESzYgUdHSNMya+9lJ6kvBn40jYZsW1cLRVi/CHbFm
	qNVWSkPdOggellYZBtVbHquC22LpXh7r7kwPAJsQt4Kj5t+iuLPo2f3i6Q9vd7ik2wtu7ZdQOdD4h
	sdr7Vfzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH6c7-0000000AL57-03tY;
	Mon, 19 May 2025 19:57:31 +0000
Received: from leonov.paulk.fr ([185.233.101.22])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH6WU-0000000AH0r-2NdI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 May 2025 19:51:44 +0000
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id 040151F0004F
	for <linux-arm-kernel@lists.infradead.org>; Mon, 19 May 2025 19:51:35 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id EDFC4AC2AF3; Mon, 19 May 2025 19:51:34 +0000 (UTC)
Received: from collins (unknown [192.168.1.1])
	by laika.paulk.fr (Postfix) with ESMTPSA id 9BE1CAC2AED;
	Mon, 19 May 2025 19:51:32 +0000 (UTC)
Date: Mon, 19 May 2025 21:51:30 +0200
From: Paul Kocialkowski <paulk@sys-base.io>
To: Andrew Lunn <andrew@lunn.ch>
Cc: netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Corentin Labbe <clabbe.montjoie@gmail.com>
Subject: Re: [PATCH] net: dwmac-sun8i: Use parsed internal PHY address
 instead of 1
Message-ID: <aCuLwuSliICh86SP@collins>
References: <20250519164936.4172658-1-paulk@sys-base.io>
 <d89565fc-e338-4a58-b547-99f5ae87b559@lunn.ch>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="VL1tc0gaoDiGu1D4"
Content-Disposition: inline
In-Reply-To: <d89565fc-e338-4a58-b547-99f5ae87b559@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250519_125142_763855_C8695CCE 
X-CRM114-Status: GOOD (  26.70  )
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


--VL1tc0gaoDiGu1D4
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

Thanks for your reply.

Le Mon 19 May 25, 21:25, Andrew Lunn a =C3=A9crit :
> On Mon, May 19, 2025 at 06:49:36PM +0200, Paul Kocialkowski wrote:
> > While the MDIO address of the internal PHY on Allwinner sun8i chips is
> > generally 1, of_mdio_parse_addr is used to cleanly parse the address
> > from the device-tree instead of hardcoding it.
> >=20
> > A commit reworking the code ditched the parsed value and hardcoded the
> > value 1 instead, which didn't really break anything but is more fragile
> > and not future-proof.
> >=20
> > Restore the initial behavior using the parsed address returned from the
> > helper.
> >=20
> > Fixes: 634db83b8265 ("net: stmmac: dwmac-sun8i: Handle integrated/exter=
nal MDIOs")
> > Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>
>=20
> Have you validated all .dts files using this binding? Any using
> anything other than 1? The problem with silly bugs like this is that
> there might be DT blobs with the value 42 which currently work, but
> will break as soon as this patch lands.

There's actually only two users of this (this code path for internal PHYs is
only used by two chips), which are platform dtsi files that have the address
already set to 1.

I have actually tested both with hardware and they work fine.

> Just stating in the commit message you have checked will help get the
> patch merged.

Do you think it's worth resending? I'd be fine with adding this when picking
up the patch:

The internal PHY is only found on the H3/H5 and V3s/V3/S3 chips which alrea=
dy
have the same address properly described in their platform device-tree and
were verified to work after this patch.

Cheers,

Paul

--=20
Paul Kocialkowski,

Independent contractor - sys-base - https://www.sys-base.io/
Free software developer - https://www.paulk.fr/

Expert in multimedia, graphics and embedded hardware support with Linux.

--VL1tc0gaoDiGu1D4
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEAbcMXZQMtj1fphLChP3B6o/ulQwFAmgri8IACgkQhP3B6o/u
lQxmxQ//buEL628Aci5cGp43IOq18Bzcz4AqwqiGwgLeInHX5XL/j7iKqm3Snxvw
EgF1CVwszdRfg7wt/C6HaIQiz1VX4HtfvwY11oQNR3gom2gTzIzLsEqYiC+ZbLAf
zx5h38nsM47Yml4gxXLfXp3YcKgdSZzUePvTgkoI4ScCFRUaUxW8fDUOILDEnR6D
vpjbp+qXjuA3lFWpREr2OztgOr/BxNMu/g2KVvuuSRtRXxPsesjls2mtXkimrmB+
2kUDz/s83L50iCLbnmVY0Ac6D6V4G3DIpXwI8EcssnzA9nQmnnZ3d6X4tBQU+3Eh
G1hZfgWzMg7p7F09cHOqpoflvAyuPeU9LAdHVjgP3oAcK5Zredbtha8mVMOz8JFF
JMF99vrBfcq0W0uUPvOu0bW9IoC/rSlilHURibBPNbzZRq318pk8i6CMozIv9CD6
a3+fH69JxziH+jYNSKtPl8uNLsZM0o4QLVCQZYiY8ep8ZgodDsjtb5uCGzULedR2
UMhu7eYKXJPU3777swOzakEcW6k0ZHRVgit2hA2xLLbCBm7fWNeaDhxQAIta0kPh
fZCFJQ1ChcNM+aJ0/GhkUDZvurax7mBW19qXemer587wPHSqjwKYsZldU+jhChXe
9tE6Njmq5MqsrBQe3olAmyePoVYKQrqqDLr9aCiXLTS6ewf+jUo=
=lDrU
-----END PGP SIGNATURE-----

--VL1tc0gaoDiGu1D4--


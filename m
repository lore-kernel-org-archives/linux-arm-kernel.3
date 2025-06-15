Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8DD1C71150
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Jun 2025 09:00:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZTnG4Ig1Nd/2TfAOi8lAZMY7d1c9sbHTJRnDj1+E5ro=; b=W6nivTTz1RYiHphtWB8BCaS7J9
	3oYvXEnhWq1Ea+t6kHxj1jg3RGY41RPVH4VjPwnCziPJ//AOc7LLXm8JpI8bkrvZVQh3jqGWJC1fo
	PFpRCGrjWLiik3j+w6Pdg3GPwf0G3adQidkm47uZ1mlWrdYCkfFxUkVBjAWhl3ONSOuqs5iZzQbjx
	FQ6dKLG2mZmFVW7Eora4GFPrxm6PuivmyOKfPtT5ZMHh8Mpdl9VgkybUZz202okuTddUe9WDWEmmJ
	TqSq/zz0Ead9NwWqwjDncWpBEsSQXCCBYIVrI7kFFsZ448rXScNItfdydkBU/gTUH5jHd7nC2O2rZ
	gtwmK3cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQjE7-00000002NyX-243s;
	Sun, 15 Jun 2025 09:00:31 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQjAR-00000002NhW-0qbZ;
	Sun, 15 Jun 2025 08:56:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 49995A5058D;
	Sun, 15 Jun 2025 08:56:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68726C4CEE3;
	Sun, 15 Jun 2025 08:56:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749977801;
	bh=G2CDdBbRrmYymKS4L5Z4OVIYHkFBoX38/5rv04VfCpU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=F2Fvdouvgn3r/weCireAnZIeyq5rji8be5bBBFkperf6upHh+O0b+IGoonxz7FHce
	 ul7aAmFeC58duwkGPg4Zt56d33Nj9vOBn/l7MmSbqON5qJKcBbfyGvSfvTUDPznL9h
	 PuPu8viqNCnlFwT+TKOze+nhoKlR56iNDl+01jNj6zLNpUdImswW9oSAHpGFnUhwma
	 5ipmT0I1M3kK5xQEk5gALXoRC+rl3tMtgpjqBxqf9jAdgMY67ZoX0jncrLW6HXPNz0
	 Xic0KTt5q1rcIcle+Ms53uoheWeFSB2kxlSbgNftSdIzXUx94HFXgKMh3ubVuWBZjc
	 xlVXWqQGdZNTQ==
Date: Sun, 15 Jun 2025 10:56:39 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: Frank Wunderlich <linux@fw-web.de>, Felix Fietkau <nbd@nbd.name>,
	Sean Wang <sean.wang@mediatek.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, daniel@makrotopia.org
Subject: Re: [net-next v1] net: ethernet: mtk_eth_soc: support named IRQs
Message-ID: <aE6Kx4JHyEmDY2mQ@lore-desk>
References: <20250613191813.61010-1-linux@fw-web.de>
 <aE0pav5c8Ji1Q7br@lore-rh-laptop>
 <E6B6CB88-4B47-455D-9554-DE9BFC209454@public-files.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="W2SN/lL0wh+oroZo"
Content-Disposition: inline
In-Reply-To: <E6B6CB88-4B47-455D-9554-DE9BFC209454@public-files.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250615_015643_368161_2DCBC26B 
X-CRM114-Status: GOOD (  36.51  )
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


--W2SN/lL0wh+oroZo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Jun 14, Frank Wunderlich wrote:
> Am 14. Juni 2025 09:48:58 MESZ schrieb Lorenzo Bianconi <lorenzo@kernel.o=
rg>:
> >> From: Frank Wunderlich <frank-w@public-files.de>
> >>=20
> >> Add named interrupts and keep index based fallback for exiting devicet=
rees.
> >>=20
> >> Currently only rx and tx IRQs are defined to be used with mt7988, but
> >> later extended with RSS/LRO support.
> >>=20
> >> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> >> ---
> >>  drivers/net/ethernet/mediatek/mtk_eth_soc.c | 24 +++++++++++++--------
> >>  1 file changed, 15 insertions(+), 9 deletions(-)
> >>=20
> >> diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net=
/ethernet/mediatek/mtk_eth_soc.c
> >> index b76d35069887..fcec5f95685e 100644
> >> --- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
> >> +++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
> >> @@ -5106,17 +5106,23 @@ static int mtk_probe(struct platform_device *p=
dev)
> >>  		}
> >>  	}
> >> =20
> >> -	for (i =3D 0; i < 3; i++) {
> >> -		if (MTK_HAS_CAPS(eth->soc->caps, MTK_SHARED_INT) && i > 0)
> >> -			eth->irq[i] =3D eth->irq[0];
> >> -		else
> >> -			eth->irq[i] =3D platform_get_irq(pdev, i);
> >> -		if (eth->irq[i] < 0) {
> >> -			dev_err(&pdev->dev, "no IRQ%d resource found\n", i);
> >> -			err =3D -ENXIO;
> >> -			goto err_wed_exit;
> >> +	eth->irq[1] =3D platform_get_irq_byname(pdev, "tx");
> >> +	eth->irq[2] =3D platform_get_irq_byname(pdev, "rx");
> >
> >Hi Frank,
> >
> >doing so you are not setting eth->irq[0] for MT7988 devices but it is ac=
tually
> >used in mtk_add_mac() even for non-MTK_SHARED_INT devices. I guess we ca=
n reduce
> >the eth->irq array size to 2 and start from 0 even for the MT7988 case.
> >What do you think?
>=20
> Hi Lorenzo,
>=20
> Thank you for reviewing my patch
>=20
> I had to leave flow compatible with this:
>=20
> <https://github.com/frank-w/BPI-Router-Linux/blob/bd7e1983b9f0a69cf47cc9b=
9631138910d6c1d72/drivers/net/ethernet/mediatek/mtk_eth_soc.c#L5176>

I guess the best would be to start from 0 even here (and wherever it is
necessary) and avoid reading current irq[0] since it is not actually used f=
or
!shared_int devices (e.g. MT7988).  Agree?

>=20
> Here the irqs are taken from index 1 and 2 for
>  registration (!shared_int else only 0). So i avoided changing the
>  index,but yes index 0 is unset at this time.
>=20
> I guess the irq0 is not really used here...
> I tested the code on bpi-r4 and have traffic
>  rx+tx and no crash.
>  imho this field is not used on !shared_int
>  because other irq-handlers are used and
>  assigned in position above.

agree. I have not reviewed the code in detail, but this is why
I think we can avoid reading it.

>=20
> It looks like the irq[0] is read before...there is a
>  message printed for mediatek frame engine
>  which uses index 0 and shows an irq 102 on
>  index way and 0 on named version...but the
>  102 in index way is not visible in /proc/interrupts.
> So imho this message is misleading.
>=20
> Intention for this patch is that irq 0 and 3 on
>  mt7988 (sdk) are reserved (0 is skipped on=20
> !shared_int and 3 never read) and should imho
>  not listed in devicetree. For further cleaner
>  devicetrees (with only needed irqs) and to
>  extend additional irqs for rss/lro imho irq
>  names make it better readable.

Same here, if you are not listing them in the device tree, you can remove t=
hem
in the driver too (and adjust the code to keep the backward compatibility).

Regards,
Lorenzo

>=20
> >Regards,
> >Lorenzo
> >
> >> +	if (eth->irq[1] < 0 || eth->irq[2] < 0) {
> >> +		for (i =3D 0; i < 3; i++) {
> >> +			if (MTK_HAS_CAPS(eth->soc->caps, MTK_SHARED_INT) && i > 0)
> >> +				eth->irq[i] =3D eth->irq[0];
> >> +			else
> >> +				eth->irq[i] =3D platform_get_irq(pdev, i);
> >> +
> >> +			if (eth->irq[i] < 0) {
> >> +				dev_err(&pdev->dev, "no IRQ%d resource found\n", i);
> >> +				err =3D -ENXIO;
> >> +				goto err_wed_exit;
> >> +			}
> >>  		}
> >>  	}
> >> +
> >>  	for (i =3D 0; i < ARRAY_SIZE(eth->clks); i++) {
> >>  		eth->clks[i] =3D devm_clk_get(eth->dev,
> >>  					    mtk_clks_source_name[i]);
> >> --=20
> >> 2.43.0
> >>=20
>=20
>=20
> regards Frank

--W2SN/lL0wh+oroZo
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCaE6KxgAKCRA6cBh0uS2t
rLW+AQDpfSGh+NZyjhOon4w6ir5aDO+JYLtW9pWA+9lJDd2t5wEA9rEPWrWqDis0
Vagdhcg9+7wUZX87d/XZ4CDvFcRaxgI=
=ITe8
-----END PGP SIGNATURE-----

--W2SN/lL0wh+oroZo--


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7471C5DF94
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Aug 2026 09:05:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KQZI73q5Exni8BU+8wGbesz3YhWlzsOsEvNqr/vzRXY=; b=PcepJECoQdr5ap2y2GZbY97Dfj
	o2ztMzIPb/jMQnkSn+GaDBW8bWNZl3IzuP66EhejaRPMbCb/tfZL/fN80VzrktPOc4AwvTrbXuDfP
	GRaAdpdJw8gRAepr0GTPsxfCHXwDivWSzS9+g1Gsucvt9yK3AyIpoX5mItfFdbzDn5I8ZqowBYgmS
	cV6QwbFiYBB0QjEUxRMtWaGUvDcUVrf4j1JzvkZY/eFmjRPUS2jP7fE6H0Lj1iQyOwEOuMhFkHvIs
	kYq78loc/qAuo1ar0R78i2kpLeoRhAERukOyIVeuVWak98Oli/MDmK7G3LQKwExU2Vk+J5EWOZSjd
	aMnh1zGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyQcL-0000000GGdt-1DG9;
	Mon, 24 Aug 2026 09:05:21 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyQcD-0000000GGVq-1nWt;
	Mon, 24 Aug 2026 09:05:14 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 1E09340479;
	Mon, 24 Aug 2026 09:05:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 764EB1F00ACA;
	Mon, 24 Aug 2026 09:05:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787562313;
	bh=KQZI73q5Exni8BU+8wGbesz3YhWlzsOsEvNqr/vzRXY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=bIqjI0sYAmyaFUTpNpQZyf7W23Y2EEH5UgfN8f3Nk3XmnegBLOEYH5SksLDdDq7DG
	 mL18wuC5U5foSBe68y/hyZduAH/P1GsKj/i8A2TbFUyMDj9HwcVssoN67+5wEJCPpb
	 tMIkpkO5kG4diHAbNYW2ymcYMBfe36t9bv6d04us0Lqcvd93yWfXs52qPactTFR8h2
	 HueIqjRPGpq/C58IsO389MW1qDaGtYNf1G/Odfg5oZk5tpQE31C8tT0p0jh3wQJlKJ
	 bojPPxkDhPD4H/cdZieqFYO3tiapgJVOW/FNjcnbBchfbHpOV34AbJcyPMsfhP9X7d
	 a0U3fwOI1XlLQ==
Date: Mon, 24 Aug 2026 11:05:10 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Rex Lu =?utf-8?B?KOebp+W7uumKmCk=?= <Rex.Lu@mediatek.com>
Cc: Jakub Kicinski <kuba@kernel.org>, Shiji Yang <yangshiji66@outlook.com>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	Felix Fietkau <nbd@nbd.name>, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>
Subject: Re: =?utf-8?B?5Zue6KaGOiBbUEFUQ0hdIG5ldA==?= =?utf-8?Q?=3A?=
 ethernet: mtk_wed: increase WED v2 WDMA RESV_BUFF to 0x80
Message-ID: <aowJRvfl2E0oYK3k@lore-desk>
References: <OSZPR01MB779537889255E2F606E47EABBCA52@OSZPR01MB7795.jpnprd01.prod.outlook.com>
 <20260821174121.326f3c49@kernel.org>
 <aoljUFw-rQTLDXg0@lore-qca>
 <aov3TTKBZ68yl50k@lore-desk>
 <SI2PR03MB55456905E3D6E84E2337F6ADF3A02@SI2PR03MB5545.apcprd03.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6n3KvZE76g7zMrBv"
Content-Disposition: inline
In-Reply-To: <SI2PR03MB55456905E3D6E84E2337F6ADF3A02@SI2PR03MB5545.apcprd03.prod.outlook.com>
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

--6n3KvZE76g7zMrBv
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Hi Lorenzo,
>=20
>     it is only for v2.  v3 changed the hw design and fixed it.  so this R=
ESV_BUFF register was removed =20

Hi Rex,

thx for pointing this out. In this case:

Acked-by: Lorenzo Bianconi <lorenzo@kernel.org>

>=20
> Thanks
> Rex Lu
> ________________________________________
> =E5=AF=84=E4=BB=B6=E8=80=85: Lorenzo Bianconi
> =E5=B7=B2=E5=82=B3=E9=80=81: =E6=98=9F=E6=9C=9F=E4=B8=80, 2026 =E5=B9=B4 =
8 =E6=9C=88 24 =E6=97=A5  =E4=B8=8B=E5=8D=88 03:48
> =E6=94=B6=E4=BB=B6=E8=80=85: Jakub Kicinski
> =E5=89=AF=E6=9C=AC: Shiji Yang; netdev@vger.kernel.org; Rex Lu (=E7=9B=A7=
=E5=BB=BA=E9=8A=98); Felix Fietkau; Andrew Lunn; David S. Miller; Eric Duma=
zet; Paolo Abeni; Matthias Brugger; AngeloGioacchino Del Regno; linux-kerne=
l@vger.kernel.org; linux-arm-kernel@lists.infradead.org; linux-mediatek@lis=
ts.infradead.org
> =E4=B8=BB=E6=97=A8: Re: [PATCH] net: ethernet: mtk_wed: increase WED v2 W=
DMA RESV_BUFF to 0x80
>=20
> > On Aug 21, Jakub Kicinski wrote:
> > > On Wed, 19 Aug 2026 21:07:07 +0800 Shiji Yang wrote:
> > > > Change WDMA RESV_BUFF from 0x40 to 0x80 to avoid CDM TX FIFO overfl=
ow.
> > > > Without this patch mt7986 and mt7981 may have WDMA TX hang issue. T=
his
> > > > patch was pulled from mtk-openwrt-feeds GPL open source project.
> > >
> > > Lorenzo, could you TAL? (incl. Simon's suggestion of the Fixes tag)
>=20
> I am wondering if this is necessary for v3 as well.
> @Rex any input on it?
>=20
> Regarding Fixes tag, I think cf26df8833cc is the right one.
>=20
> Regards,
> Lorenzo
>=20
> >
> > sure, I am AFK now, I will review it next week.
> >
> > Regards,
> > Lorenzo
>=20
>=20

--6n3KvZE76g7zMrBv
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCaowJRgAKCRA6cBh0uS2t
rOKOAQCrUxXhlq2/GicDy3cYv/kixByf4XwJGX6woI2YjRSeIAEAoPpH97TupPNm
u1YKwGOwPcA2t7USs374lgneUPvYPA8=
=XhAn
-----END PGP SIGNATURE-----

--6n3KvZE76g7zMrBv--


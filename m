Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C57FC44501
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 07:46:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0LP7Al6rRiZBE1h+Cea0iWGHs8CXC0LyVHJxEu9jR3U=; b=SSNqeNJVcvrK0GHPi3ScDzPhmf
	/Zbc6VFXduJEvffq6Y5rmcf4p/EHaCecc6o9GwwCmWsXkS8WkDqHtY0oBg0hJ382K6JqcJdk8yZT0
	BcSghGUkV5UHD9RAKh5llyLrNeZbhMBLA9SplolFao4v1xdAsJk5rcZPs52/N94lyIC8Qo6oO5loG
	XMcTB0sxfltKjqjTAGDV8zjYU1OjFksVyN0haMNV0InFuR2hdu8Zh30S6tPwCDiXv2FOF8aIOdtY3
	072pCy//ZQbr8pAzWsBySfg3fm3tg/tsRQL6p/CJDKJE4W8XUqjwhGHfXZy/7DSOp30kDAIV4Vr16
	S/yNm5FA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjuJv-0000000E4JV-2NGs;
	Wed, 15 Jul 2026 07:46:19 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjuJt-0000000E4J7-3HGr;
	Wed, 15 Jul 2026 07:46:18 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A7F1C600BB;
	Wed, 15 Jul 2026 07:46:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3B3F1F000E9;
	Wed, 15 Jul 2026 07:46:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784101576;
	bh=0LP7Al6rRiZBE1h+Cea0iWGHs8CXC0LyVHJxEu9jR3U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Y2/XD/XOX5eKeWY1GlQ1ajpPHkVXxIb9qN8e904DmQF333rz8PgtOHNSpJSTY1Cix
	 alrG2EVN5wCvxrBxUTo8+yl8DbExDTfuVxbKndPkyKvCCso0ogYzAeqEqI13btR+fH
	 FW1QrM0T9xUAC3ZYsNjiFuGNuJwvDrUxzmfL4Yy25t7NbbkLVx7uWlnadFDLItSEcN
	 jOLEPZc2WNULDwN3zJj5DKbhX5w3JEBs7EqktwSxcvyiJ06OpkmBip5jqi3HnlaT2Z
	 FkjGbEluVmzjm6uEiU2c2+904jgu9xiH9muhvl+Q6utmOjHsyrqtnAPmHR2DtWccVH
	 rEVmCXsu+URcQ==
Date: Wed, 15 Jul 2026 09:46:14 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: Bo.Jiao@mediatek.com, angelogioacchino.delregno@collabora.com,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-wireless@vger.kernel.org,
	matthias.bgg@gmail.com, nbd@nbd.name, rex.lu@mediatek.com,
	ryder.lee@mediatek.com, sean.wang@mediatek.com,
	shayne.chen@mediatek.com, sujuan.chen@mediatek.com
Subject: Re: [PATCH mt76 v5 16/16] wifi: mt76: mt7996: Add SW path for HW-RRO
 v3.1
Message-ID: <alc6xTe4uPIJHQy8@lore-desk>
References: <20250909-mt7996-rro-rework-v5-16-7d66f6eb7795@kernel.org>
 <20260715070001.1503928-1-amadeus@jmu.edu.cn>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Yv6XrpQKV6uL3VLP"
Content-Disposition: inline
In-Reply-To: <20260715070001.1503928-1-amadeus@jmu.edu.cn>
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

--Yv6XrpQKV6uL3VLP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Hi,

Hi Chukun,

>=20
> > +	if (dev->mt76.hwrro_mode =3D=3D MT76_HWRRO_V3_1) {
> > +		/* rxdmad_c */
> > +		mdev->q_rx[MT_RXQ_RRO_RXDMAD_C].flags =3D MT_WED_RRO_Q_RXDMAD_C;
>=20
> This introduces the RRO_Q_RXDMAD_C flag for the MT7992 chipset.
> However, the mt76_wed_dma_setup function lacks handling for
> MT76_WED_RRO_Q_RXDMAD_C, causing it to return -EINVAL:
>=20
> [   20.049167] mt7996e 0000:01:00.0: attaching wed device 0 version 3
> [   20.114412] platform 15010000.wed: MTK WED WO Firmware Version: ..
> [   20.123728] platform 15010000.wed: MTK WED WO Chip ID 00 Region 2
> [   20.965401] mt7996e 0000:01:00.0: probe with driver mt7996e failed wit=
h error -22
>=20
> Can you fix this?

IIRC WED is not supported for HW RRO3.1 at the moment, it is not just a mat=
ter of
fixing mt76_wed_dma_setup().

Regards,
Lorenzo

>=20
> Thanks,
> Chukun

--Yv6XrpQKV6uL3VLP
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCalc6xQAKCRA6cBh0uS2t
rC90AQDqX1Zbse6nv0qogKELf1Vmvsehu3y+Et4oi05aX+ax1gEApd5Ck5/LaW1y
ger643vFlirl8/9c4Ntal6wPZEuVGAc=
=WbzV
-----END PGP SIGNATURE-----

--Yv6XrpQKV6uL3VLP--


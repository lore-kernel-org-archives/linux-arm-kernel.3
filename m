Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 507A0C28B28
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Mar 2025 13:57:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wMDKkTfkJ0wKCc7/gnzhaycZkLn3ynm1HthZlvBwHJw=; b=IKrg9QkPhk8pgJugVWFO/ZAX25
	ilHtwpsA1+bxSxU3sDt6fHphWk/6txkBxESh+C+g5KGFrOJ/4Yx4mkNBBtBVpwtuDcyatjrPHOmvO
	wKnJCCEsfok3cPCKAb/k7gcqjhqzOPHbfqkgwizTOZSwj37y059YnXJX8fja4uuqmTlJ9giatI60W
	m7MoTTnoeoxEFhqbybjU8jmHoLSqIMr8sbSAl6sTg2GXhf7hZmivSsHFkrluIrv7dUbbOmqa9ZPKr
	FXGYeEpVAmLTMfmnUkdysBnIUbLS3UgUAF4L+mtdg9OYcFn71XmZV7fUao8tCFjA34TC9bXC7AHSo
	LsYK1y1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuXRM-0000000661Q-07pz;
	Tue, 18 Mar 2025 13:57:08 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuXNV-000000065OL-2p2j;
	Tue, 18 Mar 2025 13:53:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D3A895C57BA;
	Tue, 18 Mar 2025 13:50:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13131C4CEF1;
	Tue, 18 Mar 2025 13:53:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742305988;
	bh=JPDR0w/YOEw1Llnb5VuhVxqbXWyVgpVHr44qHu0QbSg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gwm1AgIt9fYXFQOGLZbDqLKc0zA7MQmSCDZfYZSv66mjMeVIOUmgQvR7ELKU9mjkT
	 PJNlhF6ICeEMz5rbCgzcfqtSW0MrlfTcFj2Z/hfLajg4NobWokz7XnNQekteaOaphS
	 n8WyWgoOnIvv4ikITjfp79lQcj5mLy4wYeDgSuRvG2o+guBNTg6DzAfsWdmSqoTOfY
	 motBfd9/kTwCRklxwgdJAy3XfZBBUtspRGo2qKW/VOiPoSltM/bCtO8HOF/q5jxSg3
	 dV6WbTurGrFtnDbuRaMKd6Pi4nUNHwGrYmSrqx7klo5UZjBTdFcdzOIvgK8bY8kKZ5
	 o7Hn5i+QayETg==
Date: Tue, 18 Mar 2025 14:53:06 +0100
From: "lorenzo@kernel.org" <lorenzo@kernel.org>
To: Shayne Chen =?utf-8?B?KOmZs+i7kuS4nik=?= <Shayne.Chen@mediatek.com>
Cc: Sean Wang <Sean.Wang@mediatek.com>, "nbd@nbd.name" <nbd@nbd.name>,
	Ryder Lee <Ryder.Lee@mediatek.com>,
	"johannes@sipsolutions.net" <johannes@sipsolutions.net>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	Bo Jiao =?utf-8?B?KOeEpuazoik=?= <Bo.Jiao@mediatek.com>,
	Chui-hao Chiu =?utf-8?B?KOmCseWegua1qSk=?= <Chui-hao.Chiu@mediatek.com>
Subject: Re: [PATCH 02/21] wifi: mt76: mt7996: Add
 mt7996_mcu_sta_mld_setup_tlv() and mt7996_mcu_sta_eht_mld_tlv()
Message-ID: <Z9l6woY4TYKe2olT@lore-desk>
References: <20250312-b4-mt7996-mlo-p2-v1-0-015b3d6fd928@kernel.org>
 <20250312-b4-mt7996-mlo-p2-v1-2-015b3d6fd928@kernel.org>
 <9efb42f0948b23cc127dc5c5d9e31791f80219ef.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="S+U/CWieHPnttq0l"
Content-Disposition: inline
In-Reply-To: <9efb42f0948b23cc127dc5c5d9e31791f80219ef.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_065309_768129_9564FA8B 
X-CRM114-Status: UNSURE (   8.66  )
X-CRM114-Notice: Please train this message.
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


--S+U/CWieHPnttq0l
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[...]
> > link_sta);
> > +
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 if (sta->mlo && conn_state =
!=3D CONN_STATE_DISCONNECT)
>=20
> The latter check seems already to be handled by:
> if (conn_state =3D=3D CONN_STATE_DISCONNECT)
>     goto out;

ack, I will fix it.

Regards,
Lorenzo

>=20
> > {
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 mt7=
996_mcu_sta_mld_setup_tlv(dev, skb, sta);
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 mt7=
996_mcu_sta_eht_mld_tlv(dev, skb, sta);
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 }
> > =A0=A0=A0=A0=A0=A0=A0 }
> >=20
> > =A0=A0=A0=A0=A0=A0=A0 ret =3D mt7996_mcu_add_group(dev, link_conf->vif,=
 sta);
> >=20
>=20

--S+U/CWieHPnttq0l
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCZ9l6wgAKCRA6cBh0uS2t
rPt9AQDihoHV63IGKsFzYLkd0lQwgYU6Bnkt/voMu9V/EK0mAAEArLSYGDDloAlr
f1S4dgIRZVeLcDjQ4bfrWoXfBjaBvQI=
=+rQ0
-----END PGP SIGNATURE-----

--S+U/CWieHPnttq0l--


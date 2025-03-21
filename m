Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AD81C36000
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Mar 2025 17:16:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wBK61erz7tutRU1j8De2EmAZOwtymRxnoHDg/ZzG21w=; b=qtJw9ufHWKqQWeMGJQ8xaDAFQV
	88iG1wtix6aCtSpEDR/IAldaSu5A3nLjDE/OcYwoL6FJXwe5FJsN3QxQ/BcVVKHDdlzlJPLOrMWYh
	vpslpGRgchAMG2IzTpuiDai2cnlwmN19TDXrwLq/RrsrTl4vvUFJYKSDcfZt6R1/X+97/0+DmoU1I
	MO4YUMK6WiWKMyAtpCOdvueJIM3SuSsk9mZrGS1qcf5t0xSfZzJ+oMv2+A47OvOCGCa5kTlc5G+4X
	JGyZ+X69/W2eG4V0TY/z5IXJX8Q52cqRIw8PhhT5InrIIPz1GZTRTL5LTQC7nlFBc4NUQqvIPKuAP
	H7mikSDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvfz2-0000000FfCx-2D8J;
	Fri, 21 Mar 2025 17:16:36 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvfxN-0000000Fezh-0Ksn;
	Fri, 21 Mar 2025 17:14:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1E6DC60008;
	Fri, 21 Mar 2025 17:14:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A35D6C4CEE3;
	Fri, 21 Mar 2025 17:14:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742577292;
	bh=OYwfK7dKSULJx6KrMxl2ffWMKsD8SMJMTT/g3BO9tfY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VdXmluXMuygbFnEz+mBkQweEMG0/+5z3ZNK7ee7N3wDkUz6QUXFZNh7p1dpwwCNSZ
	 WFSakXag6CGQeK/dlUeUe0f3uLZdSip/vLRkgJViOqSO4D3HjWWajf/lqGqhnPVqYa
	 f+WwQk+NrALh6g73mQcQu9DGQ6i5RJYpV3gKq0Y3x/GbXFFVabAwNpXYKNHYs0X4do
	 pYLnLLYRcBlQ8JaPNzbl4hnWY24gJJCQIylSE7I1RetgJA04EeL+JExencinU/7XGS
	 npCtEojE2tVW0mzZ4gCH1J60clp6Ccfnhk1nJjCDpHCqKFaJy5f3EIyt6KgeP8bBXL
	 dPMwSNepnQ2VQ==
Date: Fri, 21 Mar 2025 18:14:49 +0100
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Qasim Ijaz <qasdev00@gmail.com>, nbd@nbd.name, ryder.lee@mediatek.com,
	shayne.chen@mediatek.com, sean.wang@mediatek.com,
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
	chui-hao.chiu@mediatek.com, Bo.Jiao@mediatek.com,
	linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] wifi: mt76: mt7996: prevent uninit return in
 mt7996_mac_sta_add_links
Message-ID: <Z92eiVIFIUOFKXj_@lore-desk>
References: <20250320201914.48159-1-qasdev00@gmail.com>
 <46a714fb-8a14-4d24-a0a6-a22cc9d45768@stanley.mountain>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Im/5E5uh21z8mW9u"
Content-Disposition: inline
In-Reply-To: <46a714fb-8a14-4d24-a0a6-a22cc9d45768@stanley.mountain>
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


--Im/5E5uh21z8mW9u
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> On Thu, Mar 20, 2025 at 08:19:14PM +0000, Qasim Ijaz wrote:
> > If link_conf_dereference_protected() or mt7996_vif_link()=20
> > or link_sta_dereference_protected() fail the code jumps to
> > the error_unlink label and returns ret which is uninitialised.
> >=20
> > Fix this by setting err before jumping to error_unlink.
> >=20
> > Fixes: c7e4fc362443 ("wifi: mt76: mt7996: Update mt7996_mcu_add_sta to =
MLO support")
> > Fixes: dd82a9e02c05 ("wifi: mt76: mt7996: Rely on mt7996_sta_link in st=
a_add/sta_remove callbacks")
> > Signed-off-by: Qasim Ijaz <qasdev00@gmail.com>
> > ---
> >  drivers/net/wireless/mediatek/mt76/mt7996/main.c | 12 +++++++++---
> >  1 file changed, 9 insertions(+), 3 deletions(-)
> >=20
> > diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/main.c b/drivers=
/net/wireless/mediatek/mt76/mt7996/main.c
> > index 91c64e3a0860..78f7f1fc867e 100644
> > --- a/drivers/net/wireless/mediatek/mt76/mt7996/main.c
> > +++ b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
> > @@ -998,16 +998,22 @@ mt7996_mac_sta_add_links(struct mt7996_dev *dev, =
struct ieee80211_vif *vif,
> >  			continue;
>=20
> What about if the list is empty or we hit this continue on every link?

we will return 0 and I guess that's fine, agree?

Regards,
Lorenzo

>=20
> regards,
> dan carpenter
>=20
> > =20
> >  		link_conf =3D link_conf_dereference_protected(vif, link_id);
> > -		if (!link_conf)
> > +		if (!link_conf) {
> > +			err =3D -EINVAL;
> >  			goto error_unlink;
> > +		}
> > =20
> >  		link =3D mt7996_vif_link(dev, vif, link_id);
> > -		if (!link)
> > +		if (!link) {
> > +			err =3D -EINVAL;
> >  			goto error_unlink;
> > +		}
> > =20
> >  		link_sta =3D link_sta_dereference_protected(sta, link_id);
> > -		if (!link_sta)
> > +		if (!link_sta) {
> > +			err =3D -EINVAL
> >  			goto error_unlink;
> > +		}
> > =20
> >  		err =3D mt7996_mac_sta_init_link(dev, link_conf, link_sta, link,
> >  					       link_id);
> > --=20
> > 2.39.5
> >=20

--Im/5E5uh21z8mW9u
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCZ92eiQAKCRA6cBh0uS2t
rC0WAP9lvbXpg7ssaJUu7lkS/J6GAy9WpU7XvuJ3Oqe5fwivTwD7BcCwlQlkn39X
EIghtzuMU7YZQNxndt3LZeIeBD46Pwo=
=+24y
-----END PGP SIGNATURE-----

--Im/5E5uh21z8mW9u--


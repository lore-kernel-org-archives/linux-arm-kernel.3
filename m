Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 436BFD25B4E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Jan 2026 12:56:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hTiN/iPB7YC4G8N3oGDx91LxSB/gFMs0+raSrolrvNM=; b=iaPgdPnwtASRaqr49ZQD5jnWUQ
	yV2VWCmWJQ3fxkwmCgTyT9zrh7evHjPFgw11+OY7AJ/o4Vbob8q0hbgwFylMQ6P84inUEcIWpa/xd
	z8f9OynU+E7STtNGNJvNyeEc3b/XWnwNzalxWJy7h9nGdO8puhZDeTk1OrQmkErJEMXF0dQmaLSQE
	/XYkjV1InbGOAmrRJCwRjy3/QynSNufLGYFWxCPh5Brvv+vzNBZNmNOU09MArxLCShNn4Al1vE7Gm
	KWiW1xDmHo0StasFNgbqHy8y5+x2I3JQIZ4y2xjKaeXhOs+WqOt0DzriIVFo4bMPWn2O/zVfQ0wiN
	Jf4isrxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl55w-0000000G1Or-14pw;
	Wed, 28 Jan 2026 12:56:28 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl55u-0000000G1OS-3Xug;
	Wed, 28 Jan 2026 12:56:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7ACDF43A8E;
	Wed, 28 Jan 2026 12:56:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 052DAC4CEF1;
	Wed, 28 Jan 2026 12:56:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769604985;
	bh=H4wMz2eOAnUA22tTDE7YiBFrw9e46OADbwnLFMXxEO0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=szJg0Tu7aEAsIXuqZmjwT9iKyObWKOLeGtNRMZwoMxX0ZMLKle53P58TIhFIIKyRA
	 GhB3MV/D77gqyJDuPA0ls0gquLgQQbUFydd8gmEz6Q6wFR1GoFBl6yLeAkC0heiOII
	 yDms8tBugAcp/68u/zb6emvWYZfcCc0jHOlGd7fWe49PTAvbMDOBa2w0CXFJA+YXaN
	 960sh9sOPxpOxgfkvcIa032R7+iParcfgq2hnME75CBOJSY1TuN6A8jLZY55OL8BDz
	 YORkI6YiCSaDHooIsX23qX8IAAOgMxdPj52MYKAsyzJkB2a/Ye9iAJjTRZJCeBVT2n
	 KCKhtMQ+MyqcA==
Date: Wed, 28 Jan 2026 13:56:22 +0100
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: Ryder Lee <ryder.lee@mediatek.com>, Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-wireless@vger.kernel.org, Felix Fietkau <nbd@nbd.name>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH wireless-next v3] wifi: mac80211: Add eMLSR/eMLMR action
 frame parsing support
Message-ID: <aXoHdmjLKB-g54ie@lore-desk>
References: <20260128-mac80211-emlsr-v3-1-473b0c1d9cc4@kernel.org>
 <69d939aae0abecfdd011219e00076542c6e1abb1.camel@sipsolutions.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="1Zs3XZ6GtgRi+Qdz"
Content-Disposition: inline
In-Reply-To: <69d939aae0abecfdd011219e00076542c6e1abb1.camel@sipsolutions.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_045626_906755_AF5FD1FF 
X-CRM114-Status: GOOD (  16.85  )
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


--1Zs3XZ6GtgRi+Qdz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> I probably missed this the last time already:
>=20
> > +	if ((control & IEEE80211_EML_CTRL_EMLSR_MODE) ||
> > +	    (control & IEEE80211_EML_CTRL_EMLMR_MODE)) {
> > +		eml_params.link_bitmap =3D get_unaligned_le16(ptr);
> > +		if (eml_params.link_bitmap &&
>=20
> Surely 0 is an invalid bitmap? To disable it, you send a frame without
> IEEE80211_EML_CTRL_EMLSR_MODE or IEEE80211_EML_CTRL_EMLMR_MODE set, so I
> don't see how an empty bitmap would be valid?

ack, right. When we disable EMLSR IEEE80211_EML_CTRL_EMLSR_MODE so link_bit=
map
is not present. I will fix it in v4.

>=20
> > +		    !(eml_params.link_bitmap & sdata->vif.active_links))
>=20
> That's the wrong check, I think? It only checks that you have any
> overlap, but we need all bits to be valid, i.e. only
>=20
> 		(link_bitmap & active_links) =3D=3D link_bitmap
>=20
> is valid, no?

ack, I will fix it in v4.

>=20
> > +			return;
> > +	}
> > +
> > +	if (drv_set_eml_op_mode(sdata, &sta->sta, &eml_params))
> > +		return;
> > +
> > +	ieee80211_send_eml_op_mode_notif(sdata, mgmt, opt_len);
>=20
> IMHO it would make more sense to pass "ptr, opt_len" rather than "mgmt,
> opt_len", since that's just what gets copied and then the callee doesn't
> need to dig it out.

But I guess we need mgmt pointer to set even other fields (e.g. dst-addr,
dialog_token, ecc.).

Regards,
Lorenzo

>=20
> johannes

--1Zs3XZ6GtgRi+Qdz
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCaXoHdgAKCRA6cBh0uS2t
rIx9AQDvMwmRdK2HHZaNcr3E02VyLsA7SNysCnhg80MPCO/FTAD7BFs1g3oXdEyR
83lkQ9fbka8Lcr0RoF34SyfP3qzyoQk=
=gLbO
-----END PGP SIGNATURE-----

--1Zs3XZ6GtgRi+Qdz--


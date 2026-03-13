Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14AB6103E302
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 15:25:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QN552TZqrouE4+tCPS0mMoQgQIkZUkN7DTnt9deeNgM=; b=O6dnkHrB8VnQR1MJpW3sIy5lFh
	QOkjh3uhHuneWH6IJKebHBPteTPEitwqdJ5WR/Af2sOBCWaCX6JhoYL7NLxOhxsq3VoczOiDLquxE
	cYgzg9QUO/XvyYhOmgisCVlLTaBp5C1MaoKqn0joEpOn9te8gBOCHyI4Ur8IndrN/oDneQRu/SgDr
	bT2ini7okCBMncGCzYnjPuLPoYSW0r9R0Mqw9pm0KtChHRsjENKRijAsJWSVfEDtOSWmsayccuTGZ
	HNpirxgTI8CoPOfOE/zTSUgcYlJVfJ/nF7ifi2eoSxTqau6UQRhdU5+iPqyqMhTH6/iy8jgme+a7G
	bignwZqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w14Oa-00000000Y3b-3wBh;
	Fri, 13 Mar 2026 15:25:48 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w14OX-00000000Y2R-0ekq;
	Fri, 13 Mar 2026 15:25:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D811E6012B;
	Fri, 13 Mar 2026 15:25:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16977C19425;
	Fri, 13 Mar 2026 15:25:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773415542;
	bh=QN552TZqrouE4+tCPS0mMoQgQIkZUkN7DTnt9deeNgM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Fv+rSfGYabwP29m0niuzYlLhX9bOxuPNCmBYvMs+Ek1Dz3+5ljQy9LX0Cd2Dsx6As
	 Q1OaGBzr6TzuiTRXxmFZHiXnz79grkRBVLyFXAeOnsHZO8frG+9i3VYFaTTpICT2Ar
	 AtYKENf4NqVPykJDonzFGRhX2TD5cMBF1Og7tUv5RPKq9TOkyJetHCps0o3AYetZs0
	 pV3DyvRCNjiRvL/ExWJbryBjn2OU6+ZmqPcRPAW3FhRp+v8+tjbSB5Y0x+NmTQJqTR
	 cUMXJZdl5U+qAJDqjWPDxOtdUvurTS054bCgDfwMjYkRQWrMDwxY6RziW9bb2rkRad
	 vtUc20nJA39oQ==
Date: Fri, 13 Mar 2026 16:25:39 +0100
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Simon Horman <horms@kernel.org>
Cc: Jakub Kicinski <kuba@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [PATCH net-next] net: airoha: select QDMA block according
 LAN/WAN configuration
Message-ID: <abQsc6sPZ4d4tekm@lore-desk>
References: <20260310-airoha-qdma-lan-wan-mode-v1-1-64ec74dea872@kernel.org>
 <20260312172430.GA1267298@kernel.org>
 <abMsvOMnnuTdoG-9@lore-desk>
 <20260312172248.68742f98@kernel.org>
 <abP2dLNIw6zqkxL4@lore-desk>
 <20260313143018.GD461701@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="GSGfyO71opm8Yq0x"
Content-Disposition: inline
In-Reply-To: <20260313143018.GD461701@kernel.org>
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


--GSGfyO71opm8Yq0x
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> On Fri, Mar 13, 2026 at 12:35:16PM +0100, Lorenzo Bianconi wrote:
> > > On Thu, 12 Mar 2026 22:14:36 +0100 Lorenzo Bianconi wrote:
> > > > > Is this a bug fix?
> > > > > If so, perhaps it is for net with a fixes tag. =20
> > > >=20
> > > > I guess we do not need to target net tree since airoha_eth driver c=
urrently
> > > > supports just the LAN interface via the MT7530 DSA switch connected=
 to GDM1
> > > > and there are no WAN interfaces officially supported (PCS/external =
phy is not
> > > > merged mainline yet, it is only available in OpenWrt).
> > > >=20
> > > > >=20
> > > > > And at any rate, could you add some description of the before and=
 after
> > > > > behaviour? =20
> > > >=20
> > > > Theoretically, before this patch, GDM ports were equally distribute=
d between
> > > > QDMA0 and QDMA1 while this patch assigns LAN interfaces to QDMA0 an=
d WAN
> > > > interface to QDMA1. However, for the reason explained above, this c=
hange is
> > > > not currently visible to the user.
> > >=20
> > > Please update the commit message. And please try harder to explain=20
> > > the patches, this happens a lot with your submissions..
> >=20
> > ack, fine. Sorry for not beeing very clear about this (and other
> > patches), I will pay more attention in the future.
> > Do you think we should target net-next or net for this patch?
>=20
> Hi Lorenzo,
>=20
> As per your explanation above it seems to me that there is
> no user-visible change. And I assume that implies no bug manifests.
>=20
> If so, net-next sounds right to me.

ack, I will rework the commit log and repost to net-next.

Regards,
Lorenzo

--GSGfyO71opm8Yq0x
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCabQscwAKCRA6cBh0uS2t
rCrfAQCuZd7o/lQVJ85m7ozENElbP9fJ7xRXRRkm8z78rsSGewEAt4L9X5zunMFy
HP3y/+3pF9RbCTIWqcdw6i6Z4JT7yAA=
=y/aX
-----END PGP SIGNATURE-----

--GSGfyO71opm8Yq0x--


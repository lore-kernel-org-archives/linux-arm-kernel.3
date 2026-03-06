Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0F0EFCB613
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 15:13:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m3yX/TuFuLRmQIgjvocQq3GX0w3ISo7+U2TC5CEV9uw=; b=phip7RhDbzJEIBXIpDMURO6jES
	/L5VWVopB9C4J/6zRvE/sHlEv3/DLss6A6LTo256p2Ar5erT6RRNzW0hBsNRvBrdITkKFj5cBcxfc
	QXQLrEM5SSGSVBz2V/oOtqS214ZrwSi08IrKt6WhLapq9j08S7ak0lBwF5gyOWAsvkQXS6g5K+4iV
	YEo4rKS/pTwqr/0yAym9Aj8l2+aJM4q5mk76gSACgmxPiTRnsPV29+mscGPX3KQ55N/MhB1Rkno6C
	Q+0AbBOrmj9vAvh0Y8FPFAczMql/q1Sh2w1C9f8wJk+lSL2fkHXZxKfPdUGGvEjJzdfGXpW3aS9Eo
	GRAEnfWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyWri-0000000405R-40Iv;
	Fri, 06 Mar 2026 15:13:22 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyWrh-0000000404d-1uwj;
	Fri, 06 Mar 2026 15:13:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CF3434010B;
	Fri,  6 Mar 2026 15:13:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5EC2AC4CEF7;
	Fri,  6 Mar 2026 15:13:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772810000;
	bh=m3yX/TuFuLRmQIgjvocQq3GX0w3ISo7+U2TC5CEV9uw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jiZltdZ2gL1FgHjce7eq7UkgNdE3B4LBXJl8Qxe8+hOJHZUbs+T/gCtq822uK3SXp
	 xTDxNlZKmvRv+qxSeUHDc/A9eyWLuenTL/NO0qMG+kcC9WNWRn6FPehz7PW1C1PX62
	 psecRgeyD+CRzBQS0qvbuhAFLQ7u1/guxPnWe0QoV/5rHghKcPBk+lpSfZ3A9Y6Eqp
	 o5HlFzYcgk4FIRzFpMx1H61mJumZtuX0wmQ8iT6LcOqRhntlHBrpDPWejjuz16xD2n
	 ZcAiOJR35oELwpol4XNVFP880WiVW/ZxVYQF1Zvyb0IDwXXEUy21kxzA2BSl6Ojqm9
	 F0dC5Vcig7fVA==
Date: Fri, 6 Mar 2026 16:13:18 +0100
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Simon Horman <horms@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [PATCH net-next] net: airoha: Fix GDM2 loopback configuration
 for USB serdes
Message-ID: <aarvDt9TAn0MkUk8@lore-desk>
References: <20260228-airoha-fix-loopback-for-usb-serdes-v1-1-a94be0f897da@kernel.org>
 <20260303141624.GD71509@kernel.org>
 <aaftUXaSD0u5ZhO7@lore-desk>
 <20260306134226.GD461701@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="UOcuNL+C/U/0CMjH"
Content-Disposition: inline
In-Reply-To: <20260306134226.GD461701@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_071321_554416_24007FC3 
X-CRM114-Status: GOOD (  25.79  )
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


--UOcuNL+C/U/0CMjH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> On Wed, Mar 04, 2026 at 09:29:05AM +0100, Lorenzo Bianconi wrote:
> > > On Sat, Feb 28, 2026 at 01:20:33PM +0100, Lorenzo Bianconi wrote:
> > > > Flow Control source port mapping for USB serdes needs to be configu=
red
> > > > according to the GDM port nbd parameter. This is a preliminary patch
> > > > since nbd parameter is specific for the given port serdes and needs=
 to
> > > > be read from the DTS (in the current codebase is assigned staticall=
y).
> > > >=20
> > > > Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> > >=20
> > > Hi Lorenzo,
> > >=20
> > > Is this a fix? If so, should it have a fixes tag? And be targeted at =
net?
> > > Otherwise, perhaps drop the "Fix" from the subject.
> >=20
> > Hi Simon,
> >=20
> > This is a preliminary patch in order to completely fix the loopback
> > configuration for USB serdes but the point is we are not supporting
> > USB serdes upstream yet (there is only OpenWrt support available at
> > the moment). Do you think we should target net-next or net in this
> > case?
>=20
> If there is no bug in net - given the way net can be used with in-tree co=
de
> - then I would not tag this as a fix.

ack, fine.

Regards,
Lorenzo

>=20
> >=20
> > >=20
> > > Also, I think it would be worth explaining the situation
> > > before and after this patch.
>=20
> ...
>=20

--UOcuNL+C/U/0CMjH
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCaarvDgAKCRA6cBh0uS2t
rHS4AP93AGB12XIMmq1lglTzHPArpDsRGddVBWHb/RHvuaZHdAEA1mo58+20I1V4
7y5FGuGUMVWZVwOEUq8W6grMJD84VAc=
=ifxM
-----END PGP SIGNATURE-----

--UOcuNL+C/U/0CMjH--


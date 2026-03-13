Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12F55105F79C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 11:35:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6UUBpcPvPMAWRYqT1JRM1Mjfzyj2T0c0/GqtAU3kekg=; b=xHCF8RcLrqHgmuR3aEY2UDuTOl
	Usks1qma38KHMjC8g/TZA44PauZbWRyuDNvUv1wsqqCmmAfswXOKhgKd/BYzUj4EWjm1a3GoToutU
	brk1ngydt5UIaXwLFO5orEU+J2OG6fN0BrKPxItNQ5IihjNV55WCzlCEyBmfOuyYNxR42+pefzXw/
	7H47N1GB3nWy6iX52thA+s0e/LQ54KFY2qo7naNIjEEqp2mq0/wW2Jm8OqHtm0wd3EHfM4gL4fTYd
	mep+Goon91shftE8+NrUyw1P4MA02ft0R+AknQDyQRoTR9azckWcWglBJYFp95sMi3Zj08Y9FhLpq
	J7fHPifA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w10nf-000000002Y8-0lky;
	Fri, 13 Mar 2026 11:35:27 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w10nY-000000002X0-05aF;
	Fri, 13 Mar 2026 11:35:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 185B86183F;
	Fri, 13 Mar 2026 11:35:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E3B0C19421;
	Fri, 13 Mar 2026 11:35:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773401718;
	bh=6UUBpcPvPMAWRYqT1JRM1Mjfzyj2T0c0/GqtAU3kekg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=o6JNIl1MfZo9S0LPzeyR1gEJNG3JxCj/7FNZtIxtHQ/c0Pln/241h3TeIM0rcKeEs
	 Qr4JPB8imfy4+s02TXe0/iMzV3geD63eEQXQUEfugyZuoYSU5SrKxc3ipDRV9Nxc71
	 MDkaopq+JvPWDzU5AYb5qnTPPh0GVeaHBH7yuuKYMCxYAlngD9rqWw4yX5LpFLi8Yv
	 +tPO9Xbdl4yY0vV2p7YvMfYCu9bUM0P8bAk66FkSbwmjMHD/EJZicJhxmSvyPFEr9M
	 qbwGNS+rcKCnBwOwQPru4ZZT50YABI/4tYzzwCNCV7uuFuA0aMvyytt7/M7RyFgCtS
	 X0k8mFCwIO2vg==
Date: Fri, 13 Mar 2026 12:35:16 +0100
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Simon Horman <horms@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [PATCH net-next] net: airoha: select QDMA block according
 LAN/WAN configuration
Message-ID: <abP2dLNIw6zqkxL4@lore-desk>
References: <20260310-airoha-qdma-lan-wan-mode-v1-1-64ec74dea872@kernel.org>
 <20260312172430.GA1267298@kernel.org>
 <abMsvOMnnuTdoG-9@lore-desk>
 <20260312172248.68742f98@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="MeKNmnGIFj0GyFIk"
Content-Disposition: inline
In-Reply-To: <20260312172248.68742f98@kernel.org>
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


--MeKNmnGIFj0GyFIk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> On Thu, 12 Mar 2026 22:14:36 +0100 Lorenzo Bianconi wrote:
> > > Is this a bug fix?
> > > If so, perhaps it is for net with a fixes tag. =20
> >=20
> > I guess we do not need to target net tree since airoha_eth driver curre=
ntly
> > supports just the LAN interface via the MT7530 DSA switch connected to =
GDM1
> > and there are no WAN interfaces officially supported (PCS/external phy =
is not
> > merged mainline yet, it is only available in OpenWrt).
> >=20
> > >=20
> > > And at any rate, could you add some description of the before and aft=
er
> > > behaviour? =20
> >=20
> > Theoretically, before this patch, GDM ports were equally distributed be=
tween
> > QDMA0 and QDMA1 while this patch assigns LAN interfaces to QDMA0 and WAN
> > interface to QDMA1. However, for the reason explained above, this chang=
e is
> > not currently visible to the user.
>=20
> Please update the commit message. And please try harder to explain=20
> the patches, this happens a lot with your submissions..

ack, fine. Sorry for not beeing very clear about this (and other
patches), I will pay more attention in the future.
Do you think we should target net-next or net for this patch?

Regards,
Lorenzo

--MeKNmnGIFj0GyFIk
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCabP2dAAKCRA6cBh0uS2t
rE54AQC1mMaAyrYlZgokGGCJNLPOxAyImBcax4o0k8v1VJY9UwEA0dzu7dEQaV39
KehzNqgq9qHcA+qpmY3Zu8uwmj+WzAc=
=9Tm6
-----END PGP SIGNATURE-----

--MeKNmnGIFj0GyFIk--


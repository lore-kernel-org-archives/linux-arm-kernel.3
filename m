Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFE43CFA441
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Nov 2025 19:30:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IYTQgrhW8NGBlSI9quRx/wzzU3ncq1hVmrvfbHY6q04=; b=cRT4j9Vpyu+xwc+0WLpaBKfu5y
	4vRTtwdN8W64vEm0XBt2sX8BzOw1IlIyublJWfta7myblhZ6bLiUvB56jLjDttQWG+YQCWU8EmWit
	v5hDNaxdgRdy6Pu3AVmCS5zvdYZDFpbkeFOwkD+UctoohWk3Z9lAJQDHbzvn/DU2uQyw3CbG8WAI0
	7RHLz/PQ7E/0vD21p+SSTK+WUCyCBvhLo6EpHuo4KbKvwQhLgaRYvzbWo8dwNcUxBDlIEnqIGB1TP
	ZHg1ac0ExqF2NYK1bkBeNfGh1aWGYOxROKXiTv+V+dzZCcrg0Tf5PATeKQjDvzppLCkegMxqMtm1g
	xia8dU8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMAM4-00000007HWd-0fik;
	Thu, 20 Nov 2025 19:30:08 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMAM1-00000007HWD-3YhX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Nov 2025 19:30:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 343A842AEB;
	Thu, 20 Nov 2025 19:30:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B48DC4CEF1;
	Thu, 20 Nov 2025 19:30:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763667005;
	bh=Hd4/WtqVc9Aol+DR3lXzCUNvLHHImZ9L+r1mu/MYpWM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Qur+cduaDWSWk6Jndwjpnq/XHI8eZ2FIn8B3uuBN+w4xnfousqw5Gb5jCh0f/3ESk
	 bCc9f4OPZ9two9OTmqakiPerL7dfvzdB7W6lo/tWv/sCuFh5nyuTxV5gpF2pxyjYdd
	 tX980r8VOQv+ZW3ezX43BA/QxxmLsesbShozAdRhIz+693qkogguDJ023xhJ77koXJ
	 CtX9wTvilxOb9v5Md+7ic0nGOGbeP0G64hZCMsdpS5HXzxnhQxTVlmNlfg1dGDdLU9
	 7t/K7WdReWlhJ0SOL8n5L8xkDV3cuvkZZU6rZLosgXt2Pz7ltuyCipOmWVq8oKXAXM
	 T9k8Qoa6BmHiQ==
Date: Thu, 20 Nov 2025 19:29:59 +0000
From: Conor Dooley <conor@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Will Deacon <will@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] arm64, lib: make ARM64 select
 ARCH_HAS_CPU_CACHE_INVALIDATE_MEMREGION not GENERIC_CPU_CACHE_MAINTENANCE
Message-ID: <20251120-ruined-liability-9ecbf53affd1@spud>
References: <20251119-zippy-distinct-1e2a7da7b69b@spud>
 <aR9QRuUigBsxxelm@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="GWQewNjTVJ/ff2qP"
Content-Disposition: inline
In-Reply-To: <aR9QRuUigBsxxelm@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251120_113005_909547_7FE4A3E8 
X-CRM114-Status: GOOD (  19.38  )
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


--GWQewNjTVJ/ff2qP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 20, 2025 at 05:30:46PM +0000, Catalin Marinas wrote:
> On Wed, Nov 19, 2025 at 07:08:27PM +0000, Conor Dooley wrote:
> > index 09aec4a1e13f..ac223e627bc5 100644
> > --- a/lib/Kconfig
> > +++ b/lib/Kconfig
> > @@ -544,8 +544,9 @@ config ARCH_HAS_CPU_CACHE_INVALIDATE_MEMREGION
> >  	bool
> > =20
> >  config GENERIC_CPU_CACHE_MAINTENANCE
> > -	bool
> > -	select ARCH_HAS_CPU_CACHE_INVALIDATE_MEMREGION
> > +	def_bool y
> > +	depends on ARCH_HAS_CPU_CACHE_INVALIDATE_MEMREGION
> > +	depends on ARM64
>=20
> That's what we do if GENERIC_CPU_CACHE_MAINTENANCE depends on some arch
> code but that's not the case here. GENERIC_CPU_CACHE_MAINTENANCE is an
> alternative implementation that an arch can select if it does not
> provide its own. I find the current code without the above patch better.

Right, I am going to leave it as-is for now then. That's both you and I
(and presumably Jonathan) finding the current form more natural. Sorry
Randy!

>=20
> Maybe what gets confusing here is that the core code uses
> ARCH_HAS_CPU_CACHE_INVALIDATE_MEMREGION directly. A more involved fix
> would be something like:
>=20
> config CPU_CACHE_INVALIDATE_MEMREGION
> 	def_bool y
> 	depends on ARCH_HAS_CPU_CACHE_INVALIDATE_MEMREGION ||
> 		GENERIC_CPU_CACHE_MAINTENANCE
>=20
> and then go and change all the uses of
> ARCH_HAS_CPU_CACHE_INVALIDATE_MEMREGION.
>=20
> Up to you, the current code also works for me.
>=20
> --=20
> Catalin

--GWQewNjTVJ/ff2qP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaR9sNwAKCRB4tDGHoIJi
0iwAAP4sZZunWgmdbcP4niSKJ9g4EK7V7O3kaxN4Ej7sdvGNxAD6A8/QxGwRZLSe
nw9K+uD+keAFW9zH8cVgWCwaWpigQwA=
=PQDt
-----END PGP SIGNATURE-----

--GWQewNjTVJ/ff2qP--


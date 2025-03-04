Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 853A5C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 18:59:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T+feXRx4z2wUHPqJ+Ktl2nRz4X4S3o+EdNLy3mGdC4c=; b=AjScwqwMfVjgYaXJ3zpQFrpnUh
	qL/80fB4OpIVi4jwzy3zyfgICQP2uSUK7qsKeJ+95wcfkebXNIo7eTVFLvpze3vxqSkoku2gKe6j8
	sJvNaEfhX1AmXFBCozIpMHB6qdSkbAkF104EzZkdGObtk0pnshtc8DGYyNGGYBf9wKKNc1AEVFj0X
	lozYrQLIqQC2Oacx4ya1h7sWXwY6QJy38XpNrD0G91IIRg7B4SPq6vXysjtFAp7lZv/RMljfV+nfo
	+i9kNVRMEFVBA5RUXfDl03bOmDJezI4iPLkh9L5GK9eOOhL8cj3BPRR4I0Jv4rQiHwUcKgg3BmBRI
	viYwxzWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpXUX-00000005w2b-3cFl;
	Tue, 04 Mar 2025 18:59:45 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpUyP-00000005OWC-3mBN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 16:18:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 622665C5F06;
	Tue,  4 Mar 2025 16:16:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 000EFC4CEE5;
	Tue,  4 Mar 2025 16:18:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741105104;
	bh=XhtYLV02qtbsJ7+TV85fVvw/Qxk6F/Hh9cvsI0OjeqA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Dpvztu/URG1nraLrZK66ui8QddhoqBabtvjnTJ45RdC3oW/wrWuuoM/q1Pq+7B97d
	 P/NuEzIsAX7tegU4t6n9LSh1DViOr2G2n8vMDOSgZLfo9xPHm3FEdxAiVcwiZgdlHT
	 980Weqz3d1eL4c3JeVxQwTH1duzb3mH3zayiKFEmG6fz/4bX7Wl/NKPmoBw1riJuJc
	 66v4Fi94oEo8SEYU1/7RIBUzTSrcWYcFJUAMgdZno8OYZiAtJ1jhH7s1jJmQ0wlbSZ
	 e7gAIvKWkl2qP1FjQLsyCs9EAE5sgUjRBD95IA5CqGlgpZgnRJtezba1T4ObgSDQNB
	 FC62RSs+eu4bA==
Date: Tue, 4 Mar 2025 16:18:20 +0000
From: Mark Brown <broonie@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH 0/6] ASoC: samsung: GPIO descriptor conversion
Message-ID: <7da76b50-67fd-4273-83a3-300f734f7922@sirena.org.uk>
References: <20250303-samsung-codecs-v1-0-56a2299dd928@linaro.org>
 <174110255924.87345.17067818310965896666.b4-ty@kernel.org>
 <CAMRc=MfqNSZeQxBuEfM1nAo0F3NmEkyG-Les3dyxxuun=4XpuQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+ZFwNRSVfzGqExSp"
Content-Disposition: inline
In-Reply-To: <CAMRc=MfqNSZeQxBuEfM1nAo0F3NmEkyG-Les3dyxxuun=4XpuQ@mail.gmail.com>
X-Cookie: Do not disturb.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_081825_991731_8A1AC85C 
X-CRM114-Status: GOOD (  12.21  )
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


--+ZFwNRSVfzGqExSp
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 04, 2025 at 04:48:54PM +0100, Bartosz Golaszewski wrote:
> On Tue, Mar 4, 2025 at 4:36=E2=80=AFPM Mark Brown <broonie@kernel.org> wr=
ote:

> > [4/6] ASoC: samsung: speyside: Convert to GPIO descriptor
> >       commit: da9146c19b1774926148ff271c4a3dc8d7891b18

> I pointed out an issue with patch 4. :(

Oh, sorry - you didn't cut any context so I think it just flashed by
while paging through the entire message as I was scanning for responses.
One of the reasons for cutting uneeded context is it makes it easier to
spot the new content in your message.  It's an issue which can be easily
addressed incrementally in any case.

--+ZFwNRSVfzGqExSp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmfHJ8sACgkQJNaLcl1U
h9DH9gf+OVJU37vK8yaU3Mz+qk5DhrweZGTM0BSg//dtPms0VpXZBfsfYezs+Ok8
o06hRnLequ9qlMSYpbCZKTlIUD/VLWxtamnw+qQByA4UtUGoaCyaHafblWNii8Pt
szMAIGyzN+Px7YCqVUe1OH0kJNThyGmx6OAnOFfqTuDHzGXEFnJ5FUoxfEZlFcFp
GBB/Q7XZDebfnMpdzY54PCiNl+yHYJ1UwczZMqlEULygHg8/IGa++nsHXm+ciOJF
il1UQ/GHk5e9CXm2cdYp38Bj2UmN6Zs3hmkWuVE34+gTcAc2si3QW2tD8LhTeFrr
WLOhgUgjBEd1+bA99iuE7JdJjec3FQ==
=Qt2b
-----END PGP SIGNATURE-----

--+ZFwNRSVfzGqExSp--


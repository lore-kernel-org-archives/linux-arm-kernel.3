Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30F60CD3447
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 10 May 2026 01:22:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5yiWmD6uwkd0Zp5KqmRCJpP+WsbkEivGVu0xC8Lode4=; b=T81Diw3SwFWex1S9YVKg7cmd5F
	iO78Kn/XlXODBwDmzyAo50kXX7EHKdTVBHJBWFbxGd5rJFYVOXk0WKR+59MMArctBNV/1WlWUYshd
	fDvsO/sk+aN5sONyc0bKrLuDeFrvqZzGEGP9YluXpKCepXxm2Onyc70B/CTxJYZOixFsV//sSbwAW
	+gjv4B8MQZj2RKOHaeJeW2thrS0wVH8ep/3HS/EHx09EvM2y3p3SMVpFF59UifZOMwe5wV2CKlQmv
	enshUgYZi5U16+lQPwKmVVe3V1PfC5PWD21Sv0qmI7Z+P1mCLJfmA6u7KNUu3bF08QmreZMm15dF2
	tnzKWP8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLssM-00000009wVU-3S0f;
	Sun, 10 May 2026 01:22:34 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLssK-00000009wUs-2jOR
	for linux-arm-kernel@lists.infradead.org;
	Sun, 10 May 2026 01:22:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 92D0640418;
	Sun, 10 May 2026 01:22:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A433C2BCB2;
	Sun, 10 May 2026 01:22:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778376148;
	bh=5yiWmD6uwkd0Zp5KqmRCJpP+WsbkEivGVu0xC8Lode4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dyiAvKa+3clyz2dycK1F19O6idhR9DqpV1QSK3ArqnfpG1Ed1l5joUZ9QOpaajv/8
	 Ehf/AgeRHm0JPXnSjfl1q/6scQHAW7UxAcMRSQ6hbSb8t0LpPhPzwgDaXqyn7oIiVO
	 NeQBS+G+wisgmGtbKntRobGOseYQy/IaQ8RF4FFepYqGfFjhI9qqRIXKkdrvNIqvp/
	 YXB+PEMZ6HGFmQl78+06WhoZsXly01O+JFJw7tfRov1MnNrYenSeMkJNX1ccyAiKrX
	 PN7UG7KkqMm2Nx4/fOUlA5pGNPGkuxO5h4ywOtCENFDE5ALIrdw/cBJKSq/urUgBTH
	 tpXtAY2+V4VCA==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 36C481AC5896; Sun, 10 May 2026 02:22:26 +0100 (BST)
Date: Sun, 10 May 2026 10:22:26 +0900
From: Mark Brown <broonie@kernel.org>
To: Ethan Nelson-Moore <enelsonmoore@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-sound@vger.kernel.org,
	linux-omap@vger.kernel.org, Russell King <linux@armlinux.org.uk>,
	Peter Ujfalusi <peter.ujfalusi@gmail.com>,
	Jarkko Nikula <jarkko.nikula@bitmer.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: Re: [PATCH] sound: soc: ti: rx51: remove stale reference to
 machine_is_nokia_rx51()
Message-ID: <af_d0qItJAkYCZIb@sirena.co.uk>
References: <20260509012247.14990-1-enelsonmoore@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2sx2LxkdBo0wNpht"
Content-Disposition: inline
In-Reply-To: <20260509012247.14990-1-enelsonmoore@gmail.com>
X-Cookie: Truckers welcome.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260509_182232_714985_402F3674 
X-CRM114-Status: GOOD (  13.51  )
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


--2sx2LxkdBo0wNpht
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, May 08, 2026 at 06:22:46PM -0700, Ethan Nelson-Moore wrote:
> The rx51 driver relies on the machine_is_nokia_rx51() macro, which is
> always false since commit 9b7141d01a76 ("ARM: OMAP2+: Drop legacy board
> file for n900"). Its presence prevents the removal of boards no longer
> present in the kernel from arch/arm/tools/mach-types, because the
> machine_is_*() macros are generated from mach-types. Drop this unused
> code.

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

--2sx2LxkdBo0wNpht
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmn/3b8ACgkQJNaLcl1U
h9BAEQf+Igsk51i9EKXmUO6uebIWPChe+g8zimHsx5tF/PsngLjE4TY+G8VDxyjW
JEKZBMih4TBb8NHiAO0AOhWxxKm7YW8Hw7FJgI8tdGr4AW1Ccl5qETyj7dehSlNs
vYpdYqn8VViOxobs6kqXzLg0t/IdWTezZ1vnqG+ImD3FQ7LgM7qi2AWaQMASH2pt
UDZs725pKvL3ybWSJru9KhUIT7nkeCpIDBcTxzB57lDHT43F4aOq3RrYOJWtpc4a
jf4js/Ew5Huqb0dTw+n4OizjKC6BrjYmatpRfwiCLqhb/qZfDXQlS2KMMlYkuWVE
+5pPz/pbPbe9hvg7C+w8JHFzJV4Srg==
=lTn/
-----END PGP SIGNATURE-----

--2sx2LxkdBo0wNpht--


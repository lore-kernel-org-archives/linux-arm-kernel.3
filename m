Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 079B3C9832F
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 18 Jan 2026 15:17:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zbjFQf142QTPll+HlFBxgXdPxx+czptb9ll+AkDvzCI=; b=3GIk9YP3Rvb1tHzyrc21W7Hko6
	0r5CkrbbjkcHVTutacr6BS9bFW1r/CsalxymzSDmyAIjSaXc/n3gBOx7B3Jy18AGc1QzPMW9/QQ26
	0fJV0swT2Ydzx9kR0oBtqhInUAZ0gBcWryySDtNfPVLwZxFDTDd6xTl1slPBFsosde9KjzTwWeRAZ
	b6PH4v5Ge7OHDTW4/2cHbB1cTn0vDotJ+nzUn0yDLpgJwZ2xbw7tuxJ168jvVDnLS0ccWgyPa+fa6
	LI91xSkYuCQZY88WvxXITHKEcYMf4VEhwj3Nfz3FsRWfbtsmKH9jFf72SS56s5NnBIVOU0NK3B+IC
	7Gtea2qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhUWM-00000000Ksm-0YZI;
	Sun, 18 Jan 2026 15:16:54 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhUWK-00000000KsF-0dQK
	for linux-arm-kernel@lists.infradead.org;
	Sun, 18 Jan 2026 15:16:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 83A8540A71;
	Sun, 18 Jan 2026 15:16:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3AD0EC116D0;
	Sun, 18 Jan 2026 15:16:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768749410;
	bh=zbjFQf142QTPll+HlFBxgXdPxx+czptb9ll+AkDvzCI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AvzTtIl5xA9be4QGgqfj+yT7GFOYPBw5BtgESqPxxNbcwzrvWLC/qhdg4u+Y6BLJZ
	 zMF9SnrkRcMyPRuK0sTrX6u0zzxTE2bKrCllzsofmie9OYL0UkYDvF6rNoh811kWbw
	 b53CKhMMj7pxRvg38b63g5Dt/Ft12VE0osis/258rMIUnF7BvZbb/+WnDyhI5UHQ/R
	 anrb0HUDpIpA8da4rlDW7q9KM1Q8+i4FfTQYF9pVblCpFzT9T8kmh3Yacx/ZjDSkl4
	 IQlT9dljin/kV3PAUU7TZ14TFar1o0LvTtFeawufg1a2hMX/BLUsYcSZk/V3FcrsCH
	 ddaN+YFFAd8PA==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 0C11D1AC56A1; Mon, 19 Jan 2026 00:16:37 +0900 (JST)
Date: Sun, 18 Jan 2026 15:16:36 +0000
From: Mark Brown <broonie@kernel.org>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Shuah Khan <shuah@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] kselftest/arm64: Use syscall() macro over nolibc
 my_syscall()
Message-ID: <aWz5VDoGPiOrfsTN@sirena.co.uk>
References: <20260117-nolibc-mysyscall-arm64-v1-1-f70266a3db15@weissschuh.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="0YxDK5bhyWkoEAQo"
Content-Disposition: inline
In-Reply-To: <20260117-nolibc-mysyscall-arm64-v1-1-f70266a3db15@weissschuh.net>
X-Cookie: Think big.  Pollute the Mississippi.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260118_071652_206237_C05A5DFE 
X-CRM114-Status: GOOD (  12.79  )
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


--0YxDK5bhyWkoEAQo
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 17, 2026 at 01:10:51PM +0100, Thomas Wei=DFschuh wrote:
> The my_syscall*() macros are internal implementation details of nolibc.
> Nolibc also provides the regular syscall(2), which is also a macro
> and directly expands to the correct my_syscall().
>=20
> Use syscall() instead.
>=20
> As a side-effect this fixes some return value checks, as my_syscall()
> returns the raw value as set by the kernel and does not set errno.

Acked-by: Mark Brown <broonie@kernel.org>

Looking at the history the nolibc syscall() was added after we started
doing this in the arm64 selftests, it was 2023 while the tpidr2 test
is from 2022.

--0YxDK5bhyWkoEAQo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmls+VIACgkQJNaLcl1U
h9CfBAf/SeWySUzi4DWG7/eYfuh0UqSkZ9GVeLEaP6CQVEBfhdQfDA+rdN/1fkGH
zzTWSCk8oMSQv1BTNnkREcYZQOh2M6YB1gk0ZPHcTdIjOKwxhZ73fiLrOnMzAtgQ
SHydTuSJeNJh1hZhl9DNGZmYrvHSaOBDWi5vFKeKIdnOlhZQyCR6gfrsN7JkzJjO
9Lnt9Q+Yy38sgyJJeks0dtCqyXUPaCFCg6q0Ybpm6tHrv0g3LXGByArkFxEGGdgr
i+ODI3vne00/mmkukr1sCjxyfrWTGeD+lLFy5nnsYGzWpTrC4Pa7lCnIzNYUmOll
+mForHW+scEwEHpSM5nKFhdLjo+bog==
=8Im9
-----END PGP SIGNATURE-----

--0YxDK5bhyWkoEAQo--


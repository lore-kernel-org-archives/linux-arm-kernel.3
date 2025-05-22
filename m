Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08707C54ED0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 May 2025 01:45:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nQrRu32B0JAav7NQUY9wwzCb25Wff8sr+TTCsc03jnY=; b=29D76Mjq4UR4KE0dZ46oU4pJjw
	SmJdd5kEs4Okz5Dhs41Dm6jmK+Xd9Z+Y0xZm2jarsmqPDfo8jAmE96qxMnJuPfMvbh4gBFEZv3HJJ
	CVgEPSNbgplEy4vwLVyamDrRJpznHojgJ35QSlHNltucodHiZ/+Rv2ciTENV68bno+9PngZsjyZEE
	LIsF3nFBD4BwlF0UqQJoXvg0hJ6pvexKaI/S1NyrSuyGTrTxxN42nG+8hoEE7v85Y0pY/Cxm0ay9y
	ZYn98i7gm487QMzCChSptqHrJjfyctMS4FVq/Wds9+5R2iyvDCzTJyRyPd8+SJWaD+6IGxjPkuJeG
	BCeiI2gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHuze-0000000HD0G-10xh;
	Thu, 22 May 2025 01:45:10 +0000
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHuwh-0000000HCc6-2GiP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 May 2025 01:42:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1747878126;
	bh=nQrRu32B0JAav7NQUY9wwzCb25Wff8sr+TTCsc03jnY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=tU5rMh1WUdYLWG5zxhkkpHVoPv+wF6CP16tgf5/43ZRTcaEoF52fOc1ezC417DZ5Z
	 5tXr31pN9qbvFQ0wYdzN6sSRESWr/M4mz6cnBlJWl0d3+460CtibaNFJQvwxOtOa/T
	 lyr9vcTJZx5cln+NzT0vER3tkdmUKDmifv2qwscjoxigfjGu5FVs5tULFmRdi9sBnS
	 xLm/rdI8AlFJ66O7/e1bsZXAH+B+Cb63k+ln2EPrOX3YijEMqLVngg6yLNAMdsqP2T
	 W9VgT1TgGAfA7scDrXGhLPR3eFBI8FsBjy/x8XufFU+SW8zJ59IRU+7KPDHKqDVA3v
	 aU57JBzEoS1Og==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4b2rct09tHz4x8Z;
	Thu, 22 May 2025 11:42:05 +1000 (AEST)
Date: Thu, 22 May 2025 11:42:05 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Krzysztof Kozlowski <krzk@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>, ARM
 <linux-arm-kernel@lists.infradead.org>
Subject: Re: linux-next: duplicate patches in the samsung-krzk tree
Message-ID: <20250522114205.35511096@canb.auug.org.au>
In-Reply-To: <20250522113227.7593f675@canb.auug.org.au>
References: <20250522113227.7593f675@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/FlZnicdvLD.AwBI7bx/j1lu";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250521_184207_728166_267F0D79 
X-CRM114-Status: GOOD (  10.00  )
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

--Sig_/FlZnicdvLD.AwBI7bx/j1lu
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

[cc arm-soc]

On Thu, 22 May 2025 11:32:27 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>=20
> The following commits are also in the arm-soc tree as different commits
> (but the same patches):
>=20
>   286e6e8787df ("ARM: s3c: stop including gpio.h")
>   e0d7c81b15e8 ("ARM: dts: samsung: sp5v210-aries: Align wifi node name w=
ith bindings")
>   e83a135a2b2f ("arm64: defconfig: enable ACPM protocol and Exynos mailbo=
x")

--=20
Cheers,
Stephen Rothwell

--Sig_/FlZnicdvLD.AwBI7bx/j1lu
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmgugO0ACgkQAVBC80lX
0GxIRQf/cTupFaYMhEfRpXqGhnpDVIV3Ytt7xKAOZ5623fZ14M4abbUj7tSrtwip
fQIv04ZmQsk8bhR3J7xgheiVSyAOPkkm/Fw/G0SSKEQNJgBHzPhK/xtjAsFqfTDk
CChdSsvUyEI/szITaAZSO53wgA76Nr9iVLjkbmMWWsUF/ZHoWu1c2OmqhCZEIH0V
TQ9BHe3Xxj+mrW3y81C3L3zZ/6EhYP7t92X5ELXJtmG4/1BaqZuJnuBojp5lQ1KR
3joIXjqHwV7xaQfhz5h4LKl29XURFSidFISHvGywRGW5WblcOpi+ADG2pdkFVc8p
RIDy0tJh0F2ESqxO3X7NuJezjYqNzg==
=7KXb
-----END PGP SIGNATURE-----

--Sig_/FlZnicdvLD.AwBI7bx/j1lu--


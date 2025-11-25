Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86570D0E6EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Nov 2025 14:16:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RBCGfEbl1HIFGG3+FoiwYJRUyMgK98DWtC50atpXzIQ=; b=J4N4qU5eAAlNrPP9bsZHu8E/gR
	hXc6lkLMPTBgY/Y+FDDkZBWHMSsYnYpuPHyB75hwHItcQpvY87dQx/pQX/m5ZayR8Ffpo9aV8ksMf
	a7sCcC0MMwnQQs9LAJhKuxpPlmK3LrR7ft9diXN4GNsSChBPsynK/+3yz5eMd8Ki6/eux0ZFbkpQ9
	n5eWiZH2pCl4ftpkgXVqN2zsC3c+1cZBan6dj68A8m2zWPT0lpVqUTGif0bH5TYgPp44tnp/7+/Yw
	NUZA+Lbf32v9zFHfcHSONNG92nNnwr0Nkg15FT8yW0GNYNkEx5DRY/DsFsgNjp8655HP437dVBhPQ
	3jl5wwgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNtqS-0000000DPpH-2Qvj;
	Tue, 25 Nov 2025 14:16:40 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNtqR-0000000DPp7-1CL1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Nov 2025 14:16:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 714D560159;
	Tue, 25 Nov 2025 14:16:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08AF2C4CEF1;
	Tue, 25 Nov 2025 14:16:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764080198;
	bh=j3nfGadwUDjMgTdXCatHDQbxvZr231jjSff4Bmlfkh0=;
	h=Date:From:To:Cc:Subject:From;
	b=sBP4fdOMkH7WwZqDbZ8ETIqRyvSpTJjZ5lZSp8MYTiLhb+JOmGfklgIkOBNHZ+b9s
	 /oe57QWnlcgRj36YKsBvcL6/LPA4DlELXQSHetbOPCZgU6EB4izdADkguiDl/dS72a
	 7kI78H+hP+Pvt8YDg1lMFJCuqbrr8MMLkLC1Q8ZHQwxXUUrBVVf3sf8i5Efc8t8NYJ
	 WX0OGputg0ScCLnDUOic3UvE20x5BFbPToHCXQFxQSj4eQsrgg8lbQ8HcIVYX5LpB6
	 f2di8AyLRGhJMEhfQ9Gv05qb1/g0EM81VYwBUZQvhlOCP7WnS604r5oX9FLyveljGo
	 yO3m5SyX1dMRQ==
Received: by wens.tw (Postfix, from userid 1000)
	id 99C835FD53; Tue, 25 Nov 2025 22:16:35 +0800 (CST)
Date: Tue, 25 Nov 2025 22:16:35 +0800
From: Chen-Yu Tsai <wens@kernel.org>
To: soc@kernel.org
Cc: Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>, linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Allwinner fixes for 6.18
Message-ID: <aSW6QyCvqM_DChbG@wens.tw>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="DJKq9zpsa0m/tR0v"
Content-Disposition: inline
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


--DJKq9zpsa0m/tR0v
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df56787:

  Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git sunxi-fixes-for-6.18

for you to fetch changes up to 9f393d8e757f79060baf4b2e703bd6b2d0d8d323:

  riscv: dts: allwinner: d1: fix vlenb property (2025-11-22 09:19:42 +0800)

----------------------------------------------------------------
Allwinner fixes for 6.18

Just one fix to correct the "thead,vlenb" property for the RISC-V based
D1 SoC family.

----------------------------------------------------------------
Sergey Matyukevich (1):
      riscv: dts: allwinner: d1: fix vlenb property

 arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--DJKq9zpsa0m/tR0v
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE2nN1m/hhnkhOWjtHOJpUIZwPJDAFAmklukMACgkQOJpUIZwP
JDCkOA//TvgyXYI40m3/T4+wHSjBhxtFFCnQ9h+dF4bcE64TvWSwcOyCHO1k8zaM
KJOYYXm3wXaNDvWN1H8/tY7hJHAPpsfTRzgEFX88rlr6/9c2AtGZnm37rtnGQ3NU
Z9fziFumZrzUWLvOKD55I+rZKS9N1xA4Qq4seilfkuuiwY4xivgiDEA4HeimK5MC
mdwICWEDgxWBNW8Xcw2kbuHW8ScpDhVkahreqkhGArYJHOavqGQtUbV1pvN/uYlo
89/lVKX7KPv6a8y335R0He6KqcPY+oPSRW+0nABT9NEot6Q++tUSc4aUBV1tErej
na/AF9DDP/UtZZBIxOVnwD2pYBqfvsOhPbG0dyt0r0c5sYjsZN+9D5iuWa5GKovC
+jh9lx+5xDaPrqc4v0jXWY97wKHAvU3Sxd5J7zoYcAcQTuxMUZFyDGovtSdUqfQC
96M3lFGx/ue7Ky4VOqELLsF+NNyBbDzSc7XITXmq6rXh8c0Sh/C1vgTozjCsNQfb
9ayXF84Xax1a8Fml5lyEYIXeHTu26CzlmbE/0vL2FuQXb8T31hsp6v0SRQmNj4XT
OW1h1tJ5tN98ASGJ8GOwPcef8vsJr4AHGCYa5qbb7xlaHwsDHhNCKVRepOn6a2+f
FKjQgdy8zWKny4DewnGGTQJ3mOLmnYWjWNpWB1RxEgoK9xLK/+g=
=jqdm
-----END PGP SIGNATURE-----

--DJKq9zpsa0m/tR0v--


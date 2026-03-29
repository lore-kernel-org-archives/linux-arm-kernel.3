Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24DE8F3D60A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 29 Mar 2026 13:48:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3bcaZFqGfKQTnEU0Pqs5njQvxaJmzn2jZeb0eVSmtAc=; b=ChreBvPQ9QGdGu2xqe7mFOCG5H
	5DosR4EXAorxpA9IS+QE6+4jHYcnPwvdmZ6sGsIsxFEq9sZhe+7N1I1B1OzyvRwzJGkKGB6hbGJb0
	SlEWTsh4IdpzlO/i1M/Hm1fcBSPLyFyBocWkgK+TiIAOAze62yzfCsWatDPTJKTv1qXGGHWMOIuUG
	sbmX8rUfvHEcpBgGxK5DGroRZgGJEj0Q4JMrz8tpyKKFqpn+DSO8Ym7YidnW3UMGB6taouaQnW+nA
	2hHRjbs0PMbDgHeLOYIxoiW/cc9zKlnMcSLEdwyhHdX+6KtB78Ln51nTE9D07w53SPCCodZvvZ1T5
	JVKBMSOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6qUs-00000009zg0-3D2l;
	Sun, 29 Mar 2026 13:48:10 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6qUq-00000009zfW-1bC4
	for linux-arm-kernel@lists.infradead.org;
	Sun, 29 Mar 2026 13:48:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8D78E4397E;
	Sun, 29 Mar 2026 13:48:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22383C116C6;
	Sun, 29 Mar 2026 13:48:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774792087;
	bh=sb4o1N/oL6lvVOe9YJyVsD4ePMQZTxAlbb8658xG5ak=;
	h=Date:From:To:Cc:Subject:From;
	b=BalvOawFCDfS1k/olYA5LjntSA2mVzrhQiAAVnrBBKF8YAofy4eCjHnuw9OzNZSQ5
	 STR4A5Qqa17tqsaZOMQehEHeNUeUJ52bRwwlUnJVmSTTf2OrxxHk6B2P++OA1m83NG
	 Md/pMzhTP3Rv2BL4LO49zj2S4G+0cJC6VqbOrSjz0jYRECEYWIsUY49W92dtgiHjAc
	 aZDOFpdSouqMax/ddbNIEgwkpLGtD5m/Vr0m2RzzwFGaY4EJ/l07Mky7NBMi/vfwcO
	 vaiOQZSPA53eYHg6lo0PuHEJZbX3lLmkILncoim8GGuvMsENcThl7yeMC9Di0iJrMc
	 g96oHiZZl4KIA==
Date: Sun, 29 Mar 2026 21:48:03 +0800
From: Chen-Yu Tsai <wens@kernel.org>
To: soc@kernel.org
Cc: Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>, linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Allwinner Device Tree Changes for 7.1 - Part 1
Message-ID: <acktk8WGYYRGjTow@home.wens.tw>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="uH9ejCki1eKkeZPL"
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260329_064808_456478_860E9B7C 
X-CRM114-Status: GOOD (  10.71  )
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


--uH9ejCki1eKkeZPL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:

  Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git tags/sunxi-dt-for-7.1

for you to fetch changes up to b912e48bee355b6b1faf86efc4a23191324ffecb:

  arm64: dts: allwinner: h6: Add TaiqiCat (TQC) A01 support (2026-03-14 15:27:04 +0800)

There are more patches to come, once they have been in -next for a few
days.

----------------------------------------------------------------
Allwinner device tree changes for 7.1 - part 1

Only minor additions this cycle.

Allwinner A523 SoC family had LED controller enabled.

Avaota A1 board had SPI NAND enabled.

New board added:
- TaiqiCat (TQC) A01

----------------------------------------------------------------
Chen-Yu Tsai (5):
      dt-bindings: leds: sun50i-a100: Add compatible for Allwinner A523 SoC
      arm64: dts: allwinner: sun55i-a523: Add LED controller
      arm64: dts: allwinner: sun55i-t527: avaota-a1: Enable LEDs
      arm64: dts: allwinner: sun55i-a523: Add pinmux for spi0 on PJ pins
      arm64: dts: allwinner: sun55i-t527: avaota-a1: Add SPI NAND

Jun Yan (3):
      dt-bindings: vendor-prefixes: Add Beijing Ultrapower Software Co., Ltd.
      dt-bindings: arm: sunxi: Add TaiqiCat (TQC) A01
      arm64: dts: allwinner: h6: Add TaiqiCat (TQC) A01 support

 Documentation/devicetree/bindings/arm/sunxi.yaml   |   5 +
 .../bindings/leds/allwinner,sun50i-a100-ledc.yaml  |   1 +
 .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
 arch/arm64/boot/dts/allwinner/Makefile             |   1 +
 .../boot/dts/allwinner/sun50i-h6-taiqicat-a01.dts  | 361 +++++++++++++++++++++
 arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi     |  57 ++++
 .../boot/dts/allwinner/sun55i-t527-avaota-a1.dts   |  56 ++++
 7 files changed, 483 insertions(+)
 create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-h6-taiqicat-a01.dts

--uH9ejCki1eKkeZPL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE2nN1m/hhnkhOWjtHOJpUIZwPJDAFAmnJLZMACgkQOJpUIZwP
JDB2bxAAjRQI9v1+5u/ytTJ1uZaJWZAmDNGTsbBtUKhjYdSAHlgUwMG/u8559uin
k877mIYYPiIz5TFyLCrnwDuKdOboTPVh1OhV4nZLAhiMk2KamWONxTNMmB8XO+HL
y1cBxGCg18swx+62eFkRLilAl6f3GQXftunsHRNM//fSwWk378Hcvf17Ieg5whEN
/3TS69jxzazAm1riNYRfLOPQ/NL7RUFmPF+jiSmTnJrwYRv5+ROjEHGJF2OMA0Qz
tNIxKzFtCJsvr8mwv/3XxSk7aiyX0fUywx3NiH99yokULBlMBOhamQqwb2cB+5p3
yFCkZ7/1xNf8/bk8FllQq5VKVuW7Ak0vl4JvZB+GTD1VWVgQ4yRwZrLQFf7mWe/p
bWB9YYvasIBAbSFiZwgK9OAjW4qVl2Yo7YXXKhOVfm6h1okgOd3QM3Axb5D1UI1Q
ggrhT1iI6h6JGyBCAayrtQg7Usd+Hl0ivxu8jOu7DCPSrwUzAcKeJGc1iPG2XhvS
GbIYCXN+Hz74+TLGsBJDY2b8eb+6/ANfa7KlNF6D9yWWytya3J/2rNkeeZvwUycx
11Vl8JWe2QAoXdEP7DerDp7YeLApr67KGUv8a1DRyzMW1qvHdLQkCrk6d2egqn/8
7RuCyTNOIIZd3R1GW4iVDxI3bCrZxkPMMz7RrHES87wVRM+8/SU=
=SRJh
-----END PGP SIGNATURE-----

--uH9ejCki1eKkeZPL--


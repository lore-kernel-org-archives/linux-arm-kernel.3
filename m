Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E11F8E77188
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jan 2025 16:05:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/aepM7ItkixZhv0auLLJnUouzgwxkrbNtCq01JUViuk=; b=ZDDGgkw6oyppIDrM9OHhyIVxAT
	IwdQEqd73/jJvdpTDETj3TThDt2GsW1r4Q3KunvSFD4vmxmrRRcR2onBZEbsPmnkTEXiQnYl+6UGW
	If4y5rNEnJ7GXsAcCMmodB+806qYOWG0rZcfUg5rYWWYoFKoR4EzQWfM4tVYhSyLsOTH8NPYiawtH
	O4lABUhAMwV26Zet2PRfJgYmFkn9TUGzs0mH0g8x8AiqcvBj38O/v9sybN3ZMInn6oGpHDr3HNJ8p
	4tv2k6+4ssbsBzp9W/TLpnYz0BIVKN4nu2mkXBophtntTIhiFyTFRmnGRQxqmKMWWJEZ7RrVqMp7s
	cbwagXyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVYYE-0000000965z-3Cj8;
	Wed, 08 Jan 2025 16:04:58 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVYWz-000000095uj-0o6T
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jan 2025 16:03:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 50AF5A41866;
	Wed,  8 Jan 2025 16:01:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 758A8C4CEDD;
	Wed,  8 Jan 2025 16:03:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736352219;
	bh=1tJnGOLAipaBuviy3zQGAqJhc5YWyT3t1d2UXy5vXFo=;
	h=Date:From:To:Cc:Subject:From;
	b=EejpkU6g1xnTdaaT/jkSvQncqm/R/s57/mFJIwswiw9USbYU1zWcwdKqH+NhRN1f3
	 QvuZvFCXbG8VXBv32qgcZkz7wWg5KzL3LHEHn0AjI5AvyJblzmm/tldEBN5KrQhre/
	 wkRvFEeiUEhJAwkItKOSEvTzERD8OUxtGnImznrmjaGzgrZCHQ9n/v/CanNwxTXPOF
	 54XC4z+cthPcPxQbEyZIltEvEY3p96OzYkMWPaxmhZOHRWHM8lsknKtrKZVI0k7GNz
	 Cwy+HXlC5JecwlO252061axBzDvj4i3n7tWj6L39dGelJNPymdNkvDq+Wg+GAm1u1I
	 LlnruKdjzNviw==
Received: by wens.tw (Postfix, from userid 1000)
	id 7CC435FA10; Thu,  9 Jan 2025 00:03:36 +0800 (CST)
Date: Thu, 9 Jan 2025 00:03:36 +0800
From: Chen-Yu Tsai <wens@kernel.org>
To: soc@kernel.org
Cc: Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>, linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Allwinner device tree changes for 6.14
Message-ID: <Z36h2FwUxro8rouO@wens.tw>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="XIu6UgM/IfLWEBFY"
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_080341_358363_9AF28689 
X-CRM114-Status: GOOD (  13.18  )
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


--XIu6UgM/IfLWEBFY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following changes since commit 40384c840ea1944d7c5a392e8975ed088ecf0b37:

  Linux 6.13-rc1 (2024-12-01 14:28:56 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git tags/sunxi-dt-for-6.14

for you to fetch changes up to 8715c91a836502929c637c76a26335ede8818acf:

  arm64: dts: allwinner: a64: explicitly assign clock parent for TCON0 (2025-01-04 20:16:51 +0800)

----------------------------------------------------------------
Allwinner Device Tree changes for 6.14

- Add support for DMA engine and audio codec on F1C100s
  and enable audio codec on Lichee Pi Nano
- Add syscon and SRAM nodes for A100
- Enable CPU DVFS for Tanix TX1
- Explicitly configure TCON0 pixel clock parent according to display
  output used

This includes one commit shared with the clock tree

    dt-bindings: clock: sunxi: Export PLL_VIDEO_2X and PLL_MIPI

which adds the macros for the TCON0 pixel clock parents.

----------------------------------------------------------------
Andre Przywara (1):
      arm64: dts: allwinner: h313: enable DVFS for Tanix TX1

Chen-Yu Tsai (1):
      Merge branch 'sunxi/shared-clk-ids-for-6.14' into sunxi/dt-for-6.14

Cody Eksal (2):
      dt-bindings: sram: sunxi-sram: Add A100 compatible
      arm64: dts: allwinner: a100: Add syscon nodes

Mesih Kilinc (3):
      ARM: dts: suniv: f1c100s: Add support for DMA
      ARM: dts: suniv: f1c100s: Add support for Audio Codec
      ARM: dts: suniv: f1c100s: Activate Audio Codec for Lichee Pi Nano

Vasily Khoruzhick (2):
      dt-bindings: clock: sunxi: Export PLL_VIDEO_2X and PLL_MIPI
      arm64: dts: allwinner: a64: explicitly assign clock parent for TCON0

 .../sram/allwinner,sun4i-a10-system-control.yaml   |  4 ++-
 .../dts/allwinner/suniv-f1c100s-licheepi-nano.dts  |  8 ++++++
 arch/arm/boot/dts/allwinner/suniv-f1c100s.dtsi     | 24 ++++++++++++++++
 arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi     | 33 ++++++++++++++++++++++
 .../boot/dts/allwinner/sun50i-a64-pinebook.dts     |  2 ++
 .../boot/dts/allwinner/sun50i-a64-teres-i.dts      |  2 ++
 arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi      |  2 ++
 .../boot/dts/allwinner/sun50i-h313-tanix-tx1.dts   |  1 +
 include/dt-bindings/clock/sun50i-a64-ccu.h         |  2 ++
 9 files changed, 77 insertions(+), 1 deletion(-)

--XIu6UgM/IfLWEBFY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE2nN1m/hhnkhOWjtHOJpUIZwPJDAFAmd+odYACgkQOJpUIZwP
JDCI/g/+KEVO+Q/n4UT4J+UPEIgUeBGT+Q3TWTKpgxBg5hJcK8ka9JuM2spYR70r
Ha8jaItEm81Y81aA8kiW3i3XTFt6ROusehuMFDvsSuEh0lqsfg9fFYGisTJVKoDz
5UvzMnf0dIu0Cvgk0p5I7u7/H9neUYyXxkQPzYmM8DmBEI1fvvA4l/wAIABxub1q
yT/V4Xk8BboGTDfEBxZv1dQgHX42rFkj4p/ezj5KmjFjMpx+3Bzcjabpjnm1zSa7
33fiahfUlRl+Yg2KJxBkSfxtP5E0FsnBsdr3/fZ/O3SFBdpTJ/vU4ykOveuWgCfQ
lyhSbmCD2ohAqljLHVqDBt+gol3feBPjV984OzdOxotCp0giaaHUUl/1GejMhdVG
3yefr0gots3PRJ1qsbveo5Mlo1m6hcC36AwKKsDcsGDjLK1PC3xHQd7dAWpGiQnK
UYg34kXffXh5xNPJ8oBFIQkvqMP4pHeFJSavMKRlY3t9BIuKLu3/SZCHGhFTo6Dk
F5YoZsrBANlZ6s1qh+LiKxEeFg03J/QJ2DvPkXCcjJejFXwcpOIA13A3qxzNhNGU
D4qG7MBplj8YvxZY+FGGs/MslT/PhZiBQzO/JVmtXUr4hbo3fVDPXC4MMoCBHgbw
IzapdUDWSES1sWSLy2purZKeH/6fv7cbJA1M+iPv+KVWq90uf6k=
=Dp5j
-----END PGP SIGNATURE-----

--XIu6UgM/IfLWEBFY--


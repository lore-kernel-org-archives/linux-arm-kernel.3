Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C786BCD4F3E
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 16 Nov 2025 08:01:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=R7NbJbBVjhK1zrfbpAcrZuzD8j9inbYYX6YLsjVC098=; b=DvgSNguGi64GyNNLVYWLmjn50t
	hsRAZ61/6hfEAjiTkoZiGok++dkwEo428mcORG1Qg8PIbdl0H1rTxD3nE5vsrGMGKdtw10gsRovxr
	Px8dfeR4X79yCfbQFsbizBIld+xnpwVcVVTNAJQtDnDiOQxhH7rRJeQwIPrgCB+6u04XIJNeT7rx1
	mnjt1fIJoK8T/59AoKaM8lQe1rPe7KDyvRlhCDXDtcGyYIn2FjrB3qioSoX/ILmuGOLj/aCYl7h7P
	Hq2U97Vh4xSa7J9oXkkNjaP+6yi5rO2oU8z5rE7YoXS3wEtcpliVq+9d6dHGm+AyNGc/bC5kV3N6v
	38ARu7kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKXh6-0000000ESb0-3wmy;
	Sun, 16 Nov 2025 08:01:08 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKXh5-0000000ESaf-30Wd
	for linux-arm-kernel@lists.infradead.org;
	Sun, 16 Nov 2025 08:01:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id DF2AC60147;
	Sun, 16 Nov 2025 08:01:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70E42C116B1;
	Sun, 16 Nov 2025 08:01:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763280065;
	bh=n1m3+OEF7ZWWfJVdAJR+SCkIJOuK7J/zBc3Whpeg4zs=;
	h=Date:From:To:Cc:Subject:From;
	b=Oi1oh0LyKUfgqA/oXZ/90yJqnLB6jw6RKLgVckWAt9cZjKStxigZ8w93oQ+Fcyjke
	 UumwTgYTdUWAQDvpwWZ4qjcmNh0uYvU8PZ7jVciWVR+z5ZIQbJAX2e9Nf/1HVOHu4I
	 yLj88Vzaj9x+Zp1qyHziFFLaBJH6wQxQEddxJz8L2cyUB35hdOixFGq33coGTGttnm
	 4ikCysxrqYivY09LkWscVt8bWB3BN80/1IJEmmYQ2vzLHssqLPdeHL8u7ytK0CxFmC
	 d4RcGjlwWS/RwX5JDEaC1TvsdvkaiDbnsBiBwuZ8fN2wthXFKtmfv1mbcAiZJBCiQc
	 HGcQe+a9hb6fQ==
Received: by wens.tw (Postfix, from userid 1000)
	id 69C2E5FF44; Sun, 16 Nov 2025 16:01:03 +0800 (CST)
Date: Sun, 16 Nov 2025 16:01:03 +0800
From: Chen-Yu Tsai <wens@kernel.org>
To: soc@kernel.org
Cc: Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>, linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Allwinner DT changes for 6.19
Message-ID: <aRmEvz0F1yVCgE-B@wens.tw>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="g5tY81ESRNcZFmD0"
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


--g5tY81ESRNcZFmD0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df56787:

  Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git tags/sunxi-dt-for-6.19

for you to fetch changes up to ae0d3f1e6dd2c6404db2fbd7556b93eddd6c87b8:

  arm64: dts: allwinner: a523: Add SPDIF TX pin on PB and PI pins (2025-10-29 01:07:33 +0800)

----------------------------------------------------------------
Allwinner device tree changes for 6.19

The A523 family gains support for I2S and SPDIF audio interfaces, as
well as the GMAC200 Ethernet controller.

The H616 gains support for the NAND controller.

----------------------------------------------------------------
Chen-Yu Tsai (10):
      arm64: dts: allwinner: a523: Add GMAC200 ethernet controller
      arm64: dts: allwinner: a527: cubie-a5e: Enable second Ethernet port
      arm64: dts: allwinner: t527: avaota-a1: enable second Ethernet port
      arm64: dts: allwinner: t527: orangepi-4a: Enable Ethernet port
      dt-bindings: dma: allwinner,sun50i-a64-dma: Add compatibles for A523
      arm64: dts: allwinner: a523: Add DMA controller device nodes
      arm64: dts: allwinner: a523: Add device node for SPDIF block
      arm64: dts: allwinner: a523: Add device nodes for I2S controllers
      arm64: dts: allwinner: a523: Add I2S2 pins on PI pin group
      arm64: dts: allwinner: a523: Add SPDIF TX pin on PB and PI pins

Richard Genoud (1):
      arm64: dts: allwinner: h616: add NAND controller

 .../bindings/dma/allwinner,sun50i-a64-dma.yaml     |   5 +-
 arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi     |  52 ++++++
 arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi     | 204 +++++++++++++++++++++
 .../boot/dts/allwinner/sun55i-a527-cubie-a5e.dts   |  28 ++-
 .../boot/dts/allwinner/sun55i-t527-avaota-a1.dts   |  26 ++-
 .../boot/dts/allwinner/sun55i-t527-orangepi-4a.dts |  23 +++
 6 files changed, 333 insertions(+), 5 deletions(-)

--g5tY81ESRNcZFmD0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE2nN1m/hhnkhOWjtHOJpUIZwPJDAFAmkZhL8ACgkQOJpUIZwP
JDD33g/+MTCGbBbfJdpgGLE7z/F24tbTFDk2KVV+dAfCW+CZ08p+MVSVlhrzAk5h
CbRAVxqYLO7sgGQhF0Jd7ge1HuE+zcZYqOym/SyfNJmYqVq7UnBTD7CIA2fYoy6Z
UoKpRfSwqzX/yEkvIPwPNJKwiL3hdJLqe2rBl7EVB4NrZpbmdOXEbyTydoy9fq5o
VDTArUSsxen53dqhjoXMNj7LF9h7Dftvb3Tp1G5vhRJtP6ozMBoauG7YI8anh3I9
jLj43YXxAYwhvYKpYYjB0eTgGiXZoB1v10kvCI4KEm5FAffhbCQgGR8R9deWHEkq
SzAn/luocI+dd9O0FYqfMBi2ngAanSM4c/PQ7nHB7lpZXblQ+nsz48BiNC32F27G
itFecCqDJS8VkxmTuqkKbCT5mjZvahlHn+7Mr8OjHdS/aIqnVoCQNxPk+VxdB5cV
UcxqNMJ3Nb2+n2GEvDm8BPWJ8tqPKiEvOBE5c5GEVkHmAMvFp7BhMM5NgEyxNcDQ
guXJa/eTNynwdonSfh2J0I1oL6rbhx6vLPz4dgnBZei0w9rliO1RusPbvEDSrv5F
WCrIaiLQfthgh810ieDrFw1PCqhDtdhBmqb4tifNkm9LAifkhNnmVJsr/GaKjL0g
N6RcXcUHkOqbu4C4vzXC1BXLU6Z6BJgXjtuF4w9pK5sj/pjwXU8=
=cVPx
-----END PGP SIGNATURE-----

--g5tY81ESRNcZFmD0--


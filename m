Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A415C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Mar 2025 15:36:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6ot+603elM/hZVNH7nhESqvB/vmsyZbUuJNjjp1fzus=; b=rhJxIASsZg9kd9QVFx2b/Gedok
	YNIRHD+EFqJLtiPKUKbgqQNKNSjqyAhp2ERXhhiFkGmXnTbxeanBTbC1jOheLFWPCKmY5FtrM3l8x
	QmyOQNBR77jGqbw89voNaLE6d1IKPPSHEWTw92F9l+4bYPIj86UEUcvPr6bY+8OBpehh0fl1NrkUX
	wzHDvHtq5Hn93c1+EHXNe5LxbxyIhjryEv2N79UybQBYGlMvkQNSbXin2IAMoAZlfWe1oxJLuYoBx
	htijDqVNMujPkPzGNNsZqz2LHSITkwpJxw1xEyTCMQJ/8wSUDAho3r/uQmqfRdPZLmeYJKkmmYavr
	ngiwSrfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tskb9-0000000BfnD-1mpp;
	Thu, 13 Mar 2025 15:35:51 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tskZT-0000000Bffg-3W8B
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Mar 2025 15:34:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 9F430A47602;
	Thu, 13 Mar 2025 15:28:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05A77C4CEDD;
	Thu, 13 Mar 2025 15:34:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741880046;
	bh=Toz2VTcsyobehQEDG0cJrm5RPXMUb2+0ksBhaQGMR1s=;
	h=Date:From:To:Cc:Subject:From;
	b=Po+cLDjd3M11/1oitHJkKxim2mkT8imMEMuE+OdnPMUgOK9QKYXlkNiXEt8ud59GX
	 xuFWFKGrTFQ1n0NBdKCP5tIFRGitLCYNX8af311yYSr/nc1uN0WqGT/NWmwFMLIXDt
	 31HENkgVdVQcmrs9vn7jq8A3M+JoXJQyO5RNMLQ5lh+6XI7UBokSqMkc7Q9q7Bn6/l
	 Rd7uY8uF8TcCtMWPfQe1PRZ5Fq5KXQJo4DAfitfv418Ivquyl8lWN6Gt+jbJNYGTvK
	 CJp/WeZJRV4HPyMEwzR9yvN5YZJl8jWZK6H7wzMsGJz4IMhui+Y+ymHY+tewEEP0Fq
	 iTOZ/9kUhwPnQ==
Received: by wens.tw (Postfix, from userid 1000)
	id BE0BC5FBF4; Thu, 13 Mar 2025 20:44:40 +0800 (CST)
Date: Thu, 13 Mar 2025 20:44:40 +0800
From: Chen-Yu Tsai <wens@kernel.org>
To: soc@kernel.org
Cc: Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>, linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Allwinner device tree changes for 6.15
Message-ID: <Z9LTOHJDY2p0lNG0@wens.tw>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="V5GzvCGLWhTVTWN3"
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_083408_009367_5223D36C 
X-CRM114-Status: GOOD (  12.13  )
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


--V5GzvCGLWhTVTWN3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following changes since commit 2014c95afecee3e76ca4a56956a936e23283f05b:

  Linux 6.14-rc1 (2025-02-02 15:39:26 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git sunxi-dt-for-6.15

for you to fetch changes up to a8181e6861fec3068f393d77ff81b2aaf4ea4203:

  arm64: dts: allwinner: a100: Add CPU Operating Performance Points table (2025-02-22 21:17:50 +0800)

----------------------------------------------------------------
Allwinner device tree changes for 6.15

- New board support: NetCube Systems Kumquat
- Enable USB and LED on Anbernic RG35XX
- Fix reboot GPIO detection logic on Anbernic RG35XX
- Disable (non-existent) battery thermistor on Anbernic RG35XX
- Add CPU OPP table for A100

----------------------------------------------------------------
Chris Morgan (4):
      arm64: dts: allwinner: h700: Set cpusldo to always-on for RG35XX
      arm64: dts: allwinner: h700: Add LED1 for Anbernic RG35XX
      arm64: dts: allwinner: h700: Add USB Host for RG35XX-H
      arm64: dts: allwinner: rg35xx: Add no-thermistor property for battery

Lukas Schmid (4):
      dt-bindings: vendor-prefixes: Add NetCube Systems Austria name
      dt-bindings: arm: sunxi: Add NetCube Systems Kumquat board
      ARM: dts: sunxi: add uart1_pe pinctrl for sun8i-v3s
      ARM: dts: sunxi: add support for NetCube Systems Kumquat

Shuosheng Huang (1):
      arm64: dts: allwinner: a100: Add CPU Operating Performance Points table

 Documentation/devicetree/bindings/arm/sunxi.yaml   |   5 +
 .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
 arch/arm/boot/dts/allwinner/Makefile               |   2 +
 .../dts/allwinner/sun8i-v3s-netcube-kumquat.dts    | 276 +++++++++++++++++++++
 arch/arm/boot/dts/allwinner/sun8i-v3s.dtsi         |   6 +
 .../dts/allwinner/sun50i-a100-allwinner-perf1.dts  |   5 +
 .../boot/dts/allwinner/sun50i-a100-cpu-opp.dtsi    |  90 +++++++
 arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi     |   8 +
 .../allwinner/sun50i-h700-anbernic-rg35xx-2024.dts |  18 +-
 .../allwinner/sun50i-h700-anbernic-rg35xx-h.dts    |  23 ++
 10 files changed, 434 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm/boot/dts/allwinner/sun8i-v3s-netcube-kumquat.dts
 create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-a100-cpu-opp.dtsi

--V5GzvCGLWhTVTWN3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE2nN1m/hhnkhOWjtHOJpUIZwPJDAFAmfS0zYACgkQOJpUIZwP
JDAj3A/+OXZAJYwn40wiIZodHuTKJ8g7AvWwn3yxuc4ocKPjYcbmCGFCCP2Szd8u
hblBU6JZsJ6JUU0OhonF8Xum96pVCR/xTS14AaU7XzFLZothIynoKKmv9whyZ71k
QVna86mkhROAWxNvO/HXrNkzXxXZUkYuDZ1yAu16mu3CesJ+hS3BSPEDovvETGDt
NU0S2APZ610L0aA2odAq5B7MeROLfgv9cSIgTKRzRWA12G6a9yW4bZuSwnPXBi7U
XiWYAD/yYjAZ0d5WfATamAQ8bixrPoHnQowHqQiNyRLh1gndKubOUAOM35VlrVFG
ehqWj1H17pXSqqvIbQlTc3lxN1Sh3E8pxwhb5MHpvKCwfS2eRuZf5WNhGxorWkJK
Xb/ks/vXgJsxr4TuYVW88Kl2j/V0WXVb1goFcqNMIXFkU0XNQrGpWgTXd4ErBRRs
TQPZrINDX4/gwZieNBjA+WO7A7usTTp22vITs5XBXiUXOIoDsL0g1aP3DHj/9arG
yPss8fgBfftvuNvpdCC7EoK6adF2Dny2qFxztmtUseP4/wk83R19v5eu6k/Zqpa4
zAZ8XicEpd7l8lVrt7KXRpY1TUIG3ldNNI/vgP/t/GMlKh7uNMN8lGF92CXbc4X3
cS2MB3vkGoJPya4U0zSq4FJvCylaAOXAWr/KC/k/gwcAeF8iles=
=0w4i
-----END PGP SIGNATURE-----

--V5GzvCGLWhTVTWN3--


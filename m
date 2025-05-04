Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 496BCC369DC
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  4 May 2025 22:16:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=sLpW6jTBTWl6wB5elGwC1n2v3ZUSHcQl9rZfk83A14c=; b=yqRWon3lfrSrJSUyjL30PTLv6c
	mVIP0UA1flJZUC1/gH+bNvP0K5ttmONoiBHpZKFVK+OVPu11BUJMgkr3BFNxi3vX5XMA+FWAr/fEx
	ADo3naxRDzl7bBLDICEnQWZVj71pFsGnJ4PNPWi0d3JjqBEbEAHKuejy29T8uRS5A4OR01NWRWJFC
	fjA1kSZsUsP6ogXvhlVSdPuPxQ1tK25d/NjI3yo+6jGN7La5M06YYo+/y0jMP6MBYAREY3zMeCCo9
	vRAcriBx97HZFrEChiREbxGSkIf3CcpN2aCoIefECTzs+btmorqp8KzEE5miMAJlplsityH2s9Clg
	ScI/jN7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBhdY-000000062gH-3Qeg;
	Sun, 04 May 2025 22:16:40 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBhXJ-000000062Km-1l5M;
	Sun, 04 May 2025 22:10:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=sLpW6jTBTWl6wB5elGwC1n2v3ZUSHcQl9rZfk83A14c=; b=AKeciERUlG++PembkUMAJdd63H
	3v1llWiYQP4DTT+yzeVR18isqNCTLiYN73K/RLwsG4gwH7VGxUbAeGBHTikmXrWXFaAfdhphARTI+
	4vP4VxsE3YTbUKJxOhF1izBTda2CCbcgDStmw9sxeCvVyOnUIuotfNTm3OcP6jlw6pbi6yEjKrEdG
	zcS+HVUibELouIA/ic+R3zVAW8V/JTWI6nEWmZQGntlw6Rt1E2B3Yk0/NWEbZAQPk221arAWeYrne
	5uvqYzip67fbqn4o6MYsI6rhQe6RWDBQK0A/RzDqQ0juzeYsCS35km+qvq6kmPebeqXbocQyad5Im
	J+h66POQ==;
Received: from i53875bbc.versanet.de ([83.135.91.188] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uBhXI-0006CM-6R; Mon, 05 May 2025 00:10:12 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: arm@kernel.org
Cc: soc@kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Rockchip dts fixes for 6.15 #1
Date: Mon, 05 May 2025 00:10:11 +0200
Message-ID: <2923598.88bMQJbFj6@diego>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250504_151013_459192_5027276B 
X-CRM114-Status: UNSURE (   9.37  )
X-CRM114-Notice: Please train this message.
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

Hi Arnd, Kevin, Olof,

please find a below some fixes for the current 6.15 release-cycle.

Please pull

Thanks
Heiko


The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:

  Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git ta=
gs/v6.15-rockchip-dtsfixes1

for you to fetch changes up to 4bf593be2e462623c4c34c7e3b604eb3f8f9de45:

  arm64: dts: rockchip: fix Sige5 RTC interrupt pin (2025-04-29 23:21:49 +0=
200)

=2D---------------------------------------------------------------
Removal of operating-points above what the rk3588j soc is rated for, and
a number of smaller fixes: Turing RK1 fan can spin down again, fixed pins,
pinmuxing and clocks and some devicetree-correctnes improvements.

=2D---------------------------------------------------------------
Dragan Simic (1):
      arm64: dts: rockchip: Remove overdrive-mode OPPs from RK3588J SoC dtsi

Krzysztof Kozlowski (1):
      arm64: dts: rockchip: Align wifi node name with bindings in CB2

Nicolas Frattaroli (1):
      arm64: dts: rockchip: fix Sige5 RTC interrupt pin

Rob Herring (Arm) (2):
      arm64: dts: rockchip: Use "regulator-fixed" for btreg on px30-engicam=
 for vcc3v3-btreg
      arm64: dts: rockchip: Fix mmc-pwrseq clock name on rock-pi-4

Sam Edwards (1):
      arm64: dts: rockchip: Allow Turing RK1 cooling fan to spin down

Tom Vincent (1):
      arm64: dts: rockchip: Assign RT5616 MCLK rate on rk3588-friendlyelec-=
cm3588

Uwe Kleine-K=C3=B6nig (1):
      arm64: dts: rockchip: Add pinmuxing for eMMC on QNAP TS433

 .../boot/dts/rockchip/px30-engicam-common.dtsi     |  3 +-
 .../boot/dts/rockchip/px30-engicam-ctouch2.dtsi    |  2 +-
 .../rockchip/px30-engicam-px30-core-edimm2.2.dts   |  2 +-
 arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4.dtsi |  2 +-
 .../boot/dts/rockchip/rk3566-bigtreetech-cb2.dtsi  |  2 +-
 arch/arm64/boot/dts/rockchip/rk3568-qnap-ts433.dts |  2 +
 .../boot/dts/rockchip/rk3576-armsom-sige5.dts      |  2 +-
 .../dts/rockchip/rk3588-friendlyelec-cm3588.dtsi   |  4 ++
 .../arm64/boot/dts/rockchip/rk3588-turing-rk1.dtsi |  2 +
 arch/arm64/boot/dts/rockchip/rk3588j.dtsi          | 53 +++++++-----------=
=2D---
 10 files changed, 31 insertions(+), 43 deletions(-)





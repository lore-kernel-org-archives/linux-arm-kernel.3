Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26446CAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 21 Sep 2025 21:01:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=nA7SF2fzw7JbesVTWtaZYM0KNv+9N0bkcTooj4MuXe8=; b=Ksczt6Z1YFvkwhftkUpcn9tSCV
	zgsDrwWuUC6NjdGLUYYqeScSCCgqsC+P6C6hw6F9J5/Nb5CvE4AxOUwPJQO4d/OHJINjQbT89JJ8P
	5SZC8qWsyP25LsV0+ZzR3ynlc/kYEhonRL31QZrMZGGJt3TNPiqW0V+5CQmRYLQVBVU9jI6XuiXtB
	3axDuOoknP5dyYWTehBp1WLO5mg6yk7ageXSyZqGIrl3Py51bzy0jRXoTXMA5nylFilKRQRJo7EC5
	V72dFxAnxcKAOTc7ZE0j2cTQnWrXKcqw4QzRDCcmFGkljoqlTs8fPpT2EdzHNVCTXMOfLATtSzeHL
	6Vs5Bkig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0RBF-00000008CPz-3oYl;
	Sun, 21 Sep 2025 21:01:09 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0RBA-00000008CPL-3nFG;
	Sun, 21 Sep 2025 21:01:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:In-Reply-To:References;
	bh=nA7SF2fzw7JbesVTWtaZYM0KNv+9N0bkcTooj4MuXe8=; b=CUR9LEIGOG5od/Ii444xVrA7u0
	f5lSMkYd3dXrhiznr8uzinPBWt0ke7O1cY0AK9gRC/sbruo36Zrg+F3zyYcvqg8QqeQtUH0esrgzT
	hFG8Jt3b8kOUEDCYI5ZR8gZsrBkw8dXsmrSucpJJYWL7vtlx+zk8YsCIBR0nSHv60VbdNh8vO59nu
	ZDM3Jfpje+8zdEx2refJdcKO0G+QY9Z53o5vaCZESb8Q4yQ8IoNj5Dlz6I7E/9w5kut1kUzrOvwjD
	toEQOEgQ5avYGiFelmL2tsklgXV4fMIFPctBAYSlA9v7L2U+qoUL5B16z6eT3HnADM1emq7GVRxbr
	ypLznwHw==;
Received: from i53875add.versanet.de ([83.135.90.221] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1v0RB9-0007dH-7u; Sun, 21 Sep 2025 23:01:03 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: arm@kernel.org
Cc: soc@kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Rockchip dts64 changes for 6.18 #2
Date: Sun, 21 Sep 2025 23:01:02 +0200
Message-ID: <2079092.kXSN5OTJKJ@diego>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250921_140104_950032_9700E099 
X-CRM114-Status: GOOD (  11.93  )
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

Hi soc maintainers,

please find below some more Rockchip 64bit dt changes for for 6.18 .
To go on top of the first set.


Please pull.
Thanks
Heiko


The following changes since commit 07c53a9e970712b1a479dd0ec4adfe184482c22f:

  arm64: dts: rockchip: Enable DP2HDMI for ROCK 5 ITX (2025-09-02 08:32:26 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v6.18-rockchip-dts64-2

for you to fetch changes up to 93781211e9ad9578787355147c2f28b7289a8ec6:

  arm64: dts: rockchip: Add devicetree for the ROC-RK3588-RT (2025-09-18 20:59:59 +0200)

----------------------------------------------------------------
One new board the ROC-RK3588-RT, gpu improvements for RK3328, frequency
scaling for the RK3528 and the very first small steps for camera
support on the RK3588 - with the CSI-DPHY support, with more hopefully
to come soon'ish :-) .

And apart from those bigger points, some more individual peripheral work
on some boards.

----------------------------------------------------------------
Alex Bee (2):
      arm64: dts: rockchip: add GPU powerdomain, opps, and cooling to rk3328
      arm64: dts: rockchip: enable the Mali GPU on RK3328 boards

Chris Morgan (1):
      arm64: dts: rockchip: Add USB and charger to Gameforce Ace

Chukun Pan (3):
      arm64: dts: rockchip: Add rk3528 CPU frequency scaling support
      arm64: dts: rockchip: remove vcc_3v3_pmu regulator for Radxa E52C
      arm64: dts: rockchip: update pinctrl names for Radxa E52C

Kaison Deng (2):
      dt-bindings: arm: rockchip: Add Firefly ROC-RK3588-RT
      arm64: dts: rockchip: Add devicetree for the ROC-RK3588-RT

Marcin Juszkiewicz (1):
      arm64: dts: rockchip: enable HDMI Receiver on NanoPC T6

Michael Riesch (2):
      dt-bindings: soc: rockchip: add rk3588 csidphy grf syscon
      arm64: dts: rockchip: add mipi csi-2 dphy nodes to rk3588

Sebastian Reichel (1):
      arm64: dts: rockchip: Fix network on rk3576 evb1 board

 .../devicetree/bindings/arm/rockchip.yaml          |    5 +
 .../devicetree/bindings/soc/rockchip/grf.yaml      |    1 +
 arch/arm64/boot/dts/rockchip/Makefile              |    1 +
 arch/arm64/boot/dts/rockchip/rk3328-roc-pc.dts     |    4 -
 arch/arm64/boot/dts/rockchip/rk3328-roc.dtsi       |    4 +
 arch/arm64/boot/dts/rockchip/rk3328-rock64.dts     |    4 +
 arch/arm64/boot/dts/rockchip/rk3328.dtsi           |   40 +-
 arch/arm64/boot/dts/rockchip/rk3528.dtsi           |   39 +
 arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dts   |   38 +-
 arch/arm64/boot/dts/rockchip/rk3582-radxa-e52c.dts |   26 +-
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi      |   34 +
 arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi |   17 +
 arch/arm64/boot/dts/rockchip/rk3588-roc-rt.dts     | 1132 ++++++++++++++++++++
 .../boot/dts/rockchip/rk3588s-gameforce-ace.dts    |  122 +++
 14 files changed, 1434 insertions(+), 33 deletions(-)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588-roc-rt.dts





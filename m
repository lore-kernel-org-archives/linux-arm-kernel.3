Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 503A2E6781D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Nov 2024 15:42:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Y2LinK603WP8GiL3Qqg8edQY+80d2HVOC9EVt0tprZw=; b=H8K55gSM1/eIWopC6e0Jh9WWxv
	lHy2+07g5hMbbYOKIYTvQsOPAbpDPJ62pj3sYuRP9na9ifZ2hTXOZQsa0M3Hl2pOUz0A0cJZOq3Hx
	oxN7q3gd20Ac33hKqrsjni/QyNnd4oBQaJ6au8Dpvg1TlBof+8GaJZZaX13dMTxSiGVlzte7pWVCG
	zlPcqpfNYbMHpHvYDZRPPCWQrUKbY6iz7qrquQyZ+jsDx4tr0aPahIHpaBGY1S9c6IvQW3aRjPVpC
	voOAdBghEQqVBkOiL1l5awncxBcZsvcBhD2G7U6w5NON/zpElrdtcJFf/iz2nAKbsXZvdvzCMzY/j
	rxOnt+Lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAWYH-00000000UWY-3dz1;
	Mon, 11 Nov 2024 15:42:06 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAWSh-00000000Tmp-3yc2;
	Mon, 11 Nov 2024 15:36:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Y2LinK603WP8GiL3Qqg8edQY+80d2HVOC9EVt0tprZw=; b=TZqOG6p5/y7jp8uaiQKwH2l17c
	kI7XtVOAmrYny/bcc8mhABoB7vtm0azBAMt4rLNh1jCvXc/yT2JjeiRH6rdvHdyH65gyTl5nEtaJq
	QatEOpy9YiTCXjDqT23JNCLs3hI7N2fcvAhy8fDpL5wGu/UQUSNENjApZJMCPHCS3zVpuoGB9oUBQ
	qvTHUCk8fhYOD05d/yg7N1tKZCbph1q6BL2/hWWNI0gW0M4CT3MappPpNdSPsf0WKYnqKlBfGT3HX
	TKqPH1mlI+8F1f+gG6Zj6JIjntsSUR9btb0HdvTzzxytTqXxw2IQ8BrVpMaCeI2q4H+DOHWiVHm0N
	XKM/g8AQ==;
Received: from i53875b28.versanet.de ([83.135.91.40] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tAWSg-000471-Jo; Mon, 11 Nov 2024 16:36:18 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: arm@kernel.org
Cc: soc@kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Rockchip dts32 changes for 6.13 #2
Date: Mon, 11 Nov 2024 16:36:18 +0100
Message-ID: <16977226.geO5KgaWL5@diego>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_073619_996580_E9FC74F8 
X-CRM114-Status: GOOD (  11.69  )
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

The following changes since commit bdb2696ac5786ed3f43520e700347fe2152ea199:

  ARM: dts: rockchip: Add Relfor Saib board (2024-10-14 11:35:50 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v6.13-rockchip-dts32-2

for you to fetch changes up to 2c3944d952ec4d3428a8d3163be2263579d1939a:

  ARM: dts: rockchip: adapt regulator nodenames to preferred form (2024-11-09 18:43:23 +0100)

----------------------------------------------------------------
Fixed-regulator nowadays has preferred node-naming scheme set in the
binding. This gets all boards on the same state for Rockchip arm32-dts.

----------------------------------------------------------------
Johan Jonker (1):
      ARM: dts: rockchip: adapt regulator nodenames to preferred form

 arch/arm/boot/dts/rockchip/rk3036-kylin.dts        |  2 +-
 arch/arm/boot/dts/rockchip/rk3066a-bqcurie2.dts    |  4 ++--
 arch/arm/boot/dts/rockchip/rk3066a-marsboard.dts   |  6 ++---
 arch/arm/boot/dts/rockchip/rk3066a-mk808.dts       | 12 +++++-----
 arch/arm/boot/dts/rockchip/rk3066a-rayeager.dts    | 16 ++++++-------
 arch/arm/boot/dts/rockchip/rk3128-evb.dts          |  4 ++--
 arch/arm/boot/dts/rockchip/rk3128-xpi-3128.dts     | 28 +++++++++++-----------
 arch/arm/boot/dts/rockchip/rk3188-bqedison2qc.dts  | 14 +++++------
 arch/arm/boot/dts/rockchip/rk3188-px3-evb.dts      |  2 +-
 arch/arm/boot/dts/rockchip/rk3188-radxarock.dts    |  8 +++----
 arch/arm/boot/dts/rockchip/rk3228-evb.dts          |  2 +-
 arch/arm/boot/dts/rockchip/rk3229-evb.dts          | 16 ++++++-------
 arch/arm/boot/dts/rockchip/rk3229-xms6.dts         | 16 ++++++-------
 arch/arm/boot/dts/rockchip/rk3288-evb-act8846.dts  |  4 ++--
 arch/arm/boot/dts/rockchip/rk3288-evb.dtsi         |  8 +++----
 .../dts/rockchip/rk3288-firefly-reload-core.dtsi   |  2 +-
 .../boot/dts/rockchip/rk3288-firefly-reload.dts    | 18 +++++++-------
 arch/arm/boot/dts/rockchip/rk3288-firefly.dtsi     | 16 ++++++-------
 arch/arm/boot/dts/rockchip/rk3288-miqi.dts         |  8 +++----
 arch/arm/boot/dts/rockchip/rk3288-phycore-rdk.dts  |  6 ++---
 arch/arm/boot/dts/rockchip/rk3288-phycore-som.dtsi |  6 ++---
 arch/arm/boot/dts/rockchip/rk3288-popmetal.dts     | 10 ++++----
 arch/arm/boot/dts/rockchip/rk3288-r89.dts          |  8 +++----
 arch/arm/boot/dts/rockchip/rk3288-rock2-som.dtsi   |  4 ++--
 arch/arm/boot/dts/rockchip/rk3288-rock2-square.dts |  6 ++---
 arch/arm/boot/dts/rockchip/rk3288-tinker.dtsi      |  4 ++--
 arch/arm/boot/dts/rockchip/rk3288-veyron-brain.dts |  6 ++---
 .../dts/rockchip/rk3288-veyron-chromebook.dtsi     | 10 ++++----
 arch/arm/boot/dts/rockchip/rk3288-veyron-edp.dtsi  |  4 ++--
 .../arm/boot/dts/rockchip/rk3288-veyron-fievel.dts | 10 ++++----
 .../arm/boot/dts/rockchip/rk3288-veyron-mickey.dts |  4 ++--
 arch/arm/boot/dts/rockchip/rk3288-veyron-pinky.dts |  4 ++--
 arch/arm/boot/dts/rockchip/rk3288-veyron.dtsi      |  8 +++----
 arch/arm/boot/dts/rockchip/rk3288-vmarc-som.dtsi   |  2 +-
 arch/arm/boot/dts/rockchip/rk3288-vyasa.dts        | 18 +++++++-------
 .../rockchip/rockchip-radxa-dalang-carrier.dtsi    |  8 +++----
 arch/arm/boot/dts/rockchip/rv1108-elgin-r1.dts     |  2 +-
 arch/arm/boot/dts/rockchip/rv1108-evb.dts          |  2 +-
 .../boot/dts/rockchip/rv1126-edgeble-neu2-io.dts   |  6 ++---
 .../arm/boot/dts/rockchip/rv1126-edgeble-neu2.dtsi |  2 +-
 40 files changed, 158 insertions(+), 158 deletions(-)





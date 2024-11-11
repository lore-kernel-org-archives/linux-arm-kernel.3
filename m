Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64C23D2E9C5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Nov 2024 15:36:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=SAGiYdxZNLXobUA02V5AK0lpEE5EWN2wLDUbcZRXya0=; b=cJyj73Bkg2KeDS6rP+SZEbN15G
	I5NwrfjVeLMg3i1lVzOJp2HtIK/S3ULOoY8vuXcwjvMwsQ/zZoZXA0BmlVmYP3YVZesgE/TIatLNx
	S3blI5Avx5SX7zKoI5YqEVaF1flgcY7at77SkjtxXnaOu/AUBqNDdwu4FWwoteM7l5pTdSxWv1yG/
	ZzvRFnw4nsCIF+5R4vx9shvwzLORYtTocko0WELwjtpmSh0yCnzk52GW/3aydSW87slymOCaJqzG+
	diy/0YqP8d1OoHJNuger+TQXgy2/DCwDMhQVZUrjCIHHQdowbYwHAaTLGFqxYGDVPTIOsFmezM3Uu
	eRexxWxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAWT3-00000000Trp-2kGe;
	Mon, 11 Nov 2024 15:36:41 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAWQt-00000000TQV-0ULe;
	Mon, 11 Nov 2024 15:34:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=SAGiYdxZNLXobUA02V5AK0lpEE5EWN2wLDUbcZRXya0=; b=CxgKWUHSY0Csj7WahkKZpcA60n
	I9L9CKPtPDaKK0hvLhdX68A83wKH2e+Opp4jeiiCHdkqQnF6lpPe31gmrh6CpIT1GWLwwVBhP38/N
	/OuWyEmLeHYfifH51SQ3vtTcfWE8wAxPxXbwPKnU3HVhoGO7ildnIzmmX6Oh7rJQhE/0CfVoh1ZVy
	xocpwlF+UJBKh/z12oDnwGy72bBj4jgN3kfzjHHQ8Naygyo1rcQMV+qdSActfvn9A3ZeZDootEqno
	wS9ltgtzU/id5Uho6xgZh4I5f18NnhMeu+1ZUXTDGt1BthoHRiB+hzS8pHNLEmtiN+SKlUola5QPq
	5rvXOL0A==;
Received: from i53875b28.versanet.de ([83.135.91.40] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tAWQo-00046D-QY; Mon, 11 Nov 2024 16:34:22 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: arm@kernel.org
Cc: soc@kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Rockchip dts64 changes for 6.13 #2
Date: Mon, 11 Nov 2024 16:34:22 +0100
Message-ID: <3313711.oiGErgHkdL@diego>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_073427_365402_5C701B00 
X-CRM114-Status: GOOD (  17.40  )
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

Hi SoC-people

please find below and in a subsequent pull-request
some more Rockchip changes for for 6.13 .

More of the same as in part1 essentially :-) .

Please pull.
Thanks
Heiko


The following changes since commit 46fa3fee0b1c027862b04717b51630195c253a30:

  arm64: dts: rockchip: Add rk3588-orangepi-5b device tree (2024-10-25 08:48:01 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v6.13-rockchip-dts64-2

for you to fetch changes up to 409e01f32787d7327fd732396d08c52051ab4746:

  arm64: dts: rockchip: use less broad pinctrl for pcie3x1 on Radxa E25 (2024-11-11 16:31:35 +0100)

----------------------------------------------------------------
More new boards: Rock-5C, Banana Pi P2 Pro

HDMI output enabled on a huge number of rk3588 boards, now that we
have the ability to do that.

A new RK356x variant - the RK3566T (with lower max-frequencies). The
variant was already in use on some boards which then encoded those OPP
differences in the board files itself. This moves this to saner place.

Fixed-regulator nowadays has a preferred node-naming scheme set in the
binding and we had accumulated a number of different styles over time.
A change brings all of them in line for arm64 dts files.

----------------------------------------------------------------
Andy Yan (3):
      arm64: dts: rockchip: Enable HDMI0 for rk3588 Cool Pi CM5 EVB
      arm64: dts: rockchip: Enable HDMI display for rk3588 Cool Pi 4B
      arm64: dts: rockchip: Enable HDMI display for rk3588 Cool Pi GenBook

Chen-Yu Tsai (1):
      arm64: dts: rockchip: orangepi-5-plus: Enable GPU

Chris Morgan (3):
      arm64: dts: rockchip: correct analog audio name on Indiedroid Nova
      arm64: dts: rockchip: Enable GPU on Indiedroid Nova
      arm64: dts: rockchip: Enable HDMI0 on Indiedroid Nova

Detlev Casanova (1):
      arm64: dts: rockchip: Remove non-removable flag from sdmmc on rk3576-sige5

Dmitry Yashin (2):
      dt-bindings: arm: rockchip: add Banana Pi P2 Pro board
      arm64: dts: rockchip: add Banana Pi P2 Pro board

Dragan Simic (4):
      arm64: dts: rockchip: Add OPP voltage ranges to RK3399 OP1 SoC dtsi
      arm64: dts: rockchip: Update CPU OPP voltages in RK356x SoC dtsi
      arm64: dts: rockchip: Prepare RK356x SoC dtsi files for per-variant OPPs
      arm64: dts: rockchip: Add new SoC dtsi for the RK3566T variant

FUKAUMI Naoki (4):
      arm64: dts: rockchip: sort rk3588s-rock5a properly in Makefile
      dt-bindings: arm: rockchip: add Radxa ROCK 5C
      arm64: dts: rockchip: add Radxa ROCK 5C
      arm64: dts: rockchip: use less broad pinctrl for pcie3x1 on Radxa E25

Johan Jonker (1):
      arm64: dts: rockchip: adapt regulator nodenames to preferred form

Jonas Karlman (4):
      arm64: dts: rockchip: Enable HDMI0 on FriendlyElec CM3588 NAS
      arm64: dts: rockchip: Enable HDMI on Hardkernel ODROID-M2
      arm64: dts: rockchip: Enable GPU on NanoPi R6C/R6S
      arm64: dts: rockchip: Enable HDMI on NanoPi R6C/R6S

Rick Wertenbroek (1):
      arm64: dts: rockchip: enable USB3 on NanoPC-T6

 .../devicetree/bindings/arm/rockchip.yaml          |  10 +
 arch/arm64/boot/dts/rockchip/Makefile              |   4 +-
 .../boot/dts/rockchip/px30-engicam-common.dtsi     |   4 +-
 arch/arm64/boot/dts/rockchip/px30-evb.dts          |   2 +-
 .../boot/dts/rockchip/px30-firefly-jd4-core-mb.dts |   4 +-
 .../boot/dts/rockchip/px30-firefly-jd4-core.dtsi   |   2 +-
 .../boot/dts/rockchip/px30-ringneck-haikou.dts     |  10 +-
 arch/arm64/boot/dts/rockchip/px30-ringneck.dtsi    |   2 +-
 arch/arm64/boot/dts/rockchip/rk3308-bpi-p2-pro.dts | 362 ++++++++
 arch/arm64/boot/dts/rockchip/rk3308-evb.dts        |  20 +-
 arch/arm64/boot/dts/rockchip/rk3308-roc-cc.dts     |  12 +-
 arch/arm64/boot/dts/rockchip/rk3308-rock-pi-s.dts  |  14 +-
 arch/arm64/boot/dts/rockchip/rk3318-a95x-z2.dts    |  12 +-
 .../boot/dts/rockchip/rk3326-anbernic-rg351m.dtsi  |   2 +-
 .../boot/dts/rockchip/rk3326-gameforce-chi.dts     |   2 +-
 arch/arm64/boot/dts/rockchip/rk3326-odroid-go.dtsi |   4 +-
 arch/arm64/boot/dts/rockchip/rk3328-a1.dts         |   4 +-
 arch/arm64/boot/dts/rockchip/rk3328-evb.dts        |   8 +-
 arch/arm64/boot/dts/rockchip/rk3328-nanopi-r2.dtsi |   8 +-
 .../boot/dts/rockchip/rk3328-orangepi-r1-plus.dtsi |   6 +-
 arch/arm64/boot/dts/rockchip/rk3328-roc.dtsi       |  12 +-
 arch/arm64/boot/dts/rockchip/rk3328-rock-pi-e.dts  |   8 +-
 arch/arm64/boot/dts/rockchip/rk3328-rock64.dts     |   6 +-
 arch/arm64/boot/dts/rockchip/rk3368-evb.dtsi       |   6 +-
 arch/arm64/boot/dts/rockchip/rk3368-geekbox.dts    |   2 +-
 arch/arm64/boot/dts/rockchip/rk3368-lba3368.dts    |  14 +-
 .../arm64/boot/dts/rockchip/rk3368-lion-haikou.dts |   6 +-
 arch/arm64/boot/dts/rockchip/rk3368-lion.dtsi      |   2 +-
 .../boot/dts/rockchip/rk3368-orion-r68-meta.dts    |  18 +-
 arch/arm64/boot/dts/rockchip/rk3368-px5-evb.dts    |   2 +-
 arch/arm64/boot/dts/rockchip/rk3368-r88.dts        |  14 +-
 arch/arm64/boot/dts/rockchip/rk3399-eaidk-610.dts  |  16 +-
 arch/arm64/boot/dts/rockchip/rk3399-evb.dts        |  12 +-
 arch/arm64/boot/dts/rockchip/rk3399-firefly.dts    |  16 +-
 .../boot/dts/rockchip/rk3399-gru-chromebook.dtsi   |  22 +-
 arch/arm64/boot/dts/rockchip/rk3399-gru-kevin.dts  |   4 +-
 .../boot/dts/rockchip/rk3399-gru-scarlet.dtsi      |  20 +-
 arch/arm64/boot/dts/rockchip/rk3399-gru.dtsi       |  20 +-
 arch/arm64/boot/dts/rockchip/rk3399-hugsun-x99.dts |  18 +-
 .../boot/dts/rockchip/rk3399-khadas-edge.dtsi      |  14 +-
 .../boot/dts/rockchip/rk3399-kobol-helios64.dts    |  28 +-
 arch/arm64/boot/dts/rockchip/rk3399-leez-p710.dts  |  14 +-
 arch/arm64/boot/dts/rockchip/rk3399-nanopc-t4.dts  |   4 +-
 arch/arm64/boot/dts/rockchip/rk3399-nanopi-m4.dtsi |   8 +-
 .../arm64/boot/dts/rockchip/rk3399-nanopi-neo4.dts |   6 +-
 .../arm64/boot/dts/rockchip/rk3399-nanopi-r4s.dtsi |   2 +-
 arch/arm64/boot/dts/rockchip/rk3399-nanopi4.dtsi   |  14 +-
 arch/arm64/boot/dts/rockchip/rk3399-op1.dtsi       |  52 +-
 arch/arm64/boot/dts/rockchip/rk3399-orangepi.dts   |  16 +-
 .../boot/dts/rockchip/rk3399-pinebook-pro.dts      |  26 +-
 .../boot/dts/rockchip/rk3399-pinephone-pro.dts     |  12 +-
 .../arm64/boot/dts/rockchip/rk3399-puma-haikou.dts |  12 +-
 arch/arm64/boot/dts/rockchip/rk3399-puma.dtsi      |  14 +-
 .../boot/dts/rockchip/rk3399-roc-pc-mezzanine.dts  |   6 +-
 .../arm64/boot/dts/rockchip/rk3399-roc-pc-plus.dts |   2 +-
 arch/arm64/boot/dts/rockchip/rk3399-roc-pc.dtsi    |  20 +-
 .../boot/dts/rockchip/rk3399-rock-4c-plus.dts      |  12 +-
 arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4.dtsi |  18 +-
 arch/arm64/boot/dts/rockchip/rk3399-rock960.dtsi   |  14 +-
 arch/arm64/boot/dts/rockchip/rk3399-rockpro64.dtsi |  22 +-
 arch/arm64/boot/dts/rockchip/rk3399-sapphire.dtsi  |  16 +-
 .../boot/dts/rockchip/rk3399pro-vmarc-som.dtsi     |   2 +-
 arch/arm64/boot/dts/rockchip/rk3566-base.dtsi      |  35 +
 arch/arm64/boot/dts/rockchip/rk3566-lubancat-1.dts |  12 +-
 arch/arm64/boot/dts/rockchip/rk3566-pinenote.dtsi  |  14 +-
 arch/arm64/boot/dts/rockchip/rk3566-pinetab2.dtsi  |  18 +-
 arch/arm64/boot/dts/rockchip/rk3566-quartz64-a.dts |  18 +-
 arch/arm64/boot/dts/rockchip/rk3566-quartz64-b.dts |  12 +-
 .../boot/dts/rockchip/rk3566-radxa-cm3-io.dts      |   6 +-
 arch/arm64/boot/dts/rockchip/rk3566-radxa-cm3.dtsi |   8 +-
 .../boot/dts/rockchip/rk3566-radxa-zero-3.dtsi     |   2 +-
 arch/arm64/boot/dts/rockchip/rk3566-roc-pc.dts     |  12 +-
 arch/arm64/boot/dts/rockchip/rk3566-rock-3c.dts    |  18 +-
 .../boot/dts/rockchip/rk3566-soquartz-blade.dts    |   6 +-
 .../boot/dts/rockchip/rk3566-soquartz-cm4.dts      |   6 +-
 .../boot/dts/rockchip/rk3566-soquartz-model-a.dts  |  10 +-
 arch/arm64/boot/dts/rockchip/rk3566-soquartz.dtsi  |   6 +-
 arch/arm64/boot/dts/rockchip/rk3566.dtsi           | 116 ++-
 arch/arm64/boot/dts/rockchip/rk3566t.dtsi          |  90 ++
 arch/arm64/boot/dts/rockchip/rk3568-bpi-r2-pro.dts |  22 +-
 arch/arm64/boot/dts/rockchip/rk3568-evb1-v10.dts   |  16 +-
 .../boot/dts/rockchip/rk3568-fastrhino-r66s.dtsi   |  10 +-
 arch/arm64/boot/dts/rockchip/rk3568-lubancat-2.dts |  16 +-
 .../arm64/boot/dts/rockchip/rk3568-nanopi-r5s.dtsi |  18 +-
 arch/arm64/boot/dts/rockchip/rk3568-odroid-m1.dts  |  12 +-
 .../arm64/boot/dts/rockchip/rk3568-radxa-cm3i.dtsi |  10 +-
 arch/arm64/boot/dts/rockchip/rk3568-radxa-e25.dts  |  16 +-
 arch/arm64/boot/dts/rockchip/rk3568-roc-pc.dts     |  18 +-
 arch/arm64/boot/dts/rockchip/rk3568-rock-3a.dts    |  26 +-
 .../rk3568-wolfvision-pf5-io-expander.dtso         |   6 +-
 .../boot/dts/rockchip/rk3568-wolfvision-pf5.dts    |  12 +-
 arch/arm64/boot/dts/rockchip/rk3568.dtsi           | 113 ++-
 .../dts/rockchip/{rk356x.dtsi => rk356x-base.dtsi} |  81 --
 .../boot/dts/rockchip/rk3576-armsom-sige5.dts      |   1 -
 .../arm64/boot/dts/rockchip/rk3588-armsom-lm7.dtsi |   4 +-
 .../boot/dts/rockchip/rk3588-armsom-sige7.dts      |  10 +-
 arch/arm64/boot/dts/rockchip/rk3588-armsom-w3.dts  |   8 +-
 .../boot/dts/rockchip/rk3588-coolpi-cm5-evb.dts    |  59 +-
 .../dts/rockchip/rk3588-coolpi-cm5-genbook.dts     |  63 +-
 .../arm64/boot/dts/rockchip/rk3588-coolpi-cm5.dtsi |   8 +-
 .../dts/rockchip/rk3588-edgeble-neu6a-common.dtsi  |   6 +-
 .../boot/dts/rockchip/rk3588-edgeble-neu6a-io.dtsi |   8 +-
 .../dts/rockchip/rk3588-edgeble-neu6a-wifi.dtso    |   2 +-
 arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dts   |  22 +-
 arch/arm64/boot/dts/rockchip/rk3588-fet3588-c.dtsi |  12 +-
 .../rockchip/rk3588-friendlyelec-cm3588-nas.dts    |  47 ++
 arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts     |  20 +-
 .../boot/dts/rockchip/rk3588-nanopc-t6-lts.dts     |   2 +-
 arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dts  |   2 +-
 arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi |  54 +-
 arch/arm64/boot/dts/rockchip/rk3588-ok3588-c.dts   |  14 +-
 .../boot/dts/rockchip/rk3588-orangepi-5-plus.dts   |  15 +-
 .../arm64/boot/dts/rockchip/rk3588-quartzpro64.dts |  14 +-
 arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts    |  12 +-
 .../boot/dts/rockchip/rk3588-tiger-haikou.dts      |  14 +-
 arch/arm64/boot/dts/rockchip/rk3588-tiger.dtsi     |   6 +-
 .../arm64/boot/dts/rockchip/rk3588-toybrick-x0.dts |  20 +-
 .../arm64/boot/dts/rockchip/rk3588-turing-rk1.dtsi |   6 +-
 arch/arm64/boot/dts/rockchip/rk3588s-coolpi-4b.dts |  67 +-
 .../boot/dts/rockchip/rk3588s-gameforce-ace.dts    |  10 +-
 .../boot/dts/rockchip/rk3588s-indiedroid-nova.dts  |  69 +-
 .../boot/dts/rockchip/rk3588s-khadas-edge2.dts     |  10 +-
 .../arm64/boot/dts/rockchip/rk3588s-nanopi-r6.dtsi |  68 +-
 arch/arm64/boot/dts/rockchip/rk3588s-odroid-m2.dts |  47 ++
 .../arm64/boot/dts/rockchip/rk3588s-orangepi-5.dts |   2 +-
 .../boot/dts/rockchip/rk3588s-orangepi-5.dtsi      |   6 +-
 arch/arm64/boot/dts/rockchip/rk3588s-rock-5a.dts   |  12 +-
 arch/arm64/boot/dts/rockchip/rk3588s-rock-5c.dts   | 920 +++++++++++++++++++++
 128 files changed, 2674 insertions(+), 775 deletions(-)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3308-bpi-p2-pro.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3566-base.dtsi
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3566t.dtsi
 rename arch/arm64/boot/dts/rockchip/{rk356x.dtsi => rk356x-base.dtsi} (96%)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588s-rock-5c.dts





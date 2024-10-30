Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90BFFD3A67D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Oct 2024 09:25:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=uu3ZQracmyXKjnGtslK36vhe3Y/Ue/aAIyzqKHVzdsY=; b=Ux+xx2YDDnAKc4b+J1oNZGLmh/
	usIPR8IqXiPmWiekSdve4+9Jr0IngxKLKEWyIOcD3EZr44adjkDycvHMgTmvxAIarB6pLn27tcP8t
	MQYDBUZU94dw+GMUpQtAuBVemQ75TYTsaOd20Dhk3Lh3cH1P2YwV37rv13wLXgsuj9zuSPGna+9BO
	t880q8f5iV9ma64LRqwZwB9sSQzFwLruPfp/beI+YnvJLhg/KGHUTc6E6iMfevsCVT7kF2YMGBPQC
	jwqIkRepWuvq/9UotbXU/PJnse6eVVMv/ps5uBjzicpSStPQLlEzRCV8nn5OJLYw+zpfIld6xx+bK
	tFMP8ihg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t64wr-0000000HO28-40xP;
	Wed, 30 Oct 2024 09:25:05 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t64vD-0000000HNnq-3ZJp;
	Wed, 30 Oct 2024 09:23:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=uu3ZQracmyXKjnGtslK36vhe3Y/Ue/aAIyzqKHVzdsY=; b=BXxPM5+jpoGcUKORcsXdRBepu3
	VsUAQjfYp6DpRGj3Nx+fwQFDWv2PNrqy2ScIOylM0xnjKlIBMfrgMyurwgcGuHat1nlK1sWmYs/Qb
	c5/mTSVE+ejo8LcoAvtaVz+bLKWq7YLFJUmwP/fDqML7UN8qE6SB2MtwEwtal3N6+Y5AQJsraYNG8
	DzqxIiRP0DHGTtfh7IwjRynpeR7Ql42eBdF62DbSJr85SLfraKNqSKq7MMuk7qNlEmIQa79tdQ5Hy
	YCSPoEdazmCmq/7WDLWpq2oSPefi/Cg+o1sYAlWetjVyssCK1IGIw+zVLaUs9oRVsbL/85ruRGy5F
	uhuwlb7Q==;
Received: from [185.156.123.69] (helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1t64v9-0000kI-Mz; Wed, 30 Oct 2024 10:23:19 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: arm@kernel.org
Cc: soc@kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Rockchip dts64 changes for 6.13 #1
Date: Wed, 30 Oct 2024 10:23:18 +0100
Message-ID: <12542111.O9o76ZdvQC@phil>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241030_022324_253116_350A66F6 
X-CRM114-Status: GOOD (  18.06  )
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

please find below and in a subsequent pull-requests
Rockchip changes for for 6.13 .

Some new boards, some new peripherals and the rk3588 hdmi support
as the really notable thing, now people can see all the fancy
panthor (mali) results using the mainline kernel without needing
additional patches.


Please pull.
Thanks
Heiko


The following changes since commit 9852d85ec9d492ebef56dc5f229416c925758edc:

  Linux 6.12-rc1 (2024-09-29 15:06:19 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v6.13-armsoc/dts64-1

for you to fetch changes up to 46fa3fee0b1c027862b04717b51630195c253a30:

  arm64: dts: rockchip: Add rk3588-orangepi-5b device tree (2024-10-25 08:48:01 +0200)

----------------------------------------------------------------
New SoCs: basic RK3528 support, RK3399S - a variant made specifically
for the Pinephone Pro and for consistencies sake it gets its own SoC
dtsi to not hide the specifics in the Pinephone Pro devicetree.

New boards: OrangePi-5b, NanoPi R3S, ArmSom Sige 5 (first rk3576 board),
Radxa e20c (first rk3528 board), Powkiddy RGB20SX, RK3588S-EVB1 and
the ArmSoM LM7 SoM with W3 carrier board.

HDMI support for rk3588 brings the first graphical output capability
there. This includes of course needed changes to a number of boards.

And finally a bunch of newly enabled peripherals on different boards,
as well as changes to adhere better to bindings and removal/change of
deprecated properties.

----------------------------------------------------------------
Cenk Uluisik (3):
      arm64: dts: rockchip: refactor common Orange Pi 5 board
      dt-bindings: arm: rockchip: Add Orange Pi 5b enum to Orange Pi 5 entry
      arm64: dts: rockchip: Add rk3588-orangepi-5b device tree

Chris Morgan (2):
      dt-bindings: arm: rockchip: Add Powkiddy RGB20SX
      arm64: dts: rockchip: Add Powkiddy RGB20SX

Cristian Ciocaltea (5):
      arm64: dts: rockchip: Add HDMI0 node to rk3588
      arm64: dts: rockchip: Enable HDMI0 on rock-5b
      arm64: dts: rockchip: Enable HDMI0 on rk3588-evb1
      arm64: dts: rockchip: Enable HDMI0 on orangepi-5-plus
      arm64: dts: rockchip: Enable HDMI0 on rock-5a

Damon Ding (2):
      dt-bindings: arm: rockchip: Add RK3588S EVB1 board
      arm64: dts: rockchip: Add RK3588S EVB1 board

Daniel Semkowicz (1):
      arm64: dts: rockchip: Add power button for puma-haikou

Detlev Casanova (3):
      dt-bindings: arm: rockchip: Add ArmSoM Sige 5
      arm64: dts: rockchip: Add rk3576 SoC base DT
      arm64: dts: rockchip: Add rk3576-armsom-sige5 board

Diederik de Haas (5):
      arm64: dts: rockchip: Drop rockchip prefix of s-p-c PMIC prop from px30
      arm64: dts: rockchip: Drop rockchip prefix of s-p-c PMIC prop from rk3328
      arm64: dts: rockchip: Drop rockchip prefix of s-p-c PMIC prop from rk3368
      arm64: dts: rockchip: Drop rockchip prefix of s-p-c PMIC prop from rk3399
      arm64: dts: rockchip: Drop rockchip prefix of s-p-c PMIC prop from rk356x

Dragan Simic (2):
      arm64: dts: rockchip: Convert dts files used as parents to dtsi files
      arm64: dts: rockchip: Add dtsi file for RK3399S SoC variant

FUKAUMI Naoki (2):
      arm64: dts: rockchip: add LED_FUNCTION_STATUS for RGB LEDs on Radxa E25
      arm64: dts: rockchip: add and enable gpu node for Radxa ROCK 5A

Farouk Bouabid (4):
      arm64: dts: rockchip: add tsd,mule-i2c-mux on rk3588-jaguar
      arm64: dts: rockchip: add tsd,mule-i2c-mux on rk3399-puma
      arm64: dts: rockchip: add tsd,mule-i2c-mux on rk3588-tiger
      arm64: dts: rockchip: add tsd,mule-i2c-mux on px30-ringneck

Florian Klink (1):
      arm64: dts: rockchip: enable automatic fan control on Orange Pi 5+

Geert Uytterhoeven (2):
      arm64: dts: rockchip: Switch to simple-audio-card,hp-det-gpios
      arm64: dts: rockchip: Switch to hp-det-gpios

Heiko Stuebner (5):
      arm64: dts: rockchip: fix the pcie refclock oscillator on Rock 5 ITX
      arm64: dts: rockchip: add HDMI pinctrl to rk3588-tiger SoM
      arm64: dts: rockchip: add HDMI support to rk3588-tiger-haikou
      arm64: dts: rockchip: add HDMI support to rk3588-jaguar
      arm64: dts: rockchip: Remove 'enable-active-low' from two boards

Jacobe Zang (1):
      arm64: dts: rockchip: Add AP6275P wireless support to Khadas Edge 2

Jakob Unterwurzacher (1):
      arm64: dts: rockchip: add attiny_rst_gate to Ringneck

Jianfeng Liu (3):
      dt-bindings: arm: rockchip: Add ArmSoM LM7 SoM
      arm64: dts: rockchip: Add ArmSoM LM7 SoM
      arm64: dts: rockchip: Add ArmSoM W3 board

Jimmy Hon (4):
      arm64: dts: rockchip: Enable HDMI0 on Orange Pi 5
      arm64: dts: rockchip: analog audio on Orange Pi 5
      arm64: dts: rockchip: reorder audio/hdmi nodes in Orange Pi 5
      arm64: dts: rockchip: pwm-leds for Orange Pi 5

Johan Jonker (2):
      arm64: dts: rockchip: fix compatible string rk3328 cru node
      arm64: rockchip: add clocks property to cru node rk3328

Marcin Juszkiewicz (1):
      arm64: dts: rockchip: Enable HDMI0 on rk3588-nanopc-t6

Sam Edwards (5):
      arm64: dts: rockchip: Split up RK3588's PCIe pinctrls
      arm64: dts: rockchip: Fix Turing RK1 PCIe3 hang
      arm64: dts: rockchip: Enable automatic fan control on Turing RK1
      arm64: dts: rockchip: Enable GPU on Turing RK1
      arm64: dts: rockchip: Enable all 3 USBs on Turing RK1

Tianling Shen (7):
      dt-bindings: arm: rockchip: Add FriendlyARM NanoPi R3S
      arm64: dts: rockchip: Add FriendlyARM NanoPi R3S board
      arm64: dts: rockchip: fix model name for FriendlyElec NanoPi R3S
      arm64: dts: rockchip: replace deprecated snps,reset props for NanoPi R3S
      arm64: dts: rockchip: sort props in pmu_io_domains node for NanoPi R3S
      arm64: dts: rockchip: enable eMMC HS200 mode for NanoPi R3S
      arm64: dts: rockchip: reorder mmc aliases for NanoPi R3S

Yao Zi (3):
      dt-bindings: arm: rockchip: Add Radxa E20C board
      arm64: dts: rockchip: Add base DT for rk3528 SoC
      arm64: dts: rockchip: Add Radxa e20c board

 .../devicetree/bindings/arm/rockchip.yaml          |   32 +-
 arch/arm64/boot/dts/rockchip/Makefile              |    7 +
 .../boot/dts/rockchip/px30-engicam-px30-core.dtsi  |    2 +-
 arch/arm64/boot/dts/rockchip/px30-evb.dts          |    2 +-
 .../boot/dts/rockchip/px30-firefly-jd4-core.dtsi   |    2 +-
 arch/arm64/boot/dts/rockchip/px30-ringneck.dtsi    |   37 +-
 .../boot/dts/rockchip/rk3326-anbernic-rg351m.dtsi  |    2 +-
 .../boot/dts/rockchip/rk3326-gameforce-chi.dts     |    2 +-
 arch/arm64/boot/dts/rockchip/rk3326-odroid-go.dtsi |    2 +-
 arch/arm64/boot/dts/rockchip/rk3328-a1.dts         |    2 +-
 arch/arm64/boot/dts/rockchip/rk3328-evb.dts        |    2 +-
 arch/arm64/boot/dts/rockchip/rk3328-nanopi-r2.dtsi |  394 ++
 .../boot/dts/rockchip/rk3328-nanopi-r2c-plus.dts   |    3 +-
 arch/arm64/boot/dts/rockchip/rk3328-nanopi-r2c.dts |   28 +-
 .../arm64/boot/dts/rockchip/rk3328-nanopi-r2c.dtsi |   35 +
 .../boot/dts/rockchip/rk3328-nanopi-r2s-plus.dts   |   20 +-
 arch/arm64/boot/dts/rockchip/rk3328-nanopi-r2s.dts |  399 +-
 .../arm64/boot/dts/rockchip/rk3328-nanopi-r2s.dtsi |   29 +
 .../dts/rockchip/rk3328-orangepi-r1-plus-lts.dts   |    6 +-
 .../boot/dts/rockchip/rk3328-orangepi-r1-plus.dts  |  346 +-
 .../boot/dts/rockchip/rk3328-orangepi-r1-plus.dtsi |  358 ++
 arch/arm64/boot/dts/rockchip/rk3328-roc-cc.dts     |  379 +-
 arch/arm64/boot/dts/rockchip/rk3328-roc-pc.dts     |    3 +-
 arch/arm64/boot/dts/rockchip/rk3328-roc.dtsi       |  377 ++
 arch/arm64/boot/dts/rockchip/rk3328-rock-pi-e.dts  |    2 +-
 arch/arm64/boot/dts/rockchip/rk3328-rock64.dts     |    2 +-
 arch/arm64/boot/dts/rockchip/rk3328.dtsi           |    4 +-
 arch/arm64/boot/dts/rockchip/rk3368-geekbox.dts    |    2 +-
 arch/arm64/boot/dts/rockchip/rk3368-lba3368.dts    |    2 +-
 arch/arm64/boot/dts/rockchip/rk3368-lion.dtsi      |    2 +-
 arch/arm64/boot/dts/rockchip/rk3368-px5-evb.dts    |    2 +-
 arch/arm64/boot/dts/rockchip/rk3399-eaidk-610.dts  |    4 +-
 arch/arm64/boot/dts/rockchip/rk3399-evb.dts        |    2 +-
 arch/arm64/boot/dts/rockchip/rk3399-firefly.dts    |    2 +-
 arch/arm64/boot/dts/rockchip/rk3399-hugsun-x99.dts |    2 +-
 .../boot/dts/rockchip/rk3399-khadas-edge.dtsi      |    2 +-
 .../boot/dts/rockchip/rk3399-kobol-helios64.dts    |    2 +-
 arch/arm64/boot/dts/rockchip/rk3399-leez-p710.dts  |    2 +-
 arch/arm64/boot/dts/rockchip/rk3399-nanopi-m4.dts  |   47 +-
 arch/arm64/boot/dts/rockchip/rk3399-nanopi-m4.dtsi |   60 +
 arch/arm64/boot/dts/rockchip/rk3399-nanopi-m4b.dts |    3 +-
 .../dts/rockchip/rk3399-nanopi-r4s-enterprise.dts  |    3 +-
 arch/arm64/boot/dts/rockchip/rk3399-nanopi-r4s.dts |  124 +-
 .../arm64/boot/dts/rockchip/rk3399-nanopi-r4s.dtsi |  131 +
 arch/arm64/boot/dts/rockchip/rk3399-nanopi4.dtsi   |    2 +-
 arch/arm64/boot/dts/rockchip/rk3399-orangepi.dts   |    2 +-
 .../boot/dts/rockchip/rk3399-pinebook-pro.dts      |    4 +-
 .../boot/dts/rockchip/rk3399-pinephone-pro.dts     |   25 +-
 .../arm64/boot/dts/rockchip/rk3399-puma-haikou.dts |    8 +
 arch/arm64/boot/dts/rockchip/rk3399-puma.dtsi      |   26 +-
 .../arm64/boot/dts/rockchip/rk3399-roc-pc-plus.dts |    2 +-
 arch/arm64/boot/dts/rockchip/rk3399-roc-pc.dtsi    |    2 +-
 .../boot/dts/rockchip/rk3399-rock-4c-plus.dts      |    2 +-
 arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4.dtsi |    2 +-
 .../boot/dts/rockchip/rk3399-rock-pi-4a-plus.dts   |    2 +-
 .../boot/dts/rockchip/rk3399-rock-pi-4b-plus.dts   |    2 +-
 arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4c.dts |    2 +-
 arch/arm64/boot/dts/rockchip/rk3399-rock960.dtsi   |    2 +-
 arch/arm64/boot/dts/rockchip/rk3399-rockpro64.dtsi |    2 +-
 arch/arm64/boot/dts/rockchip/rk3399-s.dtsi         |  123 +
 .../dts/rockchip/rk3399-sapphire-excavator.dts     |    2 +-
 arch/arm64/boot/dts/rockchip/rk3399-sapphire.dtsi  |    2 +-
 .../boot/dts/rockchip/rk3399pro-vmarc-som.dtsi     |    2 +-
 arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dts |   22 +
 arch/arm64/boot/dts/rockchip/rk3528.dtsi           |  189 +
 .../boot/dts/rockchip/rk3566-anbernic-rg-arc.dtsi  |    2 +-
 .../boot/dts/rockchip/rk3566-anbernic-rg353p.dts   |    2 +-
 .../boot/dts/rockchip/rk3566-anbernic-rg353ps.dts  |    2 +-
 .../boot/dts/rockchip/rk3566-anbernic-rg353v.dts   |    2 +-
 .../boot/dts/rockchip/rk3566-anbernic-rg353vs.dts  |    2 +-
 .../boot/dts/rockchip/rk3566-anbernic-rg503.dts    |    2 +-
 arch/arm64/boot/dts/rockchip/rk3566-lckfb-tspi.dts |    2 +-
 arch/arm64/boot/dts/rockchip/rk3566-lubancat-1.dts |    2 +-
 arch/arm64/boot/dts/rockchip/rk3566-nanopi-r3s.dts |  554 ++
 arch/arm64/boot/dts/rockchip/rk3566-pinenote.dtsi  |    2 +-
 arch/arm64/boot/dts/rockchip/rk3566-pinetab2.dtsi  |    4 +-
 .../boot/dts/rockchip/rk3566-powkiddy-rgb20sx.dts  |   89 +
 .../boot/dts/rockchip/rk3566-powkiddy-x55.dts      |    2 +-
 arch/arm64/boot/dts/rockchip/rk3566-quartz64-a.dts |    2 +-
 arch/arm64/boot/dts/rockchip/rk3566-quartz64-b.dts |    2 +-
 arch/arm64/boot/dts/rockchip/rk3566-radxa-cm3.dtsi |    2 +-
 arch/arm64/boot/dts/rockchip/rk3566-roc-pc.dts     |    2 +-
 arch/arm64/boot/dts/rockchip/rk3566-soquartz.dtsi  |    2 +-
 arch/arm64/boot/dts/rockchip/rk3568-bpi-r2-pro.dts |    2 +-
 arch/arm64/boot/dts/rockchip/rk3568-evb1-v10.dts   |    2 +-
 .../boot/dts/rockchip/rk3568-fastrhino-r66s.dtsi   |    2 +-
 arch/arm64/boot/dts/rockchip/rk3568-lubancat-2.dts |    2 +-
 .../arm64/boot/dts/rockchip/rk3568-nanopi-r5s.dtsi |    2 +-
 arch/arm64/boot/dts/rockchip/rk3568-odroid-m1.dts  |    4 +-
 .../arm64/boot/dts/rockchip/rk3568-radxa-cm3i.dtsi |    2 +-
 arch/arm64/boot/dts/rockchip/rk3568-radxa-e25.dts  |    1 +
 arch/arm64/boot/dts/rockchip/rk3568-roc-pc.dts     |    2 +-
 arch/arm64/boot/dts/rockchip/rk3568-rock-3a.dts    |    2 +-
 .../rk3568-wolfvision-pf5-io-expander.dtso         |    1 -
 .../boot/dts/rockchip/rk3568-wolfvision-pf5.dts    |    2 +-
 .../boot/dts/rockchip/rk3576-armsom-sige5.dts      |  659 +++
 arch/arm64/boot/dts/rockchip/rk3576-pinctrl.dtsi   | 5775 ++++++++++++++++++++
 arch/arm64/boot/dts/rockchip/rk3576.dtsi           | 1678 ++++++
 .../arm64/boot/dts/rockchip/rk3588-armsom-lm7.dtsi |  455 ++
 .../boot/dts/rockchip/rk3588-armsom-sige7.dts      |    2 +-
 arch/arm64/boot/dts/rockchip/rk3588-armsom-w3.dts  |  408 ++
 .../boot/dts/rockchip/rk3588-base-pinctrl.dtsi     |  271 +-
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi      |   41 +
 arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dts   |   49 +-
 .../rockchip/rk3588-friendlyelec-cm3588-nas.dts    |    2 +-
 arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts     |   75 +-
 arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi |   49 +-
 arch/arm64/boot/dts/rockchip/rk3588-ok3588-c.dts   |    2 +-
 .../boot/dts/rockchip/rk3588-orangepi-5-plus.dts   |   79 +-
 .../arm64/boot/dts/rockchip/rk3588-quartzpro64.dts |    2 +-
 arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dts |   40 +-
 arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts    |   49 +-
 .../boot/dts/rockchip/rk3588-tiger-haikou.dts      |   53 +
 arch/arm64/boot/dts/rockchip/rk3588-tiger.dtsi     |   29 +-
 .../arm64/boot/dts/rockchip/rk3588-turing-rk1.dtsi |  138 +-
 arch/arm64/boot/dts/rockchip/rk3588s-evb1-v10.dts  | 1170 ++++
 .../boot/dts/rockchip/rk3588s-gameforce-ace.dts    |    2 +-
 .../boot/dts/rockchip/rk3588s-khadas-edge2.dts     |   16 +
 .../arm64/boot/dts/rockchip/rk3588s-nanopi-r6.dtsi |  760 +++
 .../arm64/boot/dts/rockchip/rk3588s-nanopi-r6c.dts |    2 +-
 .../arm64/boot/dts/rockchip/rk3588s-nanopi-r6s.dts |  756 +--
 .../arm64/boot/dts/rockchip/rk3588s-orangepi-5.dts |  736 +--
 .../boot/dts/rockchip/rk3588s-orangepi-5.dtsi      |  866 +++
 .../boot/dts/rockchip/rk3588s-orangepi-5b.dts      |   19 +
 arch/arm64/boot/dts/rockchip/rk3588s-rock-5a.dts   |   63 +-
 125 files changed, 15260 insertions(+), 2981 deletions(-)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3328-nanopi-r2.dtsi
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3328-nanopi-r2c.dtsi
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3328-nanopi-r2s.dtsi
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3328-orangepi-r1-plus.dtsi
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3328-roc.dtsi
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3399-nanopi-m4.dtsi
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3399-nanopi-r4s.dtsi
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3399-s.dtsi
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3528.dtsi
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3566-nanopi-r3s.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3566-powkiddy-rgb20sx.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3576-pinctrl.dtsi
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3576.dtsi
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588-armsom-lm7.dtsi
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588-armsom-w3.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588s-evb1-v10.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6.dtsi
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dtsi
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5b.dts





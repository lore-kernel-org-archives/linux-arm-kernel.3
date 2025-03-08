Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65040C28B28
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Mar 2025 18:23:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=uSMLLjyc1MHrpzhSX2iWbflDQD3yY1sfNAMg18WOH80=; b=YTxRyquIqNwd3WCle3Uj8ntcuy
	GPUZpV52dYVVoGTcBOs38Pz0GJMFmYJGlBLxEmMw17beULXSqvvOxoQDxi832o+oDtAOOAcAY4hYl
	CRw8Xdk327jq1/3dYhTB8anDg0PrLjvAsEtWP580jY7W4V9fwIdNcgs1xAZYk7qCqf67D4+khadKn
	j8yzS1GI66usAbGM0iY1ZmwRun0mYf6qpXqAzfp6Iri10hbvEXmyRcO6LOwZ5eZxUCTP74BxPXxIF
	sqek56bQyjKSZktgcKV0UmDrcQQtw7UMT7sV5HvOIamwlaDH+vDsXxqidpdESzp1BPPqwwuqpFt9j
	9V9ZbZoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqypr-0000000GzO3-1785;
	Sat, 08 Mar 2025 18:23:43 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqyoD-0000000GzGL-1KFQ;
	Sat, 08 Mar 2025 18:22:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=uSMLLjyc1MHrpzhSX2iWbflDQD3yY1sfNAMg18WOH80=; b=2JKsvgjmq15ffgOgEQyFBpJ5ID
	18QUWZGVj7VmF6fy7WtX6Kd2j0ZklNU24RZRRyxSNo/wSANxAv8vEnFsExjvewU4tQETKfUauEd4g
	iH7fYofgmEKIrnurORdQM0BpkCcMFSSZXCd3B9KQKMqYdOqOasf0YnOxU1GkzPWQHaflYQlX8wU7U
	q/Dh8PrQ5va2RLO+PAwCBFrf6S08gz8jQcL/eLRayymck2GGVjzmp/ov2GRXa7PJ23mMIax5GM+zM
	jU8JmwiaB1lkgFj5xbdFxV3DDls2ZD7HcirHV119Ipu+xRqmXhTthzwA5afDlAFwO0b2Q7J62N9Lt
	TssqP6Pg==;
Received: from [194.95.143.137] (helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tqyoB-00050G-TA; Sat, 08 Mar 2025 19:21:59 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: arm@kernel.org
Cc: soc@kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Rockchip dts64 changes for 6.15 #1
Date: Sat, 08 Mar 2025 19:21:59 +0100
Message-ID: <13791512.uLZWGnKmhe@phil>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250308_102201_649973_AB8D9FCA 
X-CRM114-Status: GOOD (  21.57  )
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

please find below and in a subsequent pull-requests
Rockchip changes for for 6.15 .

It looks like the new year caused a flurry of activity, because
I don't remember having this much changes :-) .

Again, there haven't been arm32 changes this time around (so far)


Please pull.
Thanks
Heiko



The following changes since commit 2014c95afecee3e76ca4a56956a936e23283f05b:

  Linux 6.14-rc1 (2025-02-02 15:39:26 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v6.15-rockchip-dts64-1

for you to fetch changes up to ba82f56bbf20e4166c988621cd0507509872848e:

  arm64: dts: rockchip: Add SPI NOR device on the ROCK 4D (2025-03-08 18:19:59 +0100)

----------------------------------------------------------------
New boards: MNT-Reform2 laptop (rk3588), OrangePi5-Ultra (rk3588),
Radxa Rock 4D (rk3576), Firefly ROC-RK3576-PC, Photonicat (rk3568)

New overlays: Video-adapters for Theobroma boards and one adapter used
in hw test scenarios.

Interesting bigger changes contain clock support for rk3528; support for
the hdmi1 controller as well as hdmi-audio support on both controllers on
rk3588; the hdmi-receiver of the rk3588 landed, and rk3576 got basic
graphics support and can now do hdmi output.

Another big block is that we're now doing overlays way better and are
including build-testing for applied overlays to the base dtb - similar
to how other arches already do this.

Of cours a big list of more controllers for rk3576 (nvmem, sfc), rk3588
(rng, spdif, regulator for gpu power-domain) and rk3528 (saradc, pinctrl)

And a huge number of board-level improvements and additions.

----------------------------------------------------------------
Alexey Charkov (5):
      arm64: dts: rockchip: Add finer-grained PWM states for the fan on Rock 5C
      arm64: dts: rockchip: Enable automatic fan control on Radxa Rock 5C
      arm64: dts: rockchip: switch Rock 5C to PMIC-based TSHUT reset
      arm64: dts: rockchip: Add SPDIF nodes to RK3588(s) device trees
      arm64: dts: rockchip: Enable SPDIF output on H96 Max V58

Andy Yan (5):
      arm64: dts: rockchip: Enable USB3 OTG on rk3588s Cool Pi 4B
      arm64: dts: rockchip: Add vop for rk3576
      arm64: dts: rockchip: Add hdmi for rk3576
      arm64: dts: rockchip: Enable hdmi display on sige5
      arm64: dts: rockchip: Enable hdmi out display for rk3576-evb-v10

Chris Morgan (1):
      arm64: dts: rockchip: remove rk3588 optee node

Chukun Pan (3):
      dt-bindings: mfd: syscon: Add rk3528 QoS register compatible
      arm64: dts: rockchip: Add rk3528 QoS register node
      arm64: dts: rockchip: enable SCMI clk for RK3528 SoC

Cristian Ciocaltea (8):
      arm64: dts: rockchip: Enable HDMI0 PHY clk provider on RK3588
      arm64: dts: rockchip: Add HDMI0 PHY PLL clock source to VOP2 on RK3588
      arm64: dts: rockchip: Add PHY node for HDMI1 TX port on RK3588
      arm64: dts: rockchip: Add HDMI1 node on RK3588
      arm64: dts: rockchip: Enable HDMI1 on rock-5b
      arm64: dts: rockchip: Enable HDMI1 PHY clk provider on RK3588
      arm64: dts: rockchip: Add HDMI1 PHY PLL clock source to VOP2 on RK3588
      arm64: dts: rockchip: Enable HDMI1 on rk3588-evb1

Damon Ding (1):
      arm64: dts: rockchip: Fix label name of hdptxphy for RK3588

Detlev Casanova (6):
      dt-bindings: arm: rockchip: Add Radxa ROCK 4D board
      arm64: dts: rockchip: Add HDMI audio outputs for rk3588
      arm64: dts: rockchip: Enable HDMI audio outputs for Rock 5B
      arm64: dts: rockchip: Add HDMI support for rock-4d
      arm64: dts: rockchip: Add SFC nodes for rk3576
      arm64: dts: rockchip: Add SPI NOR device on the ROCK 4D

Diederik de Haas (1):
      arm64: dts: rockchip: add 'chassis-type' property on PineNote

Dragan Simic (3):
      arm64: dts: rockchip: Describe why is HWRNG disabled in RK356x base dtsi
      arm64: dts: rockchip: Use "dma-noncoherent" in base RK3588 SoC dtsi
      arm64: dts: rockchip: linewrap gmac assigned-clocks on Quartz64 Model A/B files a bit

FUKAUMI Naoki (1):
      arm64: dts: rockchip: Enable USB OTG for Radxa ROCK Pi E

Heiko Stuebner (5):
      dt-bindings: arm: rockchip: Add Firefly ROC-RK3576-PC binding
      arm64: dts: rockchip: Add devicetree for the ROC-RK3576-PC
      arm64: dts: rockchip: add rk3576 otp node
      Merge branch 'v6.15-shared/clkids' into v6.15-armsoc/dts64
      arm64: dts: rockchip: add usb typec host support to rk3588-jaguar

Jagan Teki (1):
      arm64: dts: rockchip: Enable HDMI1 out for Edgeble-6TOPS Modules

Jianfeng Liu (2):
      arm64: dts: rockchip: Enable HDMI on armsom-sige7
      arm64: dts: rockchip: add hdmi1 support to ROCK 5 ITX

Jimmy Hon (6):
      arm64: dts: rockchip: Enable HDMI1 on Orange Pi 5 Max
      arm64: dts: rockchip: Adapt to differences between Orange Pi 5 Max and Ultra
      dt-bindings: arm: rockchip: Add Xunlong Orange Pi 5 Ultra
      arm64: dts: rockchip: Add Orange Pi 5 Ultra board
      arm64: dts: rockchip: Enable HDMI1 on Orange Pi 5 Ultra
      arm64: dts: rockchip: Enable HDMI1 audio output for Orange Pi 5 Ultra

Jonas Karlman (7):
      dt-bindings: soc: rockchip: Add RK3528 ioc grf syscon
      arm64: dts: rockchip: Add pinctrl and gpio nodes for RK3528
      arm64: dts: rockchip: Add uart0 pinctrl to Radxa E20C
      arm64: dts: rockchip: Add leds node to Radxa E20C
      arm64: dts: rockchip: Add user button to Radxa E20C
      arm64: dts: rockchip: Add SARADC node for RK3528
      arm64: dts: rockchip: Add maskrom button to Radxa E20C

Junhao Xie (3):
      dt-bindings: vendor-prefixes: Add prefix for Ariaboard
      dt-bindings: arm: rockchip: Add Ariaboard Photonicat RK3568
      arm64: dts: rockchip: add dts for Ariaboard Photonicat RK3568

Kever Yang (1):
      dt-bindings: vendor-prefixes: Update rockchip company name

Krzysztof Kozlowski (2):
      arm64: dts: rockchip: Add ES8388 audio codec fallback on RK3399 ROC PC PLUS
      arm64: dts: rockchip: Add ES8388 audio codec fallback on RK3588 boards

Nicolas Frattaroli (1):
      arm64: dts: rockchip: Add rng node to RK3588

Patrick Wildt (2):
      dt-bindings: arm: rockchip: Add MNT Reform 2 (RCORE)
      arm64: dts: rockchip: add MNT Reform 2 laptop

Quentin Schulz (17):
      arm64: dts: rockchip: add support for sound output over HDMI on RK3399 Puma Haikou
      arm64: dts: rockchip: add overlay test for WolfVision PF5
      arm64: dts: rockchip: add overlay test for Edgeble NCM6A/NCM6B
      arm64: dts: rockchip: add overlay tests for Rock 5B PCIe overlays
      arm64: dts: rockchip: minimal support for Pre-ICT tester adapter for RK3588 Jaguar
      arm64: dts: rockchip: add support for HAIKOU-LVDS-9904379 adapter for PX30 Ringneck
      arm64: dts: rockchip: add overlay for PX30 Ringneck Haikou Video Demo adapter
      arm64: dts: rockchip: add overlay for RK3399 Puma Haikou Video Demo adapter
      arm64: dts: rockchip: enable UART5 on RK3588 Tiger Haikou
      arm64: dts: rockchip: move DDC bus from Haikou carrierboard to RK3399 Puma DTSI
      arm64: dts: rockchip: move I2C6 from Haikou carrierboard to Puma DTSI
      arm64: dts: rockchip: disable I2C6 on Puma DTSI
      arm64: dts: rockchip: enable I2S0 in Haikou carrierboard, not Puma DTSI
      arm64: dts: rockchip: add EEPROM found on RK3399 Puma Haikou
      arm64: dts: rockchip: enable Ethernet in Haikou carrierboard, not Puma DTSI
      arm64: dts: rockchip: enable I2C3 in Haikou carrierboard, not Ringneck DTSI
      arm64: dts: rockchip: disable I2C2 bus by default on RK3588 Tiger

Sebastian Reichel (2):
      arm64: dts: rockchip: Add GPU power domain regulator dependency for RK3588
      arm64: dts: rockchip: Enable HDMI receiver on rock-5b

Shreeya Patel (1):
      arm64: dts: rockchip: Add device tree support for HDMI RX Controller

Stephen Chen (1):
      arm64: dts: rockchip: Add Radxa ROCK 4D device tree

Yao Zi (5):
      dt-bindings: clock: Document clock and reset unit of RK3528
      arm64: dts: rockchip: Add clock generators for RK3528 SoC
      arm64: dts: rockchip: Add UART clocks for RK3528 SoC
      dt-bindings: soc: rockchip: Add RK3528 VO GRF syscon
      dt-bindings: soc: rockchip: Add RK3528 VPU GRF syscon

 .../devicetree/bindings/arm/rockchip.yaml          |   25 +-
 .../bindings/clock/rockchip,rk3528-cru.yaml        |   64 +
 Documentation/devicetree/bindings/mfd/syscon.yaml  |    2 +
 .../devicetree/bindings/soc/rockchip/grf.yaml      |    3 +
 .../devicetree/bindings/vendor-prefixes.yaml       |    4 +-
 arch/arm64/boot/dts/rockchip/Makefile              |   63 +
 .../px30-ringneck-haikou-lvds-9904379.dtso         |  130 ++
 .../rockchip/px30-ringneck-haikou-video-demo.dtso  |  190 +++
 .../boot/dts/rockchip/px30-ringneck-haikou.dts     |    2 +
 arch/arm64/boot/dts/rockchip/px30-ringneck.dtsi    |    4 -
 arch/arm64/boot/dts/rockchip/rk3328-rock-pi-e.dts  |    8 +
 .../rockchip/rk3399-puma-haikou-video-demo.dtso    |  166 +++
 .../arm64/boot/dts/rockchip/rk3399-puma-haikou.dts |   26 +-
 arch/arm64/boot/dts/rockchip/rk3399-puma.dtsi      |   10 +-
 .../arm64/boot/dts/rockchip/rk3399-roc-pc-plus.dts |    2 +-
 arch/arm64/boot/dts/rockchip/rk3528-pinctrl.dtsi   | 1397 ++++++++++++++++++++
 arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dts |  118 ++
 arch/arm64/boot/dts/rockchip/rk3528.dtsi           |  354 ++++-
 arch/arm64/boot/dts/rockchip/rk3566-pinenote.dtsi  |    2 +
 arch/arm64/boot/dts/rockchip/rk3566-quartz64-a.dts |    8 +-
 arch/arm64/boot/dts/rockchip/rk3566-quartz64-b.dts |    8 +-
 arch/arm64/boot/dts/rockchip/rk3568-photonicat.dts |  588 ++++++++
 arch/arm64/boot/dts/rockchip/rk356x-base.dtsi      |    5 +
 .../boot/dts/rockchip/rk3576-armsom-sige5.dts      |   47 +
 arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dts   |   47 +
 arch/arm64/boot/dts/rockchip/rk3576-roc-pc.dts     |  736 +++++++++++
 arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dts    |  751 +++++++++++
 arch/arm64/boot/dts/rockchip/rk3576.dtsi           |  187 +++
 .../arm64/boot/dts/rockchip/rk3588-armsom-lm7.dtsi |    4 +
 .../boot/dts/rockchip/rk3588-armsom-sige7.dts      |   51 +
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi      |  110 +-
 .../boot/dts/rockchip/rk3588-coolpi-cm5-evb.dts    |    2 +-
 .../dts/rockchip/rk3588-coolpi-cm5-genbook.dts     |    2 +-
 .../arm64/boot/dts/rockchip/rk3588-coolpi-cm5.dtsi |    4 +
 .../dts/rockchip/rk3588-edgeble-neu6a-common.dtsi  |    4 +
 .../boot/dts/rockchip/rk3588-edgeble-neu6a-io.dtsi |   47 +
 arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dts   |   50 +-
 arch/arm64/boot/dts/rockchip/rk3588-extra.dtsi     |  186 +++
 arch/arm64/boot/dts/rockchip/rk3588-fet3588-c.dtsi |    4 +
 .../dts/rockchip/rk3588-firefly-core-3588j.dtsi    |    4 +
 .../dts/rockchip/rk3588-firefly-icore-3588q.dtsi   |  443 +++++++
 .../boot/dts/rockchip/rk3588-firefly-itx-3588j.dts |    2 +-
 .../rockchip/rk3588-friendlyelec-cm3588-nas.dts    |    2 +-
 .../dts/rockchip/rk3588-friendlyelec-cm3588.dtsi   |    4 +
 .../arm64/boot/dts/rockchip/rk3588-h96-max-v58.dts |   30 +-
 .../dts/rockchip/rk3588-jaguar-pre-ict-tester.dtso |  171 +++
 arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts     |  224 +++-
 .../arm64/boot/dts/rockchip/rk3588-mnt-reform2.dts |  336 +++++
 arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi |    6 +-
 arch/arm64/boot/dts/rockchip/rk3588-ok3588-c.dts   |    4 +
 .../dts/rockchip/rk3588-orangepi-5-compact.dtsi    |    9 -
 .../boot/dts/rockchip/rk3588-orangepi-5-max.dts    |   51 +-
 .../boot/dts/rockchip/rk3588-orangepi-5-plus.dts   |    2 +-
 .../boot/dts/rockchip/rk3588-orangepi-5-ultra.dts  |   83 ++
 .../arm64/boot/dts/rockchip/rk3588-orangepi-5.dtsi |    6 +-
 .../arm64/boot/dts/rockchip/rk3588-quartzpro64.dts |    6 +-
 arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dts |   53 +
 arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts    |   83 +-
 .../boot/dts/rockchip/rk3588-tiger-haikou.dts      |    4 +-
 arch/arm64/boot/dts/rockchip/rk3588-tiger.dtsi     |    5 +-
 .../arm64/boot/dts/rockchip/rk3588-toybrick-x0.dts |    4 +
 .../arm64/boot/dts/rockchip/rk3588-turing-rk1.dtsi |    4 +
 arch/arm64/boot/dts/rockchip/rk3588s-coolpi-4b.dts |   29 +-
 arch/arm64/boot/dts/rockchip/rk3588s-evb1-v10.dts  |    6 +-
 .../boot/dts/rockchip/rk3588s-gameforce-ace.dts    |    6 +-
 .../boot/dts/rockchip/rk3588s-indiedroid-nova.dts  |    8 +-
 .../boot/dts/rockchip/rk3588s-khadas-edge2.dts     |    4 +
 .../arm64/boot/dts/rockchip/rk3588s-nanopi-r6.dtsi |    6 +-
 arch/arm64/boot/dts/rockchip/rk3588s-odroid-m2.dts |    6 +-
 .../boot/dts/rockchip/rk3588s-orangepi-5.dtsi      |    8 +-
 arch/arm64/boot/dts/rockchip/rk3588s-rock-5a.dts   |    6 +-
 arch/arm64/boot/dts/rockchip/rk3588s-rock-5c.dts   |   42 +-
 include/dt-bindings/clock/rockchip,rk3528-cru.h    |  453 +++++++
 include/dt-bindings/reset/rockchip,rk3528-cru.h    |  241 ++++
 74 files changed, 7693 insertions(+), 69 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/rockchip,rk3528-cru.yaml
 create mode 100644 arch/arm64/boot/dts/rockchip/px30-ringneck-haikou-lvds-9904379.dtso
 create mode 100644 arch/arm64/boot/dts/rockchip/px30-ringneck-haikou-video-demo.dtso
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3399-puma-haikou-video-demo.dtso
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3528-pinctrl.dtsi
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3568-photonicat.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3576-roc-pc.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588-firefly-icore-3588q.dtsi
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588-jaguar-pre-ict-tester.dtso
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588-mnt-reform2.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-ultra.dts
 create mode 100644 include/dt-bindings/clock/rockchip,rk3528-cru.h
 create mode 100644 include/dt-bindings/reset/rockchip,rk3528-cru.h





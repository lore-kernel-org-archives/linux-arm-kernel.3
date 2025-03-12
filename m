Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D33FBC28B2E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Mar 2025 06:57:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IrZA2lvwXnim9dm71xs60MOqB4apIeEVzkWR+ebY1SQ=; b=W0Yqdvw7HrmtPe6OhCW7nUyfm9
	smOys9LEddhyjHtqyJxr1uD6k3W89GsSf1ZuGB6VuEayOzZHZXTTnMTtkrVllxLMXI/YticnrJHca
	225EngeY3kOudkA0VXUulsn3BG4HpSYgVFe1XrUf19yKnA/Ldx0qyq9TSY/jCq9499clQ3t1qKW85
	/R8+j0e7Wwdg8xZ/qDXQsBr7W1rfaklhoRGhyCJwXRwRWbBCDADID12DX6ZYm/B4I9s6Im0UsHioA
	+CuP4VL8XLTPLQm4ElO3Rkx0LV/Czehtlm9aHqqjYyCCODD1oOjzMpyFiELgwOHAWnAEso9VDyvWi
	mCLHjaZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsG1g-00000007e7n-1tsR;
	Wed, 12 Mar 2025 06:57:12 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsG01-00000007daw-1tfk;
	Wed, 12 Mar 2025 06:55:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=IrZA2lvwXnim9dm71xs60MOqB4apIeEVzkWR+ebY1SQ=; b=Exas6HGwVvktv7Ywakyjvfpfau
	Jp0JjJg7YKW3ykl6i9ItbLyHTmF6V0AgQh9cGkuWFS1gWOS+15otP1EiS+v6X2F/f9q/Cj3pyumr9
	R7Mk1x4PfnQoWi54vQGbsW6fSdz9sorjmNOGNoi7NCsdqAAhhiEQTc45F/NznzVygOuG9194D7lkO
	Pm5KewlHK2S97MiWWseERGdXANs9OHjbgbH4b6ih4Be6wsdIatwc9Rw7b/S8N5HTbk57fmAtY9xO+
	IVnyITgLpDZ2STUbm42FuqUbmuYAtJj2RRb5zjM3Ia0vjYNrWyuJIDmvAloyiBrE1DNqMDdSemhzc
	wz64nwXQ==;
Received: from ip-185-104-138-79.ptr.icomera.net ([185.104.138.79] helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tsFzz-0005cE-Uk; Wed, 12 Mar 2025 07:55:28 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: arm@kernel.org
Cc: soc@kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL] Rockchip dts64 changes for 6.15 #1
Date: Wed, 12 Mar 2025 07:55:25 +0100
Message-ID: <3339830.aeNJFYEL58@phil>
In-Reply-To: <13791512.uLZWGnKmhe@phil>
References: <13791512.uLZWGnKmhe@phil>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250311_235529_770251_45CCF790 
X-CRM114-Status: GOOD (  31.45  )
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

Hi,

Am Samstag, 8. M=C3=A4rz 2025, 19:21:59 MEZ schrieb Heiko Stuebner:
> Hi soc maintainers,
>=20
> please find below and in a subsequent pull-requests
> Rockchip changes for for 6.15 .
>=20
> It looks like the new year caused a flurry of activity, because
> I don't remember having this much changes :-) .

as a note, one Rockchip dts patch has slipped into the scsi tree,
and is causing an (easy to resolve) merge conflict.

So this should not cause an issue, but should probably be mentioned
in the 6.15 merge window soc PR.

See
https://lore.kernel.org/lkml/20250312085101.58cdd1e5@canb.auug.org.au/


Heiko

>=20
> Again, there haven't been arm32 changes this time around (so far)
>=20
>=20
> Please pull.
> Thanks
> Heiko
>=20
>=20
>=20
> The following changes since commit 2014c95afecee3e76ca4a56956a936e23283f0=
5b:
>=20
>   Linux 6.14-rc1 (2025-02-02 15:39:26 -0800)
>=20
> are available in the Git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git =
tags/v6.15-rockchip-dts64-1
>=20
> for you to fetch changes up to ba82f56bbf20e4166c988621cd0507509872848e:
>=20
>   arm64: dts: rockchip: Add SPI NOR device on the ROCK 4D (2025-03-08 18:=
19:59 +0100)
>=20
> ----------------------------------------------------------------
> New boards: MNT-Reform2 laptop (rk3588), OrangePi5-Ultra (rk3588),
> Radxa Rock 4D (rk3576), Firefly ROC-RK3576-PC, Photonicat (rk3568)
>=20
> New overlays: Video-adapters for Theobroma boards and one adapter used
> in hw test scenarios.
>=20
> Interesting bigger changes contain clock support for rk3528; support for
> the hdmi1 controller as well as hdmi-audio support on both controllers on
> rk3588; the hdmi-receiver of the rk3588 landed, and rk3576 got basic
> graphics support and can now do hdmi output.
>=20
> Another big block is that we're now doing overlays way better and are
> including build-testing for applied overlays to the base dtb - similar
> to how other arches already do this.
>=20
> Of cours a big list of more controllers for rk3576 (nvmem, sfc), rk3588
> (rng, spdif, regulator for gpu power-domain) and rk3528 (saradc, pinctrl)
>=20
> And a huge number of board-level improvements and additions.
>=20
> ----------------------------------------------------------------
> Alexey Charkov (5):
>       arm64: dts: rockchip: Add finer-grained PWM states for the fan on R=
ock 5C
>       arm64: dts: rockchip: Enable automatic fan control on Radxa Rock 5C
>       arm64: dts: rockchip: switch Rock 5C to PMIC-based TSHUT reset
>       arm64: dts: rockchip: Add SPDIF nodes to RK3588(s) device trees
>       arm64: dts: rockchip: Enable SPDIF output on H96 Max V58
>=20
> Andy Yan (5):
>       arm64: dts: rockchip: Enable USB3 OTG on rk3588s Cool Pi 4B
>       arm64: dts: rockchip: Add vop for rk3576
>       arm64: dts: rockchip: Add hdmi for rk3576
>       arm64: dts: rockchip: Enable hdmi display on sige5
>       arm64: dts: rockchip: Enable hdmi out display for rk3576-evb-v10
>=20
> Chris Morgan (1):
>       arm64: dts: rockchip: remove rk3588 optee node
>=20
> Chukun Pan (3):
>       dt-bindings: mfd: syscon: Add rk3528 QoS register compatible
>       arm64: dts: rockchip: Add rk3528 QoS register node
>       arm64: dts: rockchip: enable SCMI clk for RK3528 SoC
>=20
> Cristian Ciocaltea (8):
>       arm64: dts: rockchip: Enable HDMI0 PHY clk provider on RK3588
>       arm64: dts: rockchip: Add HDMI0 PHY PLL clock source to VOP2 on RK3=
588
>       arm64: dts: rockchip: Add PHY node for HDMI1 TX port on RK3588
>       arm64: dts: rockchip: Add HDMI1 node on RK3588
>       arm64: dts: rockchip: Enable HDMI1 on rock-5b
>       arm64: dts: rockchip: Enable HDMI1 PHY clk provider on RK3588
>       arm64: dts: rockchip: Add HDMI1 PHY PLL clock source to VOP2 on RK3=
588
>       arm64: dts: rockchip: Enable HDMI1 on rk3588-evb1
>=20
> Damon Ding (1):
>       arm64: dts: rockchip: Fix label name of hdptxphy for RK3588
>=20
> Detlev Casanova (6):
>       dt-bindings: arm: rockchip: Add Radxa ROCK 4D board
>       arm64: dts: rockchip: Add HDMI audio outputs for rk3588
>       arm64: dts: rockchip: Enable HDMI audio outputs for Rock 5B
>       arm64: dts: rockchip: Add HDMI support for rock-4d
>       arm64: dts: rockchip: Add SFC nodes for rk3576
>       arm64: dts: rockchip: Add SPI NOR device on the ROCK 4D
>=20
> Diederik de Haas (1):
>       arm64: dts: rockchip: add 'chassis-type' property on PineNote
>=20
> Dragan Simic (3):
>       arm64: dts: rockchip: Describe why is HWRNG disabled in RK356x base=
 dtsi
>       arm64: dts: rockchip: Use "dma-noncoherent" in base RK3588 SoC dtsi
>       arm64: dts: rockchip: linewrap gmac assigned-clocks on Quartz64 Mod=
el A/B files a bit
>=20
> FUKAUMI Naoki (1):
>       arm64: dts: rockchip: Enable USB OTG for Radxa ROCK Pi E
>=20
> Heiko Stuebner (5):
>       dt-bindings: arm: rockchip: Add Firefly ROC-RK3576-PC binding
>       arm64: dts: rockchip: Add devicetree for the ROC-RK3576-PC
>       arm64: dts: rockchip: add rk3576 otp node
>       Merge branch 'v6.15-shared/clkids' into v6.15-armsoc/dts64
>       arm64: dts: rockchip: add usb typec host support to rk3588-jaguar
>=20
> Jagan Teki (1):
>       arm64: dts: rockchip: Enable HDMI1 out for Edgeble-6TOPS Modules
>=20
> Jianfeng Liu (2):
>       arm64: dts: rockchip: Enable HDMI on armsom-sige7
>       arm64: dts: rockchip: add hdmi1 support to ROCK 5 ITX
>=20
> Jimmy Hon (6):
>       arm64: dts: rockchip: Enable HDMI1 on Orange Pi 5 Max
>       arm64: dts: rockchip: Adapt to differences between Orange Pi 5 Max =
and Ultra
>       dt-bindings: arm: rockchip: Add Xunlong Orange Pi 5 Ultra
>       arm64: dts: rockchip: Add Orange Pi 5 Ultra board
>       arm64: dts: rockchip: Enable HDMI1 on Orange Pi 5 Ultra
>       arm64: dts: rockchip: Enable HDMI1 audio output for Orange Pi 5 Ult=
ra
>=20
> Jonas Karlman (7):
>       dt-bindings: soc: rockchip: Add RK3528 ioc grf syscon
>       arm64: dts: rockchip: Add pinctrl and gpio nodes for RK3528
>       arm64: dts: rockchip: Add uart0 pinctrl to Radxa E20C
>       arm64: dts: rockchip: Add leds node to Radxa E20C
>       arm64: dts: rockchip: Add user button to Radxa E20C
>       arm64: dts: rockchip: Add SARADC node for RK3528
>       arm64: dts: rockchip: Add maskrom button to Radxa E20C
>=20
> Junhao Xie (3):
>       dt-bindings: vendor-prefixes: Add prefix for Ariaboard
>       dt-bindings: arm: rockchip: Add Ariaboard Photonicat RK3568
>       arm64: dts: rockchip: add dts for Ariaboard Photonicat RK3568
>=20
> Kever Yang (1):
>       dt-bindings: vendor-prefixes: Update rockchip company name
>=20
> Krzysztof Kozlowski (2):
>       arm64: dts: rockchip: Add ES8388 audio codec fallback on RK3399 ROC=
 PC PLUS
>       arm64: dts: rockchip: Add ES8388 audio codec fallback on RK3588 boa=
rds
>=20
> Nicolas Frattaroli (1):
>       arm64: dts: rockchip: Add rng node to RK3588
>=20
> Patrick Wildt (2):
>       dt-bindings: arm: rockchip: Add MNT Reform 2 (RCORE)
>       arm64: dts: rockchip: add MNT Reform 2 laptop
>=20
> Quentin Schulz (17):
>       arm64: dts: rockchip: add support for sound output over HDMI on RK3=
399 Puma Haikou
>       arm64: dts: rockchip: add overlay test for WolfVision PF5
>       arm64: dts: rockchip: add overlay test for Edgeble NCM6A/NCM6B
>       arm64: dts: rockchip: add overlay tests for Rock 5B PCIe overlays
>       arm64: dts: rockchip: minimal support for Pre-ICT tester adapter fo=
r RK3588 Jaguar
>       arm64: dts: rockchip: add support for HAIKOU-LVDS-9904379 adapter f=
or PX30 Ringneck
>       arm64: dts: rockchip: add overlay for PX30 Ringneck Haikou Video De=
mo adapter
>       arm64: dts: rockchip: add overlay for RK3399 Puma Haikou Video Demo=
 adapter
>       arm64: dts: rockchip: enable UART5 on RK3588 Tiger Haikou
>       arm64: dts: rockchip: move DDC bus from Haikou carrierboard to RK33=
99 Puma DTSI
>       arm64: dts: rockchip: move I2C6 from Haikou carrierboard to Puma DT=
SI
>       arm64: dts: rockchip: disable I2C6 on Puma DTSI
>       arm64: dts: rockchip: enable I2S0 in Haikou carrierboard, not Puma =
DTSI
>       arm64: dts: rockchip: add EEPROM found on RK3399 Puma Haikou
>       arm64: dts: rockchip: enable Ethernet in Haikou carrierboard, not P=
uma DTSI
>       arm64: dts: rockchip: enable I2C3 in Haikou carrierboard, not Ringn=
eck DTSI
>       arm64: dts: rockchip: disable I2C2 bus by default on RK3588 Tiger
>=20
> Sebastian Reichel (2):
>       arm64: dts: rockchip: Add GPU power domain regulator dependency for=
 RK3588
>       arm64: dts: rockchip: Enable HDMI receiver on rock-5b
>=20
> Shreeya Patel (1):
>       arm64: dts: rockchip: Add device tree support for HDMI RX Controller
>=20
> Stephen Chen (1):
>       arm64: dts: rockchip: Add Radxa ROCK 4D device tree
>=20
> Yao Zi (5):
>       dt-bindings: clock: Document clock and reset unit of RK3528
>       arm64: dts: rockchip: Add clock generators for RK3528 SoC
>       arm64: dts: rockchip: Add UART clocks for RK3528 SoC
>       dt-bindings: soc: rockchip: Add RK3528 VO GRF syscon
>       dt-bindings: soc: rockchip: Add RK3528 VPU GRF syscon
>=20
>  .../devicetree/bindings/arm/rockchip.yaml          |   25 +-
>  .../bindings/clock/rockchip,rk3528-cru.yaml        |   64 +
>  Documentation/devicetree/bindings/mfd/syscon.yaml  |    2 +
>  .../devicetree/bindings/soc/rockchip/grf.yaml      |    3 +
>  .../devicetree/bindings/vendor-prefixes.yaml       |    4 +-
>  arch/arm64/boot/dts/rockchip/Makefile              |   63 +
>  .../px30-ringneck-haikou-lvds-9904379.dtso         |  130 ++
>  .../rockchip/px30-ringneck-haikou-video-demo.dtso  |  190 +++
>  .../boot/dts/rockchip/px30-ringneck-haikou.dts     |    2 +
>  arch/arm64/boot/dts/rockchip/px30-ringneck.dtsi    |    4 -
>  arch/arm64/boot/dts/rockchip/rk3328-rock-pi-e.dts  |    8 +
>  .../rockchip/rk3399-puma-haikou-video-demo.dtso    |  166 +++
>  .../arm64/boot/dts/rockchip/rk3399-puma-haikou.dts |   26 +-
>  arch/arm64/boot/dts/rockchip/rk3399-puma.dtsi      |   10 +-
>  .../arm64/boot/dts/rockchip/rk3399-roc-pc-plus.dts |    2 +-
>  arch/arm64/boot/dts/rockchip/rk3528-pinctrl.dtsi   | 1397 ++++++++++++++=
++++++
>  arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dts |  118 ++
>  arch/arm64/boot/dts/rockchip/rk3528.dtsi           |  354 ++++-
>  arch/arm64/boot/dts/rockchip/rk3566-pinenote.dtsi  |    2 +
>  arch/arm64/boot/dts/rockchip/rk3566-quartz64-a.dts |    8 +-
>  arch/arm64/boot/dts/rockchip/rk3566-quartz64-b.dts |    8 +-
>  arch/arm64/boot/dts/rockchip/rk3568-photonicat.dts |  588 ++++++++
>  arch/arm64/boot/dts/rockchip/rk356x-base.dtsi      |    5 +
>  .../boot/dts/rockchip/rk3576-armsom-sige5.dts      |   47 +
>  arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dts   |   47 +
>  arch/arm64/boot/dts/rockchip/rk3576-roc-pc.dts     |  736 +++++++++++
>  arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dts    |  751 +++++++++++
>  arch/arm64/boot/dts/rockchip/rk3576.dtsi           |  187 +++
>  .../arm64/boot/dts/rockchip/rk3588-armsom-lm7.dtsi |    4 +
>  .../boot/dts/rockchip/rk3588-armsom-sige7.dts      |   51 +
>  arch/arm64/boot/dts/rockchip/rk3588-base.dtsi      |  110 +-
>  .../boot/dts/rockchip/rk3588-coolpi-cm5-evb.dts    |    2 +-
>  .../dts/rockchip/rk3588-coolpi-cm5-genbook.dts     |    2 +-
>  .../arm64/boot/dts/rockchip/rk3588-coolpi-cm5.dtsi |    4 +
>  .../dts/rockchip/rk3588-edgeble-neu6a-common.dtsi  |    4 +
>  .../boot/dts/rockchip/rk3588-edgeble-neu6a-io.dtsi |   47 +
>  arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dts   |   50 +-
>  arch/arm64/boot/dts/rockchip/rk3588-extra.dtsi     |  186 +++
>  arch/arm64/boot/dts/rockchip/rk3588-fet3588-c.dtsi |    4 +
>  .../dts/rockchip/rk3588-firefly-core-3588j.dtsi    |    4 +
>  .../dts/rockchip/rk3588-firefly-icore-3588q.dtsi   |  443 +++++++
>  .../boot/dts/rockchip/rk3588-firefly-itx-3588j.dts |    2 +-
>  .../rockchip/rk3588-friendlyelec-cm3588-nas.dts    |    2 +-
>  .../dts/rockchip/rk3588-friendlyelec-cm3588.dtsi   |    4 +
>  .../arm64/boot/dts/rockchip/rk3588-h96-max-v58.dts |   30 +-
>  .../dts/rockchip/rk3588-jaguar-pre-ict-tester.dtso |  171 +++
>  arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts     |  224 +++-
>  .../arm64/boot/dts/rockchip/rk3588-mnt-reform2.dts |  336 +++++
>  arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi |    6 +-
>  arch/arm64/boot/dts/rockchip/rk3588-ok3588-c.dts   |    4 +
>  .../dts/rockchip/rk3588-orangepi-5-compact.dtsi    |    9 -
>  .../boot/dts/rockchip/rk3588-orangepi-5-max.dts    |   51 +-
>  .../boot/dts/rockchip/rk3588-orangepi-5-plus.dts   |    2 +-
>  .../boot/dts/rockchip/rk3588-orangepi-5-ultra.dts  |   83 ++
>  .../arm64/boot/dts/rockchip/rk3588-orangepi-5.dtsi |    6 +-
>  .../arm64/boot/dts/rockchip/rk3588-quartzpro64.dts |    6 +-
>  arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dts |   53 +
>  arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts    |   83 +-
>  .../boot/dts/rockchip/rk3588-tiger-haikou.dts      |    4 +-
>  arch/arm64/boot/dts/rockchip/rk3588-tiger.dtsi     |    5 +-
>  .../arm64/boot/dts/rockchip/rk3588-toybrick-x0.dts |    4 +
>  .../arm64/boot/dts/rockchip/rk3588-turing-rk1.dtsi |    4 +
>  arch/arm64/boot/dts/rockchip/rk3588s-coolpi-4b.dts |   29 +-
>  arch/arm64/boot/dts/rockchip/rk3588s-evb1-v10.dts  |    6 +-
>  .../boot/dts/rockchip/rk3588s-gameforce-ace.dts    |    6 +-
>  .../boot/dts/rockchip/rk3588s-indiedroid-nova.dts  |    8 +-
>  .../boot/dts/rockchip/rk3588s-khadas-edge2.dts     |    4 +
>  .../arm64/boot/dts/rockchip/rk3588s-nanopi-r6.dtsi |    6 +-
>  arch/arm64/boot/dts/rockchip/rk3588s-odroid-m2.dts |    6 +-
>  .../boot/dts/rockchip/rk3588s-orangepi-5.dtsi      |    8 +-
>  arch/arm64/boot/dts/rockchip/rk3588s-rock-5a.dts   |    6 +-
>  arch/arm64/boot/dts/rockchip/rk3588s-rock-5c.dts   |   42 +-
>  include/dt-bindings/clock/rockchip,rk3528-cru.h    |  453 +++++++
>  include/dt-bindings/reset/rockchip,rk3528-cru.h    |  241 ++++
>  74 files changed, 7693 insertions(+), 69 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/clock/rockchip,rk35=
28-cru.yaml
>  create mode 100644 arch/arm64/boot/dts/rockchip/px30-ringneck-haikou-lvd=
s-9904379.dtso
>  create mode 100644 arch/arm64/boot/dts/rockchip/px30-ringneck-haikou-vid=
eo-demo.dtso
>  create mode 100644 arch/arm64/boot/dts/rockchip/rk3399-puma-haikou-video=
=2Ddemo.dtso
>  create mode 100644 arch/arm64/boot/dts/rockchip/rk3528-pinctrl.dtsi
>  create mode 100644 arch/arm64/boot/dts/rockchip/rk3568-photonicat.dts
>  create mode 100644 arch/arm64/boot/dts/rockchip/rk3576-roc-pc.dts
>  create mode 100644 arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dts
>  create mode 100644 arch/arm64/boot/dts/rockchip/rk3588-firefly-icore-358=
8q.dtsi
>  create mode 100644 arch/arm64/boot/dts/rockchip/rk3588-jaguar-pre-ict-te=
ster.dtso
>  create mode 100644 arch/arm64/boot/dts/rockchip/rk3588-mnt-reform2.dts
>  create mode 100644 arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-ultra.=
dts
>  create mode 100644 include/dt-bindings/clock/rockchip,rk3528-cru.h
>  create mode 100644 include/dt-bindings/reset/rockchip,rk3528-cru.h
>=20






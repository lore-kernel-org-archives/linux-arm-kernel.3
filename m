Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B762C3ABBE
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 02:34:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NN0XJfb0lcNNziMfIMuUwgc4s1hH4+Zy2qNAFb1ElHw=; b=bGuG6bhosuaanjmqMxmZAnB5GK
	i3tZdLUlLFDpTzV9ffiipAZFrq5hgOG1bLZTO+Ax+SWKy5Gx6u//o4qciz8twn5l6C1jb82l4THSB
	y9/z4swCyXRE6lFxfiJG+twAGo39U8Tt4Yk8Hs/sUe+VUDsYL7h+wsF4PVtummUlSAo60Wcjwqn4Q
	41umgYGdoDRDc7duEnoZ2wb3Y2Xn7iiy2DuglUiiERXKv81xNgW4+FoD/Fwt5Sncy6DAiP+TlZzvr
	7gW+gU4syCChCVJLp0CTb7R+0cBUvvh2u+g/beXXGzCc0AA74NkcAWPcXvV4VqvckZh4OrIza6iK8
	ZnuAdrDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCUba-0000000DwCN-0PUu;
	Wed, 07 May 2025 02:33:54 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCPgE-0000000DQ9a-20aj;
	Tue, 06 May 2025 21:18:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=NN0XJfb0lcNNziMfIMuUwgc4s1hH4+Zy2qNAFb1ElHw=; b=BWxDeu9SKUFMIcWOFxTtiEriVE
	iABwnjszrEDIKLkgT++EWJkHr/M+WvJ8Fkjl7Lo4XF986dSIq+F7uEP3L4a/fF+pXJTBGClKwfnCM
	QfwIzsv37KbHcAVbH6QKQhtzzR9K4AMYDpBzJSKqpjXN/R3Bp7QBnaN6kKyqytXWwRYop1JaBMgvl
	YD2ZZ7AF0sKz0B/QbYpHLdcUBfaBzF1wN1RLL6AgCIEx/qCSUvannw2KgwdKRXuii1w1XvlX/KAMG
	Q30fD/uFZQ9PuABkM7Cji3YEJb8p5zAmrtxBLBKcFUN8RVEYGdxvH67Uz7UwsBHyDV5DEbUh2PJUt
	U99k2+Vw==;
Received: from i53875a1d.versanet.de ([83.135.90.29] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uCPgB-00022Z-5l; Tue, 06 May 2025 23:18:19 +0200
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: John Clark <inindev@gmail.com>, "Rob Herring (Arm)" <robh@kernel.org>
Cc: krzysztof.kozlowski@linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, frattaroli.nicolas@gmail.com,
 devicetree@vger.kernel.org, jonas@kwiboo.se, conor+dt@kernel.org,
 andrew@lunn.ch
Subject: Re: [PATCH v3 0/3] Add Luckfox Omni3576 Carrier Board support for RK3576
Date: Tue, 06 May 2025 23:18:18 +0200
Message-ID: <4978865.GXAFRqVoOG@diego>
In-Reply-To: <174655575268.2171082.7949828475697497257.robh@kernel.org>
References: <20250506114115.613616-1-inindev@gmail.com>
 <174655575268.2171082.7949828475697497257.robh@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_141822_539847_E15A7BF6 
X-CRM114-Status: GOOD (  38.73  )
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

Am Dienstag, 6. Mai 2025, 20:23:55 Mitteleurop=C3=A4ische Sommerzeit schrie=
b Rob Herring (Arm):
>=20
> On Tue, 06 May 2025 07:41:12 -0400, John Clark wrote:
> > This series adds device tree support for the Luckfox Omni3576
> > Carrier Board with the Core3576 Module, powered by the Rockchip
> > RK3576 SoC (four Cortex-A72 cores, four Cortex-A53 cores, Mali-G52
> > MC3 GPU). It enables essential functionality for booting Linux and
> > basic connectivity, with plans for future support of peripherals
> > like WiFi, MIPI-DSI, HDMI, and Ethernet.
> >=20
> > The series was first posted as v1 at:
> > https://lore.kernel.org/linux-rockchip/20250502205533.51744-1-inindev@g=
mail.com
> > v2 at:
> > https://lore.kernel.org/linux-rockchip/20250504102447.153551-1-inindev@=
gmail.com
> >=20
> > Tested features (on Linux 6.15-rc4):
> >  - UART: Serial console operational
> >  - SD card: Mounts and reads/writes successfully
> >  - PCIe: NVMe SSD detected, mounted, and fully functional
> >  - USB 2.0: Host ports operational
> >  - RTC: Timekeeping and wake-up tested
> >  - LED: Heartbeat trigger functional
> >  - eMMC: Enabled in device tree, not populated on tested hardware
> >=20
> > The series includes three patches:
> >  1. dt-bindings: vendor-prefixes: Add Luckfox vendor prefix
> >  2. dt-bindings: arm: rockchip: Add Luckfox Omni3576 and Core3576 bindi=
ngs
> >  3. arm64: dts: rockchip: Add Luckfox Omni3576 board support
> >=20
> > The device tree is covered by the existing ROCKCHIP ARCHITECTURE
> > entry in MAINTAINERS. I am aware of ongoing RK3576 upstreaming
> > efforts (e.g., by Collabora) and welcome feedback or collaboration
> > to align with mainline driver development.
> >=20
> > Changes in v3:
> >  - Addressed Jonas Karlman's feedback on patch 3/3
> >    (Luckfox Omni3576 device tree):
> >    - Added pinctrl for green LED GPIO (gpio1 RK_PD5) for proper
> >      pin setup.
> >    - Reordered regulator node properties for consistent sequence
> >      (e.g., regulator-name, regulator-min-microvolt,
> >      regulator-max-microvolt, etc.).
> >    - Updated regulator nodes (vcc_3v3_pcie, vbus_5v0_typec,
> >      vcc_5v0_host, vcc_5v0_hdmi) to use 'gpios' property instead
> >      of deprecated 'gpio'.
> >    - Removed pmic-power-off pinctrl state and pinctrl-1 from RK806
> >      PMIC node, as they are vendor-specific and undocumented in
> >      bindings.
> >    - Removed pwrkey node from PMIC, as it lacks binding
> >      documentation.
> >    - Added blank line between properties and child nodes in i2c2
> >      node for DT style compliance.
> >    - Removed no-mmc property from sdmmc node to enable MMC
> >      support, aligning with RK3576 SD v3.0 and MMC v4.51
> >      capabilities, allowing TF card slot to support MMC devices
> >      or eMMC via adapter.
> >  - Removed Ethernet support (gmac0/gmac1 nodes) per Andrew Lunn's
> >    feedback, as it relied on the generic PHY driver with incorrect
> >    RGMII delay settings, which would break with the upcoming
> >    MAE0621A driver.
> >  - Addressed Rob Herring's DTB check warnings, other warnings
> >    (e.g., VOP, PCIe, OTP, HDMI PHY) originate from rk3576.dtsi and
> >    are outside this patchset scope.
> >  - Added RNG node to pick up Nicolas Frattaroli's "add RK3576 RNG
> >    node" patch
> >=20
> > Changes in v2:
> >  - Enabled HDMI node per feedback from Heiko Stuebner and Nicolas
> >    Frattaroli; untested due to upstream driver issues.
> >  - Enabled Ethernet 1 node per Heiko's device tree philosophy;
> >    untested due to suspected PHY driver or configuration issues
> >    (removed in v3 per Andrew Lunn).
> >  - Clarified eMMC remains enabled but unpopulated on tested
> >    board, per Heiko.
> >=20
> > Signed-off-by: John Clark <inindev@gmail.com>
> > ---
> > John Clark (3):
> >   dt-bindings: vendor-prefixes: Add luckfox prefix
> >   dt-bindings: arm: rockchip: Add Luckfox Omni3576 and Core3576 bindings
> >   arm64: dts: rockchip: Add Luckfox Omni3576 Board support
> >=20
> >  .../devicetree/bindings/arm/rockchip.yaml     |  10 +
> >  .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
> >  arch/arm64/boot/dts/rockchip/Makefile         |   1 +
> >  .../dts/rockchip/rk3576-luckfox-core3576.dtsi | 683 ++++++++++++++++++
> >  .../dts/rockchip/rk3576-luckfox-omni3576.dts  |  53 ++
> >  5 files changed, 749 insertions(+)
> >  create mode 100644 arch/arm64/boot/dts/rockchip/rk3576-luckfox-core357=
6.dtsi
> >  create mode 100644 arch/arm64/boot/dts/rockchip/rk3576-luckfox-omni357=
6.dts
> >=20
> > --
> > 2.39.5
> >=20
> >=20
> >=20
>=20
>=20
> My bot found new DTB warnings on the .dts files added or changed in this
> series.
>=20
> Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
> are fixed by another series. Ultimately, it is up to the platform
> maintainer whether these warnings are acceptable or not. No need to reply
> unless the platform maintainer has comments.
>=20
> If you already ran DT checks and didn't see these error(s), then
> make sure dt-schema is up to date:
>=20
>   pip3 install dtschema --upgrade
>=20
>=20
> This patch series was applied (using b4) to base:
>  Base: attempting to guess base-commit...
>  Base: tags/next-20250506 (best guess, 2/3 blobs matched)
>=20
> If this is not the correct base, please add 'base-commit' tag
> (or use b4 which does this automatically)
>=20
> New warnings running 'make CHECK_DTBS=3Dy for arch/arm64/boot/dts/rockchi=
p/' for 20250506114115.613616-1-inindev@gmail.com:
>=20
> arch/arm64/boot/dts/rockchip/rk3576-luckfox-omni3576.dtb: /soc/rng@2a4100=
00: failed to match any schema with compatible: ['rockchip,rk3576-rng']

the binding (and driver) for the rk3576-rng have been merged into the
cryptodev tree yesterday [0], so that issue should hopefully go away with
the next linux-next.


[0] https://git.kernel.org/pub/scm/linux/kernel/git/herbert/cryptodev-2.6.g=
it/commit/?id=3D165ef524bbeb71ccd470e70a4e63f813fa71e7cd




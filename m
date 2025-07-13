Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AA97C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Jul 2025 06:00:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=65uVdE/VoTyBYsTEgzuRdb+Bqc9FPd5Kw8PkUHPSGoc=; b=nX5+25z31gVmEhFfNRHYk2ihHQ
	vWUM5OG4VaPt0gyiIpUiSMV/iwhYPHYFa6g3NX83T/o6i1bON5Tyry4125cjwH60Is6S/8D0JCZNP
	Hqr7iBmqYo/MWZUlVC6qukzC8B8cIXR2VB4HwJ8oB/ClgvDNZD/BlnwfnycMn18M2vN/RXKSQJDEy
	ez98PpRjTzReb1Flbwo7373OWeMFWqsBEkrCbU835xtbOwxbwT2s/37lEuU/xjZ1bTmmDuQ1408l6
	y/04uJ0dbQ5C1LPNAOXWVlzrKhTTOB5C0Xgy/98TUaCONQHaxAtVQ3kMSaqCUnCfEQlieqx197OYk
	yWhLDsow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uapl2-0000000HNVE-1POS;
	Sun, 13 Jul 2025 06:00:16 +0000
Received: from mail-m16.yeah.net ([220.197.32.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uapg5-0000000HNAx-40Sk
	for linux-arm-kernel@lists.infradead.org;
	Sun, 13 Jul 2025 05:55:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version:
	Content-Type; bh=65uVdE/VoTyBYsTEgzuRdb+Bqc9FPd5Kw8PkUHPSGoc=;
	b=LklGH2Rc7/GSGBkSYuwjuTyesZoRmQsjtAM+SpBWIHzItkVmj4Xzu522A1oVzw
	OdIeqFDykCAIRy5Ii10MNcwOlAMfJAdoB4X0dThCyjlK7fMgRCyDT41fnoAIM+Oe
	z5635M1p6QJtrRwrjI0XdPXTTKcEw8LzMtvF3b12SPqNs=
Received: from localhost.localdomain (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgDXb50mSnNoHrt9AA--.3344S4;
	Sun, 13 Jul 2025 13:54:49 +0800 (CST)
From: Shawn Guo <shawnguo2@yeah.net>
To: soc@kernel.org,
	arm@kernel.org
Cc: Shawn Guo <shawnguo@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	kernel@pengutronix.de,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 3/5] i.MX ARM device tree change for 6.17
Date: Sun, 13 Jul 2025 13:54:32 +0800
Message-ID: <20250713055441.221235-3-shawnguo2@yeah.net>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250713055441.221235-1-shawnguo2@yeah.net>
References: <20250713055441.221235-1-shawnguo2@yeah.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: M88vCgDXb50mSnNoHrt9AA--.3344S4
X-Coremail-Antispam: 1Uf129KBjvJXoW3Jr43ZF4furyfJr1DJFW8Zwb_yoW3CFy8pa
	4fursxWws7Gr13Kry3JrWqg3s0yw18Zr4Fvrs8Xa48GF43ZFyUZ3savwn3try3XFWrJa1S
	qwn5u3s7J34DuaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07j-2-nUUUUU=
X-Originating-IP: [114.216.146.217]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiARuJZWhy+B7xZwAAsc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250712_225510_313410_16D853CF 
X-CRM114-Status: GOOD (  13.26  )
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

From: Shawn Guo <shawnguo@kernel.org>

The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494:

  Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-dt-6.17

for you to fetch changes up to b23de67d4b69963f961611ac8e2352488677dd2e:

  ARM: dts: imx6-gw: Replace license text comment with SPDX identifier (2025-07-11 16:23:19 +0800)

----------------------------------------------------------------
i.MX ARM device tree changes for 6.17:

- New device trees for Engicam MicroGEA-MX6UL and i.MX28 Amarula board
- A couple of changes from Bence Csókás to replace license text comment
  with SPDX identifier for Karo and Gateworks boards
- A couple of imx7s-warp updates from Fabio Estevam to improve Bluetooth
  and Wifi description
- A set of dt-schema fixes for VF610 based boards from Frank Li
- A couple of imx6ul-kontron-sl-common changes to add SPI NOR partitions
  and correct QSPI NAND node name
- A few other random improvements

----------------------------------------------------------------
Annette Kobou (1):
      ARM: dts: imx6ul-kontron-bl-common: Fix RTS polarity for RS485 interface

Bence Csókás (2):
      ARM: dts: imx6-karo: Replace license text comment with SPDX identifier
      ARM: dts: imx6-gw: Replace license text comment with SPDX identifier

Dario Binacchi (6):
      ARM: dts: imx28: add pwm7 muxing options
      ARM: dts: mxs: support i.MX28 Amarula rmm board
      ARM: dts: imx6ul: support Engicam MicroGEA-MX6UL SoM
      ARM: dts: imx6ul: support Engicam MicroGEA BMM board
      ARM: dts: imx6ul: support Engicam MicroGEA RMM board
      ARM: dts: imx6ul: support Engicam MicroGEA GTW board

Eberhard Stoll (1):
      ARM: dts: imx6ul-kontron-sl-common: Add SPI NOR partitions

Fabio Estevam (2):
      ARM: dts: imx7s-warp: Improve the Bluetooth description
      ARM: dts: imx7s-warp: Improve the Wifi description

Frank Li (6):
      ARM: dts: vf: remove reg property for arm pmu
      ARM: dts: vf: remove redundant pinctrl-names
      ARM: dts: vf: remove redundant layer under iomux
      ARM: dts: vf: rename io-expander@20 to pinctrl@20
      ARM: dts: vf: vf-colibri-eval-v3: add power-supply for edt,et057090dhu
      ARM: dts: vf: vf610-zii-cfu1: rename node name *-gpio to *-gpios

Frieder Schrempf (1):
      ARM: dts: imx6ul-kontron-sl-common: Fix QSPI NAND node name

Haibo Chen (1):
      ARM: dts: add ngpios for vf610 compatible gpio controllers

Krzysztof Kozlowski (1):
      ARM: dts: vfxxx: Correctly use two tuples for timer address

 arch/arm/boot/dts/nxp/imx/Makefile                 |   3 +
 arch/arm/boot/dts/nxp/imx/imx53-tx53-x03x.dts      |  38 +--
 arch/arm/boot/dts/nxp/imx/imx53-tx53-x13x.dts      |  44 +--
 arch/arm/boot/dts/nxp/imx/imx53-tx53.dtsi          |  38 +--
 arch/arm/boot/dts/nxp/imx/imx6dl-gw551x.dts        |  44 +--
 arch/arm/boot/dts/nxp/imx/imx6dl-gw553x.dts        |  44 +--
 arch/arm/boot/dts/nxp/imx/imx6dl-gw560x.dts        |  44 +--
 arch/arm/boot/dts/nxp/imx/imx6dl-gw5903.dts        |  44 +--
 arch/arm/boot/dts/nxp/imx/imx6dl-gw5904.dts        |  44 +--
 arch/arm/boot/dts/nxp/imx/imx6dl-tx6dl-comtft.dts  |  38 +--
 arch/arm/boot/dts/nxp/imx/imx6dl-tx6s-8034-mb7.dts |  38 +--
 arch/arm/boot/dts/nxp/imx/imx6dl-tx6s-8034.dts     |  38 +--
 arch/arm/boot/dts/nxp/imx/imx6dl-tx6s-8035-mb7.dts |  38 +--
 arch/arm/boot/dts/nxp/imx/imx6dl-tx6s-8035.dts     |  38 +--
 arch/arm/boot/dts/nxp/imx/imx6dl-tx6u-801x.dts     |  38 +--
 arch/arm/boot/dts/nxp/imx/imx6dl-tx6u-8033-mb7.dts |  38 +--
 arch/arm/boot/dts/nxp/imx/imx6dl-tx6u-8033.dts     |  38 +--
 arch/arm/boot/dts/nxp/imx/imx6dl-tx6u-80xx-mb7.dts |  38 +--
 arch/arm/boot/dts/nxp/imx/imx6dl-tx6u-811x.dts     |  38 +--
 arch/arm/boot/dts/nxp/imx/imx6dl-tx6u-81xx-mb7.dts |  38 +--
 arch/arm/boot/dts/nxp/imx/imx6q-gw551x.dts         |  44 +--
 arch/arm/boot/dts/nxp/imx/imx6q-gw553x.dts         |  44 +--
 arch/arm/boot/dts/nxp/imx/imx6q-gw560x.dts         |  44 +--
 arch/arm/boot/dts/nxp/imx/imx6q-gw5903.dts         |  44 +--
 arch/arm/boot/dts/nxp/imx/imx6q-gw5904.dts         |  44 +--
 .../boot/dts/nxp/imx/imx6q-tx6q-1010-comtft.dts    |  38 +--
 arch/arm/boot/dts/nxp/imx/imx6q-tx6q-1010.dts      |  38 +--
 .../boot/dts/nxp/imx/imx6q-tx6q-1020-comtft.dts    |  38 +--
 arch/arm/boot/dts/nxp/imx/imx6q-tx6q-1020.dts      |  38 +--
 arch/arm/boot/dts/nxp/imx/imx6q-tx6q-1036-mb7.dts  |  38 +--
 arch/arm/boot/dts/nxp/imx/imx6q-tx6q-1036.dts      |  38 +--
 arch/arm/boot/dts/nxp/imx/imx6q-tx6q-10x0-mb7.dts  |  38 +--
 arch/arm/boot/dts/nxp/imx/imx6q-tx6q-1110.dts      |  38 +--
 arch/arm/boot/dts/nxp/imx/imx6q-tx6q-11x0-mb7.dts  |  38 +--
 arch/arm/boot/dts/nxp/imx/imx6qdl-gw551x.dtsi      |  44 +--
 arch/arm/boot/dts/nxp/imx/imx6qdl-gw553x.dtsi      |  44 +--
 arch/arm/boot/dts/nxp/imx/imx6qdl-gw560x.dtsi      |  44 +--
 arch/arm/boot/dts/nxp/imx/imx6qdl-gw5903.dtsi      |  44 +--
 arch/arm/boot/dts/nxp/imx/imx6qdl-gw5904.dtsi      |  44 +--
 arch/arm/boot/dts/nxp/imx/imx6qdl-tx6-lcd.dtsi     |  38 +--
 arch/arm/boot/dts/nxp/imx/imx6qdl-tx6-lvds.dtsi    |  38 +--
 arch/arm/boot/dts/nxp/imx/imx6qdl-tx6-mb7.dtsi     |  38 +--
 arch/arm/boot/dts/nxp/imx/imx6qdl-tx6.dtsi         |  38 +--
 .../arm/boot/dts/nxp/imx/imx6qp-tx6qp-8037-mb7.dts |  38 +--
 arch/arm/boot/dts/nxp/imx/imx6qp-tx6qp-8037.dts    |  38 +--
 .../arm/boot/dts/nxp/imx/imx6qp-tx6qp-8137-mb7.dts |  38 +--
 arch/arm/boot/dts/nxp/imx/imx6qp-tx6qp-8137.dts    |  38 +--
 .../boot/dts/nxp/imx/imx6ul-kontron-bl-common.dtsi |   1 -
 .../boot/dts/nxp/imx/imx6ul-kontron-sl-common.dtsi |  25 +-
 arch/arm/boot/dts/nxp/imx/imx6ul-tx6ul-0010.dts    |  38 +--
 arch/arm/boot/dts/nxp/imx/imx6ul-tx6ul-0011.dts    |  38 +--
 .../boot/dts/nxp/imx/imx6ul-tx6ul-mainboard.dts    |  38 +--
 arch/arm/boot/dts/nxp/imx/imx6ul-tx6ul.dtsi        |  38 +--
 .../dts/nxp/imx/imx6ull-engicam-microgea-bmm.dts   | 303 +++++++++++++++++
 .../dts/nxp/imx/imx6ull-engicam-microgea-gtw.dts   | 162 ++++++++++
 .../dts/nxp/imx/imx6ull-engicam-microgea-rmm.dts   | 360 +++++++++++++++++++++
 .../boot/dts/nxp/imx/imx6ull-engicam-microgea.dtsi |  95 ++++++
 arch/arm/boot/dts/nxp/imx/imx7s-warp.dts           |  49 ++-
 arch/arm/boot/dts/nxp/imx/imx7ulp.dtsi             |   4 +
 arch/arm/boot/dts/nxp/mxs/Makefile                 |   1 +
 arch/arm/boot/dts/nxp/mxs/imx28-amarula-rmm.dts    | 300 +++++++++++++++++
 arch/arm/boot/dts/nxp/mxs/imx28.dtsi               |  10 +
 arch/arm/boot/dts/nxp/vf/vf-colibri-eval-v3.dtsi   |  11 +-
 arch/arm/boot/dts/nxp/vf/vf-colibri.dtsi           | 348 ++++++++++----------
 arch/arm/boot/dts/nxp/vf/vf500-colibri.dtsi        |  44 ++-
 arch/arm/boot/dts/nxp/vf/vf500.dtsi                |  14 +-
 arch/arm/boot/dts/nxp/vf/vf610-bk4.dts             |   2 +-
 arch/arm/boot/dts/nxp/vf/vf610-cosmic.dts          |  60 ++--
 arch/arm/boot/dts/nxp/vf/vf610-twr.dts             | 228 +++++++------
 arch/arm/boot/dts/nxp/vf/vf610-zii-cfu1.dts        |   6 +-
 arch/arm/boot/dts/nxp/vf/vf610-zii-dev-rev-c.dts   |  10 +-
 arch/arm/boot/dts/nxp/vf/vf610-zii-scu4-aib.dts    |  12 +-
 arch/arm/boot/dts/nxp/vf/vf610-zii-spb4.dts        |   4 +-
 arch/arm/boot/dts/nxp/vf/vf610-zii-ssmb-dtu.dts    |   6 +-
 arch/arm/boot/dts/nxp/vf/vf610-zii-ssmb-spu3.dts   |   4 +-
 arch/arm/boot/dts/nxp/vf/vf610m4-colibri.dts       |  16 +-
 arch/arm/boot/dts/nxp/vf/vf610m4-cosmic.dts        |  12 +-
 arch/arm/boot/dts/nxp/vf/vfxxx.dtsi                |   7 +-
 78 files changed, 1721 insertions(+), 2372 deletions(-)
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea-bmm.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea-gtw.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea-rmm.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/mxs/imx28-amarula-rmm.dts



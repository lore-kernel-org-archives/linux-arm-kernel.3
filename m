Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED541E77197
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  5 Jan 2025 09:58:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Irbm6VfXAI9JkqQJkfYYSPhkzCdRNt1ZTBLO5TrSmYo=; b=QxX1Bag5hSYlOUB1MdLxLxIwnx
	Q3CR2h+2CJW9/K4vyI2mIa6s0qm4P3vZhD06pnqGazACxFPdpeF7NwUDZyA22UAzrtGudhHGjHuSu
	0131F2kXNW6HWghob1KiQYaAdu63ZRRRSS8I6lyzrw6GkKnx+AHtqqyR7tV1yqsbuowcdVmueC2P0
	qkUdZmB48ObnGComa/wa1JZRpE5c2QLkygEAUDhJoINJXgunr5oKyzdQrqV6OzbWdcomKOaaDN1PY
	o/mV74JPAXg6zPGVkcc7KWB9BLch5OJXB9GuZOHGSIWwelM8baxKBY5D1SbZwOt06tp3HqlXro+i6
	lk4A66jQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUNOn-0000000Ge2O-1GJm;
	Sun, 05 Jan 2025 09:58:21 +0000
Received: from mail-m16.yeah.net ([1.95.21.14])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUNIg-0000000GdOq-1r5a
	for linux-arm-kernel@lists.infradead.org;
	Sun, 05 Jan 2025 09:52:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=Irbm6
	VfXAI9JkqQJkfYYSPhkzCdRNt1ZTBLO5TrSmYo=; b=NKsrhu9D0M9m5idwyE84s
	QNWN2gIbNqbcOfbYhAkYnig53zcfE+v3yb3kxkgYC4yAemz6OmjX4W/DCpZZPP0e
	zMH/idLF/HfXlLjI7ZGCTP9izzId/snlroJJ5+ow0GYpSDGjpiPr33V/TsWWDEZw
	wevS3PCiR8xV/9Zqg04DJs=
Received: from localhost.localdomain (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgBXGWwuVnpnZZRPBg--.62165S5;
	Sun, 05 Jan 2025 17:51:45 +0800 (CST)
From: Shawn Guo <shawnguo2@yeah.net>
To: soc@kernel.org,
	arm@kernel.org
Cc: Shawn Guo <shawnguo@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	kernel@pengutronix.de,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 4/5] i.MX arm64 device tree change for 6.14
Date: Sun,  5 Jan 2025 17:51:37 +0800
Message-Id: <20250105095139.714590-4-shawnguo2@yeah.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250105095139.714590-1-shawnguo2@yeah.net>
References: <20250105095139.714590-1-shawnguo2@yeah.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: M88vCgBXGWwuVnpnZZRPBg--.62165S5
X-Coremail-Antispam: 1Uf129KBjvJXoW3Xr4Utr17Gw4rGrWrZr18Xwb_yoW7Zry3pa
	43urW3Gr17GFW8Cr9xW3Wvq3s8tw45JF45Cr17WrWxKrW5AFyqqF1rKr1fury2vryxZw4F
	y3W8Jry7Grn8ZaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07j7BMNUUUUU=
X-Originating-IP: [114.216.146.204]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiERPLZWd6RRkrYQAAsn
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250105_015202_908092_BEC50928 
X-CRM114-Status: GOOD (  11.55  )
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

The following changes since commit 40384c840ea1944d7c5a392e8975ed088ecf0b37:

  Linux 6.13-rc1 (2024-12-01 14:28:56 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-dt64-6.14

for you to fetch changes up to bd38fa3aaaceb371cf92f115c905579024b9feac:

  arm64: dts: freescale: imx93-9x9-qsb: enable fsl,ext-reset-output for wdog3 (2024-12-30 16:31:58 +0800)

----------------------------------------------------------------
i.MX arm64 device tree change for 6.14:

- Add simple-framebuffer support for imx8mn-bsh-smm-s2/pro board
  (Dario Binacchi)
- Add LVDS compatible string for imx8mm-phg board (Fabio Estevam)
- Add P3T1085 temperature sensor support for imx93-9x9-qsb board (Frank Li)
- Add support for i.MX8MP based aristainetos3 boards from ABB
  (Heiko Schocher)
- Add PCA9452 system PMIC support for imx93-14x14-evk board (Joy Zou)
- Support NXP LVDS to HDMI adapter cards for imx8mp-evk board with DT
  overlays (Liu Ying)
- A couple of changes from Markus Niebel to enable Open Drain for MDIO
  on imx93-tqma9352 boards
- A series from Peng Fan to enable wdog3 fsl,ext-reset-output support
  for NXP i.MX93 boards
- A couple changes from Wei Fang to add NETC support for i.MX95

----------------------------------------------------------------
Dario Binacchi (1):
      arm64: dts: imx8mn-bsh-smm-s2/pro: add simple-framebuffer

Fabio Estevam (1):
      arm64: dts: imx8mm-phg: Add LVDS compatible string

Frank Li (2):
      arm64: dts: imx8mq-zii-ultra: remove #address-cells of eeprom@a4
      arm64: dts: imx93-9x9-qsb: add temp-sensor nxp,p3t1085

Geert Uytterhoeven (1):
      arm64: dts: imx: Switch to simple-audio-card,hp-det-gpios

Heiko Schocher (1):
      arm64: dts: imx8mp: add aristainetos3 board support

Joy Zou (1):
      arm64: dts: imx93: add pca9452 support

Liu Ying (2):
      arm64: dts: imx8mp-skov-revb-mi1010ait-1cp1: Set "media_disp2_pix" clock rate to 70MHz
      arm64: dts: imx8mp-evk: Add NXP LVDS to HDMI adapter cards

Markus Niebel (2):
      arm64: dts: imx93-tqma9352-mba93xxca: enable Open Drain for MDIO
      arm64: dts: imx93-tqma9352-mba93xxla: enable Open Drain for MDIO

Peng Fan (3):
      arm64: dts: freescale: imx93-11x11-evk: enable fsl,ext-reset-output for wdog3
      arm64: dts: freescale: imx93-14x14-evk: enable fsl,ext-reset-output for wdog3
      arm64: dts: freescale: imx93-9x9-qsb: enable fsl,ext-reset-output for wdog3

Wei Fang (2):
      arm64: dts: imx95: add NETC related nodes
      arm64: dts: imx95-19x19-evk: add ENETC 0 support

 arch/arm64/boot/dts/freescale/Makefile             |   13 +
 arch/arm64/boot/dts/freescale/imx8mm-phg.dts       |    2 +-
 .../dts/freescale/imx8mn-bsh-smm-s2-display.dtsi   |   28 +
 .../freescale/imx8mp-aristainetos3-adpismarc.dts   |   37 +
 .../imx8mp-aristainetos3-helios-lvds.dtso          |  113 ++
 .../dts/freescale/imx8mp-aristainetos3-helios.dts  |   98 ++
 .../freescale/imx8mp-aristainetos3-proton2s.dts    |  161 +++
 .../freescale/imx8mp-aristainetos3a-som-v1.dtsi    | 1107 ++++++++++++++++++++
 .../freescale/imx8mp-evk-imx-lvds-hdmi-common.dtsi |   29 +
 .../imx8mp-evk-lvds0-imx-dlvds-hdmi-channel0.dtso  |   44 +
 .../imx8mp-evk-lvds0-imx-lvds-hdmi-common.dtsi     |   43 +
 .../freescale/imx8mp-evk-lvds0-imx-lvds-hdmi.dtso  |   28 +
 .../imx8mp-evk-lvds1-imx-dlvds-hdmi-channel0.dtso  |   44 +
 .../imx8mp-evk-lvds1-imx-lvds-hdmi-common.dtsi     |   43 +
 .../freescale/imx8mp-evk-lvds1-imx-lvds-hdmi.dtso  |   28 +
 arch/arm64/boot/dts/freescale/imx8mp-evk.dts       |    6 +
 .../freescale/imx8mp-skov-revb-mi1010ait-1cp1.dts  |    8 +-
 .../boot/dts/freescale/imx8mq-librem5-devkit.dts   |    2 +-
 arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi  |    2 +-
 .../arm64/boot/dts/freescale/imx8mq-zii-ultra.dtsi |    2 -
 arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts  |    8 +
 arch/arm64/boot/dts/freescale/imx93-14x14-evk.dts  |   92 ++
 arch/arm64/boot/dts/freescale/imx93-9x9-qsb.dts    |   14 +
 .../dts/freescale/imx93-tqma9352-mba93xxca.dts     |    8 +-
 .../dts/freescale/imx93-tqma9352-mba93xxla.dts     |    8 +-
 arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts  |   52 +
 arch/arm64/boot/dts/freescale/imx95.dtsi           |   93 ++
 27 files changed, 2096 insertions(+), 17 deletions(-)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-adpismarc.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-helios-lvds.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-helios.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-proton2s.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-aristainetos3a-som-v1.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-evk-imx-lvds-hdmi-common.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-evk-lvds0-imx-dlvds-hdmi-channel0.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-evk-lvds0-imx-lvds-hdmi-common.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-evk-lvds0-imx-lvds-hdmi.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-evk-lvds1-imx-dlvds-hdmi-channel0.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-evk-lvds1-imx-lvds-hdmi-common.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-evk-lvds1-imx-lvds-hdmi.dtso



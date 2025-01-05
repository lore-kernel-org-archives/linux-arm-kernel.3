Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B519BE77197
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  5 Jan 2025 09:55:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=69snuUwpsyIrkbZcnnFbbFnV//a9mRAcTgRbnMk9dG8=; b=JginE5NBRrfgNMwEwLiNOwjf4D
	iuS0XwPyuwc+TaqQJaG7pn/DVizwn0QOKOi4QQA/gmeGVjByQrTb2TB0hnqqy/zMA7spSGeNnzKSJ
	ZAUPdzcerc7qgDfOcuzkc8XQ+Rjtg5dnJYIjFmdYp7K2VlwY7RnObmxBd4p9ftT+43r9U0R49X8T6
	2ueRy5uRR6CU8ipolP7fxfDiPPAOH2fszDyv6HY1ug3Mirj3MJJPbnwl5DJzYT8wRDRcMWbm4LmWG
	d2SDXTtqFxxAnVWORqthu4ePEMVh/kknV2IEU1Rz1FTK7Ua5+kevxjBGZst2DqYdmtyJY5yYUabfy
	dWYiBoXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUNLM-0000000GdfR-187s;
	Sun, 05 Jan 2025 09:54:48 +0000
Received: from mail-m16.yeah.net ([220.197.32.19])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUNIg-0000000GdOp-1Uab
	for linux-arm-kernel@lists.infradead.org;
	Sun, 05 Jan 2025 09:52:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=69snu
	UwpsyIrkbZcnnFbbFnV//a9mRAcTgRbnMk9dG8=; b=iYay7waFFvMKKIGcEWceB
	RgxawlCM6JQiV1w0BNkINlXq1Jl3zmuz8TMIF1j0/6+/AC6VIZ9LNOoWfhivRyfZ
	8tOozGD0fFxqhfyVazWcUlzly4YDdUChYf0qvIu6YHsk8oqTZYW/GxTF6QQeDFSv
	4s3j1zBq0jM26rqN0Oxq+M=
Received: from localhost.localdomain (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgBXGWwuVnpnZZRPBg--.62165S4;
	Sun, 05 Jan 2025 17:51:44 +0800 (CST)
From: Shawn Guo <shawnguo2@yeah.net>
To: soc@kernel.org,
	arm@kernel.org
Cc: Shawn Guo <shawnguo@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	kernel@pengutronix.de,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 3/5] i.MX ARM device tree change for 6.14
Date: Sun,  5 Jan 2025 17:51:36 +0800
Message-Id: <20250105095139.714590-3-shawnguo2@yeah.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250105095139.714590-1-shawnguo2@yeah.net>
References: <20250105095139.714590-1-shawnguo2@yeah.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: M88vCgBXGWwuVnpnZZRPBg--.62165S4
X-Coremail-Antispam: 1Uf129KBjvJXoWxXr4rJrW7Gw1kuF4fAF4UXFb_yoW5Cr1fpr
	1fZrsrJr4xGryfJ34DA3yjk3yYyw15Zr1fZr15Jay8Cr45Za47Xr9Igw1ft34UXFyrWay5
	tr18ZF9rJrn5uF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jQ2-8UUUUU=
X-Originating-IP: [114.216.146.204]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiBALLZWd6TKsXoQAAsk
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250105_015202_760728_6E2DE42F 
X-CRM114-Status: UNSURE (   8.30  )
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

From: Shawn Guo <shawnguo@kernel.org>

The following changes since commit 40384c840ea1944d7c5a392e8975ed088ecf0b37:

  Linux 6.13-rc1 (2024-12-01 14:28:56 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-dt-6.14

for you to fetch changes up to c7418a6e7ac9bca66a8a49793cbfa5a45c01bcbb:

  ARM: dts: imx: Use the correct mdio pattern (2024-12-30 16:03:58 +0800)

----------------------------------------------------------------
i.MX ARM device tree change for 6.14:

- Clean up TQMa7x device trees (Alexander Stein)
- Correct node name pattern for mdio-gpio devices (Fabio Estevam)
- Update deprecated GPIO properties for Generic ASoC Sound Card device
  (Geert Uytterhoeven)
- Set USB dr_mode property to OTG explicitly for imx6qdl-sabresd based
  boards (Hui Wang)
- Update MAINTAINERS entry for DH electronics DHSOM boards (Marek Vasut)
- A series from Stefan Kerkmann to add phy-3p0-supply for usb phys

----------------------------------------------------------------
Alexander Stein (7):
      ARM: dts: imx7-mba7: remove LVDS transmitter regulator
      ARM: dts: imx7-tqma7: Remove superfluous status="okay" property
      ARM: dts: imx7-tqma7: add missing vs-supply for LM75A (rev. 01xxx)
      ARM: dts: imx7-mba7: Add 3.3V and 5.0V regulators
      ARM: dts: imx7-mba7: Fix SD card vmmc-supply
      ARM: dts: imx7-mba7: Remove duplicated power supply
      ARM: dts: imx7[d]-mba7: add Ethernet PHY IRQ support

Fabio Estevam (2):
      ARM: dts: imx6qdl-apalis: Change to "adi,force-bt656-4"
      ARM: dts: imx: Use the correct mdio pattern

Geert Uytterhoeven (1):
      ARM: dts: imx: Switch to {hp,mic}-det-gpios

Hui Wang (1):
      ARM: dts: imx6qdl-sabresd: add dr_mode to usbotg

Marek Vasut (1):
      MAINTAINERS: Update entry for DH electronics DHSOM SoMs and boards

Stefan Kerkmann (3):
      ARM: dts: imx6qdl: add phy-3p0-supply to usb phys
      ARM: dts: imx6sl: add phy-3p0-supply to usb phys
      ARM: dts: imx6sx: add phy-3p0-supply to usb phys

 MAINTAINERS                                       | 13 ++---
 arch/arm/boot/dts/nxp/imx/imx51-zii-rdu1.dts      |  2 +-
 arch/arm/boot/dts/nxp/imx/imx51-zii-scu2-mezz.dts |  2 +-
 arch/arm/boot/dts/nxp/imx/imx6q-bx50v3.dtsi       |  2 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-apalis.dtsi     |  2 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-sabresd.dtsi    |  5 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi            |  6 ++-
 arch/arm/boot/dts/nxp/imx/imx6sl-evk.dts          |  2 +-
 arch/arm/boot/dts/nxp/imx/imx6sl.dtsi             |  6 ++-
 arch/arm/boot/dts/nxp/imx/imx6sll-evk.dts         |  2 +-
 arch/arm/boot/dts/nxp/imx/imx6sx-sdb.dtsi         |  2 +-
 arch/arm/boot/dts/nxp/imx/imx6sx.dtsi             |  6 ++-
 arch/arm/boot/dts/nxp/imx/imx6ul-14x14-evk.dtsi   |  2 +-
 arch/arm/boot/dts/nxp/imx/imx7-mba7.dtsi          | 61 +++++++----------------
 arch/arm/boot/dts/nxp/imx/imx7-tqma7.dtsi         |  3 +-
 arch/arm/boot/dts/nxp/imx/imx7d-mba7.dts          |  3 +-
 arch/arm/boot/dts/nxp/imx/imx7d-sdb.dts           |  2 +-
 17 files changed, 48 insertions(+), 73 deletions(-)



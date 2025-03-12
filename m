Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D36E3C28B28
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Mar 2025 07:46:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tkkCKsKh/UBLJXGmcNKAUnu7X2uUkZ7nN1RHhS9lQiI=; b=viB+0Qdt7lfalPLy3igvXNccga
	YkyLkc+hm00IWsgfl9MHjF8HNMdp5mn5rq2zV9TsJipGXwXsHc+pBFJu9/T1OICoKZUwnq38/I6zY
	bhjZoPwLvYuQApkileb39o4sm0cCeow+QgOh+yRfjCcSBLC0uOHjqEtAhxRd2en9KYihZN11MDxec
	bcik2cCQVaKjWgd2DWg+zr6R26MuYsO6ch7725mGl+m6Di9Yd7Z+mqsNQW0KYRAEVs+mxbT+LueJx
	UU1NoGZJIHupBWpibVy8++EpXRj23Xh+wi/icIgd/YsQxn6fQFiaBueprC3ht6lx1zV5cvQnE5/nC
	wi08rS2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsGnJ-00000007jn1-0PWJ;
	Wed, 12 Mar 2025 07:46:25 +0000
Received: from mail-m16.yeah.net ([220.197.32.18])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsGht-00000007j3T-1qi4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Mar 2025 07:40:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=tkkCK
	sKh/UBLJXGmcNKAUnu7X2uUkZ7nN1RHhS9lQiI=; b=UF9CXpkgHiOcl1Gt5AVNw
	wArJ6q/yjwGJoAGbLWiX5TNsCb8grxL3BBoYVNfUZo8sB/L7vVfhbWRzAtWnIisx
	dVpSj4s11CFcRknJiCYMoXPqGTdeN9m3hTh+GxBST2h3sZP4FJtTuoO/jrMIs89h
	w6fxThEPwEkXFBwhv09swo=
Received: from localhost.localdomain (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgAnwdRtOtFnQ6_FAA--.2767S5;
	Wed, 12 Mar 2025 15:40:32 +0800 (CST)
From: Shawn Guo <shawnguo2@yeah.net>
To: soc@kernel.org,
	arm@kernel.org
Cc: Shawn Guo <shawnguo@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	kernel@pengutronix.de,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 4/5] i.MX ARM device tree changes for 6.15
Date: Wed, 12 Mar 2025 15:40:04 +0800
Message-Id: <20250312074005.663165-4-shawnguo2@yeah.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250312074005.663165-1-shawnguo2@yeah.net>
References: <20250312074005.663165-1-shawnguo2@yeah.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: Ms8vCgAnwdRtOtFnQ6_FAA--.2767S5
X-Coremail-Antispam: 1Uf129KBjvJXoW3Jr4xAFy8WFWkZryrWr48WFg_yoWxtFy3pw
	13urs3GFs7Gr1xK3srA34UK3s8Aa4UZrs5Zr15Jay8GFW3Za47Ar9aywn3t343ZFZ5Zw1S
	qr1kur9rGFyUuaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jwtxDUUUUU=
X-Originating-IP: [117.81.240.4]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiCxcOZWfRB3jvOgABsq
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_004049_877362_611A5831 
X-CRM114-Status: GOOD (  12.34  )
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

The following changes since commit 2014c95afecee3e76ca4a56956a936e23283f05b:

  Linux 6.14-rc1 (2025-02-02 15:39:26 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-dt-6.15

for you to fetch changes up to 082f59a62474fbffe7e952082f6d265f11bc37a0:

  ARM: dts: apalis/colibri-imx6: Add support for v1.2 (2025-03-11 11:40:10 +0800)

----------------------------------------------------------------
i.MX ARM device tree changes for 6.15:

- New boards support: Variscite VAR-SOM-MX6UL SoM/Concerto, i.MX6
  apalis/colibri v1.2, i.MX28 based btt3
- A bunch of TQMa6/7 cleanups from Alexander Stein and Markus Niebel,
  ordering DT properties, correcting 3.3V supply, adding partitions
  child node to spi-nor, etc.
- A bunch of changes from Fabio Estevam to fix dt-schema warnings on
  various boards
- Other small and random changes

----------------------------------------------------------------
Alexander Stein (5):
      ARM: dts: imx7s: Move csi-mux to below root
      ARM: dts: imx6qdl-tqma6: Order DT properties
      ARM: dts: imx6ul-tqma6ul: Order DT properties
      ARM: dts: imx6ul-tqma6ul: Add vcc-supply for spi-nor
      ARM: dts: imx7-tqma7: Add vcc-supply for spi-nor

Antonin Godard (2):
      ARM: dts: imx6ul: Add Variscite VAR-SOM-MX6UL SoM support
      ARM: dts: imx6ul: Add Variscite Concerto board support

Chancel Liu (2):
      ARM: dts: imx6ul-14x14-evk: Complete WM8960 power supplies
      ARM: dts: imx7d-sdb: Complete WM8960 power supplies

Ernest Van Hoecke (2):
      ARM: dts: apalis/colibri-imx6: Enable STMPE811 TS
      ARM: dts: apalis/colibri-imx6: Add support for v1.2

Fabio Estevam (8):
      ARM: dts: imx53-ppd: Fix touchscreen reset-gpios
      ARM: dts: vfxxx: Fix the CAAM job ring node names
      ARM: dts: imx5: Fix the CCM interrupts description
      ARM: dts: vf610-bk4: Use the more specific "lwn,bk4-spi"
      ARM: dts: imx28-sps1: Fix GPIO LEDs description
      ARM: dts: vfxxx: Fix the order of the DMA entries
      ARM: dts: imx31: Use nand-controller as node name
      ARM: dts: imx53-mba53: Fix the PCA9554 compatible

Francesco Dolcini (2):
      ARM: dts: imx6qdl-apalis/colibri: Remove compatible from SoM dtsi
      ARM: dts: vf610-colibri: Remove compatible from SoM dtsi

Krzysztof Kozlowski (1):
      ARM: dts: nxp: vf: Align GPIO hog name with bindings

Lukasz Majewski (1):
      ARM: dts: mxs: Add descriptions for imx287 based btt3-[012] devices

Markus Niebel (8):
      ARM: dts: imx6qdl-mba6: change sound card model name
      ARM: dts: imx7-mba7: change sound card model name
      ARM: dts: mba6ul: change sound card model name
      ARM: dts: imx6qdl-tqma6: limit PMIC SW4 to 3.3V
      ARM: dts: imx6qdl-tqma6: use sw4_reg as 3.3V supply
      ARM: dts: imx6qdl-tqma6: Add partitions subnode to spi-nor
      ARM: dts: tqma6ul: Add partitions subnode to spi-nor
      ARM: dts: tqma7: Add partitions subnode to spi-nor

Max Merchel (1):
      ARM: dts: imx6ul-tqma6ul1: Change include order to disable fec2 node

 arch/arm/boot/dts/nxp/imx/Makefile                 |  10 +
 arch/arm/boot/dts/nxp/imx/imx31.dtsi               |   2 +-
 arch/arm/boot/dts/nxp/imx/imx50.dtsi               |   2 +-
 arch/arm/boot/dts/nxp/imx/imx51.dtsi               |   2 +-
 arch/arm/boot/dts/nxp/imx/imx53-mba53.dts          |   2 +-
 arch/arm/boot/dts/nxp/imx/imx53-ppd.dts            |   2 +-
 arch/arm/boot/dts/nxp/imx/imx53.dtsi               |   2 +-
 .../boot/dts/nxp/imx/imx6dl-colibri-v1.2-aster.dts |  11 +
 .../dts/nxp/imx/imx6dl-colibri-v1.2-eval-v3.dts    |  11 +
 .../dts/nxp/imx/imx6dl-colibri-v1.2-iris-v2.dts    |  11 +
 .../boot/dts/nxp/imx/imx6dl-colibri-v1.2-iris.dts  |  11 +
 .../dts/nxp/imx/imx6q-apalis-v1.2-eval-v1.2.dts    |  11 +
 .../boot/dts/nxp/imx/imx6q-apalis-v1.2-eval.dts    |  11 +
 .../dts/nxp/imx/imx6q-apalis-v1.2-ixora-v1.1.dts   |  11 +
 .../dts/nxp/imx/imx6q-apalis-v1.2-ixora-v1.2.dts   |  11 +
 .../boot/dts/nxp/imx/imx6q-apalis-v1.2-ixora.dts   |  11 +
 arch/arm/boot/dts/nxp/imx/imx6qdl-apalis-v1.2.dtsi |  57 ++++
 arch/arm/boot/dts/nxp/imx/imx6qdl-apalis.dtsi      |   2 -
 .../arm/boot/dts/nxp/imx/imx6qdl-colibri-v1.2.dtsi |  57 ++++
 arch/arm/boot/dts/nxp/imx/imx6qdl-colibri.dtsi     |   2 -
 arch/arm/boot/dts/nxp/imx/imx6qdl-mba6.dtsi        |   2 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-tqma6.dtsi       |  25 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-tqma6a.dtsi      |   4 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-tqma6b.dtsi      |   4 +-
 arch/arm/boot/dts/nxp/imx/imx6ul-14x14-evk.dtsi    |  32 +++
 .../boot/dts/nxp/imx/imx6ul-tqma6ul-common.dtsi    |  11 +-
 .../boot/dts/nxp/imx/imx6ul-tqma6ul1-mba6ulx.dts   |   3 +-
 arch/arm/boot/dts/nxp/imx/imx6ul-tqma6ul1.dtsi     |   2 -
 .../boot/dts/nxp/imx/imx6ul-var-som-concerto.dts   | 320 +++++++++++++++++++++
 arch/arm/boot/dts/nxp/imx/imx6ul-var-som.dtsi      | 233 +++++++++++++++
 arch/arm/boot/dts/nxp/imx/imx7-mba7.dtsi           |   2 +-
 arch/arm/boot/dts/nxp/imx/imx7-tqma7.dtsi          |   7 +
 arch/arm/boot/dts/nxp/imx/imx7d-sdb.dts            |  32 +++
 arch/arm/boot/dts/nxp/imx/imx7s.dtsi               |  56 ++--
 arch/arm/boot/dts/nxp/imx/mba6ulx.dtsi             |   2 +-
 arch/arm/boot/dts/nxp/mxs/Makefile                 |   3 +
 arch/arm/boot/dts/nxp/mxs/imx28-btt3-0.dts         |  12 +
 arch/arm/boot/dts/nxp/mxs/imx28-btt3-1.dts         |   8 +
 arch/arm/boot/dts/nxp/mxs/imx28-btt3-2.dts         |  39 +++
 arch/arm/boot/dts/nxp/mxs/imx28-btt3.dtsi          | 313 ++++++++++++++++++++
 arch/arm/boot/dts/nxp/mxs/imx28-sps1.dts           |  13 +-
 arch/arm/boot/dts/nxp/vf/vf610-bk4.dts             |   4 +-
 arch/arm/boot/dts/nxp/vf/vf610-colibri.dtsi        |   1 -
 arch/arm/boot/dts/nxp/vf/vf610-zii-dev-rev-c.dts   |   4 +-
 arch/arm/boot/dts/nxp/vf/vfxxx.dtsi                |  21 +-
 45 files changed, 1301 insertions(+), 91 deletions(-)
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6dl-colibri-v1.2-aster.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6dl-colibri-v1.2-eval-v3.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6dl-colibri-v1.2-iris-v2.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6dl-colibri-v1.2-iris.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6q-apalis-v1.2-eval-v1.2.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6q-apalis-v1.2-eval.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6q-apalis-v1.2-ixora-v1.1.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6q-apalis-v1.2-ixora-v1.2.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6q-apalis-v1.2-ixora.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6qdl-apalis-v1.2.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6qdl-colibri-v1.2.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-var-som-concerto.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-var-som.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/mxs/imx28-btt3-0.dts
 create mode 100644 arch/arm/boot/dts/nxp/mxs/imx28-btt3-1.dts
 create mode 100644 arch/arm/boot/dts/nxp/mxs/imx28-btt3-2.dts
 create mode 100644 arch/arm/boot/dts/nxp/mxs/imx28-btt3.dtsi



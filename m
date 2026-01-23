Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDCE4D7788E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Jan 2026 17:20:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=z3UTT4Ddm4zSBf5O+DmvwBEkvt0fzneTnv+oGgJD2f4=; b=Vtckgm7xXrCeqsAdtzK+SSdOoc
	eGYPTJEwhhcQIMwbO+aBSfZT8mwyRlIp+5unOJ36qB2eCqLsKn7ywRPehZp1H/L8fi5r66QUeQxWH
	8D/hDBNwgzOptfGiXRlgmzQ0wBbxeoZp9ixaqGRErQWamWCbpTLc3Z0XwvcVFFN0BQ0ChYeRHLZDC
	FAET+W914waf7lXvN2v32H0nii84zotY22XKBocagmmztanC4014OCcGbNWqWxwf+VtCgKTx5V4o4
	nJN+x6TKwJ+tYAXQYU8G+DQrCyaEglWIujuYDTSuvDaj4AE9TlEkVctNf8+1bmuRe92wX2ErtPvzr
	Cn/vxdtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjKpG-00000009HPa-249H;
	Fri, 23 Jan 2026 17:20:02 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjKpD-00000009HOj-46LI
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Jan 2026 17:20:01 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 3F2881A2A2D;
	Fri, 23 Jan 2026 17:19:58 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 149E26070A;
	Fri, 23 Jan 2026 17:19:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 80E3C119A87DF;
	Fri, 23 Jan 2026 18:19:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769188797; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=z3UTT4Ddm4zSBf5O+DmvwBEkvt0fzneTnv+oGgJD2f4=;
	b=i0VFNvRI9JKzaW9mLKbKKVI51vd6z6MT95G2ub5pvHDif4v7xalaGH12klGfeXrmS6B8fE
	AHqYPUey2Dpeejr728Oe5MsIgNk25hFnvXiqH5mySvmFWQI21DASd8ctU9aF191UNSz5H1
	QiA7mHyVDHj4k8otv/+d49NB65Pa0r4xqFjbfgypZjtL54woxEinyGF+W/RJxeorEsEXoi
	NuXltGtjWQHUrIRIGbCakA3OXLkQI/gnuasIf9AjyMG1T28lJDjOO5qgRPAig6cTy97KwU
	5TNNNe5fm2hxwWl+CELYNNsOdhVAIDlH1vfaANK6Kv9tBoNaN5qzvSdxlrblqQ==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: Arnd Bergmann <arnd@arndb.de>,  <arm@kernel.org>, soc@kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>, <linux-arm-kernel@lists.infradead.org>
Subject: [GIT PULL] ARM: mvebu: dt64 for v6.20 (#1)
Date: Fri, 23 Jan 2026 18:19:55 +0100
Message-ID: <87zf64jlfo.fsf@BLaptop.bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260123_092000_757191_441101A2 
X-CRM114-Status: GOOD (  11.16  )
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

Here is the first pull request for dt64 for mvebu for v6.20.

Gregory

The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1e8:

  Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gclement/mvebu.git tags/mve=
bu-dt64-6.20-1

for you to fetch changes up to fcaf733ca526b69595ed1d227e2cc59ddd24eff7:

  MAINTAINERS: Add Falcon DB (2026-01-23 10:30:41 +0100)

----------------------------------------------------------------
mvebu dt64 for 6.20 (part 1)

Add support for Armada 7020 Express Type 7 CPU module board by Marvell, inc=
luding:
 - COM Express CPU module and carrier board (Marvell DB-98CX85x0)
  - DDR4 memory, 1Gbit OOB Ethernet, 10G KR Ethernet, NAND/SPI flash, PCIe,=
 SATA, USB, and UART interfaces
Add SoC-specific compatibles for SafeXcel crypto engine on Armada 37xx and =
CP11x
Fix regulator type from "regulator-gpio" to "regulator-fixed" where no GPIO=
 control is present
Add missing GPIO properties for "nxp,pca9536" on cn9131-cf-solidwan
Fix and clean up pinctrl-names properties and typos
Add missing "#phy-cells" to "usb-nop-xceiv" nodes
MAINTAINERS: Add Falcon DB to the list of maintained Marvell Armada dts fil=
es

----------------------------------------------------------------
AngeloGioacchino Del Regno (1):
      arm64: dts: marvell: Add SoC specific compatibles to SafeXcel crypto

Elad Nachman (2):
      arm64: dts: a7k: add COM Express boards
      MAINTAINERS: Add Falcon DB

Rob Herring (Arm) (4):
      arm64: dts: marvell: Add missing "#phy-cells" to "usb-nop-xceiv"
      arm64: dts: marvell: Fix stray and typo "pinctrl-names" properties
      arm64: dts: marvell: cn9131-cf-solidwan: Add missing GPIO properties =
on "nxp,pca9536"
      arm64: dts: marvell: change regulator-gpio to regulator-fixed

 MAINTAINERS                                        |   1 +
 arch/arm64/boot/dts/marvell/Makefile               |   1 +
 arch/arm64/boot/dts/marvell/armada-3720-db.dts     |   1 +
 .../dts/marvell/armada-3720-espressobin-ultra.dts  |   2 +-
 .../boot/dts/marvell/armada-3720-gl-mv1000.dts     |   9 +-
 arch/arm64/boot/dts/marvell/armada-37xx.dtsi       |   3 +-
 .../boot/dts/marvell/armada-7020-comexpress.dtsi   | 161 +++++++++++++++++=
++++
 arch/arm64/boot/dts/marvell/armada-70x0.dtsi       |   7 +
 arch/arm64/boot/dts/marvell/armada-8040-db.dts     |   2 +
 arch/arm64/boot/dts/marvell/armada-ap806-dual.dtsi |   4 +-
 arch/arm64/boot/dts/marvell/armada-cp11x.dtsi      |   3 +-
 arch/arm64/boot/dts/marvell/cn9130-cf-base.dts     |   2 +-
 arch/arm64/boot/dts/marvell/cn9130-crb.dtsi        |   3 +-
 arch/arm64/boot/dts/marvell/cn9130-db.dtsi         |   4 +-
 arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dts |   2 +
 .../boot/dts/marvell/cn9131-db-comexpress.dtsi     |   3 +-
 arch/arm64/boot/dts/marvell/cn9131-db.dtsi         |   1 +
 arch/arm64/boot/dts/marvell/cn9132-db.dtsi         |   3 +-
 .../boot/dts/marvell/db-falcon-carrier-a7k.dts     |  27 ++++
 arch/arm64/boot/dts/marvell/db-falcon-carrier.dtsi |  22 +++
 20 files changed, 243 insertions(+), 18 deletions(-)
 create mode 100644 arch/arm64/boot/dts/marvell/armada-7020-comexpress.dtsi
 create mode 100644 arch/arm64/boot/dts/marvell/db-falcon-carrier-a7k.dts
 create mode 100644 arch/arm64/boot/dts/marvell/db-falcon-carrier.dtsi
--=20
Gr=C3=A9gory CLEMENT, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


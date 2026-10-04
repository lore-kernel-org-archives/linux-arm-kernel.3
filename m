Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BF70CA5FE6
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  4 Oct 2026 20:35:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1pLbVNzpT4k4uzm/tuI3sNHGXY3AO/i5v4vy/cMAy5M=; b=w1PWo+sv/ijevBUlpXzeiEpsvB
	/Li2fr5sp0u66HKONccKdmc0dBkL2IEUY1V4RG2PdetA4/LRn1gbt9bxJN++k4xuRpREjEXsTL4Z8
	gf0UXKXVxqtSDyzuD2rvZ5Mn+qNx/D2qtaAgD+4TGll5tet3MT1mZACdgBHg3mWTnw4k+kbBGW7Hk
	xQMDe+SDs/UWM5XqQ1EJTdXvsSa0Ayx9C4ZtkMK4BtuOBVvkIdg97m2b7C7SkeLH9HNwlbQKF2Ivg
	1dfNbPtldf0Nq/syfCPtn0Z3KmWzhfghJUfK7IDVa8MV+LHXYR5n86L40hHYdhKQnrk9ySvP0pfHJ
	eX2SP5lQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDSvk-0000000FGw0-1z3r;
	Sun, 04 Oct 2026 20:35:34 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDSv2-0000000FGsd-22zv
	for linux-arm-kernel@lists.infradead.org;
	Sun, 04 Oct 2026 20:34:58 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id E18DC1A1138;
	Sun,  4 Oct 2026 20:34:45 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A7204604FE;
	Sun,  4 Oct 2026 20:34:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D7E501032820F;
	Sun,  4 Oct 2026 22:34:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791146084; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=1pLbVNzpT4k4uzm/tuI3sNHGXY3AO/i5v4vy/cMAy5M=;
	b=0yzQYGwmusJsIxmTjYFWxhjC4uF+JeaScpF48UTpoFVYGGeeAt5IJB+d1AaCPDiTA2zCfR
	JTUMHAS1qxn2OJ21xouHV9Yukj+IYkFA+9hZ8Q31XOYhziH++1ER/TIO2NiMGSwdITNBcg
	F8+ct5i/cnb4pbOFo5Gwqy5CAHOUo8+KS7zwSCOz6fe8xdGA+jjGBZl6zbnrKEoW79RAmS
	dMpUdtaWeTZ0YiU7ktsMvlVgeHf+sxaIMOu6jtSijGPaFJ04KjpYhc1hUSILTl5szGJyZN
	2EB3QOYgl3uuJlhU9PDIPfLRfHSHamXZtPb9EflPfDIeKPdk+nsHL82RzCsGaw==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: Arnd Bergmann <arnd@arndb.de>,  <arm@kernel.org>, soc@kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>, <linux-arm-kernel@lists.infradead.org>
Subject: [GIT PULL] ARM: mvebu: dt for v7.4 (#1)
Date: Sun, 04 Oct 2026 22:34:43 +0200
Message-ID: <87o6d96w7w.fsf@BLaptop.bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261004_133448_680703_43BCC37D 
X-CRM114-Status: UNSURE (   7.30  )
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

Hi,

Here is the first pull request for dt for mvebu for v7.4.

Gregory

The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:

  Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gclement/mvebu.git tags/mve=
bu-dt-7.4-1

for you to fetch changes up to 6dfda79476538a9aad1d2dac45453e62c6939522:

  ARM: dts: marvell: armada-388: use onnn,pca9655 compatible (2026-09-30 08=
:48:51 +0200)

----------------------------------------------------------------
mvebu dt for 7.4 (part 1)

Various fixes for Armada 388 based boards (helios4, clearfog)
Clean up indentation in dove, kirkwood and orion5x dtsi files.

----------------------------------------------------------------
Krzysztof Kozlowski (1):
      ARM: dts: marvell: Replace spaces indentation with tabs

Rosen Penev (10):
      ARM: dts: helios4: fix lm75 supply name
      ARM: dts: armada-385-clearfog-gtr: fix vmmc property name
      ARM: dts: marvell: add missing SDHCI clock-names
      ARM: dts: armada-395-gp: drop unsupported SDHCI clock-frequency
      ARM: dts: armada-388-helios4: fix vmmc property name
      ARM: dts: helios4: fix vbus-supply for USB2 PHY
      ARM: dts: helios4: fix spi1 location
      ARM: dts: helios4: use national,lm75 compatible
      ARM: dts: helios4: add #phy-cells to USB nop phys
      ARM: dts: marvell: armada-388: use onnn,pca9655 compatible

 .../boot/dts/marvell/armada-385-clearfog-gtr.dtsi  |  2 +-
 arch/arm/boot/dts/marvell/armada-388-clearfog.dtsi |  7 +----
 arch/arm/boot/dts/marvell/armada-388-helios4.dts   | 36 ++++++++----------=
----
 arch/arm/boot/dts/marvell/armada-38x.dtsi          |  1 +
 arch/arm/boot/dts/marvell/armada-395-gp.dts        |  1 -
 arch/arm/boot/dts/marvell/armada-39x.dtsi          |  1 +
 arch/arm/boot/dts/marvell/dove.dtsi                | 22 ++++++-------
 arch/arm/boot/dts/marvell/kirkwood-6282.dtsi       | 15 +++++----
 .../dts/marvell/kirkwood-guruplug-server-plus.dts  |  4 +--
 arch/arm/boot/dts/marvell/kirkwood-lsxl.dtsi       |  4 +--
 arch/arm/boot/dts/marvell/kirkwood-synology.dtsi   | 12 ++++----
 .../arm/boot/dts/marvell/orion5x-rd88f5182-nas.dts |  2 +-
 12 files changed, 46 insertions(+), 61 deletions(-)

--=20
Gr=C3=A9gory CLEMENT, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


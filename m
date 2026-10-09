Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F0D3CA6019
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 14:49:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=scmNF+46DLi47sIsqDRc0pGdZ0vlaMSMU1w1wYTd5PA=; b=RJkZu9AuA7X/TOZ33Me8tnlbQf
	MaYy06VyH438HxEuQ1phYHBW0ptuyhxxcapvgXqqRvRSWZ7RijJF+Jbb5L00Cj/7jEeNXqy4sdDkj
	GShJoOS3U4AYozL5xn1xi7gMGqhUIqyX6ZH3d07biRY7va84NJsPGxhMSVR7iddbNN6yHJnHah+DW
	gyfCVLDl6fvw8/qyTLGSXmykgCwsJ97kQH5YFLgKsd0PsFLtbfLlaxGlK9k8qqsZKotsaou3pG83f
	0KwzYQL75MYob/J0B1OaGhTZTZ2Xovu2cboVfBJ8gtNaKfjYtN3vukdf+t0EgaODYaFi3GiU9IWbk
	bTCJ+1dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFBu0-00000006UIi-20HO;
	Fri, 09 Oct 2026 14:48:52 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFBtx-00000006UHh-0JDm
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Oct 2026 14:48:51 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id A1D564E410FE;
	Fri,  9 Oct 2026 14:48:43 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6DE3960754;
	Fri,  9 Oct 2026 14:48:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 59D6C11D708B4;
	Fri,  9 Oct 2026 16:48:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791557318; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=scmNF+46DLi47sIsqDRc0pGdZ0vlaMSMU1w1wYTd5PA=;
	b=lXBeS3sBtikQ+kqLl5aIhWy5pok18OOS5k1HR6XGQ/E9lAzbB/HcljLlWg5FoHB6PhL4i1
	DvTldtMIKH5GPoMNk3RUh5pl1HnE25MChj3liDr0w/mvm9+O7GuoWEBMatVXcbJN0v19Fv
	8tK9v5eqX5hAadFQl0cJ4bm/E+e+MbIGObc3hAHiIOZUEdHXAjOMop8d7G3y9LwOUMSsmA
	MGejHU5unlM/RzT8w2D//+CGrmARdnWqZbos2tIdMi/Y3J2ibdqskAbMxv827R+yczlFdg
	EgPcmyG+y2fgFEjJS9HZI9zfgyCBADDGSMEjPP8xR86IsDAHlf24POSde9KY/Q==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: Arnd Bergmann <arnd@arndb.de>,  <arm@kernel.org>, soc@kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>, <linux-arm-kernel@lists.infradead.org>
Subject: [GIT PULL] ARM: mvebu: dt for v7.4 (#2)
Date: Fri, 09 Oct 2026 16:48:36 +0200
Message-ID: <87v77b53qz.fsf@BLaptop.bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261009_074849_251136_38669A4D 
X-CRM114-Status: UNSURE (   9.36  )
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

Here is the second version of the first pull request for dt for mvebu
for v7.4.
Compared to the first version I have just removed the patch introducing
new warning because of a missing dt binding.

Gregory

The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:

  Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gclement/mvebu.git tags/mve=
bu-dt-7.4-2

for you to fetch changes up to a7b2dbf2a48d30e49f141883e605874595d5942e:

  ARM: dts: helios4: add #phy-cells to USB nop phys (2026-09-30 08:34:58 +0=
200)

----------------------------------------------------------------
mvebu dt for 7.4 (part 1 v2)

Various fixes for Armada 388 based boards (helios4, clearfog)
Clean up indentation in dove, kirkwood and orion5x dtsi files.

----------------------------------------------------------------
Krzysztof Kozlowski (1):
      ARM: dts: marvell: Replace spaces indentation with tabs

Rosen Penev (9):
      ARM: dts: helios4: fix lm75 supply name
      ARM: dts: armada-385-clearfog-gtr: fix vmmc property name
      ARM: dts: marvell: add missing SDHCI clock-names
      ARM: dts: armada-395-gp: drop unsupported SDHCI clock-frequency
      ARM: dts: armada-388-helios4: fix vmmc property name
      ARM: dts: helios4: fix vbus-supply for USB2 PHY
      ARM: dts: helios4: fix spi1 location
      ARM: dts: helios4: use national,lm75 compatible
      ARM: dts: helios4: add #phy-cells to USB nop phys

 .../boot/dts/marvell/armada-385-clearfog-gtr.dtsi  |  2 +-
 arch/arm/boot/dts/marvell/armada-388-helios4.dts   | 27 ++++++++++--------=
----
 arch/arm/boot/dts/marvell/armada-38x.dtsi          |  1 +
 arch/arm/boot/dts/marvell/armada-395-gp.dts        |  1 -
 arch/arm/boot/dts/marvell/armada-39x.dtsi          |  1 +
 arch/arm/boot/dts/marvell/dove.dtsi                | 22 +++++++++---------
 arch/arm/boot/dts/marvell/kirkwood-6282.dtsi       | 15 ++++++------
 .../dts/marvell/kirkwood-guruplug-server-plus.dts  |  4 ++--
 arch/arm/boot/dts/marvell/kirkwood-lsxl.dtsi       |  4 ++--
 arch/arm/boot/dts/marvell/kirkwood-synology.dtsi   | 12 +++++-----
 .../arm/boot/dts/marvell/orion5x-rd88f5182-nas.dts |  2 +-
 11 files changed, 44 insertions(+), 47 deletions(-)

--=20
Gr=C3=A9gory CLEMENT, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


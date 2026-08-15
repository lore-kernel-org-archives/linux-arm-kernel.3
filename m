Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BD60C5CFDB
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Aug 2026 08:31:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TG4dt0eY+JRqs2ZUkBGkr0HGfFEd7ziAQfB8YGDuGjs=; b=Ec0ofs/Mvs2rqqB6HR2uTNTvGl
	GdLYxmeFFJ/uBRneHdF6vETltKiHXgemhCh3p30slQztr8l66UepB/Ji2HFs12ZhAvo4vrte9hCQ3
	7UdMur2pBC8FUazKq/Hi8N7lVX7RlYq6c6fOnfbPmPuUgTHn09QC5TfTpaYQYY8igqrE+wbcYTPLu
	O2UMk1eeUYbUiPRLWL3OVMxpFSsS2Ttc+mN9LnULxd+6Jucq0ER9+d1eLzOyI1X+k9y5mB0qtLWuK
	ByTap8YRZe+OE0evICcDqUKuB7cK/nok1zH9hErQIgSBd8STv2j0pcCaBnvFhrcKff7+ienZfLupX
	2NVpgXRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wv9ng-00000003fw5-3roZ;
	Sat, 15 Aug 2026 08:31:32 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wv9nc-00000003fvg-2859
	for linux-arm-kernel@lists.infradead.org;
	Sat, 15 Aug 2026 08:31:31 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id D7B831A151B;
	Sat, 15 Aug 2026 08:31:25 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 94B3F604AA;
	Sat, 15 Aug 2026 08:31:25 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 45EA011C4F436;
	Sat, 15 Aug 2026 10:31:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1786782680; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=TG4dt0eY+JRqs2ZUkBGkr0HGfFEd7ziAQfB8YGDuGjs=;
	b=BtW1aBUi0LzZfrmMB6heB14cLJkmiGJZgwhFr5TgzEpaksKZVDHpntcNdjd9cDPxaqt8f+
	WIbjtWoBMZ53onqm0XO+g2jCHhE1/aACVr2FrvJLL6v3s78tpUs+0HRSd2PcvdTLLpI5XO
	Wmpazgwssc10R5p5oAHzuZRAxUjX6IgyuHu+O51p4Sm7dD3WrE2pGTuDU0jLNdEBAciX74
	9HrjsNohG5f1GMa0RzqdddqZMuYC75I69KWPQ4U1xqEliLgGHU2K2Ud//iI7AU6IRxe/rA
	SgMndDFtZ/3elPTuPTJNyr3OyLXQ0e+kQN5OicD/0VsCVJNKtEfmQBhgRA0hFA==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: Arnd Bergmann <arnd@arndb.de>,  <arm@kernel.org>, soc@kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>, <linux-arm-kernel@lists.infradead.org>
Subject: [GIT PULL] ARM: mvebu: dt for v7.3 (#1)
Date: Sat, 15 Aug 2026 10:31:19 +0200
Message-ID: <87ik5bokdk.fsf@BLaptop.bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260815_013130_002526_BAED4641 
X-CRM114-Status: UNSURE (   8.33  )
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

Here is the first pull request for dt for mvebu for v7.3.

Sorry for the delay. I only managed to push my branches for linux-next
last Sunday, so I waited a few days for them to be merged before
creating this PR.

Gregory

The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e52491777482:

  Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gclement/mvebu.git tags/mve=
bu-dt-7.3-1

for you to fetch changes up to 7a90520e8c9a8f48fe6f3e741cf34d8c2b6dbc61:

  ARM: dts: helios4: add SATA regulator supplies (2026-08-09 12:47:04 +0200)

----------------------------------------------------------------
mvebu dt for 7.3 (part 1)

Add regulator supplies for helios4 (Armada 388 based)
Correct indentation on dts files

----------------------------------------------------------------
Krzysztof Kozlowski (3):
      ARM: dts: marvell: armada: Correct indentation
      ARM: dts: marvell: kirkwood: Correct indentation
      ARM: dts: marvell: orion5x: Correct indentation

Rosen Penev (3):
      ARM: dts: helios4: add vcc-supply to EEPROM
      ARM: dts: helios4: add vcc-supply to GPIO expander
      ARM: dts: helios4: add SATA regulator supplies

 arch/arm/boot/dts/marvell/armada-370.dtsi                  |  8 ++++----
 arch/arm/boot/dts/marvell/armada-388-helios4.dts           | 13 ++++++++++=
+++
 arch/arm/boot/dts/marvell/armada-xp-gp.dts                 | 14 +++++++---=
----
 arch/arm/boot/dts/marvell/kirkwood-b3.dts                  |  4 ++--
 .../boot/dts/marvell/kirkwood-netgear_readynas_duo_v2.dts  |  2 +-
 arch/arm/boot/dts/marvell/kirkwood-ns2-common.dtsi         |  2 +-
 arch/arm/boot/dts/marvell/kirkwood-openblocks_a6.dts       |  2 +-
 arch/arm/boot/dts/marvell/kirkwood-openblocks_a7.dts       |  2 +-
 arch/arm/boot/dts/marvell/kirkwood-ts419.dtsi              |  2 +-
 arch/arm/boot/dts/marvell/orion5x-lacie-d2-network.dts     |  2 +-
 .../boot/dts/marvell/orion5x-maxtor-shared-storage-2.dts   |  2 +-
 11 files changed, 33 insertions(+), 20 deletions(-)

--=20
Gr=C3=A9gory CLEMENT, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


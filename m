Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9F10CF857C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Nov 2025 09:51:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Nf2MKg3ETrlRe2dMSMrMdLfVe8iEcC5mFRODdYJZ2jM=; b=Zfc8+QMiabhcDIwBCX5k3XEqlN
	3DKPDIK5+0VG5+yVnRRvUhUYsuNmpPJzFuHGt1SfF5HvP3MCVXNAZ9Az7Lery4XtrDpwnlYg6saPo
	2+aTaJJwA8rmq8ztsOczGoQFPO6RXmAfHShHvICupznk0Zv80Ot/ws0vKwdzfJ7YPunIczBbJgtNA
	C8VdTPVXXRCB5WoY7Q6+tKDnzgJGcsiEn9UtUbAn0blyK2uLJEEuswzdR25/x4DEYCzqsKiDsGEmc
	jCYIayC6LLSMBW+BMDuFBC1gqq2MhY5D4SgizTvOxNeL7sZM/O7/G2RP6bQx8DJJg5uBQ29wDA/rp
	KQvgv97w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM1Jm-00000006SHa-3sll;
	Thu, 20 Nov 2025 09:51:10 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM1Jk-00000006SH0-478l
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Nov 2025 09:51:10 +0000
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vM1Jf-0002La-G0; Thu, 20 Nov 2025 10:51:03 +0100
From: Philipp Zabel <p.zabel@pengutronix.de>
To: soc@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	kernel@pengutronix.de,
	Philipp Zabel <p.zabel@pengutronix.de>
Subject: [GIT PULL] Reset controller updates for v6.19
Date: Thu, 20 Nov 2025 10:50:59 +0100
Message-ID: <20251120095059.2787351-1-p.zabel@pengutronix.de>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::54
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251120_015109_021300_A91105DB 
X-CRM114-Status: GOOD (  10.74  )
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

Dear arm-soc maintainers,

The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df56787:

  Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)

are available in the Git repository at:

  https://git.pengutronix.de/git/pza/linux.git tags/reset-for-v6.19

for you to fetch changes up to 1387cb78f101553c7fc14ec04ba730cab03ea3df:

  Documentation: reset: Remove reset_controller_add_lookup() (2025-11-20 10:02:37 +0100)

----------------------------------------------------------------
Reset controller updates for v6.19

* Add support for LAN969x, eic770 and RZ/G3S reset controllers,
  for the RZ/G3S USB-PHY reset controller, and for the remaining
  TH1520 reset controllers.
* Drop legacy reset control lookup code.
* Include linux/bits.h from linux/reset.h to make it self-contained.

----------------------------------------------------------------
Bartosz Golaszewski (2):
      clk: davinci: psc: drop unused reset lookup
      reset: remove legacy reset lookup code

Claudiu Beznea (3):
      dt-bindings: reset: renesas,rzg2l-usbphy-ctrl: Document RZ/G3S support
      reset: rzg2l-usbphy-ctrl: Add support for USB PWRRDY
      reset: rzg2l-usbphy-ctrl: Add support for RZ/G3S SoC

Dan Carpenter (1):
      reset: rzg2l-usbphy-ctrl: Fix a NULL vs IS_ERR() bug in probe

Encrow Thorne (1):
      reset: fix BIT macro reference

Robert Marko (2):
      dt-bindings: reset: microchip: Add LAN969x support
      reset: sparx5: add LAN969x support

Xuyang Dong (2):
      dt-bindings: reset: eswin: Documentation for eic7700 SoC
      reset: eswin: Add eic7700 reset driver

Yao Zi (4):
      dt-bindings: reset: thead,th1520-reset: Remove non-VO-subsystem resets
      dt-bindings: reset: thead,th1520-reset: Add controllers for more subsys
      reset: th1520: Prepare for supporting multiple controllers
      reset: th1520: Support reset controllers in more subsystems

Yue Haibing (1):
      Documentation: reset: Remove reset_controller_add_lookup()

 .../bindings/reset/eswin,eic7700-reset.yaml        |  42 ++
 .../devicetree/bindings/reset/microchip,rst.yaml   |  11 +-
 .../bindings/reset/renesas,rzg2l-usbphy-ctrl.yaml  |  41 +-
 .../bindings/reset/thead,th1520-reset.yaml         |   8 +-
 Documentation/driver-api/reset.rst                 |   1 -
 drivers/clk/davinci/psc-da850.c                    |   7 -
 drivers/reset/Kconfig                              |  13 +-
 drivers/reset/Makefile                             |   1 +
 drivers/reset/core.c                               | 124 +--
 drivers/reset/reset-eic7700.c                      | 429 +++++++++++
 drivers/reset/reset-rzg2l-usbphy-ctrl.c            |  60 ++
 drivers/reset/reset-th1520.c                       | 837 ++++++++++++++++++++-
 include/dt-bindings/reset/eswin,eic7700-reset.h    | 298 ++++++++
 include/dt-bindings/reset/thead,th1520-reset.h     | 219 +++++-
 include/linux/reset-controller.h                   |  33 -
 include/linux/reset.h                              |   1 +
 16 files changed, 1936 insertions(+), 189 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/reset/eswin,eic7700-reset.yaml
 create mode 100644 drivers/reset/reset-eic7700.c
 create mode 100644 include/dt-bindings/reset/eswin,eic7700-reset.h


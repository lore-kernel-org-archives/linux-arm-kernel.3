Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D36DD6AAEC
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Apr 2026 17:05:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/cmxnxbLkcTsu04vVVOUQVD7IbjRgfqfsVRstns1eEY=; b=v4i1Nk94JvSR0d+OqdKA7wgbmA
	HrvJ/1TWEAJddxtOaYYSt6KXw3CSbNEXMW6rVVQLuAoyZAgxY9NwTeqzT1/KsKMsM35o+CcMeZTXJ
	4STxEw3cBixEYHPPvijFxgT7necU9F6MFjAchPe4GBFyZ3VuGpSfoJAgp+Ykc7o7Hg9TA9WJV4Ju5
	IfzzW0MhPcGzAPRM3hKVW1COrOqqU7ZYwS2aa0WnIZjKGFR7Wj8i/Ezy2p6NWiwa6w+YVKvSWGFeL
	Ztw7T2K1t1BmkCWCOaKZjwskR1OTv5Hh3xpmplWwSRM7mEdc1QdqC+Pl9nPKVR11juqs3VLlX59gv
	h62Z3PNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8LU4-00000000ZVY-2fbh;
	Thu, 02 Apr 2026 17:05:32 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8LU0-00000000ZV0-3MS9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Apr 2026 17:05:31 +0000
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1w8LTy-00078F-3k; Thu, 02 Apr 2026 19:05:26 +0200
From: Philipp Zabel <p.zabel@pengutronix.de>
To: soc@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	kernel@pengutronix.de,
	Philipp Zabel <p.zabel@pengutronix.de>
Subject: [GIT PULL] Reset controller updates for v7.1
Date: Thu,  2 Apr 2026 19:05:25 +0200
Message-ID: <20260402170525.2452299-1-p.zabel@pengutronix.de>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::54
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_100528_842976_FFE3931E 
X-CRM114-Status: GOOD (  14.61  )
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

The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:

  Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)

are available in the Git repository at:

  https://git.pengutronix.de/git/pza/linux.git tags/reset-for-v7.1

for you to fetch changes up to d373605cd514837d8a6de3d00c786d4bae6dbaf8:

  Merge tag 'reset-fixes-for-v7.0-2' into reset/next (2026-04-02 18:32:53 +0200)

----------------------------------------------------------------
Reset controller updates for v7.1

* Rework the reset core to support firmware nodes, add more fine
  grained locking, and use guard() helpers.
* Change the reset-gpio driver to use firmware nodes.
* Add support for the Cix Sky1 SoC reset controller.
* Add support for the RZ/G3E SoC to the reset-rzv2h-usb2phy driver and
  convert it to regmap. Prepare registering a VBUS mux controller.
* Replace use of the deprecated register_restart_handler() function in
  the ath79, intel-gw, lpc18xx, ma35d1, npcm, and sunplus reset drivers.
* Combine two allocations into one in the sti/reset-syscfg driver.
* Fix the reset-rzg2l-usbphy-ctrl MODULE_AUTHOR email.
* Fix the reset_control_rearm() kerneldoc comment.

The last commit is a merge of reset-fixes-for-v7.0-2 into reset/next,
to solve a merge conflict between commits a9b95ce36de4 ("reset: gpio: add a
devlink between reset-gpio and its consumer") and fbffb8c7c7bb ("reset: gpio:
fix double free in reset_add_gpio_aux_device() error path").

----------------------------------------------------------------
Andrew Davis (6):
      reset: ath79: Use devm_register_restart_handler()
      reset: intel: Use devm_register_restart_handler()
      reset: lpc18xx: Use devm_register_sys_off_handler()
      reset: ma35d1: Use devm_register_sys_off_handler()
      reset: npcm: Use devm_register_sys_off_handler()
      reset: sunplus: Use devm_register_sys_off_handler()

Bartosz Golaszewski (15):
      reset: gpio: remove unneeded OF-node put
      reset: gpio: add a devlink between reset-gpio and its consumer
      reset: gpio: simplify fallback device matching
      reset: gpio: remove unneeded auxiliary_set_drvdata()
      reset: warn on reset-gpio release
      reset: fold ida_alloc() into reset_create_gpio_aux_device()
      reset: use lock guards in reset core
      reset: handle removing supplier before consumers
      reset: protect struct reset_controller_dev with its own mutex
      reset: protect struct reset_control with its own mutex
      reset: convert of_reset_control_get_count() to using firmware nodes
      reset: convert the core API to using firmware nodes
      reset: convert reset core to using firmware nodes
      reset: gpio: make the driver fwnode-agnostic
      reset: don't overwrite fwnode_reset_n_cells

Biju Das (1):
      reset: rzg2l-usbphy-ctrl: Fix malformed MODULE_AUTHOR string

Claudiu Beznea (2):
      reset: rzg2l-usbphy-ctrl: Check pwrrdy is valid before using it
      reset: core: Drop unnecessary double quote

Gary Yang (2):
      dt-bindings: soc: cix: document the syscon on Sky1 SoC
      reset: add Sky1 soc reset support

Guangshuo Li (1):
      reset: gpio: fix double free in reset_add_gpio_aux_device() error path

Philipp Zabel (2):
      reset: core: Fix indentation
      Merge tag 'reset-fixes-for-v7.0-2' into reset/next

Rosen Penev (1):
      reset: sti: kzalloc + kcalloc to kzalloc

Tommaso Merciai (5):
      reset: rzv2h-usb2phy: Keep PHY clock enabled for entire device lifetime
      dt-bindings: reset: renesas,rzv2h-usb2phy: Add '#mux-state-cells' property
      dt-bindings: reset: renesas,rzv2h-usb2phy: Document RZ/G3E USB2PHY reset
      reset: rzv2h-usb2phy: Convert to regmap API
      reset: rzv2h-usb2phy: Add support for VBUS mux controller registration

Yixun Lan (1):
      reset: spacemit: k3: Decouple composite reset lines

 .../reset/renesas,rzv2h-usb2phy-reset.yaml         |   9 +-
 .../bindings/soc/cix/cix,sky1-system-control.yaml  |  42 ++
 Documentation/driver-api/reset.rst                 |   1 -
 drivers/reset/Kconfig                              |   9 +
 drivers/reset/Makefile                             |   1 +
 drivers/reset/core.c                               | 518 ++++++++++++++-------
 drivers/reset/reset-ath79.c                        |  12 +-
 drivers/reset/reset-gpio.c                         |  27 +-
 drivers/reset/reset-intel-gw.c                     |  11 +-
 drivers/reset/reset-lpc18xx.c                      |  12 +-
 drivers/reset/reset-ma35d1.c                       |  11 +-
 drivers/reset/reset-npcm.c                         |  12 +-
 drivers/reset/reset-rzg2l-usbphy-ctrl.c            |   5 +-
 drivers/reset/reset-rzv2h-usb2phy.c                | 197 ++++----
 drivers/reset/reset-sky1.c                         | 367 +++++++++++++++
 drivers/reset/reset-sunplus.c                      |  12 +-
 drivers/reset/spacemit/reset-spacemit-k3.c         |  60 ++-
 drivers/reset/sti/reset-syscfg.c                   |   9 +-
 .../dt-bindings/reset/cix,sky1-s5-system-control.h | 163 +++++++
 .../dt-bindings/reset/cix,sky1-system-control.h    |  41 ++
 include/dt-bindings/reset/spacemit,k3-resets.h     |  48 +-
 include/linux/reset-controller.h                   |  21 +-
 include/linux/reset.h                              |  43 +-
 23 files changed, 1223 insertions(+), 408 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/soc/cix/cix,sky1-system-control.yaml
 create mode 100644 drivers/reset/reset-sky1.c
 create mode 100644 include/dt-bindings/reset/cix,sky1-s5-system-control.h
 create mode 100644 include/dt-bindings/reset/cix,sky1-system-control.h


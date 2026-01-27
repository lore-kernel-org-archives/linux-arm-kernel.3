Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF486D2D8D4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Jan 2026 10:23:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ls15gSJpT5YRkSXYvVjEiEfAPu82eNI6h+Hpuv3Ad1I=; b=JTIwoZK5r2jUK6zhlAH9ZeM+aN
	PfqZmHj+eQ+BTpFRJsTGE91pQnInfeDgHWnAP9AJKJowBVDi5J2sI+uEYmt0zBFrQ/SbrX66pxBNT
	QsDGDyTIFVr7DahMl6B0dEUotcvs83HESKElfR8+tkXdnUALNL2wTLLh+7GaonM2+ZuQpOVLLBr0N
	WJ7ccKFsBNTQHi+VK58YWYmrd0iw3B2prKJ4d4oLXzuN6DDD9KMXkfTKUIQWEtj+p35peHy7flp2C
	eienYcnzG6ZO+gTrFaw0yjncBo/3j5KxUcvYM1FZCQ4koLncrweapoY9Y+0uS55hMUNXKAwHJ7sa+
	WM9A0sIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkgDn-0000000E36b-0XkS;
	Tue, 27 Jan 2026 10:22:55 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkgDh-0000000E34Y-02t9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Jan 2026 10:22:51 +0000
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vkgDb-0005OS-Kx; Tue, 27 Jan 2026 11:22:43 +0100
From: Philipp Zabel <p.zabel@pengutronix.de>
To: soc@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	kernel@pengutronix.de,
	Philipp Zabel <p.zabel@pengutronix.de>
Subject: [GIT PULL] Reset controller updates for v6.20
Date: Tue, 27 Jan 2026 11:22:37 +0100
Message-ID: <20260127102237.3945322-1-p.zabel@pengutronix.de>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::54
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_022249_071787_C507FA61 
X-CRM114-Status: GOOD (  12.66  )
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

The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1e8:

  Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)

are available in the Git repository at:

  https://git.pengutronix.de/git/pza/linux.git tags/reset-for-v6.20

for you to fetch changes up to 938ce3b16582657e67f3bd8a7efa59089c467c90:

  reset: spacemit: Add SpacemiT K3 reset driver (2026-01-24 16:53:02 +0100)

----------------------------------------------------------------
Reset controller updates for v6.20

* Add a compatible to the reset-gpio driver, suppress the sysfs bind
  attributes, and propagate GPIO API errors.
* Add support for the i.MX8ULP SIM LPAV reset controller.
* Add RZ/G3S USBPHY suspend/resume support.
* Enable reset-k230 by default on ARCH_CANAAN
* Add support for the SpacemiT K3 SoC reset controller.
* Merge the 'spacemit-clkrst-v6.20-3' tag, shared with the clk tree,
  as a dependency for the SpacemiT changes.

----------------------------------------------------------------
Bartosz Golaszewski (3):
      reset: gpio: add the "compatible" property
      reset: gpio: suppress bind attributes in sysfs
      reset: gpio: check the return value of gpiod_set_value_cansleep()

Claudiu Beznea (2):
      reset: rzg2l-usbphy-ctrl: Propagate the return value of regmap_field_update_bits()
      reset: rzg2l-usbphy-ctrl: Add suspend/resume support

Guodong Xu (4):
      dt-bindings: soc: spacemit: Add K3 reset support and IDs
      reset: Create subdirectory for SpacemiT drivers
      reset: spacemit: Extract common K1 reset code
      reset: spacemit: Add SpacemiT K3 reset driver

Junhui Liu (1):
      reset: canaan: k230: drop OF dependency and enable by default

Laurentiu Mihalcea (4):
      reset: imx8mp-audiomix: Drop unneeded macros
      reset: imx8mp-audiomix: Switch to using regmap API
      reset: imx8mp-audiomix: Extend the driver usage
      reset: imx8mp-audiomix: Support i.MX8ULP SIM LPAV

Philipp Zabel (1):
      Merge tag 'spacemit-clkrst-v6.20-3' into reset/next

Yixun Lan (4):
      clk: spacemit: prepare common ccu header
      reset: spacemit: fix auxiliary device id
      Merge tags 'spacemit-clkrst-v6.20-1' and 'spacemit-clkrst-v6.20-2' into spacemit-clkrst-v6.20
      clk: spacemit: k3: extract common header

 .../bindings/soc/spacemit/spacemit,k1-syscon.yaml  |   8 +-
 drivers/reset/Kconfig                              |  14 +-
 drivers/reset/Makefile                             |   2 +-
 drivers/reset/core.c                               |   7 +-
 drivers/reset/reset-gpio.c                         |   9 +-
 drivers/reset/reset-imx8mp-audiomix.c              | 169 +++++++++----
 drivers/reset/reset-rzg2l-usbphy-ctrl.c            | 110 +++++++--
 drivers/reset/spacemit/Kconfig                     |  36 +++
 drivers/reset/spacemit/Makefile                    |   5 +
 drivers/reset/spacemit/reset-spacemit-common.c     |  77 ++++++
 drivers/reset/spacemit/reset-spacemit-common.h     |  42 ++++
 .../reset-spacemit-k1.c}                           | 109 +-------
 drivers/reset/spacemit/reset-spacemit-k3.c         | 233 ++++++++++++++++++
 include/dt-bindings/reset/spacemit,k3-resets.h     | 171 +++++++++++++
 include/soc/spacemit/ccu.h                         |  21 ++
 include/soc/spacemit/k1-syscon.h                   |  12 +-
 include/soc/spacemit/k3-syscon.h                   | 273 +++++++++++++++++++++
 17 files changed, 1103 insertions(+), 195 deletions(-)
 create mode 100644 drivers/reset/spacemit/Kconfig
 create mode 100644 drivers/reset/spacemit/Makefile
 create mode 100644 drivers/reset/spacemit/reset-spacemit-common.c
 create mode 100644 drivers/reset/spacemit/reset-spacemit-common.h
 rename drivers/reset/{reset-spacemit.c => spacemit/reset-spacemit-k1.c} (78%)
 create mode 100644 drivers/reset/spacemit/reset-spacemit-k3.c
 create mode 100644 include/dt-bindings/reset/spacemit,k3-resets.h
 create mode 100644 include/soc/spacemit/ccu.h
 create mode 100644 include/soc/spacemit/k3-syscon.h


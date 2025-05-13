Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4669AC3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 May 2025 09:27:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Re+3xSGdbQ4YZhlD6EZmPLIe3gM/2qZ8N8p8ljr2VMI=; b=NQVd/Mbv9+k7F9SGzhMWMXoNTl
	HodzFNASgmu/xjDyNMfSpEMZGujNc9rVeWgY4gi/+OPSSRy5vzyywXKFWahLTaRUttepUdExzB/o9
	oQ5bFVnTDrokLX/HZi64th4Bo9z9dhz93Eb8HJ5ALUcCs47xv2LvSnKGD5b93pZ4Oo0ABSPuhp+sB
	A0gRNpGIdAplzTrdFcU1fP1SH7BBDUvR/PZE8iDBuBRrG7DK8Ik+H0w5m/1QEpfg4HKAObob1NT0c
	hwh9U4i/4tzi5mj0pRAd01nQKNeLq9PqngeT17VN/X5yZpElkHXCnuPG2jRRCbQyLI0ON/SIPjA19
	Keo38CLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uElvB-0000000BuTN-0QXJ;
	Tue, 13 May 2025 09:27:33 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEltA-0000000BuFx-2Z9O
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 May 2025 09:25:29 +0000
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1uElt9-0000vC-EO; Tue, 13 May 2025 11:25:27 +0200
From: Philipp Zabel <p.zabel@pengutronix.de>
To: soc@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	kernel@pengutronix.de,
	Philipp Zabel <p.zabel@pengutronix.de>
Subject: [GIT PULL] Reset controller updates for v6.16
Date: Tue, 13 May 2025 11:25:16 +0200
Message-Id: <20250513092516.3331585-1-p.zabel@pengutronix.de>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::54
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250513_022528_647215_0D530090 
X-CRM114-Status: UNSURE (   9.48  )
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

Dear arm-soc maintainers,

The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:

  Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)

are available in the Git repository at:

  git://git.pengutronix.de/pza/linux.git tags/reset-for-v6.16

for you to fetch changes up to 1c64de886b8893c0158097edd6ba08d527a2c97a:

  dt-bindings: reset: sophgo: Add SG2044 bindings. (2025-05-05 15:22:33 +0200)

----------------------------------------------------------------
Reset controller updates for v6.16

* Add T-HEAD TH1520 and Renesas RZ/V2H(P) USB2PHY reset controller
  drivers.
* Add devm_reset_control_array_get_exclusive_released() variant to allow
  using the acquire/release hand-off mechanism for exclusive reset
  controls bundled into reset control arrays.
* Add Sophgo SG2044 reset controller to device tree bindings.

----------------------------------------------------------------
Inochi Amaoto (1):
      dt-bindings: reset: sophgo: Add SG2044 bindings.

Lad Prabhakar (3):
      dt-bindings: reset: Document RZ/V2H(P) USB2PHY reset
      reset: Add USB2PHY port reset driver for Renesas RZ/V2H(P)
      MAINTAINERS: Add entry for Renesas RZ/V2H(P) USB2PHY Port Reset driver

Michal Wilczynski (2):
      dt-bindings: reset: Add T-HEAD TH1520 SoC Reset Controller
      reset: thead: Add TH1520 reset controller driver

Patrice Chotard (1):
      reset: Add devm_reset_control_array_get_exclusive_released()

 .../reset/renesas,rzv2h-usb2phy-reset.yaml         |  56 +++++
 .../bindings/reset/sophgo,sg2042-reset.yaml        |   7 +-
 .../bindings/reset/thead,th1520-reset.yaml         |  44 ++++
 MAINTAINERS                                        |  11 +
 drivers/reset/Kconfig                              |  17 ++
 drivers/reset/Makefile                             |   2 +
 drivers/reset/reset-rzv2h-usb2phy.c                | 236 +++++++++++++++++++++
 drivers/reset/reset-th1520.c                       | 135 ++++++++++++
 include/dt-bindings/reset/thead,th1520-reset.h     |  16 ++
 include/linux/reset.h                              |   6 +
 10 files changed, 529 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/reset/renesas,rzv2h-usb2phy-reset.yaml
 create mode 100644 Documentation/devicetree/bindings/reset/thead,th1520-reset.yaml
 create mode 100644 drivers/reset/reset-rzv2h-usb2phy.c
 create mode 100644 drivers/reset/reset-th1520.c
 create mode 100644 include/dt-bindings/reset/thead,th1520-reset.h


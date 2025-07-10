Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19E40C83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jul 2025 17:35:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ay5R9XvnmQvAaBpMtaQvyIEGSLsEiW770MBmSmsj0hg=; b=CzlhIAOva/oabxnKW982bZilbz
	jzGKhXqCu6G2/ZNVjMGlQ7z9tAnchPvVtVnDKR8KZiiqrVgjH+eqt15mwplLsZTXMwn4/Fh6ABQNF
	oEBF9vfFP4KCf3BH7V7dUUVh0uTsRP2G7iQlERT1B25plBAhtUO3EJ6o2cfQAwrmav3cORFA9YzKP
	Q0ZA2oumIADfift9cbyQXP+lvd7YUcLWfcw767O/DnRjCErKuFJlyWvm7k1mPKIzHyw02BTt7rDJ+
	jnyx0DFIQNMRzPPDD9P01zfG8DnnhxMKAuO9F/0glsQ4lu1c3U1Wdxc8YQ5OMHY8GpCbSNjInv07u
	Q5RZ8E2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZvBL-0000000CbMP-3FaH;
	Thu, 10 Jul 2025 17:35:39 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZt9E-0000000CFFb-2n9x
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Jul 2025 15:25:21 +0000
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1uZt9B-0008Oa-Ed; Thu, 10 Jul 2025 17:25:17 +0200
From: Philipp Zabel <p.zabel@pengutronix.de>
To: soc@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	kernel@pengutronix.de,
	Philipp Zabel <p.zabel@pengutronix.de>
Subject: [GIT PULL] Reset controller updates for v6.17
Date: Thu, 10 Jul 2025 17:25:13 +0200
Message-Id: <20250710152513.1346298-1-p.zabel@pengutronix.de>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::54
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_082520_701493_E02E3AAE 
X-CRM114-Status: GOOD (  11.64  )
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

The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494:

  Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)

are available in the Git repository at:

  https://git.pengutronix.de/git/pza/linux.git tags/reset-for-v6.17

for you to fetch changes up to 196dbace08243bbd4639cdb3d8ec655b2da361bd:

  dt-bindings: reset: Convert snps,dw-reset to DT schema (2025-07-03 11:04:54 +0200)

----------------------------------------------------------------
Reset controller updates for v6.17

* Support reset controllers on Kendryte K230 and SOPHGO CV1800B.
* Add RZ/V2N USB2PHY reset controller bindings
* Use auxiliary device creation helpers in reset-mpfs.
* Convert nxp,lcp1850-rgu and snps,dw-reset binding docs to DT schema.
* Enable reset-brcmstb(-rescal) on BCM2712.
* Fix a typo in the T-HEAD TH1520 Kconfig option

----------------------------------------------------------------
Drew Fustini (1):
      reset: thead: Fix TH1520 typo

Frank Li (1):
      dt-bindings: reset: convert nxp,lpc1850-rgu.txt to yaml format

Inochi Amaoto (2):
      dt-bindings: reset: sophgo: Add CV1800B support
      reset: simple: add support for Sophgo CV1800B

Jerome Brunet (1):
      reset: mpfs: use the auxiliary device creation

Junhui Liu (2):
      dt-bindings: reset: add support for canaan,k230-rst
      reset: canaan: add reset driver for Kendryte K230

Lad Prabhakar (1):
      dt-bindings: reset: renesas,rzv2h-usb2phy: Document RZ/V2N SoC support

Peter Robinson (1):
      reset: brcmstb: Enable reset drivers for ARCH_BCM2835

Rob Herring (Arm) (1):
      dt-bindings: reset: Convert snps,dw-reset to DT schema

 .../devicetree/bindings/reset/canaan,k230-rst.yaml |  39 +++
 .../devicetree/bindings/reset/nxp,lpc1850-rgu.txt  |  83 -----
 .../devicetree/bindings/reset/nxp,lpc1850-rgu.yaml | 101 ++++++
 .../reset/renesas,rzv2h-usb2phy-reset.yaml         |   7 +-
 .../devicetree/bindings/reset/snps,dw-reset.txt    |  30 --
 .../devicetree/bindings/reset/snps,dw-reset.yaml   |  39 +++
 .../bindings/reset/sophgo,sg2042-reset.yaml        |   4 +-
 drivers/reset/Kconfig                              |  21 +-
 drivers/reset/Makefile                             |   1 +
 drivers/reset/reset-k230.c                         | 371 +++++++++++++++++++++
 drivers/reset/reset-mpfs.c                         |  56 +---
 drivers/reset/reset-simple.c                       |   2 +
 include/dt-bindings/reset/canaan,k230-rst.h        |  90 +++++
 13 files changed, 672 insertions(+), 172 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/reset/canaan,k230-rst.yaml
 delete mode 100644 Documentation/devicetree/bindings/reset/nxp,lpc1850-rgu.txt
 create mode 100644 Documentation/devicetree/bindings/reset/nxp,lpc1850-rgu.yaml
 delete mode 100644 Documentation/devicetree/bindings/reset/snps,dw-reset.txt
 create mode 100644 Documentation/devicetree/bindings/reset/snps,dw-reset.yaml
 create mode 100644 drivers/reset/reset-k230.c
 create mode 100644 include/dt-bindings/reset/canaan,k230-rst.h


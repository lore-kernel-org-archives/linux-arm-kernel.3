Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11E9FE9A74E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 09:43:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=h1j7nhXNxy5z2nDtI4anQZ5tze0oTo26BnQ3y9sJs7Y=; b=EGXwQRLpX4hkxm42uNp2ihQVHf
	dS0CFyTBfEUf+epXy1ybrrE7xsLsqRw5d1z2yRsZnKjkjXJ7aOsTPQeOUVXkbuS7+3mtq7tgkOIJl
	nt/vF0lvgOlsrkrwV0laLtn6gRuzNfA4XqoeZgqHBQ+2UNoOqLt/suB+suEr1ZoUH5Dnqz0KLWiHr
	THpLYtdHkaJN/93r4Z0kZ+JyWPLG4eBLELvi/fqY7fyY1XaAUmsD3CarWGJ8KwhjBueARL9Zazyq5
	bRQwZQJWLygKPQ5pQHbd6TK17oZHIMO1A4ESkp+8O/94+Tuj0JSjXDnYm4qP5trQJ/2mvGzTgFtfa
	hsNwee1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4yHx-000000017dH-2IEd;
	Tue, 24 Mar 2026 09:43:05 +0000
Received: from metis.whiteo.stw.pengutronix.de ([185.203.201.7])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4yHu-000000017cs-3169
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 09:43:04 +0000
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1w4yHr-0006HF-LO; Tue, 24 Mar 2026 10:42:59 +0100
From: Philipp Zabel <p.zabel@pengutronix.de>
To: soc@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	kernel@pengutronix.de,
	Philipp Zabel <p.zabel@pengutronix.de>
Subject: [GIT PULL] Reset controller fixes for v7.0, part 2
Date: Tue, 24 Mar 2026 10:42:55 +0100
Message-ID: <20260324094255.3538772-1-p.zabel@pengutronix.de>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::54
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_024302_757196_2C80EC16 
X-CRM114-Status: UNSURE (   9.22  )
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

The following changes since commit e0cf84109bc6c6768337123f1de24ff56b41c91b:

  reset: rzg2l-usbphy-ctrl: Check pwrrdy is valid before using it (2026-02-23 17:03:28 +0100)

are available in the Git repository at:

  https://git.pengutronix.de/git/pza/linux.git tags/reset-fixes-for-v7.0-2

for you to fetch changes up to a0e0c2f8c5f32b675f58e25a9338283cedb5ad2b:

  reset: spacemit: k3: Decouple composite reset lines (2026-03-23 12:25:47 +0100)

----------------------------------------------------------------
Reset controller fixes for v7.0, part 2

* Decouple spacemit K3 reset lines that were incorrectly coupled
  together as one, but are in fact separate resets in hardware.
* Fix a double free in the reset_add_gpio_aux_device() error path.
  This has already been fixed on reset/next by commit a9b95ce36de4
  ("reset: gpio: add a devlink between reset-gpio and its consumer").
* Fix the MODULE_AUTHOR string in the rzg2l-usbphy-ctrl driver.

----------------------------------------------------------------
Biju Das (1):
      reset: rzg2l-usbphy-ctrl: Fix malformed MODULE_AUTHOR string

Guangshuo Li (1):
      reset: gpio: fix double free in reset_add_gpio_aux_device() error path

Yixun Lan (1):
      reset: spacemit: k3: Decouple composite reset lines

 drivers/reset/core.c                           |  1 -
 drivers/reset/reset-rzg2l-usbphy-ctrl.c        |  2 +-
 drivers/reset/spacemit/reset-spacemit-k3.c     | 60 +++++++++++++++-----------
 include/dt-bindings/reset/spacemit,k3-resets.h | 48 +++++++++++++++------
 4 files changed, 73 insertions(+), 38 deletions(-)


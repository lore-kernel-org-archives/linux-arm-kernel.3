Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A976DD13588
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 03:56:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/oUjjD/eRBA5m22VQ9yhvGIODstk5j7yR2JxKhQTjmY=; b=uHGFU1uJV7146WXb8fEKxFtztS
	ukEjG3awHBNsM15s7HLOj+rq9yZGeF9uw0wMi2WCQa37bAR6TytaLUSS/1aQFXSKVyKwsK3O8KsBG
	TlG0iaZJGkQculEsgvmQhuUMeruk/cl0uuciWqACwUJJA9RGO8wzodgdo5MyoAx2AD560IekDJdLh
	1pgVndx+QnbOOvVTh6ihhtOt1Du2aNRK7QgPRS06chmhMwoLk+E+PjcFGWx5ttdenChQVBvG9X1gn
	HRBMkpcfZraRLgJChWMhdQY+QhEyyM586QZyM1xEy24jrZpRYU75ZxnBTpKZP+qFRtv7J9OPi8nrT
	UVqlG4BQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5Gru-00000009UW1-3PNl;
	Mon, 28 Oct 2024 03:56:38 +0000
Received: from saphodev.broadcom.com ([192.19.144.205] helo=relay.smtp-ext.broadcom.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5GqK-00000009UPQ-0Umo
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Oct 2024 03:55:02 +0000
Received: from mail-lvn-it-01.lvn.broadcom.net (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 5A4CCC0005C0;
	Sun, 27 Oct 2024 20:54:55 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 5A4CCC0005C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1730087695;
	bh=Xea9EH2FO5ceZOT+mYEFNS4GnXIX0lfAVOtRDGmyxKQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fxAMZu2ViwiWCYgQhHp2DJRjAZOx6zHaHmp7NMiskbckOe5XHjcWiNlVQX/uT5vAD
	 GV3hnsZTHjFFbfKIsMx+3Bz93mTT8vL+/umzKzGyq6hY2aSgBBRowdJESDPIvN0TGY
	 viNKqaCERbDUEE1plKttUGUH5IxoXl7GaFr/VAW4=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail-lvn-it-01.lvn.broadcom.net (Postfix) with ESMTPSA id 0587018041CACA;
	Sun, 27 Oct 2024 20:54:55 -0700 (PDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: soc@kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	William Zhang <william.zhang@broadcom.com>,
	linux-arm-kernel@lists.infradead.org,
	arnd@arndb.de,
	olof@lixom.net,
	khilman@kernel.org,
	bcm-kernel-feedback-list@broadcom.com
Subject: [GIT PULL 2/2] Broadcom soc changes for 6.13
Date: Sun, 27 Oct 2024 20:54:49 -0700
Message-ID: <20241028035449.734504-2-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241028035449.734504-1-florian.fainelli@broadcom.com>
References: <20241028035449.734504-1-florian.fainelli@broadcom.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241027_205500_343598_25A17565 
X-CRM114-Status: GOOD (  10.50  )
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

The following changes since commit 9852d85ec9d492ebef56dc5f229416c925758edc:

  Linux 6.12-rc1 (2024-09-29 15:06:19 -0700)

are available in the Git repository at:

  https://github.com/Broadcom/stblinux.git tags/arm-soc/for-6.13/soc

for you to fetch changes up to 4ee0bd85dd0a505ea3a1117bf4fad429c1f013ab:

  ARM: bcm: brcmstb: Drop custom init_irq callback (2024-10-08 15:02:31 -0700)

----------------------------------------------------------------
This pull request contains Broadcom ARM-based SoC changes for 6.13,
please pull the following:

- Linus adds support for the debug UART on BCM6846 (BCMBCA) platform

- Florian dros the custom init_irq() callback which does the same thing
  as the standard irqchip_init()

----------------------------------------------------------------
Florian Fainelli (1):
      ARM: bcm: brcmstb: Drop custom init_irq callback

Linus Walleij (1):
      ARM: bcm: Support BCMBCA debug UART

 arch/arm/Kconfig.debug           | 12 +++++++++---
 arch/arm/mach-bcm/Makefile       |  1 +
 arch/arm/mach-bcm/board_bcmbca.c | 31 +++++++++++++++++++++++++++++++
 arch/arm/mach-bcm/brcmstb.c      |  6 ------
 4 files changed, 41 insertions(+), 9 deletions(-)
 create mode 100644 arch/arm/mach-bcm/board_bcmbca.c


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1BFFE66882
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Dec 2025 20:46:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Q51fm52oajOFRP5XFtODag3lpI4GTfTXB1z2+yA+Y1g=; b=nps+XTmTIboI6Co8e4BIDDY641
	+lq2bsb0i3N7UraiXXTut3nOqdcTdjtqyOMN8Eg98+lCtG/n89yl1ohT5xBHEAz87etRHXJFhmf8T
	ldLLSs5COahE9ZfZkk6KxAiNJDE1WyePfvrNVESakrOGR9Hu8hzpnMVgBQdXqMNc81XIzVkR1nGq3
	cgShqEs4nxz0zikJyMjIroRG9IVW82elzsiu+OJbyAN4y4jNsZxpHj1ERdVbo/2X6diyCnTUV42Nr
	nxHK19J8IMbRyNjhpDkVq1Xl6Qp96rrQjZficwIpbDKdlQSHrBthP7YlkLUjDgW3RLnZqiktfMip7
	jZJDOlMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWhMY-0000000Axvf-3vxG;
	Fri, 19 Dec 2025 20:46:10 +0000
Received: from relay.smtp-ext.broadcom.com ([192.19.144.205])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWhMW-0000000AxvH-2zFg
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Dec 2025 20:46:10 +0000
Received: from mail-lvn-it-01.broadcom.com (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 7D89FC0005DE;
	Fri, 19 Dec 2025 12:46:07 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 7D89FC0005DE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1766177167;
	bh=uFoiAnmfkJdBKjec/SKY3O4A9OIGwgwAd5zYY2hU5Mc=;
	h=From:To:Cc:Subject:Date:From;
	b=ZFS//D1I/a0QX+ABNCQJZtABaTiQ6RWS0MyTmE20f9Y8DgfjATxiaNTmLRJdPpQhw
	 z9ssngQr1ueVBA6UTzcNbWwuCcUn0pWJcSKEvbB5ofwjz7Pev9Gdplno+UoUnRmsWc
	 iLN39h4srKBJ0lhyvdeBrdY/jDDTKpfgmxeJv0U4=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-lvn-it-01.broadcom.com (Postfix) with ESMTPSA id 302D9A340;
	Fri, 19 Dec 2025 12:46:07 -0800 (PST)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: soc@kernel.org
Cc: Andrea della Porta <andrea.porta@suse.com>,
	Rob Herring <robh@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	linux-arm-kernel@lists.infradead.org,
	arnd@arndb.de,
	khilman@kernel.org,
	bcm-kernel-feedback-list@broadcom.com
Subject: [GIT PULL 1/1] Broadcom devicetree-arm64 fixes for 6.19
Date: Fri, 19 Dec 2025 12:46:03 -0800
Message-ID: <20251219204603.1016528-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_124608_826551_6358F6B9 
X-CRM114-Status: UNSURE (   9.71  )
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

The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1e8:

  Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)

are available in the Git repository at:

  https://github.com/Broadcom/stblinux.git tags/arm-soc/for-6.19/devicetree-arm64-fixes

for you to fetch changes up to 9a96cc8bbeefbc64654ac9c3da619443c22f6d32:

  arm64: dts: broadcom: rp1: drop RP1 overlay (2025-12-19 12:42:36 -0800)

----------------------------------------------------------------
This pull request contains Broadcom ARM64-SoC Device Tree fixes for
6.19, please pull the following:

- Andrea fixes the RP1 DeviceTree hierarchy and drop overlay support,
  this resolves a number of DTC warnings and other issues

----------------------------------------------------------------
Andrea della Porta (4):
      dt-bindings: misc: pci1de4,1: add required reg property for endpoint
      misc: rp1: drop overlay support
      arm64: dts: broadcom: bcm2712: fix RP1 endpoint PCI topology
      arm64: dts: broadcom: rp1: drop RP1 overlay

 .../devicetree/bindings/misc/pci1de4,1.yaml        |  8 ++++-
 arch/arm64/boot/dts/broadcom/Makefile              |  4 +--
 ...i-5-b-ovl-rp1.dts => bcm2712-rpi-5-b-base.dtsi} |  0
 arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts   | 39 ++++++++++++++--------
 arch/arm64/boot/dts/broadcom/rp1-nexus.dtsi        | 14 --------
 arch/arm64/boot/dts/broadcom/rp1.dtso              | 11 ------
 drivers/misc/rp1/Kconfig                           |  6 +---
 drivers/misc/rp1/Makefile                          |  3 +-
 drivers/misc/rp1/rp1-pci.dtso                      | 25 --------------
 drivers/misc/rp1/rp1_pci.c                         | 37 +++-----------------
 drivers/pci/quirks.c                               |  1 -
 11 files changed, 40 insertions(+), 108 deletions(-)
 rename arch/arm64/boot/dts/broadcom/{bcm2712-rpi-5-b-ovl-rp1.dts => bcm2712-rpi-5-b-base.dtsi} (100%)
 delete mode 100644 arch/arm64/boot/dts/broadcom/rp1-nexus.dtsi
 delete mode 100644 arch/arm64/boot/dts/broadcom/rp1.dtso
 delete mode 100644 drivers/misc/rp1/rp1-pci.dtso


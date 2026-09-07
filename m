Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8CF6C79F9E
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 12:33:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Espsjrco/55JPAZn2OfI/GTcyp7cAFpdNKPByCK+WN4=; b=KBeCRkAcd7FLWbIa04em/+RzKY
	T6IRAtY6veo0T2KXZtKBrnrpiEIkHF504c8rtVVjlUfg4Kq43QSg+wYTMz3VA1iL5VogoCPtl1Ec9
	YDSXHLTYc5DqvlWvQvAbvLLEZwBtGv3UgWpuUDZkop6QTWPxU40R5MsHWv8r8yFCqnJfdHk6ueUaa
	U7uy2N7DdjBrRP2Sb8YMkj6NgrKphhwZ40W6uWb+4oIvfjtsrwovjxaXWj/ARSjhv3SAf7UMb0nvg
	D7eYR3ffLhD97ZR7HxyS1UxURbRxi2+SjXOU6n/erEUAhqHaVo+nZaS+dBdUf5D38Zkn07wAa0dAm
	BPdbA00g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3YXQ-00000006oEh-0sfd;
	Mon, 07 Sep 2026 12:33:28 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3YXO-00000006oEQ-3AiG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 12:33:26 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 13167417C3;
	Mon,  7 Sep 2026 12:33:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAFF41F00A3A;
	Mon,  7 Sep 2026 12:33:24 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] ARM: shmobile: defconfig: Refresh for v7.3-rc1
Date: Mon,  7 Sep 2026 14:33:22 +0200
Message-ID: <6aa72dc7c7d5f9e7a1e38b4247c202db0bd190f7.1788784378.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Refresh the defconfig for Renesas ARM systems:
  - Move CONFIG_EEPROM_AT24=y (moved in commit cf09b7a05618bea9
    ("eeprom: move nvmem EEPROM drivers to drivers/nvmem/")),
  - Disable 8250/16550 Moxa PCIe device support (not applicable).

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in renesas-devel for v7.4.
---
 arch/arm/configs/shmobile_defconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm/configs/shmobile_defconfig b/arch/arm/configs/shmobile_defconfig
index 6f9696e9fe17ddcc..cb7eddd4eb22f945 100644
--- a/arch/arm/configs/shmobile_defconfig
+++ b/arch/arm/configs/shmobile_defconfig
@@ -48,7 +48,6 @@ CONFIG_MTD_CFI_INTELEXT=y
 CONFIG_MTD_PHYSMAP=y
 CONFIG_MTD_PHYSMAP_OF=y
 CONFIG_MTD_SPI_NOR=y
-CONFIG_EEPROM_AT24=y
 CONFIG_BLK_DEV_SD=y
 CONFIG_ATA=y
 CONFIG_SATA_RCAR=y
@@ -79,6 +78,7 @@ CONFIG_SERIAL_8250=y
 CONFIG_SERIAL_8250_CONSOLE=y
 # CONFIG_SERIAL_8250_PCI is not set
 # CONFIG_SERIAL_8250_EXAR is not set
+# CONFIG_SERIAL_8250_MOXA_PCIE is not set
 CONFIG_SERIAL_8250_DW=y
 CONFIG_SERIAL_8250_EM=y
 # CONFIG_SERIAL_8250_PERICOM is not set
@@ -209,6 +209,7 @@ CONFIG_PWM_RENESAS_RCAR=y
 CONFIG_PWM_RENESAS_TPU=y
 CONFIG_PHY_RCAR_GEN2=y
 CONFIG_PHY_RCAR_GEN3_USB2=y
+CONFIG_EEPROM_AT24=y
 # CONFIG_DNOTIFY is not set
 CONFIG_MSDOS_FS=y
 CONFIG_VFAT_FS=y
-- 
2.43.0



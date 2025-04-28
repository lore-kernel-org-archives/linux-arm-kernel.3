Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF21BC369D5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Apr 2025 13:04:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qn2vPT2DN1TaN4L7LLFaOp1OBtZmI/eT74IDt32FnQQ=; b=dqeZ5QdPLu9ATzzgC5rKI3VLt1
	KRG0mJLFcmzG0Sw5KNldvm+aEpJraBinIUCtoxx+njE1xwPOHpDVIbXl5yCagV6bwbgbM0hxRLGJf
	kH9H6XR8n1sITM+Re4EewE9SfgcBnM8sGd+9GOAazxDh0j8sonSi6MbgEDSplf12ECV9n2wJFVL+i
	cuCc/wVpoOehbTQcE+SLVDbe5A1diwBQw4C8mvsW+8mV4mbVM8W1ZlUmRf+Z/A/8aqwzzzfKC7dU/
	9KLLsC6EuEFpWAsv0shbjkSeWLFmazjefoL6B50upp6vV9cU10n+dy0jQQoQUVqWDupT7nkyG6UDl
	bSbe+UQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9OA3-00000006K8o-2Xhe;
	Mon, 28 Apr 2025 13:04:39 +0000
Received: from laurent.telenet-ops.be ([2a02:1800:110:4::f00:19])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9NPl-000000068x1-3ASE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Apr 2025 12:16:51 +0000
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:b9c4:1670:abc0:a1fc])
	by laurent.telenet-ops.be with cmsmtp
	id icGj2E0094Aed8c01cGjlj; Mon, 28 Apr 2025 14:16:43 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1u9NPd-00000000F9x-3qnF;
	Mon, 28 Apr 2025 14:16:43 +0200
Received: from geert by rox.of.borg with local (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1u9NPf-00000006xsY-08Lq;
	Mon, 28 Apr 2025 14:16:43 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Magnus Damm <magnus.damm@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] ARM: shmobile: defconfig: Enable more support for RZN1D-DB/EB
Date: Mon, 28 Apr 2025 14:16:42 +0200
Message-ID: <a40aa69832ef292497b9170e2ad607bd9dfd7e21.1745842538.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_051649_927934_F2CFD6A1 
X-CRM114-Status: UNSURE (   9.74  )
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
Message-ID: <20250428121642.FKzxKxID9IpsoXv2z1kptjDorJC-npDidSw81CeCl6g@z>

Enable more support for the Renesas RZN1D-DB and RZN1D-EB development
and expansion boards:
  - Polled GPIO buttons (also used on the Marzen development board),
  - Synopsys DesignWare I2C adapters,
  - National Semiconductor LM75 sensors and compatibles (which requires
    not disabling Hardware Monitoring support),
  - Arasan SDHCI controllers.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in renesas-devel for v6.16.
---
 arch/arm/configs/shmobile_defconfig | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/arm/configs/shmobile_defconfig b/arch/arm/configs/shmobile_defconfig
index 357cb144150be852..0ea34d5d797c818a 100644
--- a/arch/arm/configs/shmobile_defconfig
+++ b/arch/arm/configs/shmobile_defconfig
@@ -63,6 +63,7 @@ CONFIG_SMSC_PHY=y
 CONFIG_CAN_RCAR=y
 CONFIG_INPUT_EVDEV=y
 CONFIG_KEYBOARD_GPIO=y
+CONFIG_KEYBOARD_GPIO_POLLED=y
 # CONFIG_INPUT_MOUSE is not set
 CONFIG_INPUT_TOUCHSCREEN=y
 CONFIG_TOUCHSCREEN_EDT_FT5X06=y
@@ -84,6 +85,7 @@ CONFIG_SERIAL_8250_EM=y
 CONFIG_SERIAL_SH_SCI=y
 CONFIG_I2C_CHARDEV=y
 CONFIG_I2C_DEMUX_PINCTRL=y
+CONFIG_I2C_DESIGNWARE_CORE=y
 CONFIG_I2C_EMEV2=y
 CONFIG_I2C_GPIO=y
 CONFIG_I2C_RIIC=y
@@ -104,7 +106,7 @@ CONFIG_GPIO_PCF857X=y
 CONFIG_POWER_RESET=y
 CONFIG_POWER_RESET_RMOBILE=y
 CONFIG_POWER_SUPPLY=y
-# CONFIG_HWMON is not set
+CONFIG_SENSORS_LM75=y
 CONFIG_THERMAL=y
 CONFIG_CPU_THERMAL=y
 CONFIG_RCAR_THERMAL=y
@@ -174,6 +176,9 @@ CONFIG_USB_RENESAS_USBHS_UDC=y
 CONFIG_USB_RENESAS_USBF=y
 CONFIG_USB_ETH=y
 CONFIG_MMC=y
+CONFIG_MMC_SDHCI=y
+CONFIG_MMC_SDHCI_PLTFM=y
+CONFIG_MMC_SDHCI_OF_ARASAN=y
 CONFIG_MMC_SDHI=y
 CONFIG_MMC_SH_MMCIF=y
 CONFIG_NEW_LEDS=y
-- 
2.43.0



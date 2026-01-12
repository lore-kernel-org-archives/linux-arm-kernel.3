Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEB69C9EC8D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Jan 2026 15:35:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BhZVcy1c1kjpIFO4flUQ7HDdo+oMnHW0qosi24llWKA=; b=hhVw46ZGytVAsD83YY51MmTs1b
	4noqfr1rE2inlVuH6i6zR29AcvB+5iHLwwyCy9a16YZDY9+lUPKvvelBY3Ft4QMyU+E5G+3ZpT92o
	ZpQQogS1/WSmS6ujXkikDhXXBCLRewJowy4L30XC2lnitNKsIA44CfId3qjrtkmAz+IMCOhstiqY6
	h0rMiea7GOKn8i6LBM2n0HY4DAXKg5dGtJJqbfdNlFmgCt3eW1nS1RHyxZN7XGIXehchZb2Uor/3J
	ZPt6M6swH7MqBJEplEZQcvx4tvz03h/WnryUQzMJXsOPGeVEJw75OzcoPpKBGKpk9Oxap2saYSkF9
	B92OraoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfJxD-00000005eIt-2OGj;
	Mon, 12 Jan 2026 15:35:39 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfJxA-00000005eHt-3dXY
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Jan 2026 15:35:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 076346000A;
	Mon, 12 Jan 2026 15:35:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 297CBC19422;
	Mon, 12 Jan 2026 15:35:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768232135;
	bh=VJbJChd8N/LfN0hMbX+wa83dkNT92miG2RddNVLajrI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=U9aLuI8PO6Z01Vz9i1Xm/nKhIEKBFPDAzMIxe5VxPFutzNtC3v3wx1HUUxDcXDaQV
	 T5CSNIdIhp47zUPnYbqQZRLG1PQ33E2kSuR9XKIBfC/mHyAuWt1yEKgESIdsvD/ADP
	 dOiO+eKDcsc/yfhEAJGaU9SpPhIAKgRItZbGTVSrgsB0g1km4fVY/oAF0ufoE4veKa
	 SVPPRJfBpXGng22aSOHoNkB1+8coavyAxDgnIB5ZjlOVDTcvl2Vt41jBr5bn7VNx9N
	 g92gaLOwxTV8VhyIeBPXjkcl6EbKHAqHAlF8pPEyZ5jc0t0QjAis8twFbHm7qKvpG4
	 SLJVBkNUgfmdw==
From: Arnd Bergmann <arnd@kernel.org>
To: soc@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH 2/2] ARM: defconfig: turn off CONFIG_EXPERT
Date: Mon, 12 Jan 2026 16:32:55 +0100
Message-Id: <20260112153255.795553-2-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260112153255.795553-1-arnd@kernel.org>
References: <20260112153255.795553-1-arnd@kernel.org>
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

From: Arnd Bergmann <arnd@arndb.de>

Since multi_v7_defconfig is meant to be the generic defconfig, many
users are not going to be experts and it is counterintuitive to have
CONFIG_EXPERT enabled.

This change has a couple of side-effects:

 - CONFIG_NAMESPACES is enabled by default. This adds about 0.2% of
  .text, but is already enabled in many board specific configs, and
   apparently a requirement for systemd, so this seems like a useful
   change.

 - CONFIG_DEBUG_MEMORY_INIT is enabled now, adding a tiny bit
   of code in the inittext section

 - CONFIG_RFKILL, CONFIG_MEDIA_SUPPORT_FILTER and various CONFIG_HID
   driver defaults change, so these have to be listed explicitly to
   maintain the previous behavior

 - CONFIG_SERIAL_SH_SCI_NR_UARTS=20 changes to the default value
   of 18, which I understand to be sufficient for any buard, even
   if all UARTS are enabled at the same time

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/configs/multi_v7_defconfig | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index 22c50b60c794..52b2e792ad42 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -3,7 +3,6 @@ CONFIG_NO_HZ_IDLE=y
 CONFIG_HIGH_RES_TIMERS=y
 CONFIG_CGROUPS=y
 CONFIG_BLK_DEV_INITRD=y
-CONFIG_EXPERT=y
 CONFIG_PERF_EVENTS=y
 CONFIG_KEXEC=y
 CONFIG_ARCH_VIRT=y
@@ -163,7 +162,6 @@ CONFIG_BT_QCOMSMD=m
 CONFIG_CFG80211=m
 CONFIG_MAC80211=m
 CONFIG_RFKILL=y
-CONFIG_RFKILL_INPUT=y
 CONFIG_RFKILL_GPIO=y
 CONFIG_NFC=m
 CONFIG_NFC_DIGITAL=m
@@ -376,7 +374,6 @@ CONFIG_SERIAL_TEGRA=y
 CONFIG_SERIAL_IMX=y
 CONFIG_SERIAL_IMX_CONSOLE=y
 CONFIG_SERIAL_SH_SCI=y
-CONFIG_SERIAL_SH_SCI_NR_UARTS=20
 CONFIG_SERIAL_MSM=y
 CONFIG_SERIAL_MSM_CONSOLE=y
 CONFIG_SERIAL_VT8500=y
@@ -676,6 +673,7 @@ CONFIG_REGULATOR_WM8994=m
 CONFIG_CEC_SAMSUNG_S5P=m
 CONFIG_CEC_STM32=m
 CONFIG_MEDIA_SUPPORT=m
+# CONFIG_MEDIA_SUPPORT_FILTER is not set
 CONFIG_MEDIA_USB_SUPPORT=y
 CONFIG_USB_VIDEO_CLASS=m
 CONFIG_V4L_PLATFORM_DRIVERS=y
@@ -859,6 +857,18 @@ CONFIG_SND_SOC_WM8960=m
 CONFIG_SND_SOC_WM8962=m
 CONFIG_SND_SOC_WM8978=m
 CONFIG_SND_AUDIO_GRAPH_CARD=m
+# CONFIG_HID_A4TECH is not set
+# CONFIG_HID_APPLE is not set
+# CONFIG_HID_BELKIN is not set
+# CONFIG_HID_CHERRY is not set
+# CONFIG_HID_CHICONY is not set
+# CONFIG_HID_CYPRESS is not set
+# CONFIG_HID_EZKEY is not set
+# CONFIG_HID_ITE is not set
+# CONFIG_HID_KENSINGTON is not set
+# CONFIG_HID_REDRAGON is not set
+# CONFIG_HID_MICROSOFT is not set
+# CONFIG_HID_MONTEREY is not set
 CONFIG_USB=y
 CONFIG_USB_OTG=y
 CONFIG_USB_XHCI_HCD=y
-- 
2.39.5



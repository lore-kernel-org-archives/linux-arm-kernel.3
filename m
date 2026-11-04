Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03599606C599
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 21:32:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=PLSlGQa3;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=T3yiZcV+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=o+Slz/vWuMrl5TliZAuZLtBlvIRoMs2Bfr4/jUJ4VeQ=; b=PLSlGQa35wW2v8
	VCH3BHvVQmRRy/AdfuJRosondgkX9ngDPPesaOQm/PXWm8u/q9Ex3UygBDbT/ByPC40wxh4uvzseq
	yQQAKISmM16zZV9SmeTEJLcoIWOuCGwc7osyK4fYi4UmV9j5yILdaBrqauPFh88JpSwYeJkof5WqC
	X4rq1CnnX25JmcGUZzlZCykRJKZUR9LCnpjOUQ/tUnvBw30v3NtWmlu/dR5vsAOnh0j0SbvR2VuJE
	FRKmyCvDrZ5AtJzPaPYR6E2H3UQzf4p5qCWX42IyRq0yVylzjgjySIXirfF1sZ8kQ08jiL74yCkY/
	1GyQigCDRwXK+8jDrHiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOib5-000000072jT-2tVr;
	Wed, 04 Nov 2026 21:32:43 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOiaw-000000072VL-453r
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 21:32:35 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B4236403C8;
	Wed,  4 Nov 2026 21:32:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F01FE1F000C1;
	Wed,  4 Nov 2026 21:32:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793827954;
	bh=o+Slz/vWuMrl5TliZAuZLtBlvIRoMs2Bfr4/jUJ4VeQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=T3yiZcV+gy8qsOV7dZcEbMJU3whtV3IYd6SaLvd6rJyBmY6WAGiD7t0aRUrES8bWn
	 9ebIXMmi8U3QFmAF/Zok2VPSXJP0fEwFAi5Ps2F95WCheCP8NoS4mh57wQPo5h2f31
	 IohcuJQJjJ9gF8Wt22oCG2ixKTGIccATxJctcxSTvtIwXl8VVP4EHJG7KuEEnAu52b
	 z5VCrqnEpNl/45f4xx47WR1gYjisteORsXsy7IRnefsmy8vS4biHXZdjluJt4Iy/42
	 +w8aIWZi02YT3ClM8BVaGxwrqPtg9yu3MDnS+qU6ROFUPy6SlLcJrffQluT/VX5JbG
	 mx0QLeIEWTWFA==
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 04 Nov 2026 22:32:26 +0100
Subject: [PATCH 10/16] ARM: configs: u8500: Disable unused drivers
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261104-ux500-defconfig-update-v1-10-451d0537d49b@kernel.org>
References: <20261104-ux500-defconfig-update-v1-0-451d0537d49b@kernel.org>
In-Reply-To: <20261104-ux500-defconfig-update-v1-0-451d0537d49b@kernel.org>
To: Stefan Hansson <newbyte@postmarketos.org>, 
 linux-arm-kernel@lists.infradead.org
Cc: Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.16.0
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UPPERCASE_50_75,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Disable PHONET, HID, IOMMU, Virtio, Vhost, STM32 SDMMC and generic
sound driver support that is not used by U8500 systems.

Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 arch/arm/configs/u8500_defconfig | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/arch/arm/configs/u8500_defconfig b/arch/arm/configs/u8500_defconfig
index 8179d6cb8976..b2900b7f9f3c 100644
--- a/arch/arm/configs/u8500_defconfig
+++ b/arch/arm/configs/u8500_defconfig
@@ -74,7 +74,6 @@ CONFIG_NFT_FIB_IPV4=m
 CONFIG_NFT_FIB_IPV6=m
 CONFIG_BRIDGE=m
 CONFIG_VLAN_8021Q=m
-CONFIG_PHONET=y
 CONFIG_BT=m
 CONFIG_BT_HCIUART=m
 CONFIG_BT_HCIUART_BCM=y
@@ -182,8 +181,12 @@ CONFIG_BACKLIGHT_GPIO=y
 CONFIG_LOGO=y
 CONFIG_SOUND=y
 CONFIG_SND=y
+# CONFIG_SND_DRIVERS is not set
+# CONFIG_SND_ARM is not set
+# CONFIG_SND_SPI is not set
 CONFIG_SND_SOC=y
 CONFIG_SND_SOC_UX500=y
+# CONFIG_HID_SUPPORT is not set
 CONFIG_USB_MUSB_HDRC=y
 CONFIG_USB_MUSB_UX500=y
 CONFIG_MUSB_PIO_ONLY=y
@@ -192,6 +195,7 @@ CONFIG_USB_GADGET=y
 CONFIG_USB_ETH=m
 CONFIG_MMC=y
 CONFIG_MMC_ARMMMCI=y
+# CONFIG_MMC_STM32_SDMMC is not set
 CONFIG_NEW_LEDS=y
 CONFIG_LEDS_CLASS=y
 CONFIG_LEDS_CLASS_FLASH=y
@@ -205,7 +209,10 @@ CONFIG_RTC_DRV_AB8500=y
 CONFIG_RTC_DRV_PL031=y
 CONFIG_DMADEVICES=y
 CONFIG_STE_DMA40=y
+# CONFIG_VIRTIO_MENU is not set
+# CONFIG_VHOST_MENU is not set
 CONFIG_HWSPINLOCK=y
+# CONFIG_IOMMU_SUPPORT is not set
 CONFIG_EXTCON_FSA9480=y
 CONFIG_IIO=y
 CONFIG_IIO_SW_TRIGGER=y

-- 
2.56.0



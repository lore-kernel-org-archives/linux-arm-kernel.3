Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFA41C19776
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 12:09:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zNHptpbLXQ8swyWY9wfkxP0OcEEdiU/o4VafTsgVKzY=; b=JKNYm7jEsRNXxyV/x1Ho+fBOmK
	eNB+27PQduBoTqns3mD8VK5lKA8dUfFHh5I1dKKsIOKLPnywQvg86nhqysSCXW+0yr1ERXGkicAr6
	eBrQ25ait5GgvI6DBIosRVj3A7PypX3LIm0s06oOIY3bnsLRhdn7D0aM7J8jn0ndnWjbBbDKvvHc8
	FuB4XL0nSP4sz4ANH/pEUNKrnnokXLWB4VpHCwvP4z1sZ8FFs5lKVSzvNnXam6Jo+APsENqbPeC91
	XA0jd1idUQ5gNKqGREMb3FWC3oKywY4hRQf6q0mlN95D+wpibRcnvnMh2PhuR3USxtBJJ7iF7Pn3y
	Q9ohANtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnzB3-0000000AqgX-1iHe;
	Fri, 28 Feb 2025 12:09:13 +0000
Received: from mail.andi.de1.cc ([2a02:c205:3004:2154::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnyY9-0000000Akn0-2sQq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Feb 2025 11:29:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=From:Sender:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=zNHptpbLXQ8swyWY9wfkxP0OcEEdiU/o4VafTsgVKzY=; b=D/gvxBkyHgUgFjNP31TQpXtqHa
	5fYBULwlTR36eWlzN7e7Ud8N67vuvze555S8fALOQCoPbKfl2T/jRXdsczwy1s1uMM+MYiqyBhHW4
	ExbsaslAai+b9rctDi2y2x8m23I+LFUgALKvn4hnQhR4LPvk2i0462OB4U7R1jzrIwpRD/NoX5EvU
	x3XjkLIw/g8vWy3OVTmlkhC3/ge7/c0BCkQGyRx97CKPdVycj5J/ExTDjCI7uk6fJftQruJQHDqIs
	mCk0jXzwEGMmtJAubB3FwBnlgV/Ay1EiDGgr+VB11YOOYdObW2x3PBSxGu3/cvTm0TDoQvKcmmxsC
	Sc61pbTg==;
From: Andreas Kemnade <andreas@kemnade.info>
To: aaro.koskinen@iki.fi,
	andreas@kemnade.info,
	khilman@baylibre.com,
	rogerq@kernel.org,
	tony@atomide.com,
	linux@armlinux.org.uk,
	linux-omap@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ARM: omap2plus_defconfig: enable I2C devices of GTA04
Date: Fri, 28 Feb 2025 12:27:50 +0100
Message-Id: <20250228112750.367251-1-andreas@kemnade.info>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_032901_724606_750ADDAC 
X-CRM114-Status: UNSURE (   7.53  )
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

Enable I2C devices of GTA04 to get better test coverage when using
the defconfig. Until the I2C host driver is fixed, BMG160 module should be
blacklisted when booting on the GTA04A5.

Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
---
 arch/arm/configs/omap2plus_defconfig | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/configs/omap2plus_defconfig b/arch/arm/configs/omap2plus_defconfig
index 6de45d7f6078..84f334e94d5f 100644
--- a/arch/arm/configs/omap2plus_defconfig
+++ b/arch/arm/configs/omap2plus_defconfig
@@ -609,6 +609,7 @@ CONFIG_LEDS_LP5523=m
 CONFIG_LEDS_PCA963X=m
 CONFIG_LEDS_PWM=m
 CONFIG_LEDS_BD2606MVV=m
+CONFIG_LEDS_TCA6507=m
 CONFIG_LEDS_TRIGGERS=y
 CONFIG_LEDS_TRIGGER_TIMER=m
 CONFIG_LEDS_TRIGGER_ONESHOT=m
@@ -643,6 +644,8 @@ CONFIG_TI_EMIF_SRAM=m
 CONFIG_IIO=m
 CONFIG_IIO_SW_DEVICE=m
 CONFIG_IIO_SW_TRIGGER=m
+CONFIG_BMA180=m
+CONFIG_BMC150_ACCEL=m
 CONFIG_IIO_ST_ACCEL_3AXIS=m
 CONFIG_KXCJK1013=m
 CONFIG_CPCAP_ADC=m
@@ -650,10 +653,15 @@ CONFIG_INA2XX_ADC=m
 CONFIG_TI_AM335X_ADC=m
 CONFIG_TWL4030_MADC=m
 CONFIG_TWL6030_GPADC=m
+CONFIG_BMG160=m
 CONFIG_MPU3050_I2C=m
+CONFIG_ITG3200=m
+CONFIG_BOSCH_BNO055_I2C=m
 CONFIG_INV_MPU6050_I2C=m
 CONFIG_SENSORS_ISL29028=m
 CONFIG_AK8975=m
+CONFIG_BMC150_MAGN_I2C=m
+CONFIG_SENSORS_HMC5843_I2C=m
 CONFIG_BMP280=m
 CONFIG_PWM=y
 CONFIG_PWM_OMAP_DMTIMER=m
-- 
2.39.5



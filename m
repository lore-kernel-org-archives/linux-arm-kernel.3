Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DE0EC021A9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Feb 2025 20:06:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bIXATMlFsol/5fq4fVFFrsD5S9CGCNGuy/RXPDsnOZ8=; b=UhuFv+WGB2GfIaoUP9LxroKjT7
	NHi406WzzCw8c8dwS14++1VQaqVXA3D0bGTmxXeQnYGJ5AqM9zJNVTCxEFzNO63vk0hFKkfJJsR7y
	1aRhI4dYT1f3vapDAsUfDuOndw9WyWVqnLYcueVQg05bf8ldeNXBGMO0k7h4mfJIPaVKvmUKMKyZo
	vJcTz9DQyBCZn0SnXpqLh+ZBZjxl6s6wZOAqMeQR4e0gvuMlhNQzDpUbWIIkC8DNfgBtGXcN483Ue
	4vTJ3kP4UUEktrWIfOqUhfW9f9WyVBObfQFI6nZiCfNNo6GC8b1ybyUpXeoREUwH/W/3noTt/ZGhx
	OPQyR4Rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tk7NP-00000005qG6-46p6;
	Mon, 17 Feb 2025 20:05:59 +0000
Received: from sendmail.purelymail.com ([34.202.193.197])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tk7Gb-00000005ogL-0k4t
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Feb 2025 19:58:58 +0000
Authentication-Results: purelymail.com; auth=pass
DKIM-Signature: a=rsa-sha256; b=YsUHYEBqnxMEobTv7HlWmBaKlcrr1cs+IXxXJVoDeqT3d7s2DahFvuMq+gpK3/lsJbo/PVe6CjMgEglD1saqASi/Sazb/n7faF5sO/A0vnhEVwG5JpVDhLMw53a+cPUmRhUbrmFa3pd2CnCbJHMChZW39PZDUtHnsuwTAvPNPyOaKYvszEEmENSeA+6i2+e8pXcO4mE/j3Tf93hlBbPipSrDYNwr8BmzSUM2FTAzufouSFwz3HDAIH5PdQtNaLnVLzkoD6kifZTY0sBgQot3Ke1vLtEuWwV3GDd8FQ7UXgML3nLKV9FOJZqDK89NDO7Isks4FeS9JA93b/7+yQoFVQ==; s=purelymail3; d=purelymail.com; v=1; bh=ooAfCtIBB4Gn/GKkD7UJYql1T65TueuYbZ/OTNt6n3I=; h=Feedback-ID:Received:From:Date:Subject:To;
Feedback-ID: 68247:10037:null:purelymail
X-Pm-Original-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 234657940;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Mon, 17 Feb 2025 19:58:20 +0000 (UTC)
From: Igor Belwon <igor.belwon@mentallysanemainliners.org>
Date: Mon, 17 Feb 2025 20:57:39 +0100
Subject: [PATCH v2 2/2] watchdog: s3c2410_wdt: Add exynos990-wdt compatible
 data
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250217-exynos990-wdt-v2-2-3eb4fbc113f4@mentallysanemainliners.org>
References: <20250217-exynos990-wdt-v2-0-3eb4fbc113f4@mentallysanemainliners.org>
In-Reply-To: <20250217-exynos990-wdt-v2-0-3eb4fbc113f4@mentallysanemainliners.org>
To: Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-watchdog@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 Igor Belwon <igor.belwon@mentallysanemainliners.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739822294; l=3489;
 i=igor.belwon@mentallysanemainliners.org; s=20241206;
 h=from:subject:message-id; bh=ooAfCtIBB4Gn/GKkD7UJYql1T65TueuYbZ/OTNt6n3I=;
 b=4WxC88dcLDK8WkNH0UZB7vrjj47/wza9Jee7ptYJBYz/1GFhGu53S+uUz2tQwigSn7A8UcjZo
 u0+yjiBuYCuD6ZGNWIcjQiRm8EOUf/43/MHXMyb5hI0D5aedh/dAZl+
X-Developer-Key: i=igor.belwon@mentallysanemainliners.org; a=ed25519;
 pk=qKAuSTWKTaGQM0vwBxV0p6hPKMN4vh0CwZ+bozrG5lY=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_115857_286077_F13D43FF 
X-CRM114-Status: GOOD (  13.38  )
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

The Exynos990 has two watchdog clusters - cl0 and cl2. Add new
driver data for these two clusters, making it possible to use the
watchdog timer on this SoC.

Signed-off-by: Igor Belwon <igor.belwon@mentallysanemainliners.org>
---
 drivers/watchdog/s3c2410_wdt.c | 39 ++++++++++++++++++++++++++++++++++++++-
 1 file changed, 38 insertions(+), 1 deletion(-)

diff --git a/drivers/watchdog/s3c2410_wdt.c b/drivers/watchdog/s3c2410_wdt.c
index 30450e99e5e9d40b5596e2f87cc47c80ccbd2ddd..8f406e08d848646348dafabced5bc0f2bbcf49df 100644
--- a/drivers/watchdog/s3c2410_wdt.c
+++ b/drivers/watchdog/s3c2410_wdt.c
@@ -80,6 +80,10 @@
 #define GS_CLUSTER2_NONCPU_INT_EN		0x1644
 #define GS_RST_STAT_REG_OFFSET			0x3B44
 
+#define EXYNOS990_CLUSTER2_NONCPU_OUT		0x1620
+#define EXYNOS990_CLUSTER2_NONCPU_INT_EN	0x1644
+#define EXYNOS990_CLUSTER2_WDTRESET_BIT		23
+
 /**
  * DOC: Quirk flags for different Samsung watchdog IP-cores
  *
@@ -257,6 +261,32 @@ static const struct s3c2410_wdt_variant drv_data_exynos850_cl1 = {
 		  QUIRK_HAS_PMU_RST_STAT | QUIRK_HAS_PMU_CNT_EN,
 };
 
+static const struct s3c2410_wdt_variant drv_data_exynos990_cl0 = {
+	.mask_reset_reg = GS_CLUSTER0_NONCPU_INT_EN,
+	.mask_bit = 2,
+	.mask_reset_inv = true,
+	.rst_stat_reg = EXYNOS5_RST_STAT_REG_OFFSET,
+	.rst_stat_bit = EXYNOS850_CLUSTER0_WDTRESET_BIT,
+	.cnt_en_reg = EXYNOSAUTOV920_CLUSTER0_NONCPU_OUT,
+	.cnt_en_bit = 7,
+	.quirks = QUIRK_HAS_WTCLRINT_REG | QUIRK_HAS_PMU_MASK_RESET |
+		  QUIRK_HAS_PMU_RST_STAT | QUIRK_HAS_PMU_CNT_EN |
+		  QUIRK_HAS_DBGACK_BIT,
+};
+
+static const struct s3c2410_wdt_variant drv_data_exynos990_cl2 = {
+	.mask_reset_reg = EXYNOS990_CLUSTER2_NONCPU_INT_EN,
+	.mask_bit = 2,
+	.mask_reset_inv = true,
+	.rst_stat_reg = EXYNOS5_RST_STAT_REG_OFFSET,
+	.rst_stat_bit = EXYNOS990_CLUSTER2_WDTRESET_BIT,
+	.cnt_en_reg = EXYNOS990_CLUSTER2_NONCPU_OUT,
+	.cnt_en_bit = 7,
+	.quirks = QUIRK_HAS_WTCLRINT_REG | QUIRK_HAS_PMU_MASK_RESET |
+		  QUIRK_HAS_PMU_RST_STAT | QUIRK_HAS_PMU_CNT_EN |
+		  QUIRK_HAS_DBGACK_BIT,
+};
+
 static const struct s3c2410_wdt_variant drv_data_exynosautov9_cl0 = {
 	.mask_reset_reg = EXYNOS850_CLUSTER0_NONCPU_INT_EN,
 	.mask_bit = 2,
@@ -348,6 +378,8 @@ static const struct of_device_id s3c2410_wdt_match[] = {
 	  .data = &drv_data_exynos7 },
 	{ .compatible = "samsung,exynos850-wdt",
 	  .data = &drv_data_exynos850_cl0 },
+	{ .compatible = "samsung,exynos990-wdt",
+	  .data = &drv_data_exynos990_cl0 },
 	{ .compatible = "samsung,exynosautov9-wdt",
 	  .data = &drv_data_exynosautov9_cl0 },
 	{ .compatible = "samsung,exynosautov920-wdt",
@@ -676,7 +708,8 @@ s3c2410_get_wdt_drv_data(struct platform_device *pdev, struct s3c2410_wdt *wdt)
 	if (variant == &drv_data_exynos850_cl0 ||
 	    variant == &drv_data_exynosautov9_cl0 ||
 	    variant == &drv_data_gs101_cl0 ||
-	    variant == &drv_data_exynosautov920_cl0) {
+	    variant == &drv_data_exynosautov920_cl0 ||
+	    variant == &drv_data_exynos990_cl0) {
 		u32 index;
 		int err;
 
@@ -698,6 +731,10 @@ s3c2410_get_wdt_drv_data(struct platform_device *pdev, struct s3c2410_wdt *wdt)
 			else if (variant == &drv_data_exynosautov920_cl0)
 				variant = &drv_data_exynosautov920_cl1;
 			break;
+		case 2:
+			if (variant == &drv_data_exynos990_cl0)
+				variant = &drv_data_exynos990_cl2;
+			break;
 		default:
 			return dev_err_probe(dev, -EINVAL, "wrong cluster index: %u\n", index);
 		}

-- 
2.47.2



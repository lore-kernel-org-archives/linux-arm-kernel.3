Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B85BD68BDD
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 16 Nov 2024 01:29:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0P3tBtXNpyEwEzMGSGyCB4PLtgx+5VH11spzu16y6tU=; b=z08uCgxPw6nPTono2uHMdtFeMJ
	dv8rTktZf7OhunjOyZud9qqwY8/l0qoPVMvaOR/OaRPq3SsCFqaYlB9PRWGI7YLZ52Bs6hliSmA5X
	mY5RhjdsFTHdaJsCsUVGXmV0TEc1qaqSy1fpipZdpgymv8LR/T784DEFA8wUw5cNDsrvN6uwzIFFY
	Yl99n5ZITdjsNWzlyMwfgF7XJHNypWowYOSHTkHs2g0WAccGRxik3sfsuzt3GlqpXY9MEJqeeH9hf
	FY4FI7mmGYx5gNu0uGEiFviVxbOjOiYccQvF2tmyIWn7rzRUbkd/ga3cz5aATvP4QAAPDS56ONqaM
	ExezRK+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tC7d3-00000004iqz-3HSy;
	Sat, 16 Nov 2024 01:29:37 +0000
Received: from mx.treblig.org ([2a00:1098:5b::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tC7c7-00000004ikp-2L0t
	for linux-arm-kernel@lists.infradead.org;
	Sat, 16 Nov 2024 01:28:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
	:Subject; bh=0P3tBtXNpyEwEzMGSGyCB4PLtgx+5VH11spzu16y6tU=; b=TpdXh1eEobegRTQr
	QYeBT//gbrcjPUmBZWLhhB+pS2AYN52qclAj3XdzNuUa0oY51pSSvsh0l1Z6JqyIGadOwYXuGwzpx
	vcN2x61NBkBmRCyeQwrqvg6l2FnRED7cgtBWBhbpsNt+xeNqI8XBAbcpPgW238uqQZEpd4u6hj69R
	qHA1efOYKyCEb1gdrBfY3nGs0yWqP6oFyu+GmjxKaip48eUxwDBGRC8P8zObxIbvM3nuUAQmaQXlF
	VRMc2TLqnHS12simcTtrLsNjkhMFWbyF1HCu0yuI8p9gYZ8BnRt/HhkkQouYPMxHuMzs38crk734j
	wvYVlpiMaUJ3zUgwFg==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
	by mx.treblig.org with esmtp (Exim 4.96)
	(envelope-from <linux@treblig.org>)
	id 1tC7bx-000Fd6-2k;
	Sat, 16 Nov 2024 01:28:29 +0000
From: linux@treblig.org
To: s.nawrocki@samsung.com,
	mchehab@kernel.org,
	krzk@kernel.org,
	alim.akhtar@samsung.com
Cc: linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH] media: platform: exynos4-is: Remove unused fimc_is_param_strerr
Date: Sat, 16 Nov 2024 01:28:28 +0000
Message-ID: <20241116012828.359002-1-linux@treblig.org>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241115_172839_770238_06632EC4 
X-CRM114-Status: UNSURE (   7.28  )
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

From: "Dr. David Alan Gilbert" <linux@treblig.org>

fimc_is_param_strerr() was added in 2013 by
commit 9a761e436843 ("[media] exynos4-is: Add Exynos4x12 FIMC-IS driver")
but has never been called.

Remove it.

(The other possibility might be to add a call maybe in fimc-is-param ?)

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
---
 .../samsung/exynos4-is/fimc-is-errno.c        | 131 ------------------
 .../samsung/exynos4-is/fimc-is-errno.h        |   1 -
 2 files changed, 132 deletions(-)

diff --git a/drivers/media/platform/samsung/exynos4-is/fimc-is-errno.c b/drivers/media/platform/samsung/exynos4-is/fimc-is-errno.c
index 7a48fad1df16..ac67a04e5eeb 100644
--- a/drivers/media/platform/samsung/exynos4-is/fimc-is-errno.c
+++ b/drivers/media/platform/samsung/exynos4-is/fimc-is-errno.c
@@ -12,137 +12,6 @@
 
 #include "fimc-is-errno.h"
 
-const char *fimc_is_param_strerr(unsigned int error)
-{
-	switch (error) {
-	case ERROR_COMMON_CMD:
-		return "ERROR_COMMON_CMD: Invalid Command";
-	case ERROR_COMMON_PARAMETER:
-		return "ERROR_COMMON_PARAMETER: Invalid Parameter";
-	case ERROR_COMMON_SETFILE_LOAD:
-		return "ERROR_COMMON_SETFILE_LOAD: Illegal Setfile Loading";
-	case ERROR_COMMON_SETFILE_ADJUST:
-		return "ERROR_COMMON_SETFILE_ADJUST: Setfile isn't adjusted";
-	case ERROR_COMMON_SETFILE_INDEX:
-		return "ERROR_COMMON_SETFILE_INDEX: Invalid setfile index";
-	case ERROR_COMMON_INPUT_PATH:
-		return "ERROR_COMMON_INPUT_PATH: Input path can be changed in ready state";
-	case ERROR_COMMON_INPUT_INIT:
-		return "ERROR_COMMON_INPUT_INIT: IP can not start if input path is not set";
-	case ERROR_COMMON_OUTPUT_PATH:
-		return "ERROR_COMMON_OUTPUT_PATH: Output path can be changed in ready state (stop)";
-	case ERROR_COMMON_OUTPUT_INIT:
-		return "ERROR_COMMON_OUTPUT_INIT: IP can not start if output path is not set";
-	case ERROR_CONTROL_BYPASS:
-		return "ERROR_CONTROL_BYPASS";
-	case ERROR_OTF_INPUT_FORMAT:
-		return "ERROR_OTF_INPUT_FORMAT: Invalid format  (DRC: YUV444, FD: YUV444, 422, 420)";
-	case ERROR_OTF_INPUT_WIDTH:
-		return "ERROR_OTF_INPUT_WIDTH: Invalid width (DRC: 128~8192, FD: 32~8190)";
-	case ERROR_OTF_INPUT_HEIGHT:
-		return "ERROR_OTF_INPUT_HEIGHT: Invalid bit-width (DRC: 8~12bits, FD: 8bit)";
-	case ERROR_OTF_INPUT_BIT_WIDTH:
-		return "ERROR_OTF_INPUT_BIT_WIDTH: Invalid bit-width (DRC: 8~12bits, FD: 8bit)";
-	case ERROR_DMA_INPUT_WIDTH:
-		return "ERROR_DMA_INPUT_WIDTH: Invalid width (DRC: 128~8192, FD: 32~8190)";
-	case ERROR_DMA_INPUT_HEIGHT:
-		return "ERROR_DMA_INPUT_HEIGHT: Invalid height (DRC: 64~8192, FD: 16~8190)";
-	case ERROR_DMA_INPUT_FORMAT:
-		return "ERROR_DMA_INPUT_FORMAT: Invalid format (DRC: YUV444 or YUV422, FD: YUV444,422,420)";
-	case ERROR_DMA_INPUT_BIT_WIDTH:
-		return "ERROR_DMA_INPUT_BIT_WIDTH: Invalid bit-width (DRC: 8~12bits, FD: 8bit)";
-	case ERROR_DMA_INPUT_ORDER:
-		return "ERROR_DMA_INPUT_ORDER: Invalid order(DRC: YYCbCr,YCbYCr,FD:NO,YYCbCr,YCbYCr,CbCr,CrCb)";
-	case ERROR_DMA_INPUT_PLANE:
-		return "ERROR_DMA_INPUT_PLANE: Invalid plane (DRC: 3, FD: 1, 2, 3)";
-	case ERROR_OTF_OUTPUT_WIDTH:
-		return "ERROR_OTF_OUTPUT_WIDTH: Invalid width (DRC: 128~8192)";
-	case ERROR_OTF_OUTPUT_HEIGHT:
-		return "ERROR_OTF_OUTPUT_HEIGHT: Invalid height (DRC: 64~8192)";
-	case ERROR_OTF_OUTPUT_FORMAT:
-		return "ERROR_OTF_OUTPUT_FORMAT: Invalid format (DRC: YUV444)";
-	case ERROR_OTF_OUTPUT_BIT_WIDTH:
-		return "ERROR_OTF_OUTPUT_BIT_WIDTH: Invalid bit-width (DRC: 8~12bits, FD: 8bit)";
-	case ERROR_DMA_OUTPUT_WIDTH:
-		return "ERROR_DMA_OUTPUT_WIDTH";
-	case ERROR_DMA_OUTPUT_HEIGHT:
-		return "ERROR_DMA_OUTPUT_HEIGHT";
-	case ERROR_DMA_OUTPUT_FORMAT:
-		return "ERROR_DMA_OUTPUT_FORMAT";
-	case ERROR_DMA_OUTPUT_BIT_WIDTH:
-		return "ERROR_DMA_OUTPUT_BIT_WIDTH";
-	case ERROR_DMA_OUTPUT_PLANE:
-		return "ERROR_DMA_OUTPUT_PLANE";
-	case ERROR_DMA_OUTPUT_ORDER:
-		return "ERROR_DMA_OUTPUT_ORDER";
-
-	/* Sensor Error(100~199) */
-	case ERROR_SENSOR_I2C_FAIL:
-		return "ERROR_SENSOR_I2C_FAIL";
-	case ERROR_SENSOR_INVALID_FRAMERATE:
-		return "ERROR_SENSOR_INVALID_FRAMERATE";
-	case ERROR_SENSOR_INVALID_EXPOSURETIME:
-		return "ERROR_SENSOR_INVALID_EXPOSURETIME";
-	case ERROR_SENSOR_INVALID_SIZE:
-		return "ERROR_SENSOR_INVALID_SIZE";
-	case ERROR_SENSOR_INVALID_SETTING:
-		return "ERROR_SENSOR_INVALID_SETTING";
-	case ERROR_SENSOR_ACTUATOR_INIT_FAIL:
-		return "ERROR_SENSOR_ACTUATOR_INIT_FAIL";
-	case ERROR_SENSOR_INVALID_AF_POS:
-		return "ERROR_SENSOR_INVALID_AF_POS";
-	case ERROR_SENSOR_UNSUPPORT_FUNC:
-		return "ERROR_SENSOR_UNSUPPORT_FUNC";
-	case ERROR_SENSOR_UNSUPPORT_PERI:
-		return "ERROR_SENSOR_UNSUPPORT_PERI";
-	case ERROR_SENSOR_UNSUPPORT_AF:
-		return "ERROR_SENSOR_UNSUPPORT_AF";
-
-	/* ISP Error (200~299) */
-	case ERROR_ISP_AF_BUSY:
-		return "ERROR_ISP_AF_BUSY";
-	case ERROR_ISP_AF_INVALID_COMMAND:
-		return "ERROR_ISP_AF_INVALID_COMMAND";
-	case ERROR_ISP_AF_INVALID_MODE:
-		return "ERROR_ISP_AF_INVALID_MODE";
-
-	/* DRC Error (300~399) */
-	/* FD Error  (400~499) */
-	case ERROR_FD_CONFIG_MAX_NUMBER_STATE:
-		return "ERROR_FD_CONFIG_MAX_NUMBER_STATE";
-	case ERROR_FD_CONFIG_MAX_NUMBER_INVALID:
-		return "ERROR_FD_CONFIG_MAX_NUMBER_INVALID";
-	case ERROR_FD_CONFIG_YAW_ANGLE_STATE:
-		return "ERROR_FD_CONFIG_YAW_ANGLE_STATE";
-	case ERROR_FD_CONFIG_YAW_ANGLE_INVALID:
-		return "ERROR_FD_CONFIG_YAW_ANGLE_INVALID\n";
-	case ERROR_FD_CONFIG_ROLL_ANGLE_STATE:
-		return "ERROR_FD_CONFIG_ROLL_ANGLE_STATE";
-	case ERROR_FD_CONFIG_ROLL_ANGLE_INVALID:
-		return "ERROR_FD_CONFIG_ROLL_ANGLE_INVALID";
-	case ERROR_FD_CONFIG_SMILE_MODE_INVALID:
-		return "ERROR_FD_CONFIG_SMILE_MODE_INVALID";
-	case ERROR_FD_CONFIG_BLINK_MODE_INVALID:
-		return "ERROR_FD_CONFIG_BLINK_MODE_INVALID";
-	case ERROR_FD_CONFIG_EYES_DETECT_INVALID:
-		return "ERROR_FD_CONFIG_EYES_DETECT_INVALID";
-	case ERROR_FD_CONFIG_MOUTH_DETECT_INVALID:
-		return "ERROR_FD_CONFIG_MOUTH_DETECT_INVALID";
-	case ERROR_FD_CONFIG_ORIENTATION_STATE:
-		return "ERROR_FD_CONFIG_ORIENTATION_STATE";
-	case ERROR_FD_CONFIG_ORIENTATION_INVALID:
-		return "ERROR_FD_CONFIG_ORIENTATION_INVALID";
-	case ERROR_FD_CONFIG_ORIENTATION_VALUE_INVALID:
-		return "ERROR_FD_CONFIG_ORIENTATION_VALUE_INVALID";
-	case ERROR_FD_RESULT:
-		return "ERROR_FD_RESULT";
-	case ERROR_FD_MODE:
-		return "ERROR_FD_MODE";
-	default:
-		return "Unknown";
-	}
-}
-
 const char *fimc_is_strerr(unsigned int error)
 {
 	error &= ~IS_ERROR_TIME_OUT_FLAG;
diff --git a/drivers/media/platform/samsung/exynos4-is/fimc-is-errno.h b/drivers/media/platform/samsung/exynos4-is/fimc-is-errno.h
index 809e117331c0..fa8204ffec7b 100644
--- a/drivers/media/platform/samsung/exynos4-is/fimc-is-errno.h
+++ b/drivers/media/platform/samsung/exynos4-is/fimc-is-errno.h
@@ -240,6 +240,5 @@ enum fimc_is_error {
 };
 
 const char *fimc_is_strerr(unsigned int error);
-const char *fimc_is_param_strerr(unsigned int error);
 
 #endif /* FIMC_IS_ERR_H_ */
-- 
2.47.0



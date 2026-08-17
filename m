Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F876C5DF70
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Aug 2026 10:23:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bIl1SuOQpb9zg0Np5Wc9hQemKa4tzr+QCugyijtej2M=; b=iOEDAlxYAnfXlHV9Sdw00TisE6
	HXW77JXGu28M7UgdcfcHMM0F1OVGIsn/1tFR0lOyeq0rxPDYq8tSsMiUa7meLPAgj3miEnjtIaw76
	QC5pZBro7GDmOeI2P0FfThmsP4D7mhLme/FgtF0X38PRDMb6nBV1Lm9Uh3fP/HdjyzuL7KLSeEhQo
	6M0jEMnrwzB/mJekQfD8NFba4O0bFxnQCZUlm+TC0AFwW82z4T3TIXCv1eAjXSRdn/MpsNUw6v1sd
	XiE1tbUl8h+j2lIuP4sOQ8yyRhaTREi6BW1HrUve1IQfVC9iqZg+ZO5VIDxNkAZbJ8Ocn3/Xdrf0A
	B4BGCFLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvuV0-00000005udp-1MHP;
	Mon, 17 Aug 2026 10:23:22 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvuUz-00000005ucu-1h5m
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Aug 2026 10:23:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A847160A59;
	Mon, 17 Aug 2026 10:23:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 46384C2BCFA;
	Mon, 17 Aug 2026 10:23:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1786962200;
	bh=MoKFjfCjj7eH3YeKB15VObhOrHj5g0TnVGxnPcj2obA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=ijOTYxqlES7CyiGN/UDG4YOfRgjY8xfTe4FhTNnmCi5HYwhpHpZy6zaJeLGHRCKKf
	 XU4krsu9NAKKj8+AFmOmfz/oFpxzdTSYcCSJs21NrjAqjrMAynvyHZ3oLLxI8o5sBC
	 d2lbJFwzjQVol+djC9S2XnrGkKd1mwFYpl6l5p9oooqWEVNuNC5VhjaOrkbSdZHOXv
	 13SBQvir4dvEjmU5FWU0RVgILxNz7G23nREKM4Fp0pTIHvFmpRPMn8XnrK+DQa6CGA
	 QAOP1qMvIoHE/4itOSPg7fFuqoJ+5kLFduv03l/ICQlvOTAvKtvZfJGMdNY2E1bqTA
	 Gkv4eRN+nKuyg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1ECC1C5DF66;
	Mon, 17 Aug 2026 10:23:20 +0000 (UTC)
From: Aiden Isik via B4 Relay <devnull+aidenisik.member.fsf.org@kernel.org>
Date: Mon, 17 Aug 2026 11:22:53 +0100
Subject: [PATCH 2/2] watchdog: s3c2410_wdt: Add exynos5515-wdt compatible
 data
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260817-for-next-lucky7-watchdog-v1-2-a14370e20b92@member.fsf.org>
References: <20260817-for-next-lucky7-watchdog-v1-0-a14370e20b92@member.fsf.org>
In-Reply-To: <20260817-for-next-lucky7-watchdog-v1-0-a14370e20b92@member.fsf.org>
To: Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-watchdog@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 Aiden Isik <aidenisik+git@member.fsf.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1522;
 i=aidenisik@member.fsf.org; h=from:subject:message-id;
 bh=+9Y7AuNFAzHe4t85GeL0qqpJDKPFW2rCnQvCFhFMQMk=;
 b=owEBbQKS/ZANAwAIAUknAbLEetfrAcsmYgBqguEV5hCTkiYzCAuAqaEysF9HeVHLS/kYrXCkl
 wC0Z2JJs3mJAjMEAAEIAB0WIQSDy8UkXGpc3JNbEaVJJwGyxHrX6wUCaoLhFQAKCRBJJwGyxHrX
 6z0CEADqZKi0kxBZdzOSE+sR3Syr4VfVM8atvSQmljPNeD1lGwMeks1nUAbpZZCzC4cPbU5rS6O
 oQ/3Xq6FOqQPczocNa6ZI6zap4k+ZN7TPV+qtqXBj+urWUxdN3j7YBbCoYReqRc2CpEiadY9M3d
 XUIu3zxPiR/709eAYCd/A7bn5LWMF5XKXrXOXIVAhDF2fTMfUtrzucC5Gi0m1QkG3hBdzdO6CJ1
 qPeJEGiwrnaoXGtxLbwgg6PDFCziZLf7ocbYRPhOu8pF0G8eD+9zDwDi0TK6h8zOJqcebRFaVpa
 nAZnjfjKoH74wsQ4ShxGeYh9kQFIK8Ni0xs25pP4gwQEvg89bPt2IA0vNaFYA8/Zp82FsqyZOvu
 4RChbcxj7seuLR2ahHJa2xnFzPsIyVq612kLwUu9OcUQe8nibHKIQasT6eRUH9B9M0AUKpR7B67
 QzZ56LffaQAW6t/eREhMez+MkH63FiiaQ/43o85xy0vEpZWbqULqCbTWkK50vjFtjJumZo+5fJI
 38txH6RHoa65HHWPNVNsf3gIcYAo9Rn1wWQyVIbkCBVToULAqPYWhdR5MNH4sZAwNNkAs1C+17Q
 8i9yzt0jZmiwnXkGNjE+0kzruON2kWHPjgPO1YtzcHMRBFZkfRtpqset3Sluz0fPiM0FEXoxL3I
 sP6B6OPmKqE4+7Q==
X-Developer-Key: i=aidenisik@member.fsf.org; a=openpgp;
 fpr=83CBC5245C6A5CDC935B11A5492701B2C47AD7EB
X-Endpoint-Received: by B4 Relay for aidenisik@member.fsf.org/default with
 auth_id=956
X-Original-From: Aiden Isik <aidenisik@member.fsf.org>
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
Reply-To: aidenisik@member.fsf.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Aiden Isik <aidenisik@member.fsf.org>

Add driver data for the Exynos5515 SoC's watchdog timer.

Signed-off-by: Aiden Isik <aidenisik+git@member.fsf.org>
---
 drivers/watchdog/s3c2410_wdt.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/watchdog/s3c2410_wdt.c b/drivers/watchdog/s3c2410_wdt.c
index e31f93db0509..7299dfdb0c09 100644
--- a/drivers/watchdog/s3c2410_wdt.c
+++ b/drivers/watchdog/s3c2410_wdt.c
@@ -232,6 +232,16 @@ static const struct s3c2410_wdt_variant drv_data_exynos5420 = {
 		  QUIRK_HAS_PMU_RST_STAT | QUIRK_HAS_PMU_AUTO_DISABLE,
 };
 
+static const struct s3c2410_wdt_variant drv_data_exynos5515 = {
+	.mask_reset_reg = EXYNOSAUTOV920_CLUSTER0_NONCPU_INT_EN,
+	.mask_bit = 2,
+	.rst_stat_reg = EXYNOS5_RST_STAT_REG_OFFSET,
+	.rst_stat_bit = 24,
+	.quirks = QUIRK_HAS_WTCLRINT_REG | QUIRK_HAS_PMU_MASK_RESET | \
+		  QUIRK_HAS_PMU_RST_STAT | QUIRK_HAS_PMU_AUTO_DISABLE | \
+		  QUIRK_HAS_DBGACK_BIT,
+};
+
 static const struct s3c2410_wdt_variant drv_data_exynos7 = {
 	.disable_reg = EXYNOS5_WDT_DISABLE_REG_OFFSET,
 	.mask_reset_reg = EXYNOS5_WDT_MASK_RESET_REG_OFFSET,
@@ -379,6 +389,8 @@ static const struct of_device_id s3c2410_wdt_match[] = {
 	  .data = &drv_data_exynos5250 },
 	{ .compatible = "samsung,exynos5420-wdt",
 	  .data = &drv_data_exynos5420 },
+	{ .compatible = "samsung,exynos5515-wdt",
+	  .data = &drv_data_exynos5515 },
 	{ .compatible = "samsung,exynos7-wdt",
 	  .data = &drv_data_exynos7 },
 	{ .compatible = "samsung,exynos850-wdt",

-- 
2.54.0




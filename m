Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9ACA3C5DF82
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Aug 2026 15:45:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7URgaSV3lU+R20F+BkkRyDgQGA2mOI2suC+DDFznuno=; b=bRDEPOpDuHkCUyUlQhId+RQCsf
	k/hS4fEmBV/ES7+bpRFKs9dErt86f+0Zp/890s5wuWQT+uDZ80Cun8II3Cj3ELsZtY/X/2cqYpsWd
	4Q6k652Hr4MVkWU/jS2/AUjHrCycU/u7T5Vj159BowcW+iSbTmhypEwACVf6f9YjuPggQ2Lc3ygRo
	nK6YE3tbFHGD2ZbiWmmg8H9v9caIrbwFiNQQi892M9884wnI90nC0NVCMyWMNPja3tYLxTrJ9QBhe
	NO5JqgWDfEq61ouS1GahJhiRlGfjL41msbdaBAH96w4n4cNubos4868eMRnuxlW3+7ywXWdQbA9wq
	iF8udPfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwLzm-00000008I85-05Ua;
	Tue, 18 Aug 2026 15:44:58 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwLzl-00000008I7l-0W3U
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Aug 2026 15:44:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7EA6760A63;
	Tue, 18 Aug 2026 15:44:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id F2017C2BCFB;
	Tue, 18 Aug 2026 15:44:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1787067896;
	bh=B1MSr263hFpzFu1HrE+5wS7gmEE6LU7r7AbgVYf50Ik=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=FJiYx9ax7JRQohDmP1HecCxBoujaPymV6j6txfc8//QfH8MTue28UeFpURHbJBhoO
	 vtItt1rxcSD8IN3jTjDA3mTbdNoERRRHUinSjFOQLzfiVAh2kVwlmM62/GBnlTdg4y
	 4k+RlfA1ybm1wiVn4F5pI/2UuGWQRU22eHDeK2wVVBtiYxHmCG30gjjH6vLCY8b9rz
	 FPnNKyi7MLVTfgGpf1RoNCezPUM8X9x3J4mQVJJ7MRdxROHycKSpyEYWYBrIKM+KNW
	 pq7LJhpu8SH1ncFj/VEn2Fp8NbQpm5S8CQ681RARgmRqhGKObhzm4VFpiNImI+3FTs
	 bd9tkO71r2WzA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE5DAC5DF7D;
	Tue, 18 Aug 2026 15:44:55 +0000 (UTC)
From: Aiden Isik via B4 Relay <devnull+aidenisik.member.fsf.org@kernel.org>
Date: Tue, 18 Aug 2026 16:44:48 +0100
Subject: [PATCH v2 2/2] watchdog: s3c2410_wdt: Add exynos5515-wdt
 compatible data
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260818-for-next-lucky7-watchdog-v2-2-6743f479a47f@member.fsf.org>
References: <20260818-for-next-lucky7-watchdog-v2-0-6743f479a47f@member.fsf.org>
In-Reply-To: <20260818-for-next-lucky7-watchdog-v2-0-6743f479a47f@member.fsf.org>
To: Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-watchdog@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 Aiden Isik <aidenisik@member.fsf.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1518;
 i=aidenisik@member.fsf.org; h=from:subject:message-id;
 bh=C5r2bV9nYfxOIJNnwxYrMhWREb+Zhh0VM+xx1N3wI6g=;
 b=owEBbQKS/ZANAwAIAUknAbLEetfrAcsmYgBqhH315BAAGOJEjlp4J5rR3Yo9RyUegV+hrjWJ8
 HG6X6/iKn2JAjMEAAEIAB0WIQSDy8UkXGpc3JNbEaVJJwGyxHrX6wUCaoR99QAKCRBJJwGyxHrX
 6ws6EACwRp3RhFcTaoItfWoc9PNEejm0Hh+aNlLnAZWaYaPV87RYE/yjBb6TPPhP2IMq3Mo8+K+
 5JU4MnoO4FMDdfxQ4NWug+RgSyoTYNo4qr9uh3Rl1qWv+v6BJN7MdoFYxX9g202Ag08B3NlxfyB
 OJmjTq2mfbZ/HHyc6xv0mGC7grqB+OuFHdC3Qt9uAfNXtXpGrSvBI+HPzjrWAm6Gsp96rhg2LQL
 28CyaCDNu0WcmEmflQNf53tfSDegt/M5RJ18VdVBh7TzxQnORsQsuoWYA2v94/c3DuUfVpH5lhL
 ASm65HXaKN2mPx/ErOTgv1SehFGxBiBR8oopAR5TK/1Nu952gUW0Jcwqo/jP1IGq3injEAShv6h
 2cX6iwGGt8SU55hTbo7FASV9wkoV0Tn3rs0yn05Wdq6FVfuheaNoNtDYdvMjdEFOQb5AAgliLvK
 GBxhALdW5frgLwTJYJR7UaAGpoI0jf27oPE6NYpTF0UslijiwF56KPSELTIzw0wuESjDuUlMYgr
 QrAdg4Vz63gm9P4RoEz0rU/LvYfT9WaiWOmp/QpahX0jm3Reyc6kT79k6zFjsnp+9aJ92InPPkl
 lon462/vrn+e8ejxaCBUGbixwaFz1EXDh91I/JBKERGyrvyRNwkAJKaBnd4jBAdi+HeYDW2FxB0
 3W7qQcego3c2eYQ==
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

Signed-off-by: Aiden Isik <aidenisik@member.fsf.org>
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




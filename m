Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DB16CD8C8E
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  6 Jun 2026 13:18:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=dAN9QoDN/aS6i/YFO52v0YwG/FbuUx8/Jx3OqvY1QBA=; b=Qh36tKcGV6kcC78DfgbhYO/yH6
	TPUJmKdRfPBDqkk5xctLNiPM8042grnG9u3h8Y0p8c6BTqOjgVTzw9Ufa06IeQCPDrAwXIN6iEeN5
	jwwGV+JXFZkeQ1QQQZfmQnPugvBSeBhgitTNabC9dFdcdb0WwGsMaN+XSINkstVqbEZ5y154PlRz3
	UkotZ2nq6iKEX4bFHNGv/U+TAkypjmltfSG+JQAP1f/BrC6IAxkyeeIzYOMJKdVjXqQOh4l3/94a/
	5KQsnOW8iaFDZUgDSUd8LyXhGftOiliVGBlUix0OhxFn/7wuS41yLK4fg5EQQA1AjtxZO2T/Zv79k
	xgv1eyJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVquj-00000001bxB-23Kd;
	Sat, 06 Jun 2026 13:18:13 +0000
Received: from out-188.mta0.migadu.com ([2001:41d0:1004:224b::bc])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVquf-00000001bwl-3xz9
	for linux-arm-kernel@lists.infradead.org;
	Sat, 06 Jun 2026 13:18:11 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1780751884;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=dAN9QoDN/aS6i/YFO52v0YwG/FbuUx8/Jx3OqvY1QBA=;
	b=J38yp16sI2AI7S3UGd8vwk74VuueaHEAuaoUv+X/nAUImps12By70yQPnNLvvEaafzNQuq
	zr2bRjXpBvT9DNt2QQe5W92Qu/zfAnGv5Qq/QRElkuzq3qH8pNkiYZx5CopEru2WxEAslT
	eAUyp7jDap1NCsb3GMzPM+hNVyWjeQw=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Olivia Mackall <olivia@selenic.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	linux-crypto@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] hwrng: atmel - drop __maybe_unused from atmel_trng_pm_ops
Date: Sat,  6 Jun 2026 15:17:54 +0200
Message-ID: <20260606131755.10132-2-thorsten.blum@linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1028; i=thorsten.blum@linux.dev; h=from:subject; bh=bxiJ7ydWNjviwTvv7BK6XfpSQEPe+3QOJTVHTSTih8M=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDFkqcsxXFHoZ5Pf+ac1mOCXMMW124cvbObcW/35emXArn NWFtfdyRykLgxgXg6yYIsuDWT9m+JbWVG4yidgJM4eVCWQIAxenAEzE0JKRYeabSfM+7VC91v/+ hoCx5mXVuXdm/ln2yknqtRSPpUoinwojw5bgNTF+SmyXE6T//i9v1jKZvbj5Ru2Cycem/YrJKTb 05wQA
X-Developer-Key: i=thorsten.blum@linux.dev; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260606_061810_156922_7B27C7A8 
X-CRM114-Status: UNSURE (   9.18  )
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

Since atmel_trng_driver keeps atmel_trng_pm_ops referenced and pm_ptr()
uses IS_ENABLED(), which allows the compiler to optimize away unused
variables, drop the redundant __maybe_unused annotation.

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 drivers/char/hw_random/atmel-rng.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/char/hw_random/atmel-rng.c b/drivers/char/hw_random/atmel-rng.c
index 6ed24be3481d..10082add0886 100644
--- a/drivers/char/hw_random/atmel-rng.c
+++ b/drivers/char/hw_random/atmel-rng.c
@@ -186,7 +186,7 @@ static int __maybe_unused atmel_trng_runtime_resume(struct device *dev)
 	return atmel_trng_init(trng);
 }
 
-static const struct dev_pm_ops __maybe_unused atmel_trng_pm_ops = {
+static const struct dev_pm_ops atmel_trng_pm_ops = {
 	SET_RUNTIME_PM_OPS(atmel_trng_runtime_suspend,
 			   atmel_trng_runtime_resume, NULL)
 	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,

base-commit: 79bbe453e5bfa6e1c6aa2e8329bfc8f152b81c9b


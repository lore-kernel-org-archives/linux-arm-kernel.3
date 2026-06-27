Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 379D6C43458
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 27 Jun 2026 13:49:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=GE0WgxrhQlszpq0bFS8ekUeWF2E3M+uVciQ9zYtpewc=; b=095Ccbi31O9nkXUcvzpow5OpAW
	9huVr8YggAdZGkdmzJkK72up6KQHkvN3290mPxW3Mb2L3BCj7CwcH7D+aA5KdrahZCo+hdhslNZV6
	+7gwPdwIM3Uqou42yWUdcv30tJvbHrS7K7n/3hLWnfddblYngdEvz2VCCq14d+MEXM4/yldm7l271
	DsnNJ11ZvawEWt6XdVIaWD/ooSD5540CaF4hxIic69RFutpa9lCw98qWfG/gEjQUMygvoVGg6TKfU
	IVR0nGIyUmjbsp93u7mKZsenShc/p5KzLJ0GfI7W5RkpsUwGWanOmTKLDKG77lwRmfGZalGUWAKi/
	xNQVcVVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdTPT-0000000CWMz-1yrp;
	Sat, 27 Jun 2026 13:49:27 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdTPQ-0000000CWME-3MAU
	for linux-arm-kernel@lists.infradead.org;
	Sat, 27 Jun 2026 13:49:26 +0000
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-c88cc025f54so1192908a12.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 27 Jun 2026 06:49:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782568163; x=1783172963; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GE0WgxrhQlszpq0bFS8ekUeWF2E3M+uVciQ9zYtpewc=;
        b=ILbgPfrsUhnoYXdFbdoF5oHx0008up1NLlcUYlVzaTt1ITO6ORTk6GNBa2k+xZiFRx
         fep17jXEQsPopdVg6xkXtIyIL7UJ34/PLxQIbL1iZbKYW/8vm4XtEm4BXefHo6VA4UFC
         1wqmKKEX0cSM+zqwlmwp8JA9teu2DcxwEsuAYzia+kGcU8EhV8to01q+/bxq6/OjAZJz
         3h9oGgp5Ya40Ub1d90Rx6qHuO8WHt9Qt5gmj7G8NFAkdYi729eeICR2Uzh95gmdcNfpR
         A5o7SdTdX1/U6BgyPGE7hvacxUCN14SZrUtjkSW5ZlK16lePoto6UCZ8y+VzFvtgiXpW
         ZjFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782568163; x=1783172963;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GE0WgxrhQlszpq0bFS8ekUeWF2E3M+uVciQ9zYtpewc=;
        b=IX2ALxDsu/3pYaO2TbbELQpvuUuo19TUE+uH1pdVVkcfLAfszf7KB5y+wBGfE1+qQ2
         t4zq68H0nP9Cl1/nYgs4SE9RDedS067WSvsci51d0qL1lExbbadWhBQJ2JUtjrdkV/vD
         xu6hUg3z2wsU9ujad6V4oSFVnenGRCiXTooimQIquMiktvVfedzkJ9eK3aRSUxwClxCh
         80owEEK6kMKc+vB0RdgeEExB9AY45v3dlVx6+ZAceW+ppZJhldy3QMBu9584/d/xtCuk
         OTZcWqpRm48ss0i8p3J1QU/3O+V8B8c73flOovTqTPf72m9soeA+WdiPtII+AwoGR8Lo
         mUEg==
X-Forwarded-Encrypted: i=1; AFNElJ80/2LP4P9owcFlZUIXnTXLsvMEKayuif+xKpRQulFwiQ2NRj17ykRv2W9383TbM7fIewvSU9G8frE8xCdemPX+@lists.infradead.org
X-Gm-Message-State: AOJu0Yy08VbDyq4aoLJ29pHy9CgcwonED2Hs/6XOfgy71D6Hqbz+EKco
	qZHUjaXMP7F27PCkQrvTYb15Sp5sn/3sP1t3zMoOkiw3FhHWKOgh5+U=
X-Gm-Gg: AfdE7ckpLrbtRCEljLxK2E3EboUpfLo9fboKKxE3F5pPv9AaBpCXL1DhxNzqHKbJ9dm
	zSlfrjMqEAOTp0q9MghSIHJt7c6cC/HuaauqWKYTaBKIkXryIwgEvc0O/xE5Ejl4VWHNHFt2uUn
	wXxdYYDAeoE0qYlkHyT/6YDcpD4j6t24vMe5b+WiidOTBDzY+7JOZbwwbepMizQ83GMPPgUETKT
	9Wqc4ZX4dq0XHW53MhsVIeQy7vjuxF83PH7NeWOI3yztu3bU39/uuVSccMrF1fX+QGgDJYE92OU
	FIZa1Thgyvwv1spgLD8PgP/M9HYQvo4ennuoz7afcQF5VyT9JYEFQtwbPwH8JCmhmY70YEsfSzU
	BDA/rz6dexssvxxDraXYkXUDGDmFt616ntgeIM9xduPTaN1QqwIwU7Q0WcCbwzonnS8+cnpRFzG
	ot5Jrp7Sa5Kh0k0eTXX3v8yg5xJ9m1MZtNO9cDmRBff/nm9fvdVWsMoAAzCyF+dy4HdWQTu5y0G
	1eQkB6jcL/ZWFI349cuENHpitjYEC7+yK8yJTNqQkjoTHgR3Q==
X-Received: by 2002:a05:6a00:f8b:b0:842:38d2:a35f with SMTP id d2e1a72fcca58-845b3ae02b7mr11286739b3a.31.1782568163272;
        Sat, 27 Jun 2026 06:49:23 -0700 (PDT)
Received: from localhost.localdomain ([14.5.152.27])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-845ba9fa138sm4691580b3a.52.2026.06.27.06.49.19
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 27 Jun 2026 06:49:22 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Sean Wang <sean.wang@mediatek.com>,
	Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Myeonghun Pak <mhun512@gmail.com>,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH v2] dmaengine: mediatek: hsdma: fix runtime PM leak on init failure
Date: Sat, 27 Jun 2026 22:49:02 +0900
Message-ID: <20260627134915.8749-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260627_064924_838726_AF773180 
X-CRM114-Status: GOOD (  13.87  )
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

mtk_hsdma_hw_init() enables runtime PM and gets a runtime PM reference
before enabling the HSDMA clock. It currently ignores failures from
pm_runtime_get_sync(); if runtime resume fails, the usage count remains
held. If clk_prepare_enable() then fails, the usage count remains held.

Use devm_pm_runtime_enable() to manage runtime PM enablement, and use
pm_runtime_resume_and_get() so resume failures do not leak the usage count.
If clk_prepare_enable() fails after a successful runtime resume, drop the
runtime PM reference before returning.

The probe path also ignores the return value from mtk_hsdma_hw_init(), so a
failed hardware init can continue as a successful probe. Propagate
mtk_hsdma_hw_init() failures from probe, while keeping a separate unwind
label so mtk_hsdma_hw_deinit() is only called after hardware init succeeds.

Fixes: 548c4597e984 ("dmaengine: mediatek: Add MediaTek High-Speed DMA controller for MT7622 and MT7623 SoC")
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>

---
Changes in v2:
- Use devm_pm_runtime_enable() for runtime PM enablement.
- Drop manual pm_runtime_disable() calls from init/deinit paths.

 drivers/dma/mediatek/mtk-hsdma.c | 26 +++++++++++++++++++-------
 1 file changed, 19 insertions(+), 7 deletions(-)

diff --git a/drivers/dma/mediatek/mtk-hsdma.c b/drivers/dma/mediatek/mtk-hsdma.c
index a43412ff5e..27cb370106 100644
--- a/drivers/dma/mediatek/mtk-hsdma.c
+++ b/drivers/dma/mediatek/mtk-hsdma.c
@@ -848,17 +848,27 @@ static int mtk_hsdma_hw_init(struct mtk_hsdma_device *hsdma)
 {
 	int err;
 
-	pm_runtime_enable(hsdma2dev(hsdma));
-	pm_runtime_get_sync(hsdma2dev(hsdma));
+	err = devm_pm_runtime_enable(hsdma2dev(hsdma));
+	if (err)
+		return err;
+
+	err = pm_runtime_resume_and_get(hsdma2dev(hsdma));
+	if (err < 0)
+		return err;
 
 	err = clk_prepare_enable(hsdma->clk);
 	if (err)
-		return err;
+		goto err_put_pm;
 
 	mtk_dma_write(hsdma, MTK_HSDMA_INT_ENABLE, 0);
 	mtk_dma_write(hsdma, MTK_HSDMA_GLO, MTK_HSDMA_GLO_DEFAULT);
 
 	return 0;
+
+err_put_pm:
+	pm_runtime_put_sync(hsdma2dev(hsdma));
+
+	return err;
 }
 
 static int mtk_hsdma_hw_deinit(struct mtk_hsdma_device *hsdma)
@@ -868,7 +878,6 @@ static int mtk_hsdma_hw_deinit(struct mtk_hsdma_device *hsdma)
 	clk_disable_unprepare(hsdma->clk);
 
 	pm_runtime_put_sync(hsdma2dev(hsdma));
-	pm_runtime_disable(hsdma2dev(hsdma));
 
 	return 0;
 }
@@ -983,7 +992,9 @@ static int mtk_hsdma_probe(struct platform_device *pdev)
 		goto err_unregister;
 	}
 
-	mtk_hsdma_hw_init(hsdma);
+	err = mtk_hsdma_hw_init(hsdma);
+	if (err)
+		goto err_free;
 
 	err = devm_request_irq(&pdev->dev, hsdma->irq,
 			       mtk_hsdma_irq, 0,
@@ -991,7 +1002,7 @@ static int mtk_hsdma_probe(struct platform_device *pdev)
 	if (err) {
 		dev_err(&pdev->dev,
 			"request_irq failed with err %d\n", err);
-		goto err_free;
+		goto err_deinit;
 	}
 
 	platform_set_drvdata(pdev, hsdma);
@@ -1000,8 +1011,9 @@ static int mtk_hsdma_probe(struct platform_device *pdev)
 
 	return 0;
 
-err_free:
+err_deinit:
 	mtk_hsdma_hw_deinit(hsdma);
+err_free:
 	of_dma_controller_free(pdev->dev.of_node);
 err_unregister:
 	dma_async_device_unregister(dd);
-- 
2.47.1


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F616D0C84F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Jan 2026 11:00:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HqUMgsT9G/DWk/uFvxL+KtVxkdE9LqYxhq3XLrHDqqE=; b=ODggx29rgWzbK+1pTEyz4/32zY
	wPOF4/Nj2q1Zoh9563eme5Pe37aGALE4aqJ4J3ZdVWiXfKs6B8AK7/xOOTPiQmt7BF89JCtd6FArk
	jF4hHtyGTAwAFpsLhaApiO0CrhsXeh2K7O0NYj5rJtVod8uzLX99bwVVNK0jEN65LoLp5ZCSXh5W+
	n5jfEpknoOzhOf6ItM7ziMUHIJk5fHbjDk4oHCnlqfTyQosqkMFRJNZ/pb++PvsuS9V3nyR5KrDf6
	On4hWYS0l90lm44oKPQ6a7rjUNqYvEoZd7kuJnM1ejpKt71hHDT/5XpwwBNFSRKPWzxxBRCFS52ZU
	Nc/MMOCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfc8b-00000006xLx-1gs9;
	Tue, 13 Jan 2026 11:00:37 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfc8I-00000006x5H-1lNv;
	Tue, 13 Jan 2026 11:00:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1768302016;
	bh=LVyshAcuwWCeKMfeOL8j7IyTjIznQXuutAHRDxB/Ou4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YUQdwNOxDrB7fGSZAFPqSz7/3kKjmmubd/H2u6MSRxhdjleYrF2tBhTpO5LBCWrTI
	 PIDKMXOjk4FXZEeZXzw0HveonBCS7AFVDPJ4KFg2YgV7HDGYyZ8CGYJA1+opt5gzyB
	 0IC7aM64p1GfH9lH3M2Q2/RgVIq/kvfEfiSkxYvIITLwC+4/ox9Qfzxn6dp0KsN+A3
	 fAMNsTLaUF2dfiGYyUsRwx7/l1u/wMBBLD2Kjaj+XfpQ1fb3qhj9mR+wBL8KGUViDN
	 7B0aVCMGGZmrTJ9nNPKj0YkfQqRrxKSJrLaC0PtFTCvY5hqG/MDdJGA24VGaUGVdiZ
	 +i8PkTOLTPDvw==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 8627717E10F4;
	Tue, 13 Jan 2026 12:00:15 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: linux-mediatek@lists.infradead.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	ulf.hansson@linaro.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org,
	kernel@collabora.com
Subject: [PATCH 2/5] dt-bindings: power: mt7622-power: Add MT7622_POWER_DOMAIN_AUDIO
Date: Tue, 13 Jan 2026 12:00:09 +0100
Message-ID: <20260113110012.36984-3-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260113110012.36984-1-angelogioacchino.delregno@collabora.com>
References: <20260113110012.36984-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_030019_535835_D659B692 
X-CRM114-Status: UNSURE (   8.65  )
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

Add the missing power domain for the Audio IPs in this SoC.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 include/dt-bindings/power/mt7622-power.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/power/mt7622-power.h b/include/dt-bindings/power/mt7622-power.h
index ffad81ad3d46..ec244989eeba 100644
--- a/include/dt-bindings/power/mt7622-power.h
+++ b/include/dt-bindings/power/mt7622-power.h
@@ -10,5 +10,6 @@
 #define MT7622_POWER_DOMAIN_HIF0	1
 #define MT7622_POWER_DOMAIN_HIF1	2
 #define MT7622_POWER_DOMAIN_WB		3
+#define MT7622_POWER_DOMAIN_AUDIO	4
 
 #endif /* _DT_BINDINGS_POWER_MT7622_POWER_H */
-- 
2.52.0



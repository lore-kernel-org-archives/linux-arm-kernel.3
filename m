Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 560BDC43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 12:19:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xl7fV1DYeXoBwrURsKqWyZAc+fIGqyQqZLch0JyyYqw=; b=z7S2mX/JwFQHMPuOjZ2qmvQBQp
	cnq4X/ipIYvfAtlYz0cV4fhO9+KrtSXmBodi3lIOoGYm17zHt1As4nrhgUczor4vJl9YX+64SwGtf
	1dDcUZSBYrtisLtbcvMEK4crgrusArxvIb1vBY5iCVxbdiIANlIkR4kkBuFtsKKp697JYa9meojcr
	3povllyVawVkw0Yakedzr7javzbhrNX6THi1/Njxqlfw8/mq3ICIJATc0D9uBftbk0KovY/3gKRhE
	9/7E9uFzGsS04PVUwJeS2tOq/JlTGuU+GahO+uZWVVa/y6YswRT2hmhstlAAJYAFTpfGIb1imGYQN
	Y0QEOr8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wetub-00000001p0D-0agh;
	Wed, 01 Jul 2026 12:19:29 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wetuY-00000001oxz-24ya;
	Wed, 01 Jul 2026 12:19:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1782908364;
	bh=/pdnnneTXMs+v5rJuM64Y/X5xJKFYtEJFsSpji+UEmk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FihvsLWEeQzsBkAUghKQX0aqSpyaMM/onu0+LC2V1nUK4NlM43QrxnwEB54/N7CUR
	 Pxt6HZv/OR91ZB6kSMbHfwgD5rBih332wRlD+PIJqUebyt8zVr0L+3eWjqyolPh8V3
	 /jeNdqe52y0/vvulQvbbkElo1J0bDlWgUaTSy9/v6qD554QL3Z38MBheR3W0BVfXE6
	 8fpixKEWJT5bMV4F5wqQ7c6cNy+vtlnno+QLa8ftOTBs3DUSmj/MweYdkBFEuVhxOM
	 A+BolWtnJdJv50GKiU2p+nRxK5ZmR58Wk/+nYD92vo3tkqwfpCsuVOMl49sABi5Wsc
	 t6XOHa5kOK4qQ==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0496B17E0CA0;
	Wed,  1 Jul 2026 14:19:23 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: ulfh@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	nfraprado@collabora.com,
	irving-ch.lin@mediatek.com,
	macpaul.lin@mediatek.com,
	aford173@gmail.com,
	mbrugger@suse.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	justin.yeh@mediatek.com,
	kernel@collabora.com
Subject: [PATCH 1/4] dt-bindings: power: mediatek: Add support for MT8196 direct HFRP
Date: Wed,  1 Jul 2026 14:19:17 +0200
Message-ID: <20260701121920.19347-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260701121920.19347-1-angelogioacchino.delregno@collabora.com>
References: <20260701121920.19347-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_051926_695215_FA18409F 
X-CRM114-Status: UNSURE (   9.93  )
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

Add support for the HFRPSYS direct control power domains in the
MT8196 SoC, controlling power for the DisplayPort and for the
Embedded DisplayPort Transmitter IPs.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../devicetree/bindings/power/mediatek,power-controller.yaml  | 1 +
 include/dt-bindings/power/mediatek,mt8196-power.h             | 4 ++++
 2 files changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml b/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
index 07f046277f8a..070c6e5666dc 100644
--- a/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
+++ b/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
@@ -34,6 +34,7 @@ properties:
       - mediatek,mt8189-power-controller
       - mediatek,mt8192-power-controller
       - mediatek,mt8195-power-controller
+      - mediatek,mt8196-hfrp-power-controller
       - mediatek,mt8196-hwv-hfrp-power-controller
       - mediatek,mt8196-hwv-scp-power-controller
       - mediatek,mt8196-power-controller
diff --git a/include/dt-bindings/power/mediatek,mt8196-power.h b/include/dt-bindings/power/mediatek,mt8196-power.h
index 0f622a93c807..085790bf8124 100644
--- a/include/dt-bindings/power/mediatek,mt8196-power.h
+++ b/include/dt-bindings/power/mediatek,mt8196-power.h
@@ -30,6 +30,10 @@
 #define MT8196_POWER_DOMAIN_MM_PROC_DORMANT		0
 #define MT8196_POWER_DOMAIN_SSR				1
 
+/* HFRPSYS Multimedia Power Control (MMPC) - Direct Control */
+#define MT8196_POWER_DOMAIN_EDPTX			0
+#define MT8196_POWER_DOMAIN_DPTX			1
+
 /* HFRPSYS MultiMedia Power Control (MMPC) - HW Voter */
 #define MT8196_POWER_DOMAIN_VDE0			0
 #define MT8196_POWER_DOMAIN_VDE1			1
-- 
2.54.0



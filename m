Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55CEBC19F32
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 22:48:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+2Tyzy6yh5ilGbJV236A8dmsrL/FM6gEqFOZc/caRis=; b=htzau+lBFISU8sRrr9kYpdA515
	A/LyVtTLoFY7k8CBun7GXbYvcVOzz0PmCRoZip3t2nhCpkh5flDV3Sr9Te/RgRdjv69jxQjKNr5S+
	FsvB8L+kL9qhXvRRgLfdX0p2ZRs3guDoP89lGfkfnq89aF3HFY6nXew+YC/uMwOBaXXy18H4bUB2+
	ka+0YW3XWuFaSg6nT1+CGQEvoiSVLKuUyjxuZH+nSmpBXTrpRHIjzkqVmSMxw/7hPlQtTl3AFbBvW
	jFNUcPothIwOsYikC05MijK6ynniBF24DUnEzcWCD2Iuq7DUTqvnyWapq47YpMmImAFLCX91TGwPh
	ZcX4bZsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpxXk-00000009WRu-3lZ7;
	Wed, 05 Mar 2025 22:48:48 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpueF-000000096MI-1QTt;
	Wed, 05 Mar 2025 19:43:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=+2Tyzy6yh5ilGbJV236A8dmsrL/FM6gEqFOZc/caRis=; b=KpethEDZLbu6T6LizNMEa8l+gn
	BC6vTjNj1vuv4ScqmznXYmtLQIb0Vg6kV3kRdTsXFfLiJPipUG57e+DKY3wBkCAhxW/mhbfywyM0C
	S9PSuIB7GhNK92qtz26f4FdYJ16NSMHtuKMtvkHcAmaQXZl0+iL/IdQFVewVqCVp4fWJaByJcZQqu
	ObEeIU7DJ5CXpCPCHizBRQaglgQbHyDGKpsnIsm1mntHPS/l7Dg2EVGo4KPUCcOqijXnQtFU+0An4
	6QLd30EkOly4cexyOOlvB5M6hmxtZBx1LFjt5EBTqV6LBww5SNui5lLT0at50zeP57920PkICizI+
	uBT6ftSg==;
Received: from layka.disroot.org ([178.21.23.139])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpueC-00000000j6R-2Vac;
	Wed, 05 Mar 2025 19:43:18 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id E157A2027D;
	Wed,  5 Mar 2025 20:43:15 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id digvX98RG3a5; Wed,  5 Mar 2025 20:43:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1741203795; bh=zwk+LtszMoHSIYjGCAqbuOU0QSVYlP5K54ulz6VjFyA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=dMOyrpQqgPQSf1wp0pYbJprF2EN5v9yjL9wWhs8kYXE+EVTxh2kF/8EEXwp9LZlL5
	 9JTvqmWW/8nK9FBxN/XPXaJLUOJkzM9DAobzzZGdIAuCK1Q4i93f3H4MQmtvVDLneF
	 6VQro+WO3BjeGpP5rLXOExNnFhEohf+vCxfyTWYGDBg/sWisgkT7R6e6h2KLbMOEp/
	 JG09CuDSUactnqyXv+S7yQcxMLSuwTT3xR7iji38yqDsNI0B7UapMRwNSJPcWh19gY
	 FK9d+DtTS34YFuvaYGQYgzv35IYi9KaTwm4Tnj3NRMFNNmfUgPnkCkmmSv3EuF2fQo
	 k5jQZ4B4aPBBQ==
From: Yao Zi <ziyao@disroot.org>
To: Ulf Hansson <ulf.hansson@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Shresth Prasad <shresthprasad7@gmail.com>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Chukun Pan <amadeus@jmu.edu.cn>
Cc: linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Yao Zi <ziyao@disroot.org>
Subject: [PATCH v2 4/8] dt-bindings: clock: Add GRF clock definition for RK3528
Date: Wed,  5 Mar 2025 19:42:13 +0000
Message-ID: <20250305194217.47052-5-ziyao@disroot.org>
In-Reply-To: <20250305194217.47052-1-ziyao@disroot.org>
References: <20250305194217.47052-1-ziyao@disroot.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_194316_747674_7CF2705B 
X-CRM114-Status: UNSURE (   8.49  )
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

These clocks are for SD/SDIO tuning purpose and come with registers
in GRF syscon.

Signed-off-by: Yao Zi <ziyao@disroot.org>
---
 include/dt-bindings/clock/rockchip,rk3528-cru.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/dt-bindings/clock/rockchip,rk3528-cru.h b/include/dt-bindings/clock/rockchip,rk3528-cru.h
index 55a448f5ed6d..0245a53fc334 100644
--- a/include/dt-bindings/clock/rockchip,rk3528-cru.h
+++ b/include/dt-bindings/clock/rockchip,rk3528-cru.h
@@ -414,6 +414,12 @@
 #define MCLK_I2S2_2CH_SAI_SRC_PRE	402
 #define MCLK_I2S3_8CH_SAI_SRC_PRE	403
 #define MCLK_SDPDIF_SRC_PRE		404
+#define SCLK_SDMMC_DRV			405
+#define SCLK_SDMMC_SAMPLE		406
+#define SCLK_SDIO0_DRV			407
+#define SCLK_SDIO0_SAMPLE		408
+#define SCLK_SDIO1_DRV			409
+#define SCLK_SDIO1_SAMPLE		410
 
 /* scmi-clocks indices */
 #define SCMI_PCLK_KEYREADER		0
-- 
2.48.1



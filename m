Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25F48606A329
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 05:34:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1JlGgdzy;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=S+cFHIRF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=j/iKDdwYCnsubloLpqDmZlwHL6ERoLEJpqDNEy1hOkk=; b=1JlGgdzyXUD/LO
	J3ysvi5DHpj8HIH9oYCkTVPivss6FyXY9iklZzBmBjAaB7Opy2cZgpu3ZhLkSJ+7ijNjHNQa23dFQ
	mWIYsHx1Vo/vs+x2ggf1j5SXo+fPdq+JPLbXVwiDpaU6kngvIVbCbvciraJWVqL7drKjOssWysLFO
	JUL8YLvLRlRd+V4zufAsFgTxli2ruJrCAmWjUVZDkagJ6SV749cCheq4zvsLS29MiKIqCaoTNNlHw
	IOXi0qvwOpBCY6n/ti47SLUKMTodxvB138Ilpy9+ZBk7a1TuU+mFM5F2tngyEOJA93Muv/v8ekDA9
	iZTT+memllCVWqHl6Zww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNkgE-0000000FaSh-08vL;
	Mon, 02 Nov 2026 05:34:02 +0000
Received: from mail-oo2-x02.google.com ([2607:f8b0:4864:31::2])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNkgC-0000000FaPk-0cE9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 05:34:01 +0000
Received: by mail-oo2-x02.google.com with SMTP id 46e09a7af769-824f3901d55so3181803a34.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 01 Nov 2026 21:33:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793597639; x=1794202439; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j/iKDdwYCnsubloLpqDmZlwHL6ERoLEJpqDNEy1hOkk=;
        b=S+cFHIRFnEAB7YOT+5PWgMPoRMOmmpyYiNS9E1J/xp33vcw5osSBsrhHJAm07ufGKs
         CAd/PCpBDSUw389nkLnLB+w2yen/nOzlPyJ+hzcMGiZJ8uNxsefbiA80hAq+aY9h6gpZ
         1ICd6RYyM97xvuiaLWLxlL8TCUGAkN/uM7E4bjTDJEOSLNTNDHfdi7O6riF5ZzdF+QKZ
         qCUhbtCgGsWIwh6YehKP015G/lITijb/7MuofAVAWvp/3Y+EwZE/ycyXWZ8p2vwCC+2K
         p9RN85xrDxubZDC504LpcWtdqIn6pqdHkQqRf6prB0XN7uGlZHXjdrwWb53BLC9ti6RT
         yBkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793597639; x=1794202439;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j/iKDdwYCnsubloLpqDmZlwHL6ERoLEJpqDNEy1hOkk=;
        b=iRLGeZpiDNAFHzjTRqoWCVDA/YpkD95+pE9TsD0cLBAOssiu4s5zYgW3dQs4/29HAh
         gDrAwAd8D3PQiABCXZwtDz6U6Kv28/DSl9G+BMt5xv7kI7Hi0jCsuWhHJsB28aPvBkEW
         2kMsBw6JucqFK8wMrXBuj24iboljy6w1fpla433+rdzc34+D8FBowwoRAAYZHAE8GeVW
         fqSprfhtIaNKBjGXXwKuqE52QblJLZhrtR+WQwJWNZZhZG1ukGBsKytcayKUZhtqqUuj
         ebcakj3n/7/1zGktdueNk11+qQ6e8pxhlS3+IQQkJdCdiWeFK4WeE3f/g6vsm7ujV6eI
         SoFQ==
X-Forwarded-Encrypted: i=1; AKwUvByEU5wsO3f/bNYVTniugFPnxLAtGgoB7m+FMVg60PTZIaXKXbK1DG+6nREnPLKnedAzBjtSbwNoIWHyoEOGxA/V@lists.infradead.org
X-Gm-Message-State: AFq9FYJmBEa/u1VvldNtxkFHXWcZK52Hie9TGoJ/Pir9wNtjHCi4g/Kf
	8ogNAgw5dMRNEQ3p6k1RUSqTgNJtg57uyeXeH6NEa8ngJN/Iaf/l3RGF
X-Gm-Gg: AYBFou3O8IAEbgntH15w589cXGecTQi85e9WUB5iM+8pqqGCAir8/EHw0EdvYXwviYo
	dscaI0gM5dxdHvxDbaTsOv7rarTU+YlticejIr1t83cymrHvAPeVRQfT27oMQPHheZ7Bo1felzz
	m1MRx59rA2LpUD+Kq+x91cY6k+R03l6vpY171Z1lrYC+4xG1oUbPMy4ihkADgfyPwmNxpn6dquc
	tL36wGQ8Iawb5VtRTb7XqORxGDOFwRiUlpF17QRT5+d2eQfrgnvmyewOgSraxs7WOtetw+yRhJx
	1BM2dfS+qu8Q/sXIveOS3VYNVkWL2Lt2GiFuzT5lyHnzCXgaSTDw5xqlZEXEkICBoMF1nIYR+R0
	7TDBQxi4Uv4sP6Km5pK/9xX4ctZNwQ3KaQg/URGKxAWr+wP4oMUAn4qrVh7tYvEA3Mbar80EO/N
	46U2yZRqqrmIXh2T4jjpW2zbNUGFHQHN5EHGgHdV438+cFgdWZIIJFNmARg19mPsG6/DoofpD+n
	noMpeEOhCk4zBTgA2PKCk/jc7AdM/p+cYF2gbygwPzqRCBy+Y3JKmPAmI3Q0Lkdkr2MdyMDdczI
	sZQFxb1q2Zhu79Xp8OAPyAcg
X-Received: by 2002:a05:6820:81e:b0:70a:4053:52dd with SMTP id 006d021491bc7-714f24f9791mr5803420eaf.12.1793597638909;
        Sun, 01 Nov 2026 21:33:58 -0800 (PST)
Received: from [192.168.18.164] ([2600:8804:5716:d800::f01a])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-714f2a818b9sm8321164eaf.1.2026.11.01.21.33.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 21:33:57 -0800 (PST)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Date: Sun, 01 Nov 2026 23:33:47 -0600
Subject: [PATCH 2/2] rtc: mt6397: provide the 32 kHz output as a clock
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261101-rbrue-suez-upstreaming-mt6397-rtc-32k-v1-2-9758f38d7053@gmail.com>
References: <20261101-rbrue-suez-upstreaming-mt6397-rtc-32k-v1-0-9758f38d7053@gmail.com>
In-Reply-To: <20261101-rbrue-suez-upstreaming-mt6397-rtc-32k-v1-0-9758f38d7053@gmail.com>
To: Sen Chu <sen.chu@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
 Macpaul Lin <macpaul.lin@mediatek.com>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Eddie Huang <eddie.huang@mediatek.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-pm@vger.kernel.org, mfd@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-rtc@vger.kernel.org, Ryan Brue <ryanbrue.dev@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793597629; l=4890;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=eS8wwphnLf29L4d5m076ho5/o3jTqtIytR9mtme4zMw=;
 b=V5rSbVxU0IF5N7h6PPPyOJQV/wX0G6LmMZa8wVDZQxfdGcr4TIErn1bIGZZU6u4TjA94W77+a
 3p2deiTL6UBBKiXt28snx/azYaVv8C5+hP8+TMfIhI6rsZeP2q+Xt+p
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261101_213400_261834_A21E6509 
X-CRM114-Status: GOOD (  21.17  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The RTC's 32 kHz output is gated by RTC_CON.F32KOB, which the vendor
kernel clears before it powers the Wi-Fi/Bluetooth combo chip. Mainline
never touches it, so on a board whose bootloader leaves it set, such a
chip has no sleep clock and does not come up.

Register the output as a clock when the RTC node has #clock-cells, so
the chip's power sequence can enable it.

Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
---
 drivers/rtc/rtc-mt6397.c       | 85 ++++++++++++++++++++++++++++++++++++++++++
 include/linux/mfd/mt6397/rtc.h |  6 +++
 2 files changed, 91 insertions(+)

diff --git a/drivers/rtc/rtc-mt6397.c b/drivers/rtc/rtc-mt6397.c
index d6e156516aa6..5130fecffa7b 100644
--- a/drivers/rtc/rtc-mt6397.c
+++ b/drivers/rtc/rtc-mt6397.c
@@ -6,6 +6,7 @@
 
 #include <linux/array_size.h>
 #include <linux/bitfield.h>
+#include <linux/clk-provider.h>
 #include <linux/err.h>
 #include <linux/interrupt.h>
 #include <linux/mfd/mt6397/core.h>
@@ -317,6 +318,84 @@ static int mtk_rtc_nvram_write(void *priv, unsigned int offset, void *val,
 	return ret;
 }
 
+#ifdef CONFIG_COMMON_CLK
+static int mtk_rtc_clkout_set(struct clk_hw *hw, bool on)
+{
+	struct mt6397_rtc *rtc = container_of(hw, struct mt6397_rtc, clkout);
+	int ret;
+
+	mutex_lock(&rtc->lock);
+	ret = regmap_update_bits(rtc->regmap, rtc->addr_base + rtc->data->con,
+				 RTC_CON_F32KOB, on ? 0 : RTC_CON_F32KOB);
+	if (!ret)
+		ret = mtk_rtc_write_trigger(rtc);
+	mutex_unlock(&rtc->lock);
+
+	return ret;
+}
+
+static int mtk_rtc_clkout_prepare(struct clk_hw *hw)
+{
+	return mtk_rtc_clkout_set(hw, true);
+}
+
+static void mtk_rtc_clkout_unprepare(struct clk_hw *hw)
+{
+	mtk_rtc_clkout_set(hw, false);
+}
+
+static int mtk_rtc_clkout_is_prepared(struct clk_hw *hw)
+{
+	struct mt6397_rtc *rtc = container_of(hw, struct mt6397_rtc, clkout);
+	u32 con;
+
+	if (regmap_read(rtc->regmap, rtc->addr_base + rtc->data->con, &con))
+		return 0;
+
+	return !(con & RTC_CON_F32KOB);
+}
+
+static unsigned long mtk_rtc_clkout_recalc_rate(struct clk_hw *hw,
+						unsigned long parent_rate)
+{
+	return 32768;
+}
+
+static const struct clk_ops mtk_rtc_clkout_ops = {
+	.prepare = mtk_rtc_clkout_prepare,
+	.unprepare = mtk_rtc_clkout_unprepare,
+	.is_prepared = mtk_rtc_clkout_is_prepared,
+	.recalc_rate = mtk_rtc_clkout_recalc_rate,
+};
+
+/* The 32 kHz output the PMIC drives to other chips, such as a combo chip */
+static int mtk_rtc_register_clkout(struct device *dev, struct mt6397_rtc *rtc)
+{
+	struct clk_init_data init = {
+		.name = "mt6397-rtc-32k",
+		.ops = &mtk_rtc_clkout_ops,
+	};
+	int ret;
+
+	if (!rtc->data->con || !of_property_present(dev->of_node, "#clock-cells"))
+		return 0;
+
+	rtc->clkout.init = &init;
+
+	ret = devm_clk_hw_register(dev, &rtc->clkout);
+	if (ret)
+		return ret;
+
+	return devm_of_clk_add_hw_provider(dev, of_clk_hw_simple_get,
+					   &rtc->clkout);
+}
+#else
+static int mtk_rtc_register_clkout(struct device *dev, struct mt6397_rtc *rtc)
+{
+	return 0;
+}
+#endif
+
 static int mtk_rtc_probe(struct platform_device *pdev)
 {
 	struct resource *res;
@@ -380,6 +459,11 @@ static int mtk_rtc_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	ret = mtk_rtc_register_clkout(&pdev->dev, rtc);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret,
+				     "failed to register the 32k clock\n");
+
 	nvmem_cfg.priv = rtc;
 
 	return devm_rtc_nvmem_register(rtc->rtc_dev, &nvmem_cfg);
@@ -416,6 +500,7 @@ static const struct mtk_rtc_data mt6358_rtc_data = {
 
 static const struct mtk_rtc_data mt6397_rtc_data = {
 	.wrtgr = RTC_WRTGR_MT6397,
+	.con = RTC_CON_MT6397,
 };
 
 static const struct of_device_id mt6397_rtc_of_match[] = {
diff --git a/include/linux/mfd/mt6397/rtc.h b/include/linux/mfd/mt6397/rtc.h
index f4da579ec638..a8130d726c59 100644
--- a/include/linux/mfd/mt6397/rtc.h
+++ b/include/linux/mfd/mt6397/rtc.h
@@ -9,6 +9,7 @@
 #ifndef _LINUX_MFD_MT6397_RTC_H_
 #define _LINUX_MFD_MT6397_RTC_H_
 
+#include <linux/clk-provider.h>
 #include <linux/jiffies.h>
 #include <linux/mutex.h>
 #include <linux/regmap.h>
@@ -22,6 +23,9 @@
 #define RTC_WRTGR_MT6397       0x003c
 #define RTC_WRTGR_MT6323       RTC_WRTGR_MT6397
 
+#define RTC_CON_MT6397         0x003e
+#define RTC_CON_F32KOB         BIT(5)
+
 #define RTC_IRQ_STA            0x0002
 #define RTC_IRQ_STA_AL         BIT(0)
 #define RTC_IRQ_STA_LP         BIT(3)
@@ -72,6 +76,7 @@
 
 struct mtk_rtc_data {
 	u32                     wrtgr;
+	u32                     con;
 };
 
 struct mt6397_rtc {
@@ -83,6 +88,7 @@ struct mt6397_rtc {
 	int                     irq;
 	u32                     addr_base;
 	const struct mtk_rtc_data *data;
+	struct clk_hw           clkout;
 };
 
 #endif /* _LINUX_MFD_MT6397_RTC_H_ */

-- 
2.55.0



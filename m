Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C39360A8868
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 16:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=HWYTl6/v;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=z/VtGYow
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=K8BYvSAD0vaRsrXFQzKVgQ9ORTXgw762XXjLlecX85Y=; b=HWYTl6/vTQK4vq
	DhP3qkAIocd+EXYQfEvv+Lk2iYJPvUamchHuXWCX1J3I+devZAP8nit9NYmFu46nVv5i6eFyMDLHa
	pP+7gCE9ycN7eHbpzNB0ErMBzGoV3ie7LMtM7PcYwv0dJqww1JnurGHOX49SpGUbDLllrqNLbevs4
	OPst32pwIHDZ7L+hz3GZiid7gd/Chz1TfpHIF37jJLE1QDA9qjWb5NM26a1u2wOh3NiUIPN/DkLgC
	KUzfQDoEueQxQvYfBCDhal+6wFb4+phXf7Azjl6e3eVgCvQboH3iYJajkZGV6WN16GKvi3pmo+utp
	oeVWbBikJ+SkHpd7ZS8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNvEv-0000000HKsM-40HJ;
	Mon, 02 Nov 2026 16:50:33 +0000
Received: from mail-oo2-x03.google.com ([2607:f8b0:4864:31::3])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNvEt-0000000HKpN-3gcw
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 16:50:33 +0000
Received: by mail-oo2-x03.google.com with SMTP id 46e09a7af769-8459f7bc7c0so252496a34.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 08:50:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793638231; x=1794243031; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K8BYvSAD0vaRsrXFQzKVgQ9ORTXgw762XXjLlecX85Y=;
        b=z/VtGYowsBEo3f04BQeI/MxTq4XfAYgTyFGYfelTwGgHPH81KBcZN31BjfG32ZpOcb
         do2q2Z2PX1PQSxYYdjBiVs14SHJoTAgaBJEhx6EnfRmcw35VSpQ8Hy1WbrU6mghMgLeF
         jkxlHWlCrxZ2W1ZIHW1qR+/7WSMxkmzXmwEXGUDtf08z7RoAy3Eq6+EzVgHd/pETSbwN
         5KKPGPjzbzjWbZ+pLWyKbgQ349TTgDaG4KMQkVOosImXo8HE3860gW/LbwN6hQR5heut
         jQ2OuN5LMihEkRdUKrIZwc5bD7RjccRbr0J+eJfZ4OZl/wRE5afLmHZ/HAgYmEXTGyNa
         ZznQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793638231; x=1794243031;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K8BYvSAD0vaRsrXFQzKVgQ9ORTXgw762XXjLlecX85Y=;
        b=nSefxSOnjCVY5yOWuMtguFtKHelPUQKDz1vZ7aWnMP6+Dhia2qnQdawOAOCr5eKGN1
         +uxJzpITFMHOldmfjqUrgkzuVSrwLLeLNQiogU4xLsxKv2mwI9RU+Wfpt78nWzFgCxuP
         1gkgMEtkeWc1JL2Q7hK/KCRtHg3ZKMFBEAvQn4Gl+XIcsyH6J5DG0mE4LB8hRo871yoI
         WY2CUMRAxX+7h6d2NuMTzqBJ/aX9v/Bwlz7wEnX9hH9Lb69n+dt2Nn2rRLi+dAZ3GhnU
         WLc19bWffEAdGPr8y4pyA+FiKJHsa2kfTnuqIKGICsvAj4NVndCmf/h5f20weUTz+dPQ
         lktA==
X-Forwarded-Encrypted: i=1; AKwUvBzbHc9XC1E/dVO7sBH2vkTVn+gvcw5ZW3bugNTQkyuaZYqwcW01yYM8t4PqbsF6amfYDvFtPnwNlqVVzJ/jRCpw@lists.infradead.org
X-Gm-Message-State: AFq9FYLZFhiGjb/8S5WsQc0Bmut7u2+5ejKit/IHaDPiwAdlD7C3nrQy
	pjOXPdn3enx8V4y3eRDoyshP5KMZMAT+2IMxU0KRkYpfT7SigQGoVxT/
X-Gm-Gg: AYBFou35qe7JU2Ufs9AmQrGVClRCYCf76OXRe8YgK4tF1ZfY5ddYe1eBCGIVlLwR15U
	KNfXA3OTna3gilU59PEAuo/9ohQT7QrKEt7k1zRM3SqOHLwXD9wWl2lncfQcjYun+rth6wXfxm3
	Pw42wsF0tRlTrjWFdw5FxI2yjirNnIm3tBIu4FjL2RePyIfzWtjHEeEihsyEGi3CFYd5rY/frMI
	oKttWyD/NsYNM/G90pqd3iQryM6deHuIfxA22UG8mDWulTSFHIEqfCtDg4jbNXcuiLxVq3Bniti
	7cOGuCXxZWEcgZvIiyvrpWbeVraXtJrUcMhpi9vEkhwzneZxaupxnzAi+n7PfF6PVoauXYxCyTd
	647ShokV5Ek0VR5TOea/kQe/U6N2xIcaPm8UAXTctaJ4lYkOdj0SmMeKmPNv3yWDx6Z0t+Tv333
	E1UgqE1aBINzE/4UK6ccQGWeKrvIxuuqemb/uFuPHD4HEJint3xivymtu9MUEDP6/vIkwvpwOIX
	qPWYz1ncN1BSeAsw5pUPqdnr26QGTn/bkskcZ+I4sDDvFDFssl/gDAEbBuNXDIhSGLlLilGiI7v
	Nq7cTkTMFFqdCR+WIKv0L0G8Dwcu6Fqt4yg3LLBe4eKo+3lB0ONZ38zJkJ/ftD2xBqEhzoM/eHh
	k9gB44I4zHk2b7apJxqE=
X-Received: by 2002:a05:6830:3481:b0:844:a8bf:7dc7 with SMTP id 46e09a7af769-85d363fc570mr7336192a34.17.1793638230796;
        Mon, 02 Nov 2026 08:50:30 -0800 (PST)
Received: from [10.10.18.223] (wsip-64-207-253-118.tu.ok.cox.net. [64.207.253.118])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85d354985cdsm9936779a34.10.2026.11.02.08.50.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 08:50:30 -0800 (PST)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Date: Mon, 02 Nov 2026 10:50:22 -0600
Subject: [PATCH v2 2/2] rtc: mt6397: provide the 32 kHz output as a clock
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261102-rbrue-suez-upstreaming-mt6397-rtc-32k-v2-2-19ca72815374@gmail.com>
References: <20261102-rbrue-suez-upstreaming-mt6397-rtc-32k-v2-0-19ca72815374@gmail.com>
In-Reply-To: <20261102-rbrue-suez-upstreaming-mt6397-rtc-32k-v2-0-19ca72815374@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793638226; l=4890;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=amIz4+OO8bg9BY0ErwfxlJTjkYD75qjrKdIIoLGCs4c=;
 b=SddfdcmGKWyuqGOE2/GxaWQqOQ1TXoTGs5VUhTToGfp3bnPWl7+Zrz5vLWEeXxPdlsr4dE61r
 fAJ9r7/SePRCBSg2vB3thim3kLRhLfoupjQ/1z8Xsr6XCNPG6w8yuKc
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_085031_964405_58A8BAC7 
X-CRM114-Status: GOOD (  21.37  )
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
index d6e156516aa6..2849beddc79d 100644
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
+	if (!of_property_present(dev->of_node, "#clock-cells") || !rtc->data->con)
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



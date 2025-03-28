Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7D8AC28B20
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Mar 2025 09:04:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Subject:Cc:To:
	From:Mime-Version:Message-ID:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ooR/6ruSGczGS6KBayjsleNze0p0oZJ0qN6pnM57YSM=; b=b+1NH98wvsVzV5X2z5u8EZvTm6
	LvzJI6/rlgEjaZ6EA2hOM1o57aFAxf5CMaGtD/l9D/7scXwaydzMI4J4PsPF0qsCUmUqyevbDHLRj
	6ZsQ7Zupo+FH7FXv6ljTu3LtvldZJOfoHx7JdzfkKaDtjA3e/gjuBvEv4FxpPuSc8+lNfH8cAeiEQ
	6Z9fCpNEoBeqY1Rc0B5c820Svu8TjRzhqtp4HGWrR6s3seR2FRbeBj/pFxmVqnqYcdVwfELEjoRz9
	3bheOVZhGnkTGL+zBljUOyKaW9NjKDS8/bL/xKWMWH3B0DWkOT4PK66F7q54nnP3NkrORU/4j0GAm
	jlAN8uhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1ty5dq-0000000Czbf-13uG;
	Fri, 28 Mar 2025 09:04:42 +0000
Received: from mxhk.zte.com.cn ([63.216.63.40])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1ty5c4-0000000CzKb-300b;
	Fri, 28 Mar 2025 09:02:55 +0000
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4ZPF0b0RnZz8RTZV;
	Fri, 28 Mar 2025 17:02:39 +0800 (CST)
Received: from xaxapp01.zte.com.cn ([10.88.99.176])
	by mse-fl1.zte.com.cn with SMTP id 52S92TvK075798;
	Fri, 28 Mar 2025 17:02:29 +0800 (+08)
	(envelope-from shao.mingyin@zte.com.cn)
Received: from mapi (xaxapp04[null])
	by mapi (Zmail) with MAPI id mid32;
	Fri, 28 Mar 2025 17:02:32 +0800 (CST)
Date: Fri, 28 Mar 2025 17:02:32 +0800 (CST)
X-Zmail-TransId: 2afb67e665a80d0-b5d3b
X-Mailer: Zmail v1.0
Message-ID: <20250328170232003DGEGnXtJuqky8ri8DWMFQ@zte.com.cn>
Mime-Version: 1.0
From: <shao.mingyin@zte.com.cn>
To: <vkoul@kernel.org>
Cc: <kishon@kernel.org>, <wens@csie.org>, <jernej.skrabec@gmail.com>,
        <samuel@sholland.org>, <zhang.enpei@zte.com.cn>,
        <linux-phy@lists.infradead.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-sunxi@lists.linux.dev>,
        <linux-kernel@vger.kernel.org>, <yang.yang29@zte.com.cn>,
        <xu.xin16@zte.com.cn>, <ye.xingchen@zte.com.cn>
Subject: =?UTF-8?B?W1BBVENIXSBwaHkvYWxsd2lubmVyOiBwaHktc3VuNTBpLXVzYjM6IFVzZSBkZXZfZXJyX3Byb2JlKCk=?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL: mse-fl1.zte.com.cn 52S92TvK075798
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 67E665AF.000/4ZPF0b0RnZz8RTZV
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250328_020252_903218_3D46FDED 
X-CRM114-Status: UNSURE (   9.75  )
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

From: Zhang Enpei <zhang.enpei@zte.com.cn>

Replace the open-code with dev_err_probe() to simplify the code.

Signed-off-by: Zhang Enpei <zhang.enpei@zte.com.cn>
Signed-off-by: Shao Mingyin <shao.mingyin@zte.com.cn>
---
 drivers/phy/allwinner/phy-sun50i-usb3.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/phy/allwinner/phy-sun50i-usb3.c b/drivers/phy/allwinner/phy-sun50i-usb3.c
index 363f9a0df503..b03faffc160d 100644
--- a/drivers/phy/allwinner/phy-sun50i-usb3.c
+++ b/drivers/phy/allwinner/phy-sun50i-usb3.c
@@ -141,11 +141,9 @@ static int sun50i_usb3_phy_probe(struct platform_device *pdev)
 		return -ENOMEM;

 	phy->clk = devm_clk_get(dev, NULL);
-	if (IS_ERR(phy->clk)) {
-		if (PTR_ERR(phy->clk) != -EPROBE_DEFER)
-			dev_err(dev, "failed to get phy clock\n");
-		return PTR_ERR(phy->clk);
-	}
+	if (IS_ERR(phy->clk))
+		return dev_err_probe(dev, PTR_ERR(phy->clk),
+				     "failed to get phy clock\n");

 	phy->reset = devm_reset_control_get(dev, NULL);
 	if (IS_ERR(phy->reset)) {
-- 
2.25.1


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35ADEC3600C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Apr 2025 07:51:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Subject:Cc:To:
	From:Mime-Version:Message-ID:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xUkaoDOSbH9AizCtOUhvREoakLiLJHsbEapkiYvMgYQ=; b=I6sWvo5YBadYIH+nhar9I1HPW7
	m9JwgDYH5ca9fO8abS2zQ7h0FSZrhTjpMyGp9pjZVD3rD7ZbH4dCDsC481CCWm9D6sfphzAoBQMYr
	mBxl+MaMJMY9hd4G59C36+4+CeyvqYbsyN3pKoVVH9rsKJN4SsbAU/vZoudDUc0SbBlVdEuDc16rx
	7onnEEA35ihd3WUGuKyv2VnAvQIq20dd2rvT9yxU49THRlIb1U8qkvR+ZKXyXspag0ll5Txw7QDmx
	RnoRq4ph+sJQ89xGMi7nqYId4c7pjBcu2eNhADFFmSa09PutvWtwalJCXh9Q9nHyCYcZ7vph8M5vO
	WXRia8Xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0FMH-00000008B6j-3H8J;
	Thu, 03 Apr 2025 07:51:29 +0000
Received: from mxhk.zte.com.cn ([63.216.63.35])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0FD3-000000089TT-3dDY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Apr 2025 07:42:00 +0000
Received: from mse-fl2.zte.com.cn (unknown [10.5.228.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4ZStwd126qz5B1J4;
	Thu,  3 Apr 2025 15:41:53 +0800 (CST)
Received: from xaxapp02.zte.com.cn ([10.88.97.241])
	by mse-fl2.zte.com.cn with SMTP id 5337fetw066040;
	Thu, 3 Apr 2025 15:41:40 +0800 (+08)
	(envelope-from shao.mingyin@zte.com.cn)
Received: from mapi (xaxapp01[null])
	by mapi (Zmail) with MAPI id mid32;
	Thu, 3 Apr 2025 15:41:42 +0800 (CST)
Date: Thu, 3 Apr 2025 15:41:42 +0800 (CST)
X-Zmail-TransId: 2af967ee3bb677c-3db59
X-Mailer: Zmail v1.0
Message-ID: <20250403154142936Po-soX8Bifyvw_eWSbddT@zte.com.cn>
Mime-Version: 1.0
From: <shao.mingyin@zte.com.cn>
To: <olivier.moysan@foss.st.com>
Cc: <arnaud.pouliquen@foss.st.com>, <lgirdwood@gmail.com>,
        <broonie@kernel.org>, <perex@perex.cz>, <tiwai@suse.com>,
        <mcoquelin.stm32@gmail.com>, <alexandre.torgue@foss.st.com>,
        <linux-sound@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <yang.yang29@zte.com.cn>, <xu.xin16@zte.com.cn>,
        <ye.xingchen@zte.com.cn>, <zhang.enpei@zte.com.cn>
Subject: =?UTF-8?B?W1BBVENIXSBzb3VuZDogc29jOiBzdG06IHN0bTMyX3NhaTogVXNlIGRldl9lcnJfcHJvYmUoKQ==?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL: mse-fl2.zte.com.cn 5337fetw066040
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 67EE3BC1.001/4ZStwd126qz5B1J4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250403_004158_067394_83D387FD 
X-CRM114-Status: UNSURE (   9.69  )
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
 sound/soc/stm/stm32_sai.c | 18 ++++++------------
 1 file changed, 6 insertions(+), 12 deletions(-)

diff --git a/sound/soc/stm/stm32_sai.c b/sound/soc/stm/stm32_sai.c
index 504a14584765..fa821e3fb427 100644
--- a/sound/soc/stm/stm32_sai.c
+++ b/sound/soc/stm/stm32_sai.c
@@ -169,20 +169,14 @@ static int stm32_sai_get_parent_clk(struct stm32_sai_data *sai)
 	struct device *dev = &sai->pdev->dev;

 	sai->clk_x8k = devm_clk_get(dev, "x8k");
-	if (IS_ERR(sai->clk_x8k)) {
-		if (PTR_ERR(sai->clk_x8k) != -EPROBE_DEFER)
-			dev_err(dev, "missing x8k parent clock: %ld\n",
-				PTR_ERR(sai->clk_x8k));
-		return PTR_ERR(sai->clk_x8k);
-	}
+	if (IS_ERR(sai->clk_x8k))
+		return dev_err_probe(dev, PTR_ERR(sai->clk_x8k),
+				     "missing x8k parent clock\n");

 	sai->clk_x11k = devm_clk_get(dev, "x11k");
-	if (IS_ERR(sai->clk_x11k)) {
-		if (PTR_ERR(sai->clk_x11k) != -EPROBE_DEFER)
-			dev_err(dev, "missing x11k parent clock: %ld\n",
-				PTR_ERR(sai->clk_x11k));
-		return PTR_ERR(sai->clk_x11k);
-	}
+	if (IS_ERR(sai->clk_x11k))
+		return dev_err_probe(dev, PTR_ERR(sai->clk_x11k),
+				     "missing x11k parent clock\n");

 	return 0;
 }
-- 
2.25.1


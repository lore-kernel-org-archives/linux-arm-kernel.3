Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C534C7115B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Jun 2025 15:57:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Subject:Cc:To:
	From:Mime-Version:Message-ID:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=igvA1VrySGQrAl9Tt2Vjxwss8RFCsK0tjf5RoIwrLxo=; b=3eByF99NX8FSsXxWXQJtYXCLjz
	RvS5gaqlk9sPYLxsjLgV20x44mNlONl1voYECRvt01xWt8MCL5sZcrFH3tdz9/7H2NBgKB29d37AM
	DI7AhocvrcxPVWYEEGr2NA8g/VV1bNIh26omVoaFnwt14my4VD26+fzJFvvGtov5Xw/6YF36WlX4t
	e0cfpK6jVIaD9dnS83F+KXrTq5Vakr0IwsYYaMTVbCSVUaMNy61IorMQhRo/sNpx77F10CCI3ziFB
	vEqALa1H53sBhES5BFodhIPIRgLL54zyFceFLKx9OrXjSfxJk/fgEP1z/75G91WlNLCVN7qOVznVl
	frX4uQBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTjYL-00000003KQH-3a0g;
	Mon, 23 Jun 2025 15:57:49 +0000
Received: from mxct.zte.com.cn ([183.62.165.209])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTgLC-00000002hZo-2TUp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Jun 2025 12:32:04 +0000
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mxct.zte.com.cn (FangMail) with ESMTPS id 4bQnWh4Mb7z4xPSq;
	Mon, 23 Jun 2025 20:31:44 +0800 (CST)
Received: from njy2app02.zte.com.cn ([10.40.13.116])
	by mse-fl1.zte.com.cn with SMTP id 55NCVeuH048305;
	Mon, 23 Jun 2025 20:31:40 +0800 (+08)
	(envelope-from long.yunjian@zte.com.cn)
Received: from mapi (njy2app03[null])
	by mapi (Zmail) with MAPI id mid201;
	Mon, 23 Jun 2025 20:31:44 +0800 (CST)
Date: Mon, 23 Jun 2025 20:31:44 +0800 (CST)
X-Zmail-TransId: 2afb68594930fffffffff5f-67598
X-Mailer: Zmail v1.0
Message-ID: <20250623203144007kQF7E1Bhy5PJl-Ph3u3Ou@zte.com.cn>
Mime-Version: 1.0
From: <long.yunjian@zte.com.cn>
To: <pierre-yves.mordret@foss.st.com>
Cc: <alain.volmat@foss.st.com>, <andi.shyti@kernel.org>,
        <mcoquelin.stm32@gmail.com>, <alexandre.torgue@foss.st.com>,
        <linux-i2c@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <mou.yi@zte.com.cn>, <xu.lifeng1@zte.com.cn>,
        <ouyang.maochun@zte.com.cn>, <fang.yumeng@zte.com.cn>
Subject: =?UTF-8?B?UEFUQ0hdIGkyYzogc3RtMzJmNzogVXNlIHN0cl9vbl9vZmYoKSBoZWxwZXI=?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL: mse-fl1.zte.com.cn 55NCVeuH048305
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 68594930.002/4bQnWh4Mb7z4xPSq
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_053202_800565_11249B28 
X-CRM114-Status: UNSURE (   8.90  )
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

From: Yumeng Fang <fang.yumeng@zte.com.cn>

Remove hard-coded strings by using the str_on_off() helper.

Signed-off-by: Yumeng Fang <fang.yumeng@zte.com.cn>
---
 drivers/i2c/busses/i2c-stm32f7.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-stm32f7.c b/drivers/i2c/busses/i2c-stm32f7.c
index e4aaeb2262d0..ef15475a7ee1 100644
--- a/drivers/i2c/busses/i2c-stm32f7.c
+++ b/drivers/i2c/busses/i2c-stm32f7.c
@@ -34,6 +34,7 @@
 #include <linux/regmap.h>
 #include <linux/reset.h>
 #include <linux/slab.h>
+#include <linux/string_choices.h>

 #include "i2c-stm32.h"

@@ -722,7 +723,7 @@ static int stm32f7_i2c_setup_timing(struct stm32f7_i2c_dev *i2c_dev,
 	dev_dbg(i2c_dev->dev, "I2C Rise(%i) and Fall(%i) Time\n",
 		setup->rise_time, setup->fall_time);
 	dev_dbg(i2c_dev->dev, "I2C Analog Filter(%s), DNF(%i)\n",
-		(i2c_dev->analog_filter ? "On" : "Off"), i2c_dev->dnf);
+		str_on_off(i2c_dev->analog_filter), i2c_dev->dnf);

 	i2c_dev->bus_rate = setup->speed_freq;

-- 
2.25.1


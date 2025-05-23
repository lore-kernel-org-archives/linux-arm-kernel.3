Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9C72C3DA6D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 May 2025 06:19:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Subject:Cc:To:
	From:Mime-Version:Message-ID:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mm84YPkyxetd7iusGaYqyBb6xiJ7SOm5Xfpagns+V88=; b=UvdK37aD2u6Vmna3DobwgJS+NU
	zohMiEYyRpahSXgXIhE/meEq/tNiXIgfrwNNCnYWe36fFXaRyd8bet/j30SXdSQPNOjsJyVypH5dv
	YFqxFKio79VjeiIBTD5ZTgGwu9o602vDn5AxlVqAG/rj9jw/DaemEXUS9FVlieunp2sER0j4S5ZPp
	4BDlqH78TXuQu2k1Kh5nBkczS/VZ+Up0kNd4giQBCDpJsm5aZypZIuAzIX899DBML19CwZp2hOMuQ
	/45n7C37epLW4whuUPeis8esGCRNg3hoLB1Q72ZgkTvqhl+sso/WsBcXLv8gRrplqVvfaEJfGmsp7
	lceNKgLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uILkW-000000035q9-07d5;
	Fri, 23 May 2025 06:19:20 +0000
Received: from mxct.zte.com.cn ([183.62.165.209])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uILiJ-000000035hX-3UIr
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 May 2025 06:17:05 +0000
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mxct.zte.com.cn (FangMail) with ESMTPS id 4b3ZgS2Yxlz4x5pd;
	Fri, 23 May 2025 14:16:52 +0800 (CST)
Received: from njb2app06.zte.com.cn ([10.55.23.119])
	by mse-fl1.zte.com.cn with SMTP id 54N6GifQ010301;
	Fri, 23 May 2025 14:16:44 +0800 (+08)
	(envelope-from long.yunjian@zte.com.cn)
Received: from mapi (njb2app05[null])
	by mapi (Zmail) with MAPI id mid201;
	Fri, 23 May 2025 14:16:47 +0800 (CST)
Date: Fri, 23 May 2025 14:16:47 +0800 (CST)
X-Zmail-TransId: 2afd683012cfffffffffe09-86aef
X-Mailer: Zmail v1.0
Message-ID: <20250523141647052h8sceSvH_KRJYFgqd6iuJ@zte.com.cn>
Mime-Version: 1.0
From: <long.yunjian@zte.com.cn>
To: <codrin.ciubotariu@microchip.com>
Cc: <andi.shyti@kernel.org>, <nicolas.ferre@microchip.com>,
        <alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>,
        <linux-i2c@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <mou.yi@zte.com.cn>,
        <xu.lifeng1@zte.com.cn>, <fang.yumeng@zte.com.cn>,
        <ouyang.maochun@zte.com.cn>
Subject: =?UTF-8?B?W1BBVENIXSBpMmM6IGF0OTE6IFVzZSBzdHJfcmVhZF93cml0ZSgpIGhlbHBlcg==?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL: mse-fl1.zte.com.cn 54N6GifQ010301
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 683012D4.003/4b3ZgS2Yxlz4x5pd
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250522_231704_026394_2EB74095 
X-CRM114-Status: UNSURE (   9.11  )
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

Remove hard-coded strings by using the str_read_write() helper.

Signed-off-by: Yumeng Fang <fang.yumeng@zte.com.cn>
Signed-off-by: Yunjian Long <long.yunjian@zte.com.cn>
---
 drivers/i2c/busses/i2c-at91-master.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-at91-master.c b/drivers/i2c/busses/i2c-at91-master.c
index ee3b469ddfb9..374fc50bb205 100644
--- a/drivers/i2c/busses/i2c-at91-master.c
+++ b/drivers/i2c/busses/i2c-at91-master.c
@@ -26,6 +26,7 @@
 #include <linux/pinctrl/consumer.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
+#include <linux/string_choices.h>

 #include "i2c-at91.h"

@@ -523,7 +524,7 @@ static int at91_do_twi_transfer(struct at91_twi_dev *dev)
 	 */

 	dev_dbg(dev->dev, "transfer: %s %zu bytes.\n",
-		(dev->msg->flags & I2C_M_RD) ? "read" : "write", dev->buf_len);
+		str_read_write(dev->msg->flags & I2C_M_RD), dev->buf_len);

 	reinit_completion(&dev->cmd_complete);
 	dev->transfer_status = 0;
-- 
2.25.1


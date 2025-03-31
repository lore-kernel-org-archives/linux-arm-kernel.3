Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFCDDC3600C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Mar 2025 12:16:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Subject:Cc:To:
	From:Mime-Version:Message-ID:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=lIys1vUpi+oKkQfsUzr9NsYZuXriknKxoTvrbUaDcAo=; b=UAAi+JIE7Oo7d70yGBBan2aEA4
	MfS/mXMkjVVv2Jn71y9uWLs4ASUW+u0DiPTyjZ1XzCMS0EPdzCa0/JaifvIhnShnApwKP9hxfWBev
	Tcg+UtoZmrFlimXyR+5AJdPJnleICwcAeQvx7mEygHUj4jd5Wr1vuhTpkhYE5cO9sLrrNOTXCjpPK
	sJVeB/hsbaLKIx0TGZtnIwcfm9E7GkVbPRXGRpJKRy98dPMTbQuewMFNXojhAKg7I90YD1hQPdsHU
	vOrXcoz0QQLDmdhroBwzf3OfysupQ9uXLyV0TKz1N5jxHQN2B1ZmReru+WDxikOlE9v4fgMRptgUQ
	GG7zJQsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzE47-00000000JNh-2ggm;
	Mon, 31 Mar 2025 12:16:31 +0000
Received: from mxhk.zte.com.cn ([63.216.63.40])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzE2N-00000000JDH-0zlJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Mar 2025 12:14:46 +0000
Received: from mse-fl2.zte.com.cn (unknown [10.5.228.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4ZR96d1Gsjz8QrkZ;
	Mon, 31 Mar 2025 20:14:33 +0800 (CST)
Received: from xaxapp01.zte.com.cn ([10.88.99.176])
	by mse-fl2.zte.com.cn with SMTP id 52VCEMZl054991;
	Mon, 31 Mar 2025 20:14:22 +0800 (+08)
	(envelope-from shao.mingyin@zte.com.cn)
Received: from mapi (xaxapp02[null])
	by mapi (Zmail) with MAPI id mid32;
	Mon, 31 Mar 2025 20:14:25 +0800 (CST)
Date: Mon, 31 Mar 2025 20:14:25 +0800 (CST)
X-Zmail-TransId: 2afa67ea8721444-29a24
X-Mailer: Zmail v1.0
Message-ID: <20250331201425296l4h98bZjxHzs08fdvHrGO@zte.com.cn>
Mime-Version: 1.0
From: <shao.mingyin@zte.com.cn>
To: <nm@ti.com>
Cc: <yang.yang29@zte.com.cn>, <xu.xin16@zte.com.cn>, <ye.xingchen@zte.com.cn>,
        <ssantosh@kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <tang.dongxing@zte.com.cn>
Subject: =?UTF-8?B?W1BBVENIXSBzb2M6IHRpOiBrMy1yaW5nYWNjOiBVc2UgZGV2aWNlX21hdGNoX29mX25vZGUoKQ==?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL: mse-fl2.zte.com.cn 52VCEMZl054991
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 67EA8729.000/4ZR96d1Gsjz8QrkZ
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250331_051443_429095_0D20A65D 
X-CRM114-Status: GOOD (  10.74  )
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

From: Tang Dongxing <tang.dongxing@zte.com.cn>

Replace the open-code with device_match_of_node().

Signed-off-by: Tang Dongxing <tang.dongxing@zte.com.cn>
Signed-off-by: Shao Mingyin <shao.mingyin@zte.com.cn>
---
 drivers/soc/ti/k3-ringacc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/ti/k3-ringacc.c b/drivers/soc/ti/k3-ringacc.c
index 82a15cad1c6c..7602b8a909b0 100644
--- a/drivers/soc/ti/k3-ringacc.c
+++ b/drivers/soc/ti/k3-ringacc.c
@@ -1291,7 +1291,7 @@ struct k3_ringacc *of_k3_ringacc_get_by_phandle(struct device_node *np,

 	mutex_lock(&k3_ringacc_list_lock);
 	list_for_each_entry(entry, &k3_ringacc_list, list)
-		if (entry->dev->of_node == ringacc_np) {
+		if (device_match_of_node(entry->dev, ringacc_np)) {
 			ringacc = entry;
 			break;
 		}
-- 
2.25.1


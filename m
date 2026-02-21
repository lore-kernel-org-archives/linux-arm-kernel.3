Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64B34C5DF69
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Feb 2026 00:41:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Date:Subject:Cc:To:From:Message-ID:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NAjjqrpCSMYNy0iR2NzdrBAGVZVg+6SRsGa23R59QU4=; b=F954V5yQCuBKoQaGB/QVdIoyNU
	3ueX4hx19st6vTKLuyKDp3UwPpNTRT5FZ+RSfmD/iXy4HevMhzprwwhHp6DVAqrvJQFysEx4207Sv
	Ha7Ng7KPDZzGnnP62zLwTfuDz6VXfC2dDyAtHrgBXAE37spQ10d9vZw7n0Y47+lNg+zYA0ZY4MfYL
	h+vqX4U7/BFSKig9sgTi8e1Fu7it5E2wSxOW1ZK2TZSmCIOwbgDRC6pdm1ErPMpBATAwPMuu3g/1t
	+M3fmkZg4aLN5mIfu/wxwU3FJ7EIZCxozmK6ty5/eFE6WsV8FV1yw1gcve8HxmQpIRuHmlNDpBi4u
	U7a0NM1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtb3Q-0000000Fj2s-0v0q;
	Sat, 21 Feb 2026 00:41:04 +0000
Received: from out162-62-57-87.mail.qq.com ([162.62.57.87])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtb3N-0000000Fj2S-1V3Z;
	Sat, 21 Feb 2026 00:41:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1771634451;
	bh=NAjjqrpCSMYNy0iR2NzdrBAGVZVg+6SRsGa23R59QU4=;
	h=From:To:Cc:Subject:Date;
	b=aWYxrxrlK0RUK19kH4veSzMgUo8H6LLefLdiUqMQUSsAnP/yr5QYZR4qOa5zLfxFb
	 XISYSQJekWxIul3HlHyAr4EGjPVNxpEnaYToAr45+S2yslHZXG/ajAwHAxG1QkmpKi
	 YpR8jE3PGC3KVdV/IoRJSPeht5R5tPFMlr+RGeY4=
Received: from localhost.localdomain ([116.128.244.169])
	by newxmesmtplogicsvrsza56-0.qq.com (NewEsmtp) with SMTP
	id A3113C4E; Sat, 21 Feb 2026 08:40:49 +0800
X-QQ-mid: xmsmtpt1771634449tgvbkue5o
Message-ID: <tencent_BE953AE4AA17D089CF5C87EB6F4400F70206@qq.com>
X-QQ-XMAILINFO: M2SvzgchpLqfQUcwL5mx/2ncuwZeU0ZIlWpp7GxF80nJnN/ZRJ6bKNsRwnF7uE
	 btOfFY3OD6VUHSZlGAXLa7ZCoxBvHE/t92MDAR/x5I9T7PNtl5uVh0OvI9JNFNEdLe3S8uHJHbdL
	 2UNjKcjtrnqqo3WJm+oO+erCr2V0Zr5M13zODGHBY9d6aKDF9J5QTtBKDoaJqoiNgw4laVKIsBO9
	 tACEdeWJec0p73Rv2sUyR8P0iLr/6ivOfIMqKxvAGqQcUROp55w2A8b3LZI590Yjn96J5uIhiSYp
	 eMgPQ0pEIOocicTXlN7pkFmFwW9R2Sd7LxUZ6fCNZcUox7fju13WKvLhxXiT1UPGHoS3j7w5qF+1
	 d3gG0Nod287ROHI3wAYIyHXd8VdOF36ZP5OlK7Xe1rEj9sp0OZp0n8psLZSYeo3O4/yI3ntNaTkg
	 gTcU3sWzpNHkGDm69uGcJQRiJv7CYsTZ8cEzQDnOtPlYq/p0p4TwLrKkbTWOG3YrYpSEzXNfwCBi
	 mtSXz6QSg8w9wKTL7g9dtQIlrtql81ttERlLTafkdpaCrqQvATncca8Mz2XJZ0f0UX6W/u2i2jT2
	 z86JfHTr5nBSRu5wBj0OFk4u42PCtZWUxpDAnpG48+WwqaZvXWkxH8EBIAfzy8d0fhMjtArRifXS
	 ntjs/Y8sXSMdN4VsJNJ53WU5jcsv2HWtngpaN7I+3pO54pXHAA5hasnIk1vU2tvaMltuM8uveGYQ
	 8BGG6TBZsUHV6kZFn/zbjf584i2c3ayGM+1Px/xLhWjqGPXxMOcIjJbqKNlEXF970PHDGTLw1MxO
	 v2YO4xJ2UWWC6CfLQM3Z8OMvzDjb8R9eDpjzKlnf1CZnmKG4yKnslNkYqpVwp/1omFV9AWcFJB1y
	 LMKGOjt426GNmGJjlSVTrObegCYijQ4nZmVk84gedIVHf0PzLZim5D0OXBVbCQ/SPuEUoyX6Adii
	 Va+QApeZt9krzp6vDViMa2pHAitRe1uyW8iiE0WfY7qqxoOPH2HIcViTBJeblkuf2rjbzBDL5sTZ
	 RqReYtVHl5k8x4GXOi
X-QQ-XMRINFO: Nq+8W0+stu50tPAe92KXseR0ZZmBTk3gLg==
From: xiaopeitux@foxmail.com
To: heiko@sntech.de,
	shawn.lin@rock-chips.com,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Pei Xiao <xiaopei01@kylinos.cn>
Subject: [PATCH] soc: rockchip: grf: fix device node refcount leak in error path
Date: Sat, 21 Feb 2026 08:40:27 +0800
X-OQ-MSGID: <9016222c067613870e8e3fd89ba0b15adc523fcd.1771634299.git.xiaopei01@kylinos.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260220_164101_923425_668CC824 
X-CRM114-Status: UNSURE (   7.95  )
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

From: Pei Xiao <xiaopei01@kylinos.cn>

The for_each_matching_node_and_match() macro automatically manages device
node reference counts during normal iteration. However, when breaking out
of the loop early with return, the current iteration's node is not
automatically released, leading to a reference count leak.

Fix this by adding of_node_put() before returning from the loop
when fails.

Fixes: 75fb63ae0312 ("soc: rockchip: grf: Support multiple grf to be handled")
Signed-off-by: Pei Xiao <xiaopei01@kylinos.cn>
---
 drivers/soc/rockchip/grf.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/rockchip/grf.c b/drivers/soc/rockchip/grf.c
index 04937c40da47..b459607c118a 100644
--- a/drivers/soc/rockchip/grf.c
+++ b/drivers/soc/rockchip/grf.c
@@ -231,6 +231,7 @@ static int __init rockchip_grf_init(void)
 		grf = syscon_node_to_regmap(np);
 		if (IS_ERR(grf)) {
 			pr_err("%s: could not get grf syscon\n", __func__);
+			of_node_put(np);
 			return PTR_ERR(grf);
 		}
 
-- 
2.25.1



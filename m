Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3652FD0049
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Mar 2026 01:40:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fSY7mh8iFyOASonZpGirdkM3k1pmORlaG3EiIlyJ0a8=; b=NNjOcS+kN4PymIq7MhDAv1Etkw
	fYw8YuI3wDw9ygw6br2Okk/jmllXein6AgyuLXlGxrmgeyWtfqHqqjXmHpgdX3JjpigBW22qnDa/l
	F1OyjJHFE8PHesT1JYGfobPp3891uKqkO37GRPqkA7LZDfRTqo5bqZspUUSmkgUtLCVtri0pLNqQS
	IOzJ1hOtKssR9By7Mbof2hUTK1kRrJNRzf0WxuRrhx4L/tcR24xDpHKO5fHfAQLxwKbzdOIYdAKcN
	8aHpL95pxgJLtlOvhr17IlnbngHLFfiO1PQcCAKNyo7rOyb0d2j5wkbnQiPul5KkqQfsaPFqrjac1
	EyEfa2xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwVmv-0000000AbP5-0coH;
	Sun, 01 Mar 2026 01:40:05 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwVmt-0000000AbOW-2lyD;
	Sun, 01 Mar 2026 01:40:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1EEE16012A;
	Sun,  1 Mar 2026 01:40:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 141F1C19421;
	Sun,  1 Mar 2026 01:40:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772329202;
	bh=GvPeFBSp28rQnDX/NpT3iu4lnh2ZFtLOp3Qwu31SJuU=;
	h=From:To:Cc:Subject:Date:From;
	b=B8MInzn9tLmZCqH2xN/TnyeRGKTnrKTmj73Qw+FVTHl+EhKK6wss0zA7WApF7ugHT
	 EecAHJG8bFOBL+m0cyzeeSaSJkv9BKBj1xcDzhk3VVVtH03eHj6sluvVAaYahBGfdb
	 tQ4nhjFyqwJTsvH96VxiGXksxkClkbGsGki3m0sWFzilURa3nTqTXmJ/BFfmvtdAO0
	 MCKXnQw7gh9ZRrrufU1r//VCVYHtxiqjT+EcD2avAqEy/sXfAwqeKBFVh3zVHqu6DO
	 sfhEUfRzit+32dn7jOMwiH92lRBa0k4uF8BKEtvJK2At6XSjC3L4ZtndTN0ZuWc+gB
	 yOQAk4XoS3Hww==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	johan@kernel.org
Cc: Yong Wu <yong.wu@mediatek.com>,
	Miaoqian Lin <linmq006@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: FAILED: Patch "memory: mtk-smi: fix device leak on larb probe" failed to apply to 6.1-stable tree
Date: Sat, 28 Feb 2026 20:40:00 -0500
Message-ID: <20260301014000.1701156-1-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Patchwork-Hint: ignore
X-stable: review
Content-Transfer-Encoding: 8bit
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

The patch below does not apply to the 6.1-stable tree.
If someone wants it applied there, or to any other stable or longterm
tree, then please email the backport, including the original git commit
id to <stable@vger.kernel.org>.

Thanks,
Sasha

------------------ original commit in Linus's tree ------------------

From 9dae65913b32d05dbc8ff4b8a6bf04a0e49a8eb6 Mon Sep 17 00:00:00 2001
From: Johan Hovold <johan@kernel.org>
Date: Fri, 21 Nov 2025 17:46:23 +0100
Subject: [PATCH] memory: mtk-smi: fix device leak on larb probe

Make sure to drop the reference taken when looking up the SMI device
during larb probe on late probe failure (e.g. probe deferral) and on
driver unbind.

Fixes: cc8bbe1a8312 ("memory: mediatek: Add SMI driver")
Fixes: 038ae37c510f ("memory: mtk-smi: add missing put_device() call in mtk_smi_device_link_common")
Cc: stable@vger.kernel.org	# 4.6: 038ae37c510f
Cc: stable@vger.kernel.org	# 4.6
Cc: Yong Wu <yong.wu@mediatek.com>
Cc: Miaoqian Lin <linmq006@gmail.com>
Signed-off-by: Johan Hovold <johan@kernel.org>
Link: https://patch.msgid.link/20251121164624.13685-3-johan@kernel.org
Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 drivers/memory/mtk-smi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/memory/mtk-smi.c b/drivers/memory/mtk-smi.c
index dd6150d200e89..3609bfd3c64be 100644
--- a/drivers/memory/mtk-smi.c
+++ b/drivers/memory/mtk-smi.c
@@ -685,6 +685,7 @@ static void mtk_smi_larb_remove(struct platform_device *pdev)
 	device_link_remove(&pdev->dev, larb->smi_common_dev);
 	pm_runtime_disable(&pdev->dev);
 	component_del(&pdev->dev, &mtk_smi_larb_component_ops);
+	put_device(larb->smi_common_dev);
 }
 
 static int __maybe_unused mtk_smi_larb_resume(struct device *dev)
-- 
2.51.0






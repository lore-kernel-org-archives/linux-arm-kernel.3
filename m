Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EF28FD004B
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Mar 2026 01:15:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=R9iDRs/tqvnvN+f0IdKVrpRsSKmHURpj3QYvR6Ikpvg=; b=4/oWJMFIoz3S6TrMu5VfYagdWd
	MEmgUduGZWMQ4XoijMZ1MmRBSKQxQYchXiYBdfBI1ybOs1L5ZrV4rzS/L4XCaPa/MSqZ0hwwrtPES
	j3bniMzvdWaxc0Jl1gNZuN9svJGlJuF7241mt+hU+YlpAl61CbD49vc1MflAQbGUwYv55bjQuq46m
	E/itpBWKnO6UX6FXzEAiJ4GZQy/LTtCzfuZkFUBleeuP9/hgZr0X47u6NsxoWpP+9Ofx4KXHgKYpy
	zPMoeYSO4EXz4K5bfddbjt71/nDTN9NoH6Jh1fYWL+BfQqym/uUGZkYJQInwiZiQfN6Gd3E2SH9Q1
	M6ZNiTzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwVP1-0000000ARit-3qYX;
	Sun, 01 Mar 2026 01:15:24 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwVOx-0000000ARh1-0ApM;
	Sun, 01 Mar 2026 01:15:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 415DD43281;
	Sun,  1 Mar 2026 01:15:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65D6FC19421;
	Sun,  1 Mar 2026 01:15:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772327718;
	bh=0KT0uYt9nO24XwAB0yD/495s2n1S7+JBd7/h+QDK2RE=;
	h=From:To:Cc:Subject:Date:From;
	b=kI31p+25uQOz/ONLZFNdf0z/TVNUVfSDK/Q9hOpO/YK6HVBN6eJ8WjByuR6Zzjioj
	 coNfSxCmTgZ07MB3R8ME60RhNpAH6+qcutZzngIJqsqfQfgcz+SLWB878IGGGSQkIK
	 ql/EY7cdORIV3cB2LveFbI9Tb/SLD8SCxOCd+427a8pCSYQwocAWEDnGpF+Swo3ChY
	 vSIt3MPGRnW41fIJyKa4yfOWT+hVi5jrh81Gd309eaxcoComXrOUMc8Er1nHztJqn3
	 1lDNDfFw2b+r8emtSZvYBTUL4mt4fUmBT4KRi0kIQDQ0LUPVXdABDfvD/sBRy0CHRz
	 cjTa72wmxOy4g==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	johan@kernel.org
Cc: Yong Wu <yong.wu@mediatek.com>,
	Miaoqian Lin <linmq006@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: FAILED: Patch "memory: mtk-smi: fix device leaks on common probe" failed to apply to 6.18-stable tree
Date: Sat, 28 Feb 2026 20:15:15 -0500
Message-ID: <20260301011516.1668360-1-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Patchwork-Hint: ignore
X-stable: review
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260228_171519_104734_65ADE80E 
X-CRM114-Status: GOOD (  12.70  )
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

The patch below does not apply to the 6.18-stable tree.
If someone wants it applied there, or to any other stable or longterm
tree, then please email the backport, including the original git commit
id to <stable@vger.kernel.org>.

Thanks,
Sasha

------------------ original commit in Linus's tree ------------------

From 6cfa038bddd710f544076ea2ef7792fc82fbedd6 Mon Sep 17 00:00:00 2001
From: Johan Hovold <johan@kernel.org>
Date: Fri, 21 Nov 2025 17:46:22 +0100
Subject: [PATCH] memory: mtk-smi: fix device leaks on common probe

Make sure to drop the reference taken when looking up the SMI device
during common probe on late probe failure (e.g. probe deferral) and on
driver unbind.

Fixes: 47404757702e ("memory: mtk-smi: Add device link for smi-sub-common")
Fixes: 038ae37c510f ("memory: mtk-smi: add missing put_device() call in mtk_smi_device_link_common")
Cc: stable@vger.kernel.org	# 5.16: 038ae37c510f
Cc: stable@vger.kernel.org	# 5.16
Cc: Yong Wu <yong.wu@mediatek.com>
Cc: Miaoqian Lin <linmq006@gmail.com>
Signed-off-by: Johan Hovold <johan@kernel.org>
Link: https://patch.msgid.link/20251121164624.13685-2-johan@kernel.org
Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 drivers/memory/mtk-smi.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/memory/mtk-smi.c b/drivers/memory/mtk-smi.c
index 733e22f695ab7..dd6150d200e89 100644
--- a/drivers/memory/mtk-smi.c
+++ b/drivers/memory/mtk-smi.c
@@ -674,6 +674,7 @@ static int mtk_smi_larb_probe(struct platform_device *pdev)
 err_pm_disable:
 	pm_runtime_disable(dev);
 	device_link_remove(dev, larb->smi_common_dev);
+	put_device(larb->smi_common_dev);
 	return ret;
 }
 
@@ -917,6 +918,7 @@ static void mtk_smi_common_remove(struct platform_device *pdev)
 	if (common->plat->type == MTK_SMI_GEN2_SUB_COMM)
 		device_link_remove(&pdev->dev, common->smi_common_dev);
 	pm_runtime_disable(&pdev->dev);
+	put_device(common->smi_common_dev);
 }
 
 static int __maybe_unused mtk_smi_common_resume(struct device *dev)
-- 
2.51.0






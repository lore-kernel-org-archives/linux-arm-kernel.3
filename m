Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F3FFFD0048
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Mar 2026 01:15:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/v+NcgXeBrA9aITmDQvAU5H8pINWrPVR8tcprIQJBm4=; b=wrQJHn9Kue36eUCK+REoXL+Vgd
	as5dzZD8y+WVGFsiu8whT0KiThUtIKNQ+hsSyK/l3UxOAp4gPbDNStoG361cCNPwmWXKcYmvrLneK
	0CpI1eqoejXW6xQJj1KRefWOg27hrioOpKKyEPusMYQGP81xxPEPaB194RGuUKo3uJ7MqJv10zEwO
	UV9r4L/+1o46y6erv/0oZJFBhVcOBqbRrrf6I6cwnVOCzIrGq5ZG9Go1GUaveLxyi/IiU80RivbUw
	vdq2ytlLDoDV4jrohKRmc6rfEhTjO1/iWd/XglZlqPH3RSO8xX+bSZzJVLrZbS5dLjqiTJECnG44V
	3mbNyJTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwVPI-0000000ARsw-1bMQ;
	Sun, 01 Mar 2026 01:15:40 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwVP6-0000000ARlT-2auR;
	Sun, 01 Mar 2026 01:15:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7AA3260008;
	Sun,  1 Mar 2026 01:15:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BC8AC19421;
	Sun,  1 Mar 2026 01:15:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772327727;
	bh=0f/NSy3VT+8W/tGAh7PdRf3oRHJIA12mjLz212i7bdo=;
	h=From:To:Cc:Subject:Date:From;
	b=WG1d885LeaSVqGFlfYtf871xltF4JQocOx+6DtYg5cykiN73L18j8BRjudd1fFAUd
	 SivvxBGKDvGWFwL/UtMXzaIgynMghiLITvAwBrd/XPxcBQ8RYjcIAoLPDYpG8zib+T
	 4VZXdpAtYmlOdIzJ7NABJdP73FZzSqBN+OVhyJ7PKF+K0gAb7axnxdW0gFpnTvN8hC
	 8qBHefs8Wd7gOeI3Ue2HM7N25c/9cdPmQVzcfcGj6enx+VcafaEUSgYORYU1fEd6S+
	 49e0+G1PpUhdTlp047OI+CduHWJvCoCIs4yYBAlg0RRyM72mw1wrZShMSDGrsPRoKW
	 OX+IYoPWvdTYg==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	johan@kernel.org
Cc: Yong Wu <yong.wu@mediatek.com>,
	Miaoqian Lin <linmq006@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: FAILED: Patch "memory: mtk-smi: fix device leak on larb probe" failed to apply to 6.18-stable tree
Date: Sat, 28 Feb 2026 20:15:24 -0500
Message-ID: <20260301011525.1668665-1-sashal@kernel.org>
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

The patch below does not apply to the 6.18-stable tree.
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






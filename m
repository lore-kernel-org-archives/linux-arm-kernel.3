Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEA7ED12D5D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Nov 2024 01:19:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MERdRrDohXR5+nResFYaTjHMcHXpDsj2YAXyi7y7AvQ=; b=zhMg5CzV1fn+IUj6Zz6em3WzUY
	gcNYZHEhq3YkXsnC6XYeBMfavPcNAOMKEJOX2M3ZBUj91IEzv2gIHM0J3uCmTbVVN+9q6J0GMiER4
	rb77c47K/b4vvkVTN6jYMTSUNCHZ2Ip03Nzfw93lU0+53ktCPvaxPExBHLjj/f6z9XB6pmNYbGrDw
	9gCiXHkr/foPPFvWo3AfE3TK0XQEKzhB9e4Y103ska08zlYTeLan0+ONoXsqUvoteWIDegIi54Oq/
	8JTxtnJLDoPEqPUBXV4DnZEhzihrvQB4UUg48unz7zOP5tIncjrrrzt2EpsjmQHNGCdzGVB4rHzZs
	Wba5b4fA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAJ4x-0000000G0tN-1bJC;
	Mon, 11 Nov 2024 01:18:55 +0000
Received: from out30-119.freemail.mail.aliyun.com ([115.124.30.119])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAIw8-0000000Fzvi-2y3g;
	Mon, 11 Nov 2024 01:09:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1731287381; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=MERdRrDohXR5+nResFYaTjHMcHXpDsj2YAXyi7y7AvQ=;
	b=J9QZ90e818b8nWAEu6pMYKZzQqeV3sOAtVkzenluLimIegPHjQODzq9vS/Cee8sLpN74eufO2C0zIx7aZuq8Nuv6z8dzzxG7M7T1MW9Q7KXrP7oLtOcyir6FDXGTktFkB0MpXk9em4yX6enTF8PFb8dV6toJNV9xxxk6FWksmxg=
Received: from localhost(mailfrom:yang.lee@linux.alibaba.com fp:SMTPD_---0WJ3iJNr_1731287376 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 11 Nov 2024 09:09:37 +0800
From: Yang Li <yang.lee@linux.alibaba.com>
To: matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	kw@linux.com
Cc: linux-pci@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Yang Li <yang.lee@linux.alibaba.com>,
	Abaci Robot <abaci@linux.alibaba.com>
Subject: [PATCH -next] PCI: mediatek-gen3: Remove unneeded semicolon
Date: Mon, 11 Nov 2024 09:09:35 +0800
Message-Id: <20241111010935.20208-1-yang.lee@linux.alibaba.com>
X-Mailer: git-send-email 2.32.0.3.g01195cf9f
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241110_170949_754086_689823AB 
X-CRM114-Status: UNSURE (   8.37  )
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

This patch removes an redundant semicolon.

./drivers/pci/controller/pcie-mediatek-gen3.c:414:2-3: Unneeded
semicolon

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Closes: https://bugzilla.openanolis.cn/show_bug.cgi?id=11789
Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
---
 drivers/pci/controller/pcie-mediatek-gen3.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c b/drivers/pci/controller/pcie-mediatek-gen3.c
index f333afb92a21..be52e3a123ab 100644
--- a/drivers/pci/controller/pcie-mediatek-gen3.c
+++ b/drivers/pci/controller/pcie-mediatek-gen3.c
@@ -411,7 +411,7 @@ static int mtk_pcie_startup_port(struct mtk_gen3_pcie *pcie)
 		if (pcie->num_lanes > 1)
 			val |= FIELD_PREP(PCIE_SETTING_LINK_WIDTH,
 					  GENMASK(fls(pcie->num_lanes >> 2), 0));
-	};
+	}
 	writel_relaxed(val, pcie->base + PCIE_SETTING_REG);
 
 	/* Set Link Control 2 (LNKCTL2) speed restriction, if any */
-- 
2.32.0.3.g01195cf9f



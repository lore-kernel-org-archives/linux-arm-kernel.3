Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 862F8C3601B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Apr 2025 08:00:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Subject:Cc:To:
	From:Mime-Version:Message-ID:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5dhN994mK3sV8XyXlVMNu74SvDuu2WdE1WmcbuX0seo=; b=NwAoJcjSK5CQABjGVdFn25iuWl
	Nfnsa/jz2aX9GqpzXO8nnY37M7eYKD77cY11NOQpB4t/Ofs0M3iyOk0ThP9ygb3DFeYoPe5UutGdg
	Ni4/pRwYhfX1aJEVoiZFXISGobRA4XCTMew7ucppDit3UItjM84IsOTICOJ7hNnAQKqylFLLnn26+
	4VcZsuPFFer+9uNAHZc7I9z2/WPxNIPtdcqA3/Xhf0XpielkLu0wy5vcnPfun3EG1hNa2H8yfReJf
	MghPtrdFXx1qyTROVE3aSb7B1CGO2Q8lpg8foQ8Dl7M3n4yZd0zGcz9+RM91l80fh1Xs23filAduD
	7GDLrLGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0FV3-00000008CKH-09nG;
	Thu, 03 Apr 2025 08:00:33 +0000
Received: from mxhk.zte.com.cn ([63.216.63.40])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0FI4-00000008AV4-4A5C
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Apr 2025 07:47:10 +0000
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4ZSv2Y3PJ6z8RTZL;
	Thu,  3 Apr 2025 15:47:01 +0800 (CST)
Received: from xaxapp05.zte.com.cn ([10.99.98.109])
	by mse-fl1.zte.com.cn with SMTP id 5337kpK9082996;
	Thu, 3 Apr 2025 15:46:51 +0800 (+08)
	(envelope-from shao.mingyin@zte.com.cn)
Received: from mapi (xaxapp04[null])
	by mapi (Zmail) with MAPI id mid32;
	Thu, 3 Apr 2025 15:46:54 +0800 (CST)
Date: Thu, 3 Apr 2025 15:46:54 +0800 (CST)
X-Zmail-TransId: 2afb67ee3ceeffffffff9da-3bdb9
X-Mailer: Zmail v1.0
Message-ID: <20250403154654546Uoj1gN_pronbxhSLPEIUn@zte.com.cn>
Mime-Version: 1.0
From: <shao.mingyin@zte.com.cn>
To: <lpieralisi@kernel.org>
Cc: <kw@linux.com>, <manivannan.sadhasivam@linaro.org>, <robh@kernel.org>,
        <bhelgaas@google.com>, <michal.simek@amd.com>,
        <linux-pci@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <yang.yang29@zte.com.cn>,
        <xu.xin16@zte.com.cn>, <ye.xingchen@zte.com.cn>,
        <xie.ludan@zte.com.cn>
Subject: =?UTF-8?B?W1BBVENIXSBQQ0k6IHhpbGlueC14ZG1hOiBVc2UgZGV2bV9wbGF0Zm9ybV9pb3JlbWFwX3Jlc291cmNlX2J5bmFtZcKgwqA=?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL: mse-fl1.zte.com.cn 5337kpK9082996
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 67EE3CF5.001/4ZSv2Y3PJ6z8RTZL
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250403_004709_185163_8B11B6D2 
X-CRM114-Status: UNSURE (   9.81  )
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

From: Xie Ludan <xie.ludan@zte.com.cn>

Introduce devm_platform_ioremap_resource_byname() to simplify
resource retrieval and mapping.This new function consolidates
platform_get_resource_byname() and devm_ioremap_resource() into a single
call, improving code readability and reducing API call overhead.

Signed-off-by: Xie Ludan <xie.ludan@zte.com.cn>
Signed-off-by: Shao Mingyin <shao.mingyin@zte.com.cn>
---
 drivers/pci/controller/pcie-xilinx-dma-pl.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/pci/controller/pcie-xilinx-dma-pl.c b/drivers/pci/controller/pcie-xilinx-dma-pl.c
index dd117f07fc95..238deec3b948 100644
--- a/drivers/pci/controller/pcie-xilinx-dma-pl.c
+++ b/drivers/pci/controller/pcie-xilinx-dma-pl.c
@@ -753,8 +753,7 @@ static int xilinx_pl_dma_pcie_parse_dt(struct pl_dma_pcie *port,

 	if (port->variant->version == QDMA) {
 		port->cfg_base = port->cfg->win;
-		res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "breg");
-		port->reg_base = devm_ioremap_resource(dev, res);
+		port->reg_base = devm_platform_ioremap_resource_byname(pdev, "breg");
 		if (IS_ERR(port->reg_base))
 			return PTR_ERR(port->reg_base);
 		port->phys_reg_base = res->start;
-- 
2.25.1


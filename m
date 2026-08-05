Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3246C55174
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Aug 2026 06:05:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Date:Subject:Cc:To:From:Message-ID:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tRd1VpgdcpCboCWZ3SthlDpOzvouEzTnkFBo/WtbgVQ=; b=K8L1aKD4wWxEKfTOiPgnVazc3W
	JI5maSc4C1/zVGwkF/qzXqnbIW3haHQLRbIDE78IYXs0UagcqMkvBavenF0sOzyycyIRw+WxCXmuE
	BnijpKIUPyQ8VhqsUN+uohXO0C/nk19VTZBeMb7RqgUW/aUNxRPV/EH3OPvuFi5Za3wGtGQCSanZC
	QudjNtOc5B95AXpFWjK8WmeSZsadI6XMbBqSd0eOBJoxajVT/QwdOHQIp+QuQv7zv5d0kvWV2OChb
	sNT2t7XDS7MI7bMPcEude5zkHhLLYFhHjYxpNLZAMTE7QAToQ5oGK4zYCBJXEMKZHrha9JRb8E+kW
	Gn9LKdfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrUl4-00000003HXw-1LsC;
	Wed, 05 Aug 2026 06:05:42 +0000
Received: from out162-62-57-137.mail.qq.com ([162.62.57.137])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrUl0-00000003HWl-3Vtt
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Aug 2026 06:05:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1785909928; bh=tRd1VpgdcpCboCWZ3SthlDpOzvouEzTnkFBo/WtbgVQ=;
	h=From:To:Cc:Subject:Date;
	b=ARr8ZSb4uJsV9c/BtPVMfKpi67DIVWRT9LkSt1454apAXUM84rLvT++tE/uBtR8dS
	 oXE6TijrP+PMvHK6PnxFknCb91E4iXYqecZiGO6CeOllG30rMawF1TkyYlPXU2me2G
	 KlEF0g60P94RUjJ0vK09NG0PvujqsTOp+X+8x/wk=
Received: from PC24010019.. ([58.240.122.156])
	by newxmesmtplogicsvrsza53-0.qq.com (NewEsmtp) with SMTP
	id 157AE45F; Wed, 05 Aug 2026 14:05:23 +0800
X-QQ-mid: xmsmtpt1785909923ty2jmr6xa
Message-ID: <tencent_5E7D6E7FB25B4CD732F08547C11F5DA24808@qq.com>
X-QQ-XMAILINFO: NQp/UN4soYLT105Eu4TQVRXyb/MTuV1aAwkKI5/+YhNpZEItaTz97Aa46qFUUg
	 /Uqi47c0DPPwTJzpQBq1/2bzGXNZx3tn+WTNp8ScbhKcV5WEIE0Z95SmL20xBi/+g1WSSoylyQvb
	 H/MB9DFBSAmfqMSkv+hOnFRHXQZ2NKtBw2kFi4Cw6Inqwcf7ldVQJ09gucQWPZstUgzc7ESAADdO
	 8RU8k1kE+kqYyud670NtGmCQX+XdKU1YRBUt+NcZMWBtmbr4t5VGpbpSmXvMI8RSBzMeZezpnzzn
	 bCvpta200iGJO15FR3hMnDvkYfWEkoA+oc2DvQqFLyoyWMNuxmAD8tTVgN3xhWVn5zSOF3yHkTqG
	 VXApQHcsKCXvn2wfoRj2GAGTyWpqdcK4HtQkkzl06Ldg1OHNc/0YrLQMt5kb9aLGG/0SifI4cBCr
	 Uygtt5FlA2CIDwnmHGCe2OM7nAVO7vTN5NIo+elpxFHAUYQ2m5X8NRiqBP2oT8RtJkePElPiaWIr
	 gfmz/V3pd21p1btDef18lZkhBiGdUPNKBoshMl+yl1wLGcvftGSLO5fqSFjnZ27OvzoANdXYd5+e
	 QmsWcKkkxbi/PO1/6FqGGx3SlcE4k+5KP1DBpbUbuzsgauxBEex81mGv1JzfGIZZGfPw/Msjc0WG
	 xFujy1+9pr2oYfvPYNet9tkm3E1iPJic2TMl049YOxscenkrSVHKBuogX9AH2DB/I0ULEmNusw9h
	 T3UeskF3BkbNHG+VmLVCWJr6/L+UNZfF0J6pI4+O2uFc+giQG59J6sFkxvFx/uC/8bTxqU58DWc7
	 t7TE2reRA4tlFSQsuHoBWVvZbox59VrHF5pTbvU9pRoUHV7oGbH74g0t/+NzKBoK7idCz8wmB/zK
	 QmDjZ+0pJFpcoYHJU6KUS4XyFL7NyA/mR9g+P4OyHRshRhy2qEjfomSVQdQ1eBwx1hOiVs55Y8Uj
	 x5kylUFduH9jPtLZLlZjDipnFnHvI1UA1/jDTZmzSaaqiJ5G/XckVd3s/JTQE5zWsrSOd+2TzqF0
	 yLG6dgbSKroxmSGiIChqLK8Fo7Wh07JrT97spFl7W+9QK5mhX3yHlmlKpWGTU=
X-QQ-XMRINFO: MSVp+SPm3vtSI1QTLgDHQqIV1w2oNKDqfg==
From: aquapinn@qq.com
To: Ryder Lee <ryder.lee@mediatek.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-pci@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: zhengping.zhang@airoha.com,
	lei.dong@airoha.com,
	hui.ma@airoha.com,
	upstream@airoha.com,
	Zhengping Zhang <aquapinn@qq.com>
Subject: [PATCH] PCI: mediatek: Find INTx controller by property
Date: Wed,  5 Aug 2026 14:05:07 +0800
X-OQ-MSGID: <20260805060508.594458-1-aquapinn@qq.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_230539_460587_1CC993A0 
X-CRM114-Status: GOOD (  10.62  )
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

From: Zhengping Zhang <aquapinn@qq.com>

All existing DTS users already name the INTx child node
"interrupt-controller". Use of_get_child_by_name() to find it instead
of assuming it is the first child node.

Signed-off-by: Zhengping Zhang <aquapinn@qq.com>
---
 drivers/pci/controller/pcie-mediatek.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pci/controller/pcie-mediatek.c b/drivers/pci/controller/pcie-mediatek.c
index 8b57c3d75b94..7b54f3dc6cf8 100644
--- a/drivers/pci/controller/pcie-mediatek.c
+++ b/drivers/pci/controller/pcie-mediatek.c
@@ -572,9 +572,9 @@ static int mtk_pcie_init_irq_domain(struct mtk_pcie_port *port,
 	int ret;
 
 	/* Setup INTx */
-	pcie_intc_node = of_get_next_child(node, NULL);
+	pcie_intc_node = of_get_child_by_name(node, "interrupt-controller");
 	if (!pcie_intc_node) {
-		dev_err(dev, "no PCIe Intc node found\n");
+		dev_err(dev, "no PCIe INTx interrupt-controller node found\n");
 		return -ENODEV;
 	}
 
-- 
2.43.0



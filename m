Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 605ABC19F32
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 07:02:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=CKYLhsZYLN6ePRb39dRUwqAfsfIuk96t/k1thexR5Ds=; b=QgjjJkA91Ll/wHCL2iNjsyjFv/
	QH+ijc9likPerfmVWc9DCPS9f3pdtBq76JZSVJbJpNcU95bh1eaL5kMro0OhQ8YTJkQzB5hFyK88A
	euGLWa2eeo+yht3EXay/5Yvsg5jWmkhp1choyhi3ZssBA07vKQvnWrsGrhW/GbbOrPXRIfVwCBCtn
	Cs25/iBVZ4Isugjsn4goouuhJkDK0fDTyOrRzY8qeHjphCQFeozKYlWZvwrno/pcpdqJfOAWYJp5a
	EGwjUTFOk91M9q50Zeuc9eWzp1uOyyJ6tPr/GwXN/qDEXhKtmrqurY+sSpS4+F1dcsKtX6RHcmRm9
	WmXRa0Kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpilx-00000007CP2-2RX0;
	Wed, 05 Mar 2025 07:02:29 +0000
Received: from unicom145.biz-email.net ([210.51.26.145])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpikL-00000007CDn-3AaC;
	Wed, 05 Mar 2025 07:00:51 +0000
Received: from jtjnmail201604.home.langchao.com
        by unicom145.biz-email.net ((D)) with ASMTP (SSL) id 202503051500254125;
        Wed, 05 Mar 2025 15:00:25 +0800
Received: from jtjnmail201607.home.langchao.com (10.100.2.7) by
 jtjnmail201604.home.langchao.com (10.100.2.4) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 5 Mar 2025 15:00:24 +0800
Received: from locahost.localdomain (10.94.3.63) by
 jtjnmail201607.home.langchao.com (10.100.2.7) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 5 Mar 2025 15:00:23 +0800
From: Charles Han <hanchunchao@inspur.com>
To: <ryder.lee@mediatek.com>, <jianjun.wang@mediatek.com>,
	<lpieralisi@kernel.org>, <kw@linux.com>, <manivannan.sadhasivam@linaro.org>,
	<robh@kernel.org>, <bhelgaas@google.com>, <matthias.bgg@gmail.com>,
	<angelogioacchino.delregno@collabora.com>
CC: <linux-pci@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	Charles Han <hanchunchao@inspur.com>
Subject: [PATCH] PCI: mediatek-gen3: fix inconsistent indenting warning
Date: Wed, 5 Mar 2025 15:00:22 +0800
Message-ID: <20250305070022.4668-1-hanchunchao@inspur.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.94.3.63]
X-ClientProxiedBy: Jtjnmail201613.home.langchao.com (10.100.2.13) To
 jtjnmail201607.home.langchao.com (10.100.2.7)
tUid: 202530515002533dc4868a0a3680aa1f21efe3607861b
X-Abuse-Reports-To: service@corp-email.com
Abuse-Reports-To: service@corp-email.com
X-Complaints-To: service@corp-email.com
X-Report-Abuse-To: service@corp-email.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_230050_072511_D7D7B6CC 
X-CRM114-Status: UNSURE (   9.50  )
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

Fix below inconsistent indenting smatch warning.
smatch warnings:
drivers/pci/controller/pcie-mediatek-gen3.c:922 mtk_pcie_parse_port() warn: inconsistent indenting

Signed-off-by: Charles Han <hanchunchao@inspur.com>
---
 drivers/pci/controller/pcie-mediatek-gen3.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c b/drivers/pci/controller/pcie-mediatek-gen3.c
index 3583e5481dc8..2d1675ba496b 100644
--- a/drivers/pci/controller/pcie-mediatek-gen3.c
+++ b/drivers/pci/controller/pcie-mediatek-gen3.c
@@ -919,13 +919,13 @@ static int mtk_pcie_parse_port(struct mtk_gen3_pcie *pcie)
 		return pcie->num_clks;
 	}
 
-       ret = of_property_read_u32(dev->of_node, "num-lanes", &num_lanes);
-       if (ret == 0) {
-	       if (num_lanes == 0 || num_lanes > 16 || (num_lanes != 1 && num_lanes % 2))
+	ret = of_property_read_u32(dev->of_node, "num-lanes", &num_lanes);
+	if (ret == 0) {
+		if (num_lanes == 0 || num_lanes > 16 || (num_lanes != 1 && num_lanes % 2))
 			dev_warn(dev, "invalid num-lanes, using controller defaults\n");
-	       else
+		else
 			pcie->num_lanes = num_lanes;
-       }
+	}
 
 	return 0;
 }
-- 
2.43.0



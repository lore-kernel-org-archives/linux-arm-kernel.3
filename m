Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02D4EC36014
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Apr 2025 09:37:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J/xeHEkCPMt0uQpCBTIzx3IUeQGct66kufD5Mgh/U+U=; b=JfujvI+7j7ItXpwDoiuyGkfeEW
	yR10P7qpz2KxjVn6PJml8rvM7XdX3MHZ0EzzC1r/d3wzqDeL7ii3s4Lu75cEFOnCzHnTdcsoxq8UM
	VLRg2k7RS50uJHwAweN39uIyTfS5JDzR7lKM10AvzaSzybwYJMZS4X6cObVM5n5bHP0QvZsz1LNfH
	okUZyQeg/gdV+i7a+m8OV4RZDXeKO9JHOLOV7mOrcI2ljTdb4XbSvtM/3t1rqQJrFP7mVYcIvSRE3
	T4MizZJVTo6aNRAgviXzEyXtygrwX0+Ushh6+XVHrv8sp8au5ui34Rll9mJD6QXr8mL7hJiyaGASJ
	Ly+wJjvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzY3T-00000002V2U-0Ium;
	Tue, 01 Apr 2025 09:37:11 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzXkY-00000002RdW-2nwp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Apr 2025 09:17:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CA09044E04;
	Tue,  1 Apr 2025 09:17:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB218C4CEF3;
	Tue,  1 Apr 2025 09:17:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743499058;
	bh=1hPsF6LzL9OEaMMQAXlo5EkJ4jLQYjnYIgkfLxP1je8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=oaGNuz7NTJx6hyndjZ4CWsw8+8TdZTvmkBjHvLWw0Ib7qWY/svdRIYeIRIJBvh2L4
	 LwMmDxudUB7Nj3jrnsiVjbcs+cB/lTrzyUEdNOGi6jk8Aw3T8XIOkNEVPYDneiPk0b
	 OdQib5VUFflGWPDjBqam2YLyG9Z1aA/SsX2qB9WWB6m17dMzIZemvidm0moxKIyFHF
	 /KbO2vBTd30GtMsCwMa6K7HjG9aHkop6rliP1obg00b9M4OT/3p6ut02vSqn6NAA1z
	 iquc8bxGgW9RHmTaLQukV7u8qXoEoQuF3E7KOQnHLIB9ZFzcQRa/dMm6sIPVUAoAZN
	 qB4Q7v9h76/CQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1tzXkW-001GqU-5w;
	Tue, 01 Apr 2025 10:17:36 +0100
From: Marc Zyngier <maz@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	asahi@lists.linux.dev
Cc: Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Janne Grunau <j@jannau.net>,
	Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Mark Kettenis <mark.kettenis@xs4all.nl>
Subject: [PATCH v3 06/13] PCI: apple: Dynamically allocate RID-to_SID bitmap
Date: Tue,  1 Apr 2025 10:17:06 +0100
Message-Id: <20250401091713.2765724-7-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250401091713.2765724-1-maz@kernel.org>
References: <20250401091713.2765724-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, asahi@lists.linux.dev, alyssa@rosenzweig.io, j@jannau.net, marcan@marcan.st, sven@svenpeter.dev, bhelgaas@google.com, lpieralisi@kernel.org, kw@linux.com, manivannan.sadhasivam@linaro.org, robh@kernel.org, krzk+dt@kernel.org, mark.kettenis@xs4all.nl
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250401_021738_730075_821C96B0 
X-CRM114-Status: GOOD (  14.01  )
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

As we move towards supporting SoCs with varying RID-to-SID mapping
capabilities, turn the static SID tracking bitmap into a dynamically
allocated one. The current allocation size is still the same, but
that's about to change.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Acked-by: Alyssa Rosenzweig <alyssa@rosenzweig.io>
Tested-by: Janne Grunau <j@jannau.net>
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 drivers/pci/controller/pcie-apple.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/controller/pcie-apple.c b/drivers/pci/controller/pcie-apple.c
index d07e488051290..6d3aa186d9c5f 100644
--- a/drivers/pci/controller/pcie-apple.c
+++ b/drivers/pci/controller/pcie-apple.c
@@ -147,7 +147,7 @@ struct apple_pcie_port {
 	void __iomem		*base;
 	struct irq_domain	*domain;
 	struct list_head	entry;
-	DECLARE_BITMAP(sid_map, MAX_RID2SID);
+	unsigned long		*sid_map;
 	int			sid_map_sz;
 	int			idx;
 };
@@ -524,6 +524,10 @@ static int apple_pcie_setup_port(struct apple_pcie *pcie,
 	if (!port)
 		return -ENOMEM;
 
+	port->sid_map = devm_bitmap_zalloc(pcie->dev, MAX_RID2SID, GFP_KERNEL);
+	if (!port->sid_map)
+		return -ENOMEM;
+
 	ret = of_property_read_u32_index(np, "reg", 0, &idx);
 	if (ret)
 		return ret;
-- 
2.39.2



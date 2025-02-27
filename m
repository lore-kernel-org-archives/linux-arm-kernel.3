Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DB0EC19F2E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 11:43:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dtE/yQzTKTSTRJnHoa013KVsjd6UVbm1wGhrzOmi5Hg=; b=0o3xaXQXlZlsLsd+d1YSQrEjCz
	4eF7BUpVC8jL4ION/OsEPH4zt4/TnRCYC0XbxPU4oUTHR/GH4ej0ziIbHhyboO97D5qXBnXoFtrt0
	SFqrSwc/UHX18x7MmFon3GesR6wI4GIFwGTXzfLFxzmV1hr7srqVk0vazymrJGZCBX5EnsmObecmX
	lyKM/fqHHoEMBu9VpmOIE9f07ApCkoYk62MgfRnzCyy+mVfgu4DCQNivb+yKO0p39T8emOReTMZeG
	JyR1U6OK2BuWnav9Vr9baNHM9kmHLC0+ziyjYOkrgn7aO1GlJprojHEx7NxhGxrPyl5BSckkJA4jR
	LV7IvS6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tncIi-00000007Dub-0NhF;
	Thu, 27 Feb 2025 11:43:36 +0000
Received: from mail-m49232.qiye.163.com ([45.254.49.232])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnbvJ-000000079Cq-1hs7;
	Thu, 27 Feb 2025 11:19:26 +0000
Received: from localhost.localdomain (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id c65f97c8;
	Thu, 27 Feb 2025 19:19:21 +0800 (GMT+08:00)
From: Kever Yang <kever.yang@rock-chips.com>
To: heiko@sntech.de
Cc: linux-rockchip@lists.infradead.org,
	Kever Yang <kever.yang@rock-chips.com>,
	Simon Xue <xxm@rock-chips.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	linux-pci@vger.kernel.org,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 01/15] dt-bindings: PCI: dwc: rockchip: Add rk3562 support
Date: Thu, 27 Feb 2025 19:18:59 +0800
Message-Id: <20250227111913.2344207-2-kever.yang@rock-chips.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250227111913.2344207-1-kever.yang@rock-chips.com>
References: <20250227111913.2344207-1-kever.yang@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGk5KT1YaShhCTBpOTEofTB5WFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
X-HM-Tid: 0a954721efb403afkunmc65f97c8
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6MFE6PCo4TzIXMw0SEkwMHkoY
	AiwwCyxVSlVKTE9LTU5OSk1JQ05LVTMWGhIXVRAeDR4JVQIaFRw7CRQYEFYYExILCFUYFBZFWVdZ
	EgtZQVlOQ1VJSVVMVUpKT1lXWQgBWUFKTktLNwY+
DKIM-Signature: a=rsa-sha256;
	b=OIGdv/ojTp7MJl1BAr7LjG4Z/nf+7P2XerwncGNwK/5TZxKKMeTLCfglQknD0FijyGmyrN4sP0577pRh8SeGDYvIYHoS1SkvkoL9VhG/QqqoZAPRmKp18OIypqITL9J3rShgCUsMJrPfkRwTvVFmKYNfiR62iGJk/lk30XwkH3c=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=dtE/yQzTKTSTRJnHoa013KVsjd6UVbm1wGhrzOmi5Hg=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_031925_656054_88B7BEE9 
X-CRM114-Status: UNSURE (   7.22  )
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

rk3562 is using the same dwc controller as rk3576.

Signed-off-by: Kever Yang <kever.yang@rock-chips.com>
---

Changes in v3:
- Rebase the change base on rk3576 pcie patches

Changes in v2: None

 .../devicetree/bindings/pci/rockchip-dw-pcie.yaml        | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/pci/rockchip-dw-pcie.yaml b/Documentation/devicetree/bindings/pci/rockchip-dw-pcie.yaml
index 4764a0173ae4..6c6d828ce964 100644
--- a/Documentation/devicetree/bindings/pci/rockchip-dw-pcie.yaml
+++ b/Documentation/devicetree/bindings/pci/rockchip-dw-pcie.yaml
@@ -22,6 +22,7 @@ properties:
       - const: rockchip,rk3568-pcie
       - items:
           - enum:
+              - rockchip,rk3562-pcie
               - rockchip,rk3576-pcie
               - rockchip,rk3588-pcie
           - const: rockchip,rk3568-pcie
@@ -76,7 +77,9 @@ allOf:
         properties:
           compatible:
             contains:
-              const: rockchip,rk3576-pcie
+              enum:
+                - rockchip,rk3562-pcie
+                - rockchip,rk3576-pcie
     then:
       required:
         - msi-map
@@ -85,7 +88,9 @@ allOf:
       properties:
         compatible:
           contains:
-            const: rockchip,rk3576-pcie
+            enum:
+              - rockchip,rk3562-pcie
+              - rockchip,rk3576-pcie
     then:
       properties:
         interrupts:
-- 
2.25.1



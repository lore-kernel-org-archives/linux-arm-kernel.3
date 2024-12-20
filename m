Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C708E77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Dec 2024 10:24:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iKsAiUjaHjXs6Wl1aegp3PErWmUFhkBymoXghyPrcIg=; b=dtL+8Pe2cf4O4IFG9D+BRcZYHl
	milhxraIFfHlNFxwyADl8KfbDJ0XjFYlD0JfkTbt5luv5mzCncJezHekIMIeDkadFeMVLoykSL11l
	SVc1COsAAcEY1Z/dtQ+CYOg1CardmhEv8qapst1bL0YwXV2vMiwvYnFUgWV7QCYXtthCk+s/KJd5c
	xrxnyzGwivpdhA2tnUAkMwgtkt328F0HkBtmvA69py8aJJQDrwdZrFtdw0KAe62ep18ZHF2QrwaQG
	ZIEKFWa0RsB/s3B3OL7h33zWooNooOcYHuX9a2A1BTGSOtZi0gCf+avOw94TU4qk1uO7OkNs32zbl
	zDimcYcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOaBA-00000004ZzO-3FWl;
	Fri, 20 Dec 2024 10:24:20 +0000
Received: from mail-m15567.qiye.163.com ([101.71.155.67])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOa3A-00000004YTE-0k6x;
	Fri, 20 Dec 2024 10:16:06 +0000
Received: from localhost.localdomain (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 655ee901;
	Fri, 20 Dec 2024 18:15:56 +0800 (GMT+08:00)
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
Subject: [PATCH v2 2/7] dt-bindings: PCI: dwc: rockchip: Add rk3576 support
Date: Fri, 20 Dec 2024 18:15:46 +0800
Message-Id: <20241220101551.3505917-3-kever.yang@rock-chips.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241220101551.3505917-1-kever.yang@rock-chips.com>
References: <20241220101551.3505917-1-kever.yang@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGhoaQlZNQ0pNSkIZT0xPGB1WFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
X-HM-Tid: 0a93e39114ed03afkunm655ee901
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Oio6Kww*IzIKUQg3Gj4UM0kR
	DTpPFC5VSlVKTEhPTUNCTE5MTE9JVTMWGhIXVRAeDR4JVQIaFRw7CRQYEFYYExILCFUYFBZFWVdZ
	EgtZQVlOQ1VJSVVMVUpKT1lXWQgBWUFKTUJCNwY+
DKIM-Signature: a=rsa-sha256;
	b=THE7JQgD3wkpGn/fIZ2+kXZ88uI5KGMUWGbMe12I0XcVFP9yXnDGsFOSRHvuSuBY6S0MYgOUPe0Fd0aO3tFl4ihtyKvM2RK9b76Ugz3/GFthyJ0MkaIjeQTBCpUzHDPRoB0MCrrd0jpncCNH0Z/x3dvC5/ZbtQ3tPZ+FG/u4XMw=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=iKsAiUjaHjXs6Wl1aegp3PErWmUFhkBymoXghyPrcIg=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_021604_658210_48C7377D 
X-CRM114-Status: UNSURE (   8.87  )
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

rk3576 is using dwc controller, but use msi interrupt instead of its,
so the msi-map is not required, and need to add a new 'msi' interrupt name.

Signed-off-by: Kever Yang <kever.yang@rock-chips.com>
---

Changes in v2:
- remove required 'msi-map'
- add interrupt name 'msi'

 .../devicetree/bindings/pci/rockchip-dw-pcie-common.yaml      | 1 +
 Documentation/devicetree/bindings/pci/rockchip-dw-pcie.yaml   | 4 +---
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/pci/rockchip-dw-pcie-common.yaml b/Documentation/devicetree/bindings/pci/rockchip-dw-pcie-common.yaml
index cc9adfc7611c..e5e1a2c7ae05 100644
--- a/Documentation/devicetree/bindings/pci/rockchip-dw-pcie-common.yaml
+++ b/Documentation/devicetree/bindings/pci/rockchip-dw-pcie-common.yaml
@@ -81,6 +81,7 @@ properties:
       - const: msg
       - const: legacy
       - const: err
+      - const: msi
       - const: dma0
       - const: dma1
       - const: dma2
diff --git a/Documentation/devicetree/bindings/pci/rockchip-dw-pcie.yaml b/Documentation/devicetree/bindings/pci/rockchip-dw-pcie.yaml
index 550d8a684af3..9a464731fa4a 100644
--- a/Documentation/devicetree/bindings/pci/rockchip-dw-pcie.yaml
+++ b/Documentation/devicetree/bindings/pci/rockchip-dw-pcie.yaml
@@ -26,6 +26,7 @@ properties:
       - const: rockchip,rk3568-pcie
       - items:
           - enum:
+              - rockchip,rk3576-pcie
               - rockchip,rk3588-pcie
           - const: rockchip,rk3568-pcie
 
@@ -71,9 +72,6 @@ properties:
 
   vpcie3v3-supply: true
 
-required:
-  - msi-map
-
 unevaluatedProperties: false
 
 examples:
-- 
2.25.1



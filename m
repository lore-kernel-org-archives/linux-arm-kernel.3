Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBDA2C02183
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jan 2025 03:29:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=nWUOXgGr1bJtNx1vYM6geNONWF/tpXFfL8Oby3eDDFE=; b=OztT2McEg1+9p2+vtLtTq6jV0F
	jpc0ft4eYyWzq47KGitM9YS7c8cxYTL3BmBQ5AcJ+7g0Wrzpwxsbs8+uze8uLQ36FtuNuOEe8pVx6
	S7Bsj5fTzY5mdIgnIZht2DmgfmgCvmV0s8jd5xGeN/xC7b23JQIIIiEtkbFg23kEEEtLqKwrMtAhY
	JOoMwp9D9JmyDOWJXKstmf7Jn0Tnfc3gFwTroRfMwntYrReNfRYd/hbbixX8Wy4tuBCwbq/0NFLQS
	gcriiuKc+LUEdRME34b3pHEjNyxJQVvyFo/rWFxBclfAW35l+tYdGIy+r1z/mM2R/+WR2eJc7fupH
	HQWcO0Lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYd2t-0000000Guyu-3tIt;
	Fri, 17 Jan 2025 03:29:19 +0000
Received: from mail-m3285.qiye.163.com ([220.197.32.85])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYd1b-0000000Gukk-0Hz7;
	Fri, 17 Jan 2025 03:28:00 +0000
Received: from localhost.localdomain (unknown [103.29.142.67])
	by smtp.qiye.163.com (Hmail) with ESMTP id 8f2239f3;
	Fri, 17 Jan 2025 11:27:45 +0800 (GMT+08:00)
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
Subject: [PATCH v5 1/2] dt-bindings: PCI: dw: rockchip: Add rk3576 support
Date: Fri, 17 Jan 2025 11:27:41 +0800
Message-Id: <20250117032742.2990779-1-kever.yang@rock-chips.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkZH0hIVkxITEpIHkoYTE5OTlYVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlKS0hVSUJVSk9JVU1MWVdZFhoPEhUdFFlBWU9LSFVKS0lPT09IVUpLS1
	VKQktLWQY+
X-HM-Tid: 0a94724d735c03afkunm8f2239f3
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Nwg6KQw5TTIcOD8jES8sCR9C
	Fy0wCk9VSlVKTEhMS0NPT01DS01IVTMWGhIXVRAeDR4JVQIaFRw7CRQYEFYYExILCFUYFBZFWVdZ
	EgtZQVlKS0hVSUJVSk9JVU1MWVdZCAFZQUhDSko3Bg++
DKIM-Signature: a=rsa-sha256;
	b=SSQIn1G6Ajd3TooJmtM6vPtgaM8iirnAcYMHDd6c5OBEL/va29VvQohMa7+Gf5Ah2nGLqaRbWLLheucTYzF9IznOpv6HYfZ+XLTB79X9ydhtb1ea6kWa+g9zy+2trw0Mgr7RO9LxDcO8X/d6NY1m802k9rH1YjN/dv14kdw0b3E=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=nWUOXgGr1bJtNx1vYM6geNONWF/tpXFfL8Oby3eDDFE=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250116_192759_612653_999BA6BA 
X-CRM114-Status: UNSURE (   9.90  )
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

rk3576 is using dwc controller, with msi interrupt directly to gic instead
of to gic its, so
- no its support is required and the 'msi-map' is not need anymore,
- a new 'msi' interrupt is needed.

Signed-off-by: Kever Yang <kever.yang@rock-chips.com>
---

Changes in v5:
- Add constraints per device for interrupt-names due to the interrupt is
different from rk3588.

Changes in v4:
- Fix wrong indentation in dt_binding_check report by Rob

Changes in v3:
- Fix dtb check broken on rk3588
- Update commit message

Changes in v2:
- remove required 'msi-map'
- add interrupt name 'msi'

 .../bindings/pci/rockchip-dw-pcie-common.yaml | 53 +++++++++++++++----
 .../bindings/pci/rockchip-dw-pcie.yaml        |  4 +-
 2 files changed, 44 insertions(+), 13 deletions(-)

diff --git a/Documentation/devicetree/bindings/pci/rockchip-dw-pcie-common.yaml b/Documentation/devicetree/bindings/pci/rockchip-dw-pcie-common.yaml
index cc9adfc7611c..eef108037184 100644
--- a/Documentation/devicetree/bindings/pci/rockchip-dw-pcie-common.yaml
+++ b/Documentation/devicetree/bindings/pci/rockchip-dw-pcie-common.yaml
@@ -40,6 +40,7 @@ properties:
 
   interrupts:
     minItems: 5
+    maxItems: 9
     items:
       - description:
           Combined system interrupt, which is used to signal the following
@@ -64,6 +65,10 @@ properties:
           interrupts - aer_rc_err, aer_rc_err_msi, rx_cpl_timeout,
           tx_cpl_timeout, cor_err_sent, nf_err_sent, f_err_sent, cor_err_rx,
           nf_err_rx, f_err_rx, radm_qoverflow
+      - description:
+          Combinded MSI line interrupt, which is to support MSI interrupts
+          output to GIC controller via GIC SPI interrupt instead of GIC its
+          interrupt.
       - description:
           eDMA write channel 0 interrupt
       - description:
@@ -75,16 +80,7 @@ properties:
 
   interrupt-names:
     minItems: 5
-    items:
-      - const: sys
-      - const: pmc
-      - const: msg
-      - const: legacy
-      - const: err
-      - const: dma0
-      - const: dma1
-      - const: dma2
-      - const: dma3
+    maxItems: 9
 
   num-lanes: true
 
@@ -123,4 +119,41 @@ required:
 
 additionalProperties: true
 
+allOf:
+  - if:
+      compatible:
+        contains:
+          enum:
+            - rockchip,rk3568-pcie
+            - rockchip,rk3588-pcie
+    then:
+      properties:
+        interrupts:
+          min-items: 5
+          max-Items: 9
+        interrupt-names:
+          items:
+            - const: sys
+            - const: pmc
+            - const: msg
+            - const: legacy
+            - const: err
+            - const: dma0
+            - const: dma1
+            - const: dma2
+            - const: dma3
+    else:
+      properties:
+        interrupts:
+          min-items: 6
+          max-Items: 6
+        interrupt-names:
+          items:
+            - const: sys
+            - const: pmc
+            - const: msg
+            - const: legacy
+            - const: err
+            - const: msi
+
 ...
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



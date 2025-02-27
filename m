Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93BA7C021BE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 11:53:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uBdOgROO7htXLJg3uHYGlDDd8v+5cdQZJyOdo4kszRw=; b=f0foyFddlYvExPU7oq0f3r8oFV
	wI4HGmplLR7H0Ej9FsEzqDnzDhsZJS/qvAorgDmPkaRcz54AqrpkdPqm12XNS8Eh53+Dcm/8uPaGm
	b5NlCCrlF3lRkgK8PPCi8vBAMMSa4ztzpVf8RbCUq6CAlBL5yEHq/P+KmGc21d+IP+8vGUVCTPq15
	LJZrlbdFMk8u/ZB65Rg6SlO3jQhNTjPt/EHSkmMAjMhp9jKIBXSwH8/WVyOIMg8tnCW81glH1Onnv
	ZLj3mUff+WYgCeLUIFjPOQG3Qu43OtmBRQNaSb5lvHwuDOY1g6pZShCobziSyP4JkAJN5ZxzRtLnl
	uI6UmcYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tncRl-00000007FSZ-3z39;
	Thu, 27 Feb 2025 11:52:57 +0000
Received: from mail-m1973174.qiye.163.com ([220.197.31.74])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnbvX-000000079GL-0w3K;
	Thu, 27 Feb 2025 11:19:40 +0000
Received: from localhost.localdomain (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id c65f97e6;
	Thu, 27 Feb 2025 19:19:34 +0800 (GMT+08:00)
From: Kever Yang <kever.yang@rock-chips.com>
To: heiko@sntech.de
Cc: linux-rockchip@lists.infradead.org,
	Kever Yang <kever.yang@rock-chips.com>,
	devicetree@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 09/15] dt-bindings: usb: dwc3: Add support for rk3562
Date: Thu, 27 Feb 2025 19:19:07 +0800
Message-Id: <20250227111913.2344207-10-kever.yang@rock-chips.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250227111913.2344207-1-kever.yang@rock-chips.com>
References: <20250227111913.2344207-1-kever.yang@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGUxMSVYZQxlMTBgdGEgYQ0hWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
X-HM-Tid: 0a95472221ca03afkunmc65f97e6
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6P006Dww6AzIKAQ0dEkIUHkg8
	PQkKChxVSlVKTE9LTU5OSkxOT0tOVTMWGhIXVRAeDR4JVQIaFRw7CRQYEFYYExILCFUYFBZFWVdZ
	EgtZQVlOQ1VJSVVMVUpKT1lXWQgBWUFJS05KNwY+
DKIM-Signature: a=rsa-sha256;
	b=e+iDDjl/x7ZbXubeWx1k4MgxsD6ndE8Nfe363mzseOFU6ybbxCcSFdet+kRoEGwGGRwG1KyXrXzNGRzlhuYNpP74UoFkxX9H4fJtFpbd4xNwwxEB+k1WjTUqkwn59t2BWG88fUmo9P1Iwy+B3CLwx8aDLlhw7ddd2c2vVH63rG4=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=uBdOgROO7htXLJg3uHYGlDDd8v+5cdQZJyOdo4kszRw=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_031939_444699_BA70A577 
X-CRM114-Status: UNSURE (   8.56  )
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

The USB dwc3 core on Rockchip's RK3562 is the same as the one already
included in generic snps,dwc3. Extend the binding accordingly to allow

	compatible = "rockchip,rk3562-dwc3", "snps,dwc3";

There are 4 clocks with different name sequency, add schema for it.

Signed-off-by: Kever Yang <kever.yang@rock-chips.com>
---

Changes in v3:
- Update commit message and add per device schema for clock name change

Changes in v2: None

 .../bindings/usb/rockchip,dwc3.yaml           | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/rockchip,dwc3.yaml b/Documentation/devicetree/bindings/usb/rockchip,dwc3.yaml
index a21cc098542d..fba2cb05ecba 100644
--- a/Documentation/devicetree/bindings/usb/rockchip,dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/rockchip,dwc3.yaml
@@ -26,6 +26,7 @@ select:
       contains:
         enum:
           - rockchip,rk3328-dwc3
+          - rockchip,rk3562-dwc3
           - rockchip,rk3568-dwc3
           - rockchip,rk3576-dwc3
           - rockchip,rk3588-dwc3
@@ -37,6 +38,7 @@ properties:
     items:
       - enum:
           - rockchip,rk3328-dwc3
+          - rockchip,rk3562-dwc3
           - rockchip,rk3568-dwc3
           - rockchip,rk3576-dwc3
           - rockchip,rk3588-dwc3
@@ -72,6 +74,7 @@ properties:
       - enum:
           - grf_clk
           - utmi
+          - pipe
       - const: pipe
 
   power-domains:
@@ -111,6 +114,22 @@ allOf:
             - const: suspend_clk
             - const: bus_clk
             - const: grf_clk
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: rockchip,rk3562-dwc3
+    then:
+      properties:
+        clocks:
+          minItems: 4
+          maxItems: 4
+        clock-names:
+          items:
+            - const: ref_clk
+            - const: suspend_clk
+            - const: bus_clk
+            - const: pipe
   - if:
       properties:
         compatible:
-- 
2.25.1



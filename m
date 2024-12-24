Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21523E77188
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Dec 2024 09:51:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zG8fo9UPdwDqsNEMp4SUheJp0t9EsDHamrlelso9VNk=; b=S4hC7DrQPEzGtqBZM7hMUYCoFm
	LC6xId5RQ2mOxIgXm8PHEfF+1vM7lDpmIcjmwyIkmAffui2udVKfL1p6gAa/o1KkYv8Kxpot+bHwp
	AcGeO8GHbUqpKJUc6nBz/CNsJ2f2ld4NZKbwAO+kQDwGS2uiUzBYMEpSgPBlN5eOov7ql0jyAIX8E
	klHX8Sc9egesC0PxEaEt3HJW4D5Umt0EjkEoEC0Sbs8QCg7NitIHemuMvgeQte8NLMhlJ/ec1PMBW
	/bL2+aigCXJXbUsaxiImf/EaSQzlIM5uJhDOsBVEVe+jMV8X3K250vBHQIwvua5ip7ojbN4sdzd7h
	c6JYSuww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQ1ZC-0000000BeLP-0mCq;
	Tue, 24 Dec 2024 09:51:06 +0000
Received: from mail-m32104.qiye.163.com ([220.197.32.104])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQ1QL-0000000Bcg3-3LkZ;
	Tue, 24 Dec 2024 09:41:59 +0000
Received: from localhost.localdomain (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 6aaa2c18;
	Tue, 24 Dec 2024 17:41:54 +0800 (GMT+08:00)
From: Kever Yang <kever.yang@rock-chips.com>
To: heiko@sntech.de
Cc: linux-rockchip@lists.infradead.org,
	Kever Yang <kever.yang@rock-chips.com>,
	devicetree@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 1/3] dt-bindings: nvmem: rockchip,otp: Add support for rk3562 and rk3568
Date: Tue, 24 Dec 2024 17:41:51 +0800
Message-Id: <20241224094153.3816923-1-kever.yang@rock-chips.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQh1NGFYZGR5ITUxPShhNTh5WFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
X-HM-Tid: 0a93f80b5c4e03afkunm6aaa2c18
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6MC46Hjo*EjIXNkpCSzc#NxJR
	GC9PChFVSlVKTEhOS0hISEpOT09DVTMWGhIXVRAeDR4JVQIaFRw7CRQYEFYYExILCFUYFBZFWVdZ
	EgtZQVlOQ1VJSVVMVUpKT1lXWQgBWUFJT0hDNwY+
DKIM-Signature: a=rsa-sha256;
	b=W8FB6mNLCpLEXDtXU1qOQgAjV3G9Vyzg1AeJi3ICUpFL3Bv8BP6igQpD2XO/RPzNclOxdV5ysHUlzOlwZa0cyJzWXRZfkSfbWy/P/Jw7RZu1OfLSIViOi+uVFooO1dTyTmwbJKzQCMsWtNY4DP1Z8YuFDw3PS33Ky/slY4FlP4E=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=zG8fo9UPdwDqsNEMp4SUheJp0t9EsDHamrlelso9VNk=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241224_014158_011892_4BAAC7F9 
X-CRM114-Status: UNSURE (   5.95  )
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

rk3562 and rk3568 has similar clocks which different than other SoCs.

Signed-off-by: Kever Yang <kever.yang@rock-chips.com>
---

 .../bindings/nvmem/rockchip,otp.yaml          | 49 ++++++++++++++++---
 1 file changed, 42 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/nvmem/rockchip,otp.yaml b/Documentation/devicetree/bindings/nvmem/rockchip,otp.yaml
index a44d44b32809..33d2905f6c16 100644
--- a/Documentation/devicetree/bindings/nvmem/rockchip,otp.yaml
+++ b/Documentation/devicetree/bindings/nvmem/rockchip,otp.yaml
@@ -14,6 +14,8 @@ properties:
     enum:
       - rockchip,px30-otp
       - rockchip,rk3308-otp
+      - rockchip,rk3562-otp
+      - rockchip,rk3568-otp
       - rockchip,rk3588-otp
 
   reg:
@@ -25,19 +27,15 @@ properties:
 
   clock-names:
     minItems: 3
-    items:
-      - const: otp
-      - const: apb_pclk
-      - const: phy
-      - const: arb
+    maxItems: 4
 
   resets:
     minItems: 1
-    maxItems: 3
+    maxItems: 4
 
   reset-names:
     minItems: 1
-    maxItems: 3
+    maxItems: 4
 
 required:
   - compatible
@@ -62,12 +60,43 @@ allOf:
       properties:
         clocks:
           maxItems: 3
+        clock-names:
+          items:
+            - const: otp
+            - const: apb_pclk
+            - const: phy
         resets:
           maxItems: 1
         reset-names:
           items:
             - const: phy
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - rockchip,rk3562-otp
+              - rockchip,rk3568-otp
+    then:
+      properties:
+        clocks:
+          minItems: 4
+        clock-names:
+          items:
+            - const: usr
+            - const: sbpi
+            - const: apb_pclk
+            - const: phy
+        resets:
+          minItems: 4
+        reset-names:
+          items:
+            - const: usr
+            - const: sbpi
+            - const: apb
+            - const: phy
+
   - if:
       properties:
         compatible:
@@ -78,6 +107,12 @@ allOf:
       properties:
         clocks:
           minItems: 4
+        clock-names:
+          items:
+            - const: otp
+            - const: apb_pclk
+            - const: phy
+            - const: arb
         resets:
           minItems: 3
         reset-names:
-- 
2.25.1



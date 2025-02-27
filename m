Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0151BC021BE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 11:34:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xV+WNQl8ROCA2e9xUBpBg/FLDkWJ/IRVuqOd98DcSZE=; b=BOWzIhHCbdg4yUE+XHz+HBcc72
	vUwdVRKzYeuV9e0BxyGvzam4H/6vYIc8q23ROPiQO6Lmk9cgIdgEWCOL/lSP7khMJpNqK7KRCID5t
	11DaKGyT9E5E2sg3tgOo9+so2V/i3a0WnS7upx1eX+mgo/NZopNCtET8IsTQoSE9u0DiVNcKaZe1R
	ZIyAwDqAk7LJ7MGq4UBJ6tXjNUoaB7ZvHdzbW7DHHcX5jm2QaFLmqvnTqkfGf39/pSIxD/ySfnga2
	W1VvRtE07CTQ5dbO82FRTVg9ItnOahErh4sAvs5wbUDTuAPzqhhXUXxSlkM6GUXH+p7hmzYcCarVh
	Lq5lR6MQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnc9h-00000007CoJ-1qcS;
	Thu, 27 Feb 2025 11:34:17 +0000
Received: from mail-m49204.qiye.163.com ([45.254.49.204])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnbjG-0000000764z-2jC7;
	Thu, 27 Feb 2025 11:06:59 +0000
Received: from localhost.localdomain (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id c65b3753;
	Thu, 27 Feb 2025 19:06:54 +0800 (GMT+08:00)
From: Kever Yang <kever.yang@rock-chips.com>
To: heiko@sntech.de
Cc: linux-rockchip@lists.infradead.org,
	Kever Yang <kever.yang@rock-chips.com>,
	Jose Abreu <joabreu@synopsys.com>,
	devicetree@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Rob Herring <robh@kernel.org>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	David Wu <david.wu@rock-chips.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Eric Dumazet <edumazet@google.com>,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 1/3] dt-bindings: net: Add support for rk3562 dwmac
Date: Thu, 27 Feb 2025 19:06:50 +0800
Message-Id: <20250227110652.2342729-1-kever.yang@rock-chips.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGUMdTFYaGB0fTkgYQkwYTB5WFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
X-HM-Tid: 0a9547168b4f03afkunmc65b3753
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6NBA6CQw6LTINIw0LKBISDCwI
	GkMwFDNVSlVKTE9LTU5PT0pNSUxMVTMWGhIXVRAeDR4JVQIaFRw7CRQYEFYYExILCFUYFBZFWVdZ
	EgtZQVlOQ1VJSVVMVUpKT1lXWQgBWUFJTUpNNwY+
DKIM-Signature: a=rsa-sha256;
	b=j9uRAdCLAZBHyRBM1IUi9c3b2iIQOdTnuvJYVQRSibTDS2vPxDZgM9Kh5jNR7JJhEOVr6gv0fcG8RyEpo1XI1DybHcqnXSDVGdsAQod763cpywfJrLJvxipXeODZZVgniCX3amL7w9YMfU01llaOFXSsf4SwYRnFxIFkO7z45Ow=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=xV+WNQl8ROCA2e9xUBpBg/FLDkWJ/IRVuqOd98DcSZE=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_030658_863869_C806C023 
X-CRM114-Status: UNSURE (   8.95  )
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

Add a rockchip,rk3562-gmac compatible for supporting the 2 gmac
devices on the rk3562.
rk3562 only has 4 clocks availabl for gmac module.

Signed-off-by: Kever Yang <kever.yang@rock-chips.com>
---

Changes in v2:
- Fix schema entry and add clocks minItem change

 .../bindings/net/rockchip-dwmac.yaml          | 23 +++++++++++++++----
 .../devicetree/bindings/net/snps,dwmac.yaml   |  1 +
 2 files changed, 20 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/rockchip-dwmac.yaml b/Documentation/devicetree/bindings/net/rockchip-dwmac.yaml
index f8a576611d6c..81ddad924e35 100644
--- a/Documentation/devicetree/bindings/net/rockchip-dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/rockchip-dwmac.yaml
@@ -24,6 +24,7 @@ select:
           - rockchip,rk3366-gmac
           - rockchip,rk3368-gmac
           - rockchip,rk3399-gmac
+          - rockchip,rk3562-gmac
           - rockchip,rk3568-gmac
           - rockchip,rk3576-gmac
           - rockchip,rk3588-gmac
@@ -32,9 +33,6 @@ select:
   required:
     - compatible
 
-allOf:
-  - $ref: snps,dwmac.yaml#
-
 properties:
   compatible:
     oneOf:
@@ -52,6 +50,7 @@ properties:
               - rockchip,rv1108-gmac
       - items:
           - enum:
+              - rockchip,rk3562-gmac
               - rockchip,rk3568-gmac
               - rockchip,rk3576-gmac
               - rockchip,rk3588-gmac
@@ -59,7 +58,7 @@ properties:
           - const: snps,dwmac-4.20a
 
   clocks:
-    minItems: 5
+    minItems: 4
     maxItems: 8
 
   clock-names:
@@ -117,6 +116,22 @@ required:
 
 unevaluatedProperties: false
 
+allOf:
+  - $ref: snps,dwmac.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: rockchip,rk3562-gmac
+    then:
+      properties:
+        clocks:
+          minItems: 4
+    else:
+      properties:
+        clocks:
+          minItems: 5
+
 examples:
   - |
     #include <dt-bindings/interrupt-controller/arm-gic.h>
diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
index 91e75eb3f329..97d42ab8d374 100644
--- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
@@ -82,6 +82,7 @@ properties:
         - rockchip,rk3328-gmac
         - rockchip,rk3366-gmac
         - rockchip,rk3368-gmac
+        - rockchip,rk3562-gmac
         - rockchip,rk3576-gmac
         - rockchip,rk3588-gmac
         - rockchip,rk3399-gmac
-- 
2.25.1



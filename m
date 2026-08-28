Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7F10C61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Aug 2026 15:57:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vJSjjDjQ0wdkS0l0mGl82POQsgBcPy5v+GQQmLa8oqg=; b=yfHbqJ3VIJ7ahqQYh0KG7Pbout
	RTuE5+Kn+0HGHCrH9S3BGx+A1idTNnFoAr3s4PQnTD7n97FOMHGq/rEbBP34i2nszawpva5h4VNCp
	o0T2Nn4RgXLmBE62mJxhVxL0fGfbgQXPDRmZVW5mTXrTuoEIrX93z0OIgARpmJ2wZAgLovht4Nb8t
	UOISrsMjymrhMGWuQMxh8j3FNfA6tmJUgijwtf0Pdk/Q1+8FW/Yh0vlc2AbxDFbWAfptVixCFcuf+
	YIg7Asf/ywGCGEQiUZZPYLk+Yfp0rfBg8n3nHel0Y7x0rmKIUFVCRU9jGZE9Gh9OlEAZdHSsP8J9f
	9D/sAx2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzyxC-000000069MX-1UPd;
	Fri, 28 Aug 2026 15:57:19 +0000
Received: from mx.nabladev.com ([2a00:f820:417:0:178:251:229:89])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzyx6-000000069KE-3YFM
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Aug 2026 15:57:14 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9415F11D132;
	Fri, 28 Aug 2026 17:57:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1787932627; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=vJSjjDjQ0wdkS0l0mGl82POQsgBcPy5v+GQQmLa8oqg=;
	b=DCg7lc9lKXInxZqr5+32Ia5ZMs7JQFpxqe7l1OX7Rl/V6CwK6iSXbE1FvmiL5ig9k22IPa
	lEa9Tb3yiOP/tldPbhJhTpahxzS9GRPaTh5YNV7+wgTzQGXGyROiB6VtfIFaey0i9kHwn5
	xe7R+fvB7C3CKrxFnUo3HFRWDcMAfCfFd0YLpMBgafICsA4GC1Oy7FT2aPa9IEGCMZiwkU
	2XeDGIKpR99GOF9FmZpvMqxMBB3cJ3sYHkY5IxJIaTdLw3/e9s8YVGekzb+RZsJ3TmkF7u
	+/TMdXY2vTF8K8314uot2bWkUXKZR/iKOMzljFqthDnihfKKNMIzE2cljvBrZQ==
From: Marek Vasut <marex@nabladev.com>
To: linux-usb@vger.kernel.org
Cc: fabrice.gasnier@foss.st.com,
	Marek Vasut <marex@nabladev.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH v4 2/4] dt-bindings: usb: generic-ehci: Document ST STM32MP2 SoC compatibles
Date: Fri, 28 Aug 2026 17:55:46 +0200
Message-ID: <20260828155647.353877-3-marex@nabladev.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260828155647.353877-1-marex@nabladev.com>
References: <20260828155647.353877-1-marex@nabladev.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260828_085713_035261_3FB13FD6 
X-CRM114-Status: UNSURE (   8.52  )
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

Document SoC compatibles for ST STM32MP23xx and STM32MP25xx series of
SoC, so they can be used as more accurate compatible in SoC DTSI. The
SoC uses access controllers, therefore document access-controllers DT
property. For details, see access-controllers/access-controllers.yaml.

Signed-off-by: Marek Vasut <marex@nabladev.com>
---
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-usb@vger.kernel.org
---
V4: New patch
---
 .../devicetree/bindings/usb/generic-ehci.yaml | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/generic-ehci.yaml b/Documentation/devicetree/bindings/usb/generic-ehci.yaml
index 5d9dfea8e2160..49149b9d067af 100644
--- a/Documentation/devicetree/bindings/usb/generic-ehci.yaml
+++ b/Documentation/devicetree/bindings/usb/generic-ehci.yaml
@@ -57,6 +57,8 @@ properties:
               - socionext,uniphier-ehci
               - st,stm32mp13-ehci
               - st,stm32mp15-ehci
+              - st,stm32mp23-ehci
+              - st,stm32mp25-ehci
           - const: generic-ehci
       - items:
           - enum:
@@ -82,6 +84,9 @@ properties:
     minItems: 1
     maxItems: 2
 
+  access-controllers:
+    maxItems: 1
+
   dma-coherent: true
 
   interrupts:
@@ -195,6 +200,22 @@ allOf:
     else:
       properties:
         clock-names: false
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - st,stm32mp23-ehci
+              - st,stm32mp25-ehci
+    then:
+      properties:
+        clocs:
+          minItems: 2
+          maxItems: 2
+
+      required:
+        - access-controllers
+        - clocks
 
 unevaluatedProperties: false
 
-- 
2.53.0



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF7ADC61DCB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Aug 2026 15:57:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vBG7jRv/I+mblA7u8PFmX/FP7QUNIzlEbJnE5pTv4Qg=; b=FPD2nPXtl8/o0+PLqMkdnadYAk
	pO6qF0LAJ2PfkgPh+WAKc7fYnUmWar6RtFhu57sAlGgWoTqZRe5QMpiK4mC/O2+6FHJHcmVQmq6RM
	xPHMu1LlsnTB5IqufaltorsSAbyJp4GKX1946guQnEOChTcZmZI24x4Dp+QAUOG3Fkz6w8e7B3DvK
	eXDD3A8vZ+QW66mzJuzh+MR4ktmkWyJvHvOiSJZV+q4HNyD9iYwZiP2hE3G+OjEFiHq56+IQ5qH4O
	vtE7Eh+Pqlskipdeamn51y2LdQBgQnqAPVFoi9UaUzxyaoSKavIYC9audY+5iLyUYWO/wPvHn1bdm
	zyRKtryQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzyx6-000000069KQ-0hSt;
	Fri, 28 Aug 2026 15:57:12 +0000
Received: from mx.nabladev.com ([178.251.229.89])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzyx2-000000069JE-1DLO
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Aug 2026 15:57:09 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9FBBD11D0E8;
	Fri, 28 Aug 2026 17:57:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1787932622; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=vBG7jRv/I+mblA7u8PFmX/FP7QUNIzlEbJnE5pTv4Qg=;
	b=hWVvfJA5ae8H3Lf6Rtf52kWK9+0Vwtsyp3HL6Jjp+MLVdVN7WKzEUpP7WcK78WVKk+Gold
	CWQoX6Z9z1NdIc9jVTwSUuHkmSBE1Gz/cWU03DexUfB2yuBByeXkChD/xF92PvyW0FdqZ7
	cBcSNLhavVVhrqIFaaSn83ejiQ+kTPNN8MmDUeIQfYPc+b7bDg8cPCYXkV0Ngzk62sYI/M
	13V0nfIaC3/O02ax/tiChf1wnuO0lzJrMwQgZlCgGopyGR0rlpk8KRCki2dgCxly9iFUgB
	MzAnsk4H/QoJ3XMtMCVlDGJDpzXLTUu5tAyDJq2JEnVzajydC4cfFQvJydgaUA==
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
Subject: [PATCH v4 1/4] dt-bindings: usb: generic-ohci: Document ST STM32MP2 SoC compatibles
Date: Fri, 28 Aug 2026 17:55:45 +0200
Message-ID: <20260828155647.353877-2-marex@nabladev.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260828155647.353877-1-marex@nabladev.com>
References: <20260828155647.353877-1-marex@nabladev.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260828_085708_480331_E31C106D 
X-CRM114-Status: UNSURE (   8.54  )
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
 .../devicetree/bindings/usb/generic-ohci.yaml | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/generic-ohci.yaml b/Documentation/devicetree/bindings/usb/generic-ohci.yaml
index 474a84aa32d0f..71537d268b075 100644
--- a/Documentation/devicetree/bindings/usb/generic-ohci.yaml
+++ b/Documentation/devicetree/bindings/usb/generic-ohci.yaml
@@ -51,6 +51,8 @@ properties:
               - snps,hsdk-v1.0-ohci
               - st,stm32mp13-ohci
               - st,stm32mp15-ohci
+              - st,stm32mp23-ohci
+              - st,stm32mp25-ohci
           - const: generic-ohci
       - enum:
           - generic-ohci
@@ -67,6 +69,9 @@ properties:
   reg:
     maxItems: 1
 
+  access-controllers:
+    maxItems: 1
+
   dma-coherent: true
 
   interrupts:
@@ -215,6 +220,22 @@ allOf:
         clocks:
           minItems: 1
           maxItems: 3
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - st,stm32mp23-ohci
+              - st,stm32mp25-ohci
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



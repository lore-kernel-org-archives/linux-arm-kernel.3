Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65FBBC61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Aug 2026 23:18:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EJFmrBKMnXrWypnFCS1VTSSpdz94ljm2XVTUsWwwI2M=; b=rnVbiYhf+UbTa3WP1+1dYyDKKJ
	JMxn5P0FU8D+d7Lakp76jLtA1WVQGoECYg8WhWzu8jD8K7z/l0mUsEDk+X2565W7nFpa1pJSsUm26
	qwvnOmPivXPJClTINHyBD99RPwk0SNQZlrp6fO8TUlQK+bPq6kNXB/hGVfHiHWXFZCCQatUEecdRQ
	rgs1ADukwTUwcOgLZSJu73UgSlAokqb5k9oicF2fHFa9+eGyJcs3S6yWSOVaYYfDtTV6uNHcThC/1
	8bzxsAiZRtis375SK/lwMiZf8m83rm4aZAu9MnVE0Ya6yM4c5TJTXfO4UKDauM+savyFNHjz2uu7N
	zK9ixl0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1BGt-0000000AdnH-0Osg;
	Mon, 31 Aug 2026 23:18:35 +0000
Received: from mx.nabladev.com ([2a00:f820:417:0:178:251:229:89])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1BGo-0000000Adlr-0Qx3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Aug 2026 23:18:31 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C5B6611CDE1;
	Tue, 01 Sep 2026 01:18:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1788218304; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=EJFmrBKMnXrWypnFCS1VTSSpdz94ljm2XVTUsWwwI2M=;
	b=MQcMKOwkxf8IQ9XCLQ1GTfRo6ykFSbNr8629GxG/fPlKGQYszgNqr/DJdESF6GgRTf1Sac
	7Qa6fuCcR4De+sRVVL8HJmpKabN0OJ/4HXWFG0fSXdouQPflN7A2Wsgu2l2gl4m/qWqLyM
	J7+aU/fK2qnXrKoWOCQwVrd7T/kAd1Dy96vLfctKk0eu8ya4rpS3Yi72R6sP8KlGbhZpBr
	1CON8cwEAHP/y53H/lmLl4FJDaN3Qaw6XRwBNY4YiKMmJOVoMKTENmNvfuUIqSEVYF+P/1
	4Wvd8hYdq7ljrfB5apRXYDF5V1uEoJhBA0GgBvUSLHks9dvDPxZQYPbX0DLrXw==
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
Subject: [PATCH v5 1/4] dt-bindings: usb: generic-ohci: Document ST STM32MP2 SoC compatibles
Date: Tue,  1 Sep 2026 01:17:32 +0200
Message-ID: <20260831231814.137120-2-marex@nabladev.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260831231814.137120-1-marex@nabladev.com>
References: <20260831231814.137120-1-marex@nabladev.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_161830_283186_44991CA5 
X-CRM114-Status: UNSURE (   9.49  )
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
V5: - Fix typo, clocs -> clocks
    - List clocks entries as list of description:
---
 .../devicetree/bindings/usb/generic-ohci.yaml | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/generic-ohci.yaml b/Documentation/devicetree/bindings/usb/generic-ohci.yaml
index 474a84aa32d0f..7a8c3c2318153 100644
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
@@ -215,6 +220,23 @@ allOf:
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
+        clocks:
+          items:
+            - description: PHY clock
+            - description: Bus clock
+
+      required:
+        - access-controllers
+        - clocks
 
 unevaluatedProperties: false
 
-- 
2.53.0



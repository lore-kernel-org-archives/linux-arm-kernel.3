Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44E90C61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Aug 2026 23:18:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0qi6QZxFM1X4x0ZGUk8xdwpwovEki0Xze7p5nR3tV2c=; b=tybQihUgUK63n+7E8paNBAxOvA
	Je6jSiZEQJ7VCr36hioHD6+2jz939fGrelMRZpKeRXtvo6wY6/a9iWMZSoTvnRNSjkZvGaXQWjnfF
	GsLnynZrFRxgW9DQGp1DqvnhdqHlLU/VfB2a9twbYk7u/S69vDw1fFOldTDi3R0m97LfkNwwe6tVh
	S3EpLPA/SmFI1FOk92q1m9LD2xDA+MzCuNK0MomLUGaZIt/j/IXEdywmxyEwcFNHy6YQUmIoB6p0r
	VlSJOVa75tzB6xgo8uf0VcgasW/QjevAGY35eso+Dxz0itWv94nRPKl3i4nupygMvti3vHgOilwa3
	7XLGz8fQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1BGz-0000000AdpA-0m5F;
	Mon, 31 Aug 2026 23:18:41 +0000
Received: from mx.nabladev.com ([2a00:f820:417:0:178:251:229:89])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1BGt-0000000Adn9-00t2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Aug 2026 23:18:36 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B8A6D11C9D0;
	Tue, 01 Sep 2026 01:18:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1788218309; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=0qi6QZxFM1X4x0ZGUk8xdwpwovEki0Xze7p5nR3tV2c=;
	b=ZseUJG03AIc/PRV55ue4uOSpJrc0YH9T4xHez/zSQsJK2n6+suqI1M/EthXJ26MTsjtBpR
	RRgyK7RdA7ESygi92Px2Pde1Yn8RHj4Kqg1URmcLdnxyMhTz1LS7uEOssK1mXgdDAjijeq
	AVqi+yCbD6AweMlhZXsR7kf4TtXtUWJV+q5QYU6oDBafSeMMwu7HGiZHoow2BZuXuZfAO0
	B8cJOHX7FOgmAgYMLVmGG6hSEAQzo5AJQXqOEvSvL/Mw/KB6M8CQRVlIMfnNzpUxYLX/mb
	zSkdPxDAxExRpH+6hw/WIOTYLEklkWKk6mCJ50CBnJJmb6sDXKEnj4fQnEy37A==
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
Subject: [PATCH v5 2/4] dt-bindings: usb: generic-ehci: Document ST STM32MP2 SoC compatibles
Date: Tue,  1 Sep 2026 01:17:33 +0200
Message-ID: <20260831231814.137120-3-marex@nabladev.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260831231814.137120-1-marex@nabladev.com>
References: <20260831231814.137120-1-marex@nabladev.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_161835_189907_DA83B35C 
X-CRM114-Status: UNSURE (   9.45  )
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
 .../devicetree/bindings/usb/generic-ehci.yaml | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/generic-ehci.yaml b/Documentation/devicetree/bindings/usb/generic-ehci.yaml
index 5d9dfea8e2160..908b02d9175e0 100644
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
@@ -195,6 +200,23 @@ allOf:
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



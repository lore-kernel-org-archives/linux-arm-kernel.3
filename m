Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E995C9831E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 14:17:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XeqnfkBwbS9FJAo4v2yybtoxBaLCPa8f5A+nUsmDogk=; b=fE+j0D3yX71KqjUYZTm++8BZKS
	szUd91e8x+ZMAopAQCJHujeRkqQN6e+78i4ZRIbPNqPq71xFccCNdJcDwQk6ZHKLZta4ULQOJOFXt
	miO8vMrF8d4ZOUpo2/az7WvnTA3Zyuo/20Qh4TZh2FURiMl96OXlFYGye7rpY/Htba+w9zhqgjdtK
	QoQzw6vqpJVeUN7ItCMeVXGQVyrCXskWe29yIVYSMLOYj/S108f4fiFO4XRNiVLmexLENl2/h2AQJ
	tF6X28mUfzSRTpAgMyc/bvCB5Ha5HhpUM/AS98NYGAIgrGQxTqt3zqeGfA2Otv8fy4RASKNlfYKfO
	HPZb4TPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9kGW-0000000BEUY-46w2;
	Thu, 24 Sep 2026 14:17:36 +0000
Received: from mail.cyberchaos.dev ([2a0f:4ac0::3a11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9kGJ-0000000BENu-1eT8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 14:17:24 +0000
From: Yureka Lilian <yureka@cyberchaos.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cyberchaos.dev;
	s=mail; t=1790259441;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XeqnfkBwbS9FJAo4v2yybtoxBaLCPa8f5A+nUsmDogk=;
	b=EDwEaAJhLONtR9yBUMnZ304yVtgfHiqtcAXyZQ86vzWCaBALdrkjXBfXSBVL3bb9UJ+m1/
	KfmiMRShNbuLypH+Yrbx0R1M2Squ2UDN/HFAUlZOCZswladN/nN6BzOZtiXsXKrk9Fd+ya
	OKUaiY9TowAy3/pjw+WHkcq/Zgt4V5w=
Date: Thu, 24 Sep 2026 16:17:10 +0200
Subject: [PATCH v3 6/7] dt-bindings: arm: apple: Add A18 Pro based devices
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-apple-a18-pro-initial-devicetrees-v3-6-94f7ea52cc64@cyberchaos.dev>
References: <20260924-apple-a18-pro-initial-devicetrees-v3-0-94f7ea52cc64@cyberchaos.dev>
In-Reply-To: <20260924-apple-a18-pro-initial-devicetrees-v3-0-94f7ea52cc64@cyberchaos.dev>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Sven Peter <sven@kernel.org>, 
 Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, 
 Hector Martin <marcan@marcan.st>, Thomas Gleixner <tglx@kernel.org>, 
 Radu Rendec <radu@rendec.net>, Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-watchdog@vger.kernel.org, Yureka Lilian <yureka@cyberchaos.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_071723_706803_6BE45BD0 
X-CRM114-Status: UNSURE (   8.69  )
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

The MacBook Neo is the first MacBook to use an A-Series Apple Silicon
SoC. The MacBook Neo is overall similar to the M4 series devices.

The iPhone 16 Pro is based on the same SoC, but Apple does not allow
users running a custom OS on this device.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Yureka Lilian <yureka@cyberchaos.dev>
---
 Documentation/devicetree/bindings/arm/apple.yaml | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/apple.yaml b/Documentation/devicetree/bindings/arm/apple.yaml
index 5d87a4fef193..7c3e7131a5e7 100644
--- a/Documentation/devicetree/bindings/arm/apple.yaml
+++ b/Documentation/devicetree/bindings/arm/apple.yaml
@@ -82,6 +82,10 @@ description: |
   - iPhone 8 Plus
   - iPhone X
 
+  Devices based on the "A18 Pro" SoC:
+
+  - MacBook Neo (A18 Pro, 2026)
+
   Devices based on the "M1" SoC:
 
   - Mac mini (M1, 2020)
@@ -300,6 +304,13 @@ properties:
           - const: apple,t8015
           - const: apple,arm-platform
 
+      - description: Apple A18 Pro SoC based platforms
+        items:
+          - enum:
+              - apple,j700  # MacBook Neo (A18 Pro, 2026)
+          - const: apple,t8140
+          - const: apple,arm-platform
+
       - description: Apple M1 SoC based platforms
         items:
           - enum:

-- 
2.55.0



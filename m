Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9898EE4990
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Dec 2025 18:41:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=sKAWQtiI6fcKK1CPnFf9r2mhvQELHnMUqqWwuv8iWHw=; b=HALoVK4hQZAcxHYievhy6EfCXo
	y47s43eGxbtLK1OiyqBFrz0VPKBpGveW5ENo56l9dJZg+9pP0PdCB6xD1gn4tv44HkmF35qxJyvq8
	SLJf2tqSuzo4h1lqSVyss5vuXvyxU8svE8NMftR4uuRS6ahZbuU7vn5Ms6JJOMow6rWxRvDYZC7A+
	38Grn6YIEYXOpxnYOTXuss9xcutNnyRwUz19NOHhMJRCE6Z7+pNn9opGzSjD06vxOS4p+VaFKZ0xb
	Sw33xTmEfrz2MkmfI10D+B2fpLKBSKL5dV0UVomHTpV87/DVLYuFeFYVRN4TG3EeNTlZOCL1JtDnd
	xiphSZeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaefC-00000005Bcy-21xT;
	Tue, 30 Dec 2025 18:41:46 +0000
Received: from mx.nabladev.com ([2a00:f820:417:0:178:251:229:89])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaefA-00000005Bc2-0kbU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Dec 2025 18:41:45 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2AD1310CE0D;
	Tue, 30 Dec 2025 19:41:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1767120100; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=sKAWQtiI6fcKK1CPnFf9r2mhvQELHnMUqqWwuv8iWHw=;
	b=EQYva5jpfJaE03ZI3iRv26/FbNQkkRh1c1HF3VtffnmS50TfqNst9ksOhUW34tCcs6s8C8
	/sh9NNIG1Q9+rhi+ZkYU30HlUawDwB7fkoQkBi4bCTaRfDNgoNYlBB/7exMO3EYI+GhQcv
	UsveXMrOVpr62cqg3vJsuA86JuzuEk9ca1CitjCfkJbJ6NyMKzTLQrYVeFIEpzLD+uD3E2
	hOOO7Of2iBbL9M8+uY+CnZGlUr8oVqPJM8ihvDZhJw5cWg8mlzKEz+x4usb8X/E9bWu1qM
	pHqS1KAFTDlHhSlHyNEYwG1tyWL/B2WZu24Q2W5eR3ZlX/hvKcXHkXVhopYOhg==
From: Marek Vasut <marex@nabladev.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marex@nabladev.com>,
	"Rob Herring (Arm)" <robh@kernel.org>,
	Christian Eggers <ceggers@arri.de>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Markus Heidelberg <m.heidelberg@cab.de>,
	Shawn Guo <shawnguo@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/4] dt-bindings: vendor-prefixes: Document ifm electronic gmbh
Date: Tue, 30 Dec 2025 19:40:58 +0100
Message-ID: <20251230184121.52635-1-marex@nabladev.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251230_104144_467683_3F8D185C 
X-CRM114-Status: UNSURE (   8.85  )
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

ifm is a manufacturer of industrial sensors, control technology and
automation solutions. Document their vendor prefix, which is already
used for ifm,ac14xx and other powerpc devices.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Marek Vasut <marex@nabladev.com>
---
Cc: Christian Eggers <ceggers@arri.de>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Markus Heidelberg <m.heidelberg@cab.de>
Cc: Rob Herring <robh@kernel.org>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: imx@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
---
V2: Add AB from Rob
V3: No change
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index b7c6c528e0185..70d99ac01aa34 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -755,6 +755,8 @@ patternProperties:
     description: IEI Integration Corp.
   "^ifi,.*":
     description: Ingenieurburo Fur Ic-Technologie (I/F/I)
+  "^ifm,.*":
+    description: ifm electronic gmbh
   "^ilitek,.*":
     description: ILI Technology Corporation (ILITEK)
   "^imagis,.*":
-- 
2.51.0



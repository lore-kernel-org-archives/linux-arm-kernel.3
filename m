Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3929BEE4992
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Dec 2025 18:41:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fdohV05PWrCvEVOmrgoFb/WVa7Mf6GVZF7Ugyjl2xAk=; b=Kckqo1c5lKz3fuKbUuMeWI3tsv
	dWGFsMAO2xH15RIWyy+/CZ5d9C+KgSe43LMdVXiV5KNO9qJWEk/RApn9SjKNOfIBLp2fF8iFo9WDF
	YL0jf0z+Jf3VX+uYRb4vLz8gzhJZGU8t33haxj0aOvw/MhSOKgrqmtxeUEM/r1y/apA4JqYkciTpL
	+h9XhhiKqVmLk5uWGnBo7uRmYEK2RiyPGrIIT7U1GcNXccCCvIHEFAl349fcdYrgXK50ehuL1W7S8
	V4MMygSjbCPi+aZOEUOWrF/96cYHzevaHJJ9wWe3vphqZsQw0gdcOREFKl1nG729DNhmWnSZqW4R9
	qQZ4hypQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaefG-00000005Be3-3inZ;
	Tue, 30 Dec 2025 18:41:50 +0000
Received: from mx.nabladev.com ([2a00:f820:417:0:178:251:229:89])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaefA-00000005Bc3-0kJx
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Dec 2025 18:41:45 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B414510CE65;
	Tue, 30 Dec 2025 19:41:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1767120102; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=fdohV05PWrCvEVOmrgoFb/WVa7Mf6GVZF7Ugyjl2xAk=;
	b=fh9Ady+CYoQ2sdHwUv11wDbZ5YMu0KL90PJTb/p1j44FGmWIfxqetM8dvGd/Ksp6kjHPGx
	tA9Irk0uAyTU4xmMaNMg+sJ7XyVDdNfKmQFuvmXKUv+33VEGXldndn84+femzcFyv813A1
	ob5cGM+S1aH1LGb9RbcNAHB1MGfVJqtDF71EytN6juDsmtkxgGBMzWPq2ap/GRCY//qAqs
	Ey/dynWO/4u8y3T1bsDrxUI4t2LojwROeh6UBPjfII1t/jigiiU+Ly9Dz55znECMUwDKgU
	AJPjORGGHmNQMk6gmUkcFne0FRaX8WVdowM7s/7VkRXWdiGK1598LB8g3vPk2w==
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
Subject: [PATCH v3 2/4] dt-bindings: arm: fsl: Document ifm VHIP4 EvalBoard v1 and v2
Date: Tue, 30 Dec 2025 19:40:59 +0100
Message-ID: <20251230184121.52635-2-marex@nabladev.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251230184121.52635-1-marex@nabladev.com>
References: <20251230184121.52635-1-marex@nabladev.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251230_104144_467773_1D8BC7E2 
X-CRM114-Status: UNSURE (   9.88  )
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

Document ifm i.MX8MN VHIP4 EvalBoard v1 and v2 reference design binding.
This system exists in two generations, v1 and v2, which share a lot of
commonality. The boards come with either single gigabit ethernet or an
KSZ8794 fast-ethernet switch, boot from eMMC, and offer CAN interfaces
via Microchip MCP25xx SPI CAN controllers, UART, and USB host. The GPU
is not available in the SoC populated on these devices.

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
 Documentation/devicetree/bindings/arm/fsl.yaml | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 68a2d5fecc43b..4d0aee780bcb2 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1071,6 +1071,15 @@ properties:
               - gw,imx8mn-gw7902          # i.MX8MM Gateworks Board
           - const: fsl,imx8mn
 
+      - description: ifm i.MX8MN VHIP4 based boards
+        items:
+          - enum:
+              - ifm,imx8mn-vhip4-evalboard-v1
+              - ifm,imx8mn-vhip4-evalboard-v2
+          - const: ifm,imx8mn-vhip4-evalboard
+          - const: ifm,imx8mn-vhip4
+          - const: fsl,imx8mn
+
       - description: Variscite VAR-SOM-MX8MN based boards
         items:
           - enum:
-- 
2.51.0



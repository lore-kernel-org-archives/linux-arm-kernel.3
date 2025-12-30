Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 139B3EE01F6
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Dec 2025 21:34:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GHDrKQbUlzRjTpIkYfs4OsT7u2IfOnMtrTLPY43KEf4=; b=KaqR1x+1/d4D3wyZAQiNcvx8u5
	xlqQ0h/Kn1M5eW+M9FdSb6MRVp36cqYoQXtKnW0fTxZeaYqJXHxR7wGdr2lG9RGEYwU4bToGwekRi
	78mtvv1PPuQrOzLSZ7mVOoNa+PKwMeo0tcyfb+6Hql8bVT620wP3sgQ650c2qH5RHlR4+zc+2JqpN
	G94zoYxxEKd2Xc6X8t2P/Io0+C3DEkFsaRXvSfLSCwQJiKbfvyUhwog+AvYhQoPmh6RRDr6xTmhwO
	6KqSv5hGRnXooaVRu0ksy8TN3cjQLrOx8jg/q9NWvUL2bDMovfq4oyVzyDFFti3egBlsWmYaqtlxd
	XYYi+BxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vahMA-00000005JiE-0ipw;
	Tue, 30 Dec 2025 21:34:18 +0000
Received: from mx.nabladev.com ([2a00:f820:417:0:178:251:229:89])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vahM6-00000005Jg5-3cFa
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Dec 2025 21:34:16 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6A40610CE13;
	Tue, 30 Dec 2025 22:34:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1767130450; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=GHDrKQbUlzRjTpIkYfs4OsT7u2IfOnMtrTLPY43KEf4=;
	b=a1C9afa9JK9qJxOWlFmQjB603GqWCg/UNFZgtv26SakFRJpAnJnJZoHljBwmvxL7x/zu06
	hQzVNAfO7TMF3lB3qvWGnQzRJz+ZByuy3LGaNGpJSKm/kTj6hwe9Qg5sSpTfaHtEmnDSVO
	E7w5eNunKy7oam2hlq1AaBTdt7vQjJ6sFLXx/3Z9tBFsp4GGuZ8UusddRuXz5w2UfCEgyN
	5cKq0l56qssCQdhCsPA1qAEw0fyCePv5qSQ1Ld5B0yImG78/RAJtdrLsMPByG5GwXegV4L
	d4YC7DpYFY8s/25Cl5bimGVFAJ+J82rfqGtZlawHBqh5NBbo33lpbC4p5/My5w==
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
Subject: [PATCH v4 2/4] dt-bindings: arm: fsl: Document ifm VHIP4 EvalBoard v1 and v2
Date: Tue, 30 Dec 2025 22:32:32 +0100
Message-ID: <20251230213401.219808-2-marex@nabladev.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251230213401.219808-1-marex@nabladev.com>
References: <20251230213401.219808-1-marex@nabladev.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251230_133415_050059_68CCA3B7 
X-CRM114-Status: UNSURE (   9.77  )
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
V4: No change
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



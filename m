Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4FD1CA5FA3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 20:48:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2V/Nb1lTiKVYVfjos1Q8LNTtkvRDqqwW7qgRu5VAz2w=; b=BoIXDPu0Pa2GOgE8xEGAx49bEw
	EU5qz9x/WPWEnelvRYri51cqFw8JhlgM7iK7xYe1hthNUYE/1pN/XtDAm7To7ckL59S5madBt/2MG
	q3GcCPvadeW3l6N/xawiO7GG6LkuCQ+jYXngDVTadivnniZ0yghi5AC5EVMB5vS5XJiGLBjLx+SpB
	VEK/GED3sDsJbhKw28DM2XKjW0QKoPZwJWmODa/KyGfk2NL/XMeXpNIeQjV44BVqcrvw+9evsP4zN
	8BqCFI7o/+mqoBmrG+C/QHgFq6KPuTHWj8YX106Wqi9onknAzM7KTREGUUvBvWWJSnGBLSmYpTfU2
	CgdYT7jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBIGa-00000001beE-1fC6;
	Mon, 28 Sep 2026 20:48:04 +0000
Received: from mx.nabladev.com ([2a00:f820:417:0:178:251:229:89])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBIGW-00000001bdF-2sxc
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 20:48:02 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7C769100222;
	Mon, 28 Sep 2026 22:47:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1790628471; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=2V/Nb1lTiKVYVfjos1Q8LNTtkvRDqqwW7qgRu5VAz2w=;
	b=OJGltDvcYmqE41XUtT4oU+05adcdXd4duTnvvmIqi27kwSAhC6e56jFnGFp6vNmKupqA62
	3cjC/k/tZSX4SC70Ej5JZe5KaBDDkHOjv5nIrfqzpOigVZE9tYB+ot5v8xo4hV7BAHhI1M
	XmiFnNDyXbvxzqLFIdm1LHXA/+v2T7u1uWexwexSj8EllMXlkOkVz53wsCHzzyGsUjSock
	YM/DwQjJVZJ7hyqNxPg6M1iFsP1ymf/Efuf/ZtG3Wkdn/OLRKv+WssfOdZuhj0hV4HN5hR
	+r4WVEGyXKgqktl7jKPBH/zk+8i46ERUiJcrGvkmQsUAtB47YDFiVPl048SQJg==
From: Marek Vasut <marex@nabladev.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marex@nabladev.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Aswath Govindraju <a-govindraju@ti.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Marc Kleine-Budde <mkl@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-can@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 1/3] dt-bindings: phy: ti,tcan104x-can: Document Microchip ATA6563
Date: Mon, 28 Sep 2026 22:47:12 +0200
Message-ID: <20260928204741.175754-1-marex@nabladev.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_134800_932932_58FBCD5F 
X-CRM114-Status: UNSURE (   7.99  )
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

Microchip ATA6563 is High-Speed CAN Transceiver with Standby Mode.
It is pin-compatible with TI TCAN1042 and has a compatible programming
model, therefore use ti,tcan1042 as fallback compatible.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Marek Vasut <marex@nabladev.com>
---
Cc: Aswath Govindraju <a-govindraju@ti.com>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Frank Li <Frank.Li@nxp.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Marc Kleine-Budde <mkl@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: imx@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-can@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
V2: No change
V3: No change
V4: No change
V5: Add RB from Krzysztof
---
 Documentation/devicetree/bindings/phy/ti,tcan104x-can.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/phy/ti,tcan104x-can.yaml b/Documentation/devicetree/bindings/phy/ti,tcan104x-can.yaml
index 0cf5fa21106b6..e97b1bc0a2e45 100644
--- a/Documentation/devicetree/bindings/phy/ti,tcan104x-can.yaml
+++ b/Documentation/devicetree/bindings/phy/ti,tcan104x-can.yaml
@@ -18,6 +18,7 @@ properties:
       - items:
           - enum:
               - microchip,ata6561
+              - microchip,ata6563
               - ti,tcan1051
           - const: ti,tcan1042
       - items:
-- 
2.53.0



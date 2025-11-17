Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5207DCE8D6B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Nov 2025 16:30:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MFxTAweCxI61WJUCgtNBOwStLpQz98heIEJwITIF0r4=; b=eHcHXn9OscrZMiOmTG6kx0QU7m
	rLFUk6eYIwm9BqB6A42T+54eT2yNVSMqrrJPD2HoxDouRNqZrh5YgiAK/rwyl9ki6Udx2UUeC246f
	swgaRVAgPMeFfxuWpmbvLifGZjAJ3v5qy/GOG8kDaO88MaYogRGxk8w1USZX1F7FEqLGmqs2wId8L
	lSQJk/T4wy/03lR9zkG+eMTBoEtvpqfHHxC0DTytGzq9wNCFsLbP+CQsHagf2kmcVp0JI8Hz1/mWu
	B1Sy1HKMHbn8VTlsJSlMqcQrR+MnYuVLSc0Poerk9Ois1+FN+W3vz8RmPvppTm25lPMq3klA1YqTk
	NntRycSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL276-0000000GOgd-35QX;
	Mon, 17 Nov 2025 16:30:00 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL274-0000000GOfY-05h9;
	Mon, 17 Nov 2025 16:29:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 60D87418E6;
	Mon, 17 Nov 2025 16:29:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C715DC113D0;
	Mon, 17 Nov 2025 16:29:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763396997;
	bh=shKUSuameh3muiG58RfWSoS4te9QniHU0E6tvBpOmy4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=n8OhFVgTQbXQGWiK/eFE+B9CIFBxX9reOAUaY4QyzmxVw6HarFqfgbcNZxIFq8sry
	 F/bo5eJVc0/UJUI7mEMYPZgmBUs7cGh6YIsc50M8yOs/D7GB3kBozMtS6v2OQLT9J6
	 rr/BtwMvgePFIRE4vJcNG2P17VujqLhCR6FLAiILOadUFNyhvXZ5+T57JuR1aM0s9y
	 naWQyyYa7w9meyX2KZxbg8K58gVzuVlRGm/Fv0QUnUJ/bCeDvGXrMBmC6FS9f88kd5
	 Sehs9Fpnu9uRiSW0gVICYfy6ZkhaV44B3JrFZTt/9xtD+Hm1PehE2a8K5Toc3faJ+j
	 CZJvU8yjUdYsw==
From: Conor Dooley <conor@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 2/2] dt-bindings: mfd: document syscons falling back to atmel,sama5d2-sfrbu
Date: Mon, 17 Nov 2025 16:29:31 +0000
Message-ID: <20251117-marlin-mustang-5ffda4d211c7@spud>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251117-aeration-smock-5e7ac06e2942@spud>
References: <20251117-aeration-smock-5e7ac06e2942@spud>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1597; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=jLzb0xlUC6jw2ZwWlMmejU8czQGd9N0/QrEHHV0k8/c=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDJnSvhnLTUXOhxjVq2S6rUx292j2fMCiPUe+1mEX92cdJ tmNV+Z3lLIwiHExyIopsiTe7muRWv/HZYdzz1uYOaxMIEMYuDgFYCLarIwMXTIi6dkxC2b8+N8z vZxHmF+KwyXB4TzvjIUPHAz2x306ysjwv4JxyQbG7c197Se9XvyaV3dU8suvqzPSX8+yrpgep/e KDQA=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_082958_084430_BD6D3EC8 
X-CRM114-Status: UNSURE (   8.04  )
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

From: Conor Dooley <conor.dooley@microchip.com>

The sfrbu on both sama7g5 and sama6d65 both fall back to sama5d2 in
devicetrees, but the former two compatibles were undocumented. Now that
syscon.yaml has easy support for multiple soc-specific compatibles, add
both of these undocumented devices.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
CC: Nicolas Ferre <nicolas.ferre@microchip.com>
CC: Alexandre Belloni <alexandre.belloni@bootlin.com>
CC: Claudiu Beznea <claudiu.beznea@tuxon.dev>
CC: Lee Jones <lee@kernel.org>
CC: Rob Herring <robh@kernel.org>
CC: Krzysztof Kozlowski <krzk+dt@kernel.org>
CC: Conor Dooley <conor+dt@kernel.org>
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: linux-arm-kernel@lists.infradead.org
CC: linux-mediatek@lists.infradead.org
 Documentation/devicetree/bindings/mfd/syscon.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/syscon.yaml b/Documentation/devicetree/bindings/mfd/syscon.yaml
index 50f0012f4ebe..64829ecbb0b0 100644
--- a/Documentation/devicetree/bindings/mfd/syscon.yaml
+++ b/Documentation/devicetree/bindings/mfd/syscon.yaml
@@ -239,6 +239,12 @@ properties:
               - ti,j784s4-pcie-ctrl
               - ti,keystone-pllctrl
           - const: syscon
+      - items:
+          - enum:
+              - microchip,sama7g5-sfrbu
+              - microchip,sama7d65-sfrbu
+          - const: atmel,sama5d2-sfrbu
+          - const: syscon
       - items:
           - const: microchip,pic64gx-control-scb
           - const: microchip,mpfs-control-scb
-- 
2.51.0



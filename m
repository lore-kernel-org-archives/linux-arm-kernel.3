Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36315E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 02:44:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hiGqN27tDAV5FzljGhw0omCZAMqhmOG3k/Hy3TcNcVQ=; b=mVgJ0kR5t+xuy2loAme40CPXxD
	PB0/JwfEeCBGxvpnPka/roZtFYBC1+dV3hZ9HstCSHtJAcX15DnAro0mVNoRg0D9GTWPOne6lV9hR
	xghcPqzLkqjaEydMtYoB9dkC6JKl/ExxTggxM+tMk/j7hYW0qycdqeIYrT8V7qDYKAHAENo0g/3+K
	W/dDfFZYSuu5as8mbKQR7PLyKtxaf2qojnsFqg0kb96ICvGo9neVP7hDc8okiHfexPowTx+v9nihp
	VvXkxgA+hp7s6PIInJSVFkzWJZDvY53uGyte9doDsyUai5G6hja/qVqVKKSC9c5uZVDN2YPtRwcsK
	YRVC2E7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNNYr-0000000C07A-2u1p;
	Tue, 17 Dec 2024 02:43:49 +0000
Received: from ip-89-177-23-149.bb.vodafone.cz ([89.177.23.149] helo=ixit.cz)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNNXW-0000000Bzmp-17gX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Dec 2024 02:42:29 +0000
Received: from newone.lan (99-158-29-91.lightspeed.miamfl.sbcglobal.net [99.158.29.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ixit.cz (Postfix) with ESMTPSA id 8316F160E15;
	Tue, 17 Dec 2024 03:42:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ixit.cz; s=dkim;
	t=1734403337;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=hiGqN27tDAV5FzljGhw0omCZAMqhmOG3k/Hy3TcNcVQ=;
	b=Ya3k+FNLuQ/rfXYftJ0HcaO2J7yOnwSEdVqwRZYaxKfufAiTB4HqfXOV7rMlvd64vZkCQh
	pY1DL4jgthkHbO1JXxsIMOvu/JJwXXvLQfgl/OtdCFrEDqEscGOFAvkFM+qzERolzOSOK2
	UeXP5HXFl4xBS4OGdrvgn6vMJ73e5+I=
From: David Heidelberg <david@ixit.cz>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	David Heidelberg <david@ixit.cz>
Cc: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: media: imx219: Rename to include vendor prefix
Date: Mon, 16 Dec 2024 21:41:50 -0500
Message-ID: <20241217024206.1700170-1-david@ixit.cz>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_184228_194396_154E53F6 
X-CRM114-Status: GOOD (  11.04  )
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

imx219.yaml doesn't include the vendor prefix of sony,
so rename to add it.

Update the id entry and MAINTAINERS to match.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
 .../bindings/media/i2c/{imx219.yaml => sony,imx219.yaml}        | 2 +-
 MAINTAINERS                                                     | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename Documentation/devicetree/bindings/media/i2c/{imx219.yaml => sony,imx219.yaml} (97%)

diff --git ./Documentation/devicetree/bindings/media/i2c/imx219.yaml ./Documentation/devicetree/bindings/media/i2c/sony,imx219.yaml
similarity index 97%
rename from Documentation/devicetree/bindings/media/i2c/imx219.yaml
rename to Documentation/devicetree/bindings/media/i2c/sony,imx219.yaml
index 07d088cf66e0..8b23e5fc6a24 100644
--- ./Documentation/devicetree/bindings/media/i2c/imx219.yaml
+++ ./Documentation/devicetree/bindings/media/i2c/sony,imx219.yaml
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/media/i2c/imx219.yaml#
+$id: http://devicetree.org/schemas/media/i2c/sony,imx219.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: Sony 1/4.0-Inch 8Mpixel CMOS Digital Image Sensor
diff --git ./MAINTAINERS ./MAINTAINERS
index 453ba75fce3b..32a4d057a559 100644
--- ./MAINTAINERS
+++ ./MAINTAINERS
@@ -21796,7 +21796,7 @@ M:	Dave Stevenson <dave.stevenson@raspberrypi.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 T:	git git://linuxtv.org/media.git
-F:	Documentation/devicetree/bindings/media/i2c/imx219.yaml
+F:	Documentation/devicetree/bindings/media/i2c/sony,imx219.yaml
 F:	drivers/media/i2c/imx219.c
 
 SONY IMX258 SENSOR DRIVER
-- 
2.45.2



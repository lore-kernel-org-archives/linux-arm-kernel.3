Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7359C0219B
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Feb 2025 18:12:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=LAJ0ZCR2tcOgwq9g8/GvzS1LJenfL9N1eV8L//kvUWs=; b=KLqVq4GUKPbWF81X41pPoaHhCK
	SxG8jmju3eijr5W342mnwF9+8j2Ps2jCUmNR3/u7vSNVyoPL0HUEgUwCg8KXV7DJ3umJzZrwVR3Fn
	FPXHW3ZhwZ47+ZA0WKWBmZnuN8KjOg7ut5UALrbGBaPC9OXFBu5T1nf6o8FR+x/Xv59djCU2fZQXz
	+Zlt4ngaXu8KAQEWqqVPuJg/+FsWK7oS7Mva2MngeSGdrkegi6O3gX3oxmdjiY/xNQxsNcLtJ5scC
	pA4LFMtuAzp6advxub9+Vc5B/RgbwzgM48/iyz8Mwz1fWT+TA4dN8KrsHVyZaA/2HSu3aIKVBZrad
	My4JZ0Kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thBnG-0000000FJk6-3Lkk;
	Sun, 09 Feb 2025 18:12:34 +0000
Received: from ip-89-177-23-149.bb.vodafone.cz ([89.177.23.149] helo=ixit.cz)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thBiQ-0000000FJ8j-0Rne
	for linux-arm-kernel@lists.infradead.org;
	Sun, 09 Feb 2025 18:07:36 +0000
Received: from newone.lan (unknown [10.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ixit.cz (Postfix) with ESMTPSA id E1658166658;
	Sun,  9 Feb 2025 19:07:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ixit.cz; s=dkim;
	t=1739124448;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=LAJ0ZCR2tcOgwq9g8/GvzS1LJenfL9N1eV8L//kvUWs=;
	b=H3AvhGqA/ncngbIBGFv2XYjvVER0cX7gGHHw1bPfMZVg0yLTEfW223OTHpnqCzQGudB01p
	aYct8sOc8iIMJhumtSvTrCvNGbFpGtgUA7AGds5cIw2sIOsnsdzFxou61wnL4WFMOv3ceh
	zNNqNxohrQ8c9VtDWvVsTb172Gi6QTI=
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
Subject: [PATCH] media: dt-bindings: media: i2c: align IMX219 filename format with others
Date: Sun,  9 Feb 2025 19:07:08 +0100
Message-ID: <20250209180718.126462-1-david@ixit.cz>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250209_100734_373517_779CD994 
X-CRM114-Status: GOOD (  10.05  )
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

Append missing vendor and align with other sony definitions.

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
index 07d088cf66e0b..8b23e5fc6a24f 100644
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
index df1ecd2c7c3d3..2a63f5f640b9a 100644
--- ./MAINTAINERS
+++ ./MAINTAINERS
@@ -21992,7 +21992,7 @@ M:	Dave Stevenson <dave.stevenson@raspberrypi.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 T:	git git://linuxtv.org/media.git
-F:	Documentation/devicetree/bindings/media/i2c/imx219.yaml
+F:	Documentation/devicetree/bindings/media/i2c/sony,imx219.yaml
 F:	drivers/media/i2c/imx219.c
 
 SONY IMX258 SENSOR DRIVER
-- 
2.47.2



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE89EC3ABDD
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 May 2025 15:12:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZajaSm/PVM9gtCltAFgZOc7gM1HZ+NfLJCLTvS/oilM=; b=WZPufM82M3VDcRqamGznDp2JRP
	tD5Q+4tZ/qmzm2VjKz0W9i51o7Fx6khYtAb1ca+/EhXDhnSc9OUJbuCA6CsTPRQLGlDHLcQATa0u8
	qd6sWvXNuCJiPFudh0SNuS1HlpPBIXX3Ma3DJ+dA4E2VVY4jstEQLXFaWV9Ny3sQfMEavmby6zsar
	MyhDhoAM+sqEjVtDmJXRMG+M5d9bsVqPVw/j+b218EzRkib1JJl59M9aSzek6dlNpeFbUy3TCE9fi
	adMtifnGQXXVOZiBFDl/Nb7aASaqFUWPy5v8juc0v+m4hzFGtrDejZasRophy2JE+znn/UO/RFEQ6
	y+kVExng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH29c-00000009XnH-3R2I;
	Mon, 19 May 2025 15:11:48 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH1ZR-00000009SKx-1yp0
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 May 2025 14:34:27 +0000
Received: from mail.ideasonboard.com (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1FE0BD21;
	Mon, 19 May 2025 16:33:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1747665239;
	bh=QovxzFbvZQM3RY4hUzztSYGXWXyoYq70CkYjSUpeEp4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BCsZUCyuwZkLvdryVFVYMErxQ5s3Jwo/MOxBCXfDR0S9AqR97H+V5g2hkH9JgK8I6
	 +gV3WjuMvIVOEsZ2EPCe/I1BdaQ4GqoFN2v55Z84/JXmykwlcpLQ+lbTdn0kzbQShC
	 4Uteq/T1xO+d5F0hKdtO29yTjMP5KkoOlD11apWw=
From: Daniel Scally <dan.scally@ideasonboard.com>
To: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Anthony.McGivern@arm.com,
	jacopo.mondi@ideasonboard.com,
	nayden.kanchev@arm.com,
	robh+dt@kernel.org,
	mchehab@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	jerome.forissier@linaro.org,
	kieran.bingham@ideasonboard.com,
	laurent.pinchart@ideasonboard.com,
	sakari.ailus@iki.fi,
	Daniel Scally <dan.scally@ideasonboard.com>
Subject: [PATCH v9 01/17] media: uapi: Add MEDIA_BUS_FMT_RGB202020_1X60 format code
Date: Mon, 19 May 2025 15:33:53 +0100
Message-Id: <20250519143409.451100-2-dan.scally@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250519143409.451100-1-dan.scally@ideasonboard.com>
References: <20250519143409.451100-1-dan.scally@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250519_073425_668880_BA1FAB51 
X-CRM114-Status: GOOD (  10.85  )
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

The Mali-C55 ISP by ARM requires 20-bits per colour channel input on
the bus. Add a new media bus format code to represent it.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Acked-by: Nayden Kanchev <nayden.kanchev@arm.com>
Co-developed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
---
Changes in v9:

	- None

Changes in v8:

	- None

Changes in v7:

	- None

Changes in v6:

	- Fixed the table formatting

Changes in v5:

	- none

Changes in v4:

	- None

Changes in v3:

	- None

Changes in v2:

	- none

 .../media/v4l/subdev-formats.rst              | 168 ++++++++++++++++++
 include/uapi/linux/media-bus-format.h         |   3 +-
 2 files changed, 170 insertions(+), 1 deletion(-)

diff --git a/Documentation/userspace-api/media/v4l/subdev-formats.rst b/Documentation/userspace-api/media/v4l/subdev-formats.rst
index 2a94371448dc..57194180fe42 100644
--- a/Documentation/userspace-api/media/v4l/subdev-formats.rst
+++ b/Documentation/userspace-api/media/v4l/subdev-formats.rst
@@ -2224,6 +2224,174 @@ The following table list existing packed 48bit wide RGB formats.
 
     \endgroup
 
+The following table list existing packed 60bit wide RGB formats.
+
+.. tabularcolumns:: |p{4.0cm}|p{0.7cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|
+
+.. _v4l2-mbus-pixelcode-rgb-60:
+
+.. raw:: latex
+
+    \begingroup
+    \tiny
+    \setlength{\tabcolsep}{2pt}
+
+.. flat-table:: 60bit RGB formats
+    :header-rows:  3
+    :stub-columns: 0
+    :widths: 36 7 3 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2
+
+    * - Identifier
+      - Code
+      -
+      - :cspan:`31` Data organization
+    * -
+      -
+      - Bit
+      -
+      -
+      -
+      -
+      - 59
+      - 58
+      - 57
+      - 56
+      - 55
+      - 54
+      - 53
+      - 52
+      - 51
+      - 50
+      - 49
+      - 48
+      - 47
+      - 46
+      - 45
+      - 44
+      - 43
+      - 42
+      - 41
+      - 40
+      - 39
+      - 38
+      - 37
+      - 36
+      - 35
+      - 34
+      - 33
+      - 32
+    * -
+      -
+      -
+      - 31
+      - 30
+      - 29
+      - 28
+      - 27
+      - 26
+      - 25
+      - 24
+      - 23
+      - 22
+      - 21
+      - 20
+      - 19
+      - 18
+      - 17
+      - 16
+      - 15
+      - 14
+      - 13
+      - 12
+      - 11
+      - 10
+      - 9
+      - 8
+      - 7
+      - 6
+      - 5
+      - 4
+      - 3
+      - 2
+      - 1
+      - 0
+    * .. _MEDIA-BUS-FMT-RGB202020-1X60:
+
+      - MEDIA_BUS_FMT_RGB202020_1X60
+      - 0x1026
+      -
+      -
+      -
+      -
+      -
+      - r\ :sub:`19`
+      - r\ :sub:`18`
+      - r\ :sub:`17`
+      - r\ :sub:`16`
+      - r\ :sub:`15`
+      - r\ :sub:`14`
+      - r\ :sub:`13`
+      - r\ :sub:`12`
+      - r\ :sub:`11`
+      - r\ :sub:`10`
+      - r\ :sub:`9`
+      - r\ :sub:`8`
+      - r\ :sub:`7`
+      - r\ :sub:`6`
+      - r\ :sub:`5`
+      - r\ :sub:`4`
+      - r\ :sub:`3`
+      - r\ :sub:`2`
+      - r\ :sub:`1`
+      - r\ :sub:`0`
+      - g\ :sub:`19`
+      - g\ :sub:`18`
+      - g\ :sub:`17`
+      - g\ :sub:`16`
+      - g\ :sub:`15`
+      - g\ :sub:`14`
+      - g\ :sub:`13`
+      - g\ :sub:`12`
+    * -
+      -
+      -
+      - g\ :sub:`11`
+      - g\ :sub:`10`
+      - g\ :sub:`9`
+      - g\ :sub:`8`
+      - g\ :sub:`7`
+      - g\ :sub:`6`
+      - g\ :sub:`5`
+      - g\ :sub:`4`
+      - g\ :sub:`3`
+      - g\ :sub:`2`
+      - g\ :sub:`1`
+      - g\ :sub:`0`
+      - b\ :sub:`19`
+      - b\ :sub:`18`
+      - b\ :sub:`17`
+      - b\ :sub:`16`
+      - b\ :sub:`15`
+      - b\ :sub:`14`
+      - b\ :sub:`13`
+      - b\ :sub:`12`
+      - b\ :sub:`11`
+      - b\ :sub:`10`
+      - b\ :sub:`9`
+      - b\ :sub:`8`
+      - b\ :sub:`7`
+      - b\ :sub:`6`
+      - b\ :sub:`5`
+      - b\ :sub:`4`
+      - b\ :sub:`3`
+      - b\ :sub:`2`
+      - b\ :sub:`1`
+      - b\ :sub:`0`
+
+.. raw:: latex
+
+    \endgroup
+
 On LVDS buses, usually each sample is transferred serialized in seven
 time slots per pixel clock, on three (18-bit) or four (24-bit) or five (30-bit)
 differential data pairs at the same time. The remaining bits are used
diff --git a/include/uapi/linux/media-bus-format.h b/include/uapi/linux/media-bus-format.h
index ff62056feed5..62ad82fd285a 100644
--- a/include/uapi/linux/media-bus-format.h
+++ b/include/uapi/linux/media-bus-format.h
@@ -34,7 +34,7 @@
 
 #define MEDIA_BUS_FMT_FIXED			0x0001
 
-/* RGB - next is	0x1028 */
+/* RGB - next is	0x1029 */
 #define MEDIA_BUS_FMT_RGB444_1X12		0x1016
 #define MEDIA_BUS_FMT_RGB444_2X8_PADHI_BE	0x1001
 #define MEDIA_BUS_FMT_RGB444_2X8_PADHI_LE	0x1002
@@ -74,6 +74,7 @@
 #define MEDIA_BUS_FMT_RGB888_1X36_CPADLO	0x1021
 #define MEDIA_BUS_FMT_RGB121212_1X36		0x1019
 #define MEDIA_BUS_FMT_RGB161616_1X48		0x101a
+#define MEDIA_BUS_FMT_RGB202020_1X60		0x1028
 
 /* YUV (including grey) - next is	0x202f */
 #define MEDIA_BUS_FMT_Y8_1X8			0x2001
-- 
2.34.1



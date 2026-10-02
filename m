Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A54C0CA5FD4
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 10:38:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HwM7SLVvVIJhCu21U0scjFbWYh+AjkgwTRjyEORwvOY=; b=VSqb01ygzEGatcE9lnTKhY08KZ
	8YX92KhfouSptqofCHuBLC6G9ACOZdmU0iXuhC6xZvkruCiK889Qfnq1ah/mgc/sS/vNwIS2yb79w
	qmWxZrzS5SbeAI6tKmYFDet5I5WOSkLskQUwjSmnkHf5WHOsCHu5SCQiUAjVI1KDaNrmhKi9Bjo5V
	AG2HJGgAaZ9VGlzgc2CYCYX5v/LTWjXCgzhqda54x/B2BnuJ9oJQ08V2CJIhkIQvIcgTZVezUrcFQ
	VsbU2aCWJyAT9rprO9cQptg6+4C+3WdmR0bN2wqPJSN0KaGUiGhbmBz5yKIMzynVcKpk2wsT+Yz63
	7gFtNXWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCaee-0000000BLKz-1DCR;
	Fri, 02 Oct 2026 10:38:16 +0000
Received: from mail11.truemail.it ([217.194.8.81])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCaeW-0000000BLFU-0Efa
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 10:38:13 +0000
Received: from francesco-nb.. (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id E2E392097E;
	Fri,  2 Oct 2026 12:38:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1790937486;
	bh=HwM7SLVvVIJhCu21U0scjFbWYh+AjkgwTRjyEORwvOY=; h=From:To:Subject;
	b=Y2qgZtwYc+KMHwa5tgi70vZkYQAeOBNuC5sOM9noxSmRz8X0v4P39jOk9EkeWmBtJ
	 /aVIVCjIZ7zRjxu0Xehj39V32HvQqeOCJLD/48846t0LcOTBwSY0XoWngfZwLWPZjo
	 24xP1QcMCjri1CL5nGm1fgDMYXfvRvouvs+w0dzpEOexVOMFV55VEf9XW0limei6HQ
	 6Cmk7VBCKLeZ/tGZ/TUHlW9+f3WuJdB1TCKIpzj3rFNe7r7iL4IQdPk4LpOKtbqbzb
	 zyYT8t5YkmgoBDXAz1ZGkhRn+vY0g/DQcVY4upCzTYCyUU/G3MVcZPG3oMXCqQAr4Y
	 DKBKxWG+Z2r8A==
From: Francesco Dolcini <francesco@dolcini.it>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v1 3/3] arm64: dts: freescale: imx95-aquila: fix vdev buffer reserved memory node name
Date: Fri,  2 Oct 2026 12:37:56 +0200
Message-ID: <20261002103757.70065-4-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261002103757.70065-1-francesco@dolcini.it>
References: <20261002103757.70065-1-francesco@dolcini.it>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_033808_261737_B76BFA1F 
X-CRM114-Status: GOOD (  10.24  )
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

From: Francesco Dolcini <francesco.dolcini@toradex.com>

The imx_rproc driver uses node names to identify reserved memory regions.
It checks for "vdev0buffer" to skip mapping and "vdev" prefix to filter
vdev regions.

Rename the reserved memory nodes to use the expected names so the driver
can correctly identify and handle each region.

Same as commit 5cae743b988d ("arm64: dts: imx95-15x15-frdm: fix reserved
memory node names for remoteproc").

Fixes: d5c082ba23db ("arm64: dts: freescale: add Aquila iMX95 support")
Cc: stable@vger.kernel.org
Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
 arch/arm64/boot/dts/freescale/imx95-aquila.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx95-aquila.dtsi b/arch/arm64/boot/dts/freescale/imx95-aquila.dtsi
index c5f4cf0541f2..eb2958d41643 100644
--- a/arch/arm64/boot/dts/freescale/imx95-aquila.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95-aquila.dtsi
@@ -142,7 +142,7 @@ remoteproc-cm7 {
 		compatible = "fsl,imx95-cm7";
 		mboxes = <&mu7 0 1 &mu7 1 1 &mu7 3 1>;
 		mbox-names = "tx", "rx", "rxdb";
-		memory-region = <&vdevbuffer>, <&vdev0vring0>, <&vdev0vring1>,
+		memory-region = <&vdev0buffer>, <&vdev0vring0>, <&vdev0vring1>,
 				<&vdev1vring0>, <&vdev1vring1>, <&rsc_table>, <&m7_reserved>;
 	};
 
@@ -189,7 +189,7 @@ vdev1vring1: vdev1vring1@88018000 {
 			no-map;
 		};
 
-		vdevbuffer: vdevbuffer@88020000 {
+		vdev0buffer: vdev0buffer@88020000 {
 			compatible = "shared-dma-pool";
 			reg = <0 0x88020000 0 0x100000>;
 			no-map;
-- 
2.47.3



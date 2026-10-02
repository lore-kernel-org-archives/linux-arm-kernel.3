Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9D51CA5FD4
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 10:38:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1Lmc7m9O5GYGW82qx/YwZr2eAGDKfa3VzLbHRgPFcIs=; b=DZ6qN7NXMTUlzN2oWGM2x8S3PO
	KuK4n99TIiVQAncX5tMkw5qQtg/JOsn88hmS1AW6i262vkeUmvzLX+jojOKpHqo69BwDV1HpKkeHA
	tANgsSeg3ziFbR3cPlqulaMQDTwJrBVM5W4Q3G+j3o3x3iwvixEazAC3GN/GhIWcsu39T75aMLjc7
	wXpp6YFQ9h69z0tupcB6kbqyWWLDxFx3Ho2MSZTjAB50kwdu5XYB4PbAcrbnpvBZX3rjudPpiwyLH
	IdqCYY8X0Ygal32CTTmGV93YUBQuj9yObMatUCWoUWt9tG0uyqRHkKcGtCqMecJI+GNy6H9KlYSkI
	tdaSFh4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCaea-0000000BLIa-3txL;
	Fri, 02 Oct 2026 10:38:12 +0000
Received: from mail11.truemail.it ([2001:4b7e:0:8::81])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCaeU-0000000BLF3-3qMw
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 10:38:12 +0000
Received: from francesco-nb.. (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id AA0CF207B3;
	Fri,  2 Oct 2026 12:38:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1790937485;
	bh=1Lmc7m9O5GYGW82qx/YwZr2eAGDKfa3VzLbHRgPFcIs=; h=From:To:Subject;
	b=C65mH7WKZs2QaWzNJby4yt5fC8ZQZNCqwdoM/+Dw8UklYXMxM8t9TnQ6UJgjztGab
	 m60H5+G5Vn9phmR+tkfKYavizshf9jQu73WHNQTd11t9SGK0ARXxZr2QnwG80X2KV4
	 Ees+zZxfA+5Ntc9MYT5IV4VxR8w98quJELSYKaV+AAqgs8b6RDOMjf8LRjjTkL0KSq
	 SnBlq/7KZb5NLmu5elxZzGMMSm8Dv3lcxVCY3G54BCMWtnT1mkcdiYXbXjThyBkCkZ
	 mgDT09017X6mN/jjvafnaGhL5SAQBW5Txe+pnx7V+4EH89LiHdl/pzjv9KQm/kx/j3
	 A/wZyMgoLZO/A==
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
Subject: [PATCH v1 1/3] arm64: dts: freescale: imx95-verdin: fix vdev buffer reserved memory node name
Date: Fri,  2 Oct 2026 12:37:54 +0200
Message-ID: <20261002103757.70065-2-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261002103757.70065-1-francesco@dolcini.it>
References: <20261002103757.70065-1-francesco@dolcini.it>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_033807_123237_B50F29A2 
X-CRM114-Status: GOOD (  10.09  )
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

Fixes: 676d7ce22f00 ("arm64: dts: freescale: Add Verdin iMX95 support")
Cc: stable@vger.kernel.org
Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
 arch/arm64/boot/dts/freescale/imx95-verdin.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx95-verdin.dtsi b/arch/arm64/boot/dts/freescale/imx95-verdin.dtsi
index 72e7f1e88409..f2e41d39ca6e 100644
--- a/arch/arm64/boot/dts/freescale/imx95-verdin.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95-verdin.dtsi
@@ -142,7 +142,7 @@ cm7: remoteproc-cm7 {
 		mboxes = <&mu7 0 1
 			  &mu7 1 1
 			  &mu7 3 1>;
-		memory-region = <&vdevbuffer>, <&vdev0vring0>, <&vdev0vring1>,
+		memory-region = <&vdev0buffer>, <&vdev0vring0>, <&vdev0vring1>,
 				<&vdev1vring0>, <&vdev1vring1>, <&rsc_table>, <&m7_reserved>;
 	};
 
@@ -184,7 +184,7 @@ vdev1vring1: vdev1vring1@88018000 {
 			no-map;
 		};
 
-		vdevbuffer: vdevbuffer@88020000 {
+		vdev0buffer: vdev0buffer@88020000 {
 			compatible = "shared-dma-pool";
 			reg = <0 0x88020000 0 0x100000>;
 			no-map;
-- 
2.47.3



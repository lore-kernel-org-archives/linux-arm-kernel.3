Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D430C87FDA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Aug 2025 06:43:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=EJcwko3c7uyCeYh/tGW6fF+83okM4Hcdm+WEAVIUDSw=; b=iA47HM3ihwJrd96EwLRD2b/rL7
	XZHe2hzE56CtPN9zt0O1AsasxDsd3VzSfVzdfxauX3RHyNva2Qzbq/IuLURkK0TGfxtR+eH06yFv9
	YWjSOuR6Xc4wkU7lfqaMjF5nqJ2qn6ehI4ohtn+VH/W/BvnL1yYpeqSORkRTalNOiIvl7VlrHHNGx
	G2BM2VnyMCrApYYUob5p6/tnMxXdXfU39S1PzpnXzjEvbJ5myci3PrwU3BxHGs3HeIkIY0CLfA3PM
	a5sh2QTO96AfqtVNYPGZjNpdS44Gpx962my7lYSdxCVykCqg5QCA5EwfbwxKVRRwlPTtO0GjCfeOr
	1shDes/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulMFx-00000006chE-1edC;
	Mon, 11 Aug 2025 06:43:41 +0000
Received: from mail.thorsis.com ([217.92.40.78])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulMBV-00000006cNQ-3kj0
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Aug 2025 06:39:07 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 24117148003B;
	Mon, 11 Aug 2025 08:38:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=thorsis.com; s=dkim;
	t=1754894340; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=EJcwko3c7uyCeYh/tGW6fF+83okM4Hcdm+WEAVIUDSw=;
	b=iK/zGLLLcQTsPRVVPlSXi2vZprXSiexLaEk1zoq/cLARMbJaH7pt3Fo6l2dlWU4cVkf7xh
	uD5OgMfZzNpYuW+EjxC4Y5XTs4AVkET+1g6uVem78JkYWjXg5lf0ejTZOvn7vxVWSYsOn6
	RqcDERKnXYeNnSNIltHtIvxspfIXwU/2ae7Ce4ZA7sM91uWsTjLoVivPUF0nkSoX5smp4M
	CMQHukpCDDjjSZsEYSDFufXThGL6QWy/VGXTIbS/5eePGG3PTfCTndQNNCxlCA0/9stdjP
	rZ2bKEj04VpSCGOeMiM4CcJrIaPfGcF4ded9LSabspywR2zCCilvh/BRqgyx5A==
From: Alexander Dahl <ada@thorsis.com>
To: devicetree@vger.kernel.org
Cc: Frank Li <Frank.li@nxp.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	imx@lists.linux.dev (open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v3] arm64: dts: imx8dxl-ss-conn: Disable USB3 nodes
Date: Mon, 11 Aug 2025 08:38:54 +0200
Message-Id: <20250811063855.46431-1-ada@thorsis.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250810_233906_382985_814AB286 
X-CRM114-Status: UNSURE (   8.82  )
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

The i.MX 8DualXLite/8SoloXLite has a different connectivity memory map
than the generic i.MX8 has.  One conflicting resource is usb, where the
imx8dxl has a second usb2 phy @5b110000, while the generic imx8 dtsi has
one usb2 phy and one usb3 phy, and the usb3otg @5b110000.  When
including both imx8dxl-ss-conn.dtsi and imx8-ss-conn.dtsi as done in
imx8dxl.dtsi this leads to a duplicate unit-address warning.

The usb3otg node was introduced after the initial imx8dxl support with
commit a8bd7f155126 ("arm64: dts: imx8qxp: add cadence usb3 support")
and since then leads to warnings like this (when built with W=2):

      DTC     arch/arm64/boot/dts/freescale/imx8dxl-evk.dtb
    …/arch/arm64/boot/dts/freescale/imx8-ss-conn.dtsi:148.24-182.4: Warning (unique_unit_address): /bus@5b000000/usb@5b110000: duplicate unit-address (also used in node /bus@5b000000/usbphy@5b110000)
      also defined at …/arch/arm64/boot/dts/freescale/imx8dxl-ss-hsio.dtsi:41.23-50.4
      also defined at …/arch/arm64/boot/dts/freescale/imx8dxl-evk.dts:645.8-653.3

Delete usb3 related nodes at dxl to fix above warning.

Signed-off-by: Alexander Dahl <ada@thorsis.com>
---

Notes:
    v3:
    - reworded commit message (thrown out irrelevant parts)
    - rebased on v6.17-rc1
    
    v2:
    - reworded commit message (build on mainline with W=2)
    - rebased on v6.16-rc3
    - Link: https://lore.kernel.org/linux-devicetree/20250623075440.36660-1-ada@thorsis.com/
    
    v1:
    - Link: https://lore.kernel.org/linux-devicetree/20250610060756.8212-1-ada@thorsis.com/

 arch/arm64/boot/dts/freescale/imx8dxl-ss-conn.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8dxl-ss-conn.dtsi b/arch/arm64/boot/dts/freescale/imx8dxl-ss-conn.dtsi
index 9b114bed084b..a66ba6d0a8c0 100644
--- a/arch/arm64/boot/dts/freescale/imx8dxl-ss-conn.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8dxl-ss-conn.dtsi
@@ -5,6 +5,8 @@
 
 /delete-node/ &enet1_lpcg;
 /delete-node/ &fec2;
+/delete-node/ &usbotg3;
+/delete-node/ &usb3_phy;
 
 / {
 	conn_enet0_root_clk: clock-conn-enet0-root {

base-commit: 8f5ae30d69d7543eee0d70083daf4de8fe15d585
-- 
2.39.5



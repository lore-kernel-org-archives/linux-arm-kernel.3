Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F9F2C7115B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Jun 2025 08:03:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rgy/dV9hiRjmDOzfF33PTkPljLUb2D+gAPORxCVHCIs=; b=oKzI35cnhwOa+QAkRIjZeM50ZL
	rTa8NheG1g6skzy74GS/0ZG3dzsR5tEdPCymYYwsOpjl+awyo8ET597jDdaMkpTAfUYcyh3IKMk0w
	Sjr7o+Ux3epmoLG7L5+9XcRzhKzKFxZn6Cr8SnBmPQ3UARRsHh6kS63ugW60gKsAbobjnRdv8yeYq
	8oaWlnTYaERsl7nq3TQpFA9tLHmUJzyUpWp7bLRII8WrmkJMrjSeDLzPhZadOHyGEJUFdc95HetTq
	DiS9b5gETLgvGex9Tkzffut1eRHm2OWWovSKw2CHZwKiwBOx2zdIALX13EZMFcDh13AdxjliYz+Uv
	+ioukMzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTc9f-00000001x30-3xc2;
	Mon, 23 Jun 2025 08:03:51 +0000
Received: from mail.thorsis.com ([217.92.40.78])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTc0y-00000001vxC-3FhZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Jun 2025 07:54:54 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DF04A1483FA8;
	Mon, 23 Jun 2025 09:54:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=thorsis.com; s=dkim;
	t=1750665287; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=rgy/dV9hiRjmDOzfF33PTkPljLUb2D+gAPORxCVHCIs=;
	b=mGrnUBXQSd6JgDYmcwpPh+ViDk6d1h6HhcQasoJc59Wb8uiEOFTS1UgAPwf5pVbMsv87Ue
	v777pYevIAsD9XK2LrVt9ZD8uI4QG31yRei4ZQRBW3WFDAP5lQ2ZTMVDuOFCkyw1Tk0Ai0
	pclHWthQnVeu9ixc30A39lUT2u+iqL/P2KR+E+zcBqwy1fZVn/MDFY8v6gwKGOUv6Lvc8R
	6x9dYz2jHyHgoaNpsdPGwFJ3afpwoFENDeEghsxqWkTj60pONDVX2gSr94Vq2lTM5D97tp
	D+RsoyrVGWgocXrgdaVGJqLMzJn4OPRyJhrgjViXWJ6urCnBnoHo1wkr7Q4BDw==
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
Subject: [PATCH v2] arm64: dts: imx8dxl-ss-conn: Disable USB3 nodes
Date: Mon, 23 Jun 2025 09:54:40 +0200
Message-Id: <20250623075440.36660-1-ada@thorsis.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_005453_269010_DD66FC0A 
X-CRM114-Status: UNSURE (   8.78  )
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
    …/arch/arm64/boot/dts/freescale/imx8-ss-hsio.dtsi:52.23-81.4: Warning (unique_unit_address): /bus@5f000000/pcie@5f010000: duplicate unit-address (also used in node /bus@5f000000/pcie-ep@5f010000)
      also defined at …/arch/arm64/boot/dts/freescale/imx8dxl-ss-hsio.dtsi:41.23-50.4
      also defined at …/arch/arm64/boot/dts/freescale/imx8dxl-evk.dts:645.8-653.3

After the change that usb related warning is gone:

      DTC     arch/arm64/boot/dts/freescale/imx8dxl-evk.dtb
    …/arch/arm64/boot/dts/freescale/imx8-ss-hsio.dtsi:52.23-81.4: Warning (unique_unit_address): /bus@5f000000/pcie@5f010000: duplicate unit-address (also used in node /bus@5f000000/pcie-ep@5f010000)
      also defined at …/arch/arm64/boot/dts/freescale/imx8dxl-ss-hsio.dtsi:41.23-50.4
      also defined at …/arch/arm64/boot/dts/freescale/imx8dxl-evk.dts:645.8-653.3

Signed-off-by: Alexander Dahl <ada@thorsis.com>
---

Notes:
    v2:
    - reworded commit message (build on mainline with W=2)
    - rebased on v6.16-rc3
    
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

base-commit: 86731a2a651e58953fc949573895f2fa6d456841
-- 
2.39.5



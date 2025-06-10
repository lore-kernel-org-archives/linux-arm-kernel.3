Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE7FDC5B552
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Jun 2025 06:12:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=I4ti+/foQg3QbjYgEJL1AVz6uH68ooxEzV0rGfw+TYU=; b=bxp/H1HaaeQZtylGfJveImx5wb
	kHdOgtdci6V+4EEAtbZpRoARzxr3/zu83JEl0s+lSjvanWQ+l9BY4CoMTrzPp55prymTS/KfxRnWK
	2eO3jtwoJaPcfH171hhHmMwJcZOHdmj5KJiULdc0pgHBvKbCTT176g08KnwgdQfnKhCdr+IHyEZbL
	JulMf3gAlaghrtydgUSP589jA9LVw15NyyYSDpyMmtRClVWvMmq6iBOzqh5t/rLk3r/C6pNdi1orn
	TPsVSda1AVgpD/Xn83u7Vk+PMFJEZVVh/D+vjQrwKXu+nZXFP6Yxjsp/0rsKrc6f2kRjqQnYyycRA
	J103LAwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOsDm-00000005uBY-1yYd;
	Tue, 10 Jun 2025 06:12:30 +0000
Received: from mail.thorsis.com ([217.92.40.78])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOs9Z-00000005tlx-2zuA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Jun 2025 06:08:11 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id AB8E81485BB5;
	Tue, 10 Jun 2025 08:08:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=thorsis.com; s=dkim;
	t=1749535683; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=I4ti+/foQg3QbjYgEJL1AVz6uH68ooxEzV0rGfw+TYU=;
	b=DxP4gN/oqr6gN9kmsdPBSyeLw6tkZIOAmwNldabPG+7Hhp9EtGCtotcehqu0dNUnjHlOAT
	LUIMnguyEn0vT5FWSRzuscfaELFyJOCVX1wO0fZcHVSYt+HJDqUwaayGGPj3Hakr3cg0Gn
	bnaPOVZtSmsP/J+kZRd8jUoHnr+ratbdESmBrU1vRgAaK+m8fShfZXIYEUyJ+Wv6C3AC1m
	Nv1QLKDjAZcP5FBDWSbj7o0TrI97MxCRCFA8K8AuiGpw9v8KPJxU4DSPYyKKEG2J9K2UnP
	9U+cEqXuI8FsOxG9eSbLlMNp0TuSRFkP9Vgel0sLaD5fzh6IZdzJry7VcrjbEw==
From: Alexander Dahl <ada@thorsis.com>
To: devicetree@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	imx@lists.linux.dev (open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] arm64: dts: imx8dxl-ss-conn: Disable USB3 nodes
Date: Tue, 10 Jun 2025 08:07:56 +0200
Message-Id: <20250610060756.8212-1-ada@thorsis.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_230810_203323_6B6B66B7 
X-CRM114-Status: UNSURE (   8.11  )
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
and since then leads to warnings like this (when building with ptxdist):

    CPP generic/platform-v8a/build-target/linux-6.12/arch/arm64/boot/dts/freescale/imx8dxl-evk.dts
    DTC generic/platform-v8a/packages/linux-6.12/boot/imx8dxl-evk.dtb
    /home/adahl/Work/bsp/thorsis/generic/platform-v8a/build-target/linux-6.12/arch/arm64/boot/dts/freescale/imx8-ss-conn.dtsi:148.24-182.4: Warning (unique_unit_address): /bus@5b000000/usb@5b110000: duplicate unit-address (also used in node /bus@5b000000/usbphy@5b110000)

Signed-off-by: Alexander Dahl <ada@thorsis.com>
---
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

base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
-- 
2.39.5



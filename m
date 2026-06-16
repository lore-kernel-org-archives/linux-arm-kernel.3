Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBB8CCD98CF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Jun 2026 10:43:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=aThhbPVkViZDOYmIYsh1qACbccOEM0HdUC2kdMlFlcg=; b=u/VoZRBmP5KmTCBJIdjH8aCpkQ
	caOUe0bfz3ZMKrdS9goMbCOcrmnfUItfNR9FWvIl9uGHFt7MiOnIAlxwI+hoNYUPRVvCFkrR3/Yf8
	m4pWFI21NXfAcWiUnOCbeBBf4ePqp2chz07+tlBnwYYZMdj40MKXw/SwtTVmeTAXNjJkgXYZPn8oC
	nznxr7ovn6TRNRIDhfQZ5y60fX4mXAlX9P2rZtZqHOlaAfjRsxwNtxppttDurpGtdcBuHbuj/O+qm
	NztHuDonRz/FgMXY4C1e+aKZo1C2HWkpGNig48pyHWjmRVnqb9ZIqduatP1ZhYiprNuMfGQ0PkZjT
	tJeVFsTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZRGY-0000000FcSh-3uBJ;
	Tue, 16 Jun 2026 10:43:34 +0000
Received: from mail.fris.de ([116.203.77.234])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZRGV-0000000FcSG-3yGT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Jun 2026 10:43:33 +0000
From: Frieder Schrempf <frieder@fris.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=mail;
	t=1781606606;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=aThhbPVkViZDOYmIYsh1qACbccOEM0HdUC2kdMlFlcg=;
	b=PL91a9QSRz3tmG5n8pe+J3lwK33NYmKe9lP8mm3WxE3siVmeHJkiEOFqjgXVZl7Vr8BMlW
	zqQweswwx+xeGdpjya0FGfWwYtppajdQiwhk/bj/p524ExcJdhfypSHFzHx9S7qyzOITS2
	hWJs6OYYGYAEPC1Z972NLh7xdeo5NU/3KfrpCd5j0OsettVYCC+lHZ/jbsjzF7P0IWaX+e
	j1v5Sqk7Sorp20b4gAN96dsBOSjI9kNckLKi4IY7HpY+LKMda6/XU/VI2joEWk2lZ/ciUY
	NXnnCQoA83ab8wgdKn5luV6OwqE5VPY5Ob4pKqET3xLishJuJr7jV3uz+xiv4Q==
To: Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Frank Li <Frank.Li@nxp.com>,
	Frieder Schrempf <frieder.schrempf@kontron.de>,
	imx@lists.linux.dev,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>
Cc: Fabio Estevam <festevam@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: [PATCH] arm64: dts: imx93-kontron: Fix memory node
Date: Tue, 16 Jun 2026 12:43:09 +0200
Message-ID: <20260616104311.633297-1-frieder@fris.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260616_034332_468153_3998DD34 
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

From: Frieder Schrempf <frieder.schrempf@kontron.de>

The start address of the DRAM area is 0x80000000. The minimal
size of the DDR on the SoM is 1 GiB. Fix this.

Fixes: 2b52fd6035b7 ("arm64: dts: Add support for Kontron i.MX93 OSM-S SoM and BL carrier board")
Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
---
 arch/arm64/boot/dts/freescale/imx93-kontron-osm-s.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx93-kontron-osm-s.dtsi b/arch/arm64/boot/dts/freescale/imx93-kontron-osm-s.dtsi
index c79b1df339db..f881912cde46 100644
--- a/arch/arm64/boot/dts/freescale/imx93-kontron-osm-s.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx93-kontron-osm-s.dtsi
@@ -15,9 +15,9 @@ aliases {
 		rtc1 = &bbnsm_rtc;
 	};
 
-	memory@40000000 {
+	memory@80000000 {
 		device_type = "memory";
-		reg = <0x0 0x40000000 0 0x80000000>;
+		reg = <0x0 0x80000000 0 0x40000000>;
 	};
 
 	chosen {
-- 
2.54.0



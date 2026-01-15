Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B8A5D44C46
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Jan 2026 13:10:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=YP69q32yMgT6rirbxWK59GPFgTZNcMCE7ROQl7g7utI=; b=Oq4UudTufSkWenxOTWhAQJ7t2V
	C+Di2fuz6+uM8dteJAJZ0JY9d1b1c72X8wIi1qmFK83D2eeobmWxHAvXJeeMfjsE/rrL6F8gAJ/Kk
	nXClmUjadZ7Y0y2QSSqlBWzuhJLRF4dskRX5FxXGCjVp1n3vVgqkH+JYTSUotP5Rmc8TVK7pd7UzT
	ge6Tg3kJGCYB+HyDe6Xjjfpg6zZjUMja8mtGdyQHU8TsQFlwJ5zXk2VtSgxHp6NJgVZi4KXvhJQb9
	dxdlq8+cUF6QYhmlX9j22ft1Vik7S/DE9VUSuWxfjxVwDG6uAWVtycUUEYZI2W0BwRB2AvrM0vEsg
	6DXr+MFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgN7b-0000000COAQ-1K38;
	Thu, 15 Jan 2026 13:10:43 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgN7Y-0000000CO9g-2t6S;
	Thu, 15 Jan 2026 13:10:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1768482638;
	bh=dWXWKnfDVR+IlEHGZ7ZNUwzNrPO+NGwKp0fV3hm++hk=;
	h=From:To:Cc:Subject:Date:From;
	b=AxBkfOiCV54NRAY1JslEhpl8RDtPEjACijHqqEt3hCj+laH6qFRbiSm/easIXweGo
	 nUmPWSW6/yZha+1kzxYnVwIeC+z6+KuiKZbfxZ+UwzU89sZkYWUSNJ+Ms4I61hRX9M
	 sl8F2kz8WnAWv2TO5Kq9E42ZdBwoAa4EKIV7qAKdHGwT/RBt23EG+DlpLDOV70ObhX
	 X0FwleJuwAliSCls6CSlmU1HaasgsvTgDBps6x9k4mvNaKxgZdrSbW2S7fYYUIKz2O
	 5Ty8y/4bGjSztsUDgyzS5uHlQzP1KS8J7s9Eu2L3yz+84lXYlyuXG6IMAWHu7HDPbC
	 QN8MG7Tm2i/cg==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0EF4B17E10F8;
	Thu, 15 Jan 2026 14:10:38 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: linux-mediatek@lists.infradead.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com,
	frank-w@public-files.de
Subject: [PATCH v2] arm64: dts: mediatek: mt7988a: Fix PCI-Express T-PHY node address
Date: Thu, 15 Jan 2026 14:10:35 +0100
Message-ID: <20260115131035.75574-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_051040_903057_A71AA00C 
X-CRM114-Status: UNSURE (   9.40  )
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

The PCIe and USB TPHYs are under the soc bus, which provides MMIO,
and all nodes under that must use the bus, otherwise those would
clearly be out of place.

Add ranges to both the tphy(s) and assign the address to the main
node to silence a dtbs_check warning, and fix the children to
use the MMIO range of t-phy.

Fixes: ("f693e6ba55ae arm64: dts: mediatek: mt7988: Add t-phy for ssusb1")
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt7988a.dtsi | 28 +++++++++++------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt7988a.dtsi b/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
index bec590d26659..8c9a5aba2579 100644
--- a/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
@@ -629,20 +629,20 @@ pcie_intc1: interrupt-controller {
 		tphy: t-phy@11c50000 {
 			compatible = "mediatek,mt7986-tphy",
 				     "mediatek,generic-tphy-v2";
-			#address-cells = <2>;
-			#size-cells = <2>;
-			ranges;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges = <0 0 0x11c50000 0x1000>;
 			status = "disabled";
 
-			tphyu2port0: usb-phy@11c50000 {
-				reg = <0 0x11c50000 0 0x700>;
+			tphyu2port0: usb-phy@0 {
+				reg = <0 0x700>;
 				clocks = <&infracfg CLK_INFRA_USB_UTMI_CK_P1>;
 				clock-names = "ref";
 				#phy-cells = <1>;
 			};
 
-			tphyu3port0: usb-phy@11c50700 {
-				reg = <0 0x11c50700 0 0x900>;
+			tphyu3port0: usb-phy@700 {
+				reg = <0x700 0x900>;
 				clocks = <&infracfg CLK_INFRA_USB_PIPE_CK_P1>;
 				clock-names = "ref";
 				#phy-cells = <1>;
@@ -659,20 +659,20 @@ topmisc: system-controller@11d10084 {
 		xsphy: xs-phy@11e10000 {
 			compatible = "mediatek,mt7988-xsphy",
 				     "mediatek,xsphy";
-			#address-cells = <2>;
-			#size-cells = <2>;
-			ranges;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges = <0 0 0x11e10000 0x3900>;
 			status = "disabled";
 
-			xphyu2port0: usb-phy@11e10000 {
-				reg = <0 0x11e10000 0 0x400>;
+			xphyu2port0: usb-phy@0 {
+				reg = <0 0x400>;
 				clocks = <&infracfg CLK_INFRA_USB_UTMI>;
 				clock-names = "ref";
 				#phy-cells = <1>;
 			};
 
-			xphyu3port0: usb-phy@11e13000 {
-				reg = <0 0x11e13400 0 0x500>;
+			xphyu3port0: usb-phy@3400 {
+				reg = <0x3400 0x500>;
 				clocks = <&infracfg CLK_INFRA_USB_PIPE>;
 				clock-names = "ref";
 				#phy-cells = <1>;
-- 
2.52.0



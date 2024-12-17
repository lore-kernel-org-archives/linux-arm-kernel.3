Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D88AE7716A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 09:31:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1qpq2TeKtX83y0CQ6eBnXEfc924KW6SAf81KBp6Mvvw=; b=IqV7UCxzzxrEKKb7+U4rGtXzjC
	Fk/Ims4XZ4b1jLTKfesCUV1r78Z1rpjsUNVo3c0PkNSkvIFnI7KPqyFsYv82I5qLwT5I0VAxBSTzP
	UhDJtzAhYysAW76LzrTZJs/7ZC3MPFFYx+SClKIer2UTZL0h5eN3Nx8vOXgE5tdEIWTR5zO3+g716
	yU6pEesl2VNKwyOQenVOnrdX4uivD1TJRecO+E8IFBIE4dWBgNPhNTdn+uxIxkm8VeJNcAj8Fw+FH
	Fuw4BmEM1rCgEBkI84eS41KfqNe9z5Sv6bC/hvpEFI7hjEwsAHVLsX/LcRVSKuXzt276XrmiFQFwX
	AUFUoo+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNTuw-0000000Cvno-0cer;
	Tue, 17 Dec 2024 09:31:02 +0000
Received: from mxout4.routing.net ([2a03:2900:1:a::9])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNTdT-0000000Cr48-1r9i;
	Tue, 17 Dec 2024 09:13:00 +0000
Received: from mxbox2.masterlogin.de (unknown [192.168.10.89])
	by mxout4.routing.net (Postfix) with ESMTP id DF765100935;
	Tue, 17 Dec 2024 09:12:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1734426778;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1qpq2TeKtX83y0CQ6eBnXEfc924KW6SAf81KBp6Mvvw=;
	b=AAoYX28FYmVngTAnmC3WEsgtfHvP43zk7Dye+lPLvLPcrTgD0Tb2sv6lWeNelJJvfG3FFm
	lfSlRUqL4CGTsMwUwH21l3PWW85+79SSx0zvVj+CVd16BZwKWnylJyk6Q0NJvEET0FL14u
	FTp03/Bp9/Pfmw7AvANQvjcN3Apa7i8=
Received: from frank-u24.. (fttx-pool-217.61.150.187.bambit.de [217.61.150.187])
	by mxbox2.masterlogin.de (Postfix) with ESMTPSA id 3311D1004DD;
	Tue, 17 Dec 2024 09:12:57 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Frank Wunderlich <frank-w@public-files.de>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v3 09/22] arm64: dts: mediatek: mt7988: Add t-phy for ssusb1
Date: Tue, 17 Dec 2024 10:12:23 +0100
Message-ID: <20241217091238.16032-10-linux@fw-web.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241217091238.16032-1-linux@fw-web.de>
References: <20241217091238.16032-1-linux@fw-web.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mail-ID: 4829692c-2fa9-453d-9b7f-c32d2c4d92c7
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_011259_635031_926749BD 
X-CRM114-Status: UNSURE (   8.62  )
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

From: Frank Wunderlich <frank-w@public-files.de>

USB controller needs phys for working properly.
On mt7988 ssusb0 uses a xs-phy, ssusb uses t-phy.
For now add the t-phy for ssusb1. We can reuse the mt7986 compatible
here.

Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
---
 arch/arm64/boot/dts/mediatek/mt7988a.dtsi | 25 +++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt7988a.dtsi b/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
index f8b01f3fff32..209d170bce7f 100644
--- a/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
@@ -349,6 +349,8 @@ usb@11200000 {
 				 <&infracfg CLK_INFRA_133M_USB_HCK_CK_P1>,
 				 <&infracfg CLK_INFRA_USB_XHCI_CK_P1>;
 			clock-names = "sys_ck", "ref_ck", "mcu_ck", "dma_ck", "xhci_ck";
+			phys = <&tphyu2port0 PHY_TYPE_USB2>,
+			       <&tphyu3port0 PHY_TYPE_USB3>;
 			status = "disabled";
 		};
 
@@ -371,6 +373,29 @@ mmc0: mmc@11230000 {
 			status = "disabled";
 		};
 
+		t-phy@11c50000 {
+			compatible = "mediatek,mt7986-tphy",
+				     "mediatek,generic-tphy-v2";
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges;
+			status = "disabled";
+
+			tphyu2port0: usb-phy@11c50000 {
+				reg = <0 0x11c50000 0 0x700>;
+				clocks = <&infracfg CLK_INFRA_USB_UTMI_CK_P1>;
+				clock-names = "ref";
+				#phy-cells = <1>;
+			};
+
+			tphyu3port0: usb-phy@11c50700 {
+				reg = <0 0x11c50700 0 0x900>;
+				clocks = <&infracfg CLK_INFRA_USB_PIPE_CK_P1>;
+				clock-names = "ref";
+				#phy-cells = <1>;
+			};
+		};
+
 		clock-controller@11f40000 {
 			compatible = "mediatek,mt7988-xfi-pll";
 			reg = <0 0x11f40000 0 0x1000>;
-- 
2.43.0



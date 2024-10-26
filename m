Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68865D10BE8
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Oct 2024 08:26:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XjxDeo6zOYxngA2g8fuyB76jH3rCT3r+Uwoyt6rnH+w=; b=FTWtwbBvkAbJHFdDFHcgdoktuH
	knnLA2oJINU8gxuq8mV7TiXDEP9WDyJ8ta9yLsIGzOiUTzt2m2YC3eaehCcTJaIHfghXaYeS50/m3
	+C28/2cRwaNo1/qD+CF8uGpyN8nUqqU5EBDmF7eb4YjTmBIgpI7joJBuxP2oivob6KE90AT7++whh
	CZvpoGHzCyb7HOpufEElb6P0RjKCvVhZD1Mps1G4amJL7j1dpyFQ3yQsuyKA9Z1zd43+SdtHEym4w
	Ig6tQhalXkCyAuck5f5Y2D5vB0UrKg89BqH6oHYyGAtm3EomPjxlmFrkWdD07hQhOAPBcZl1pbqst
	NfUvXEXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4c7s-00000006DZQ-1Gnc;
	Sat, 26 Oct 2024 08:26:24 +0000
Received: from m16.mail.163.com ([117.135.210.3])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4c1g-00000006CsG-1XN8;
	Sat, 26 Oct 2024 08:20:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-ID:MIME-Version; bh=XjxDe
	o6zOYxngA2g8fuyB76jH3rCT3r+Uwoyt6rnH+w=; b=YkmEuXK/CKkH+XsNFygVi
	UoGVVYuNqbIiwmwRf4/NnsoRn15Ai6wZB2YWE4jqeILLZKo+0yeWQTCWQW9nP5Sx
	L/dgmAFr/iVAtpdqroil8dhQCvrRld7HcqlyUsGxbh7L6YTdBcnMUwXbDE7cifts
	EhuzkBWRrb6N5ijB/omY20=
Received: from ProDesk.. (unknown [103.29.142.67])
	by gzga-smtp-mtada-g1-0 (Coremail) with SMTP id _____wD3v9wkphxnW2U0Dg--.30094S5;
	Sat, 26 Oct 2024 16:19:54 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: heiko@sntech.de
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	Andy Yan <andyshrk@163.com>
Subject: [PATCH 3/3] arm64: dts: rockchip: Enable HDMI display for rk3588 Cool Pi GenBook
Date: Sat, 26 Oct 2024 16:19:28 +0800
Message-ID: <20241026081942.348459-4-andyshrk@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241026081942.348459-1-andyshrk@163.com>
References: <20241026081942.348459-1-andyshrk@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wD3v9wkphxnW2U0Dg--.30094S5
X-Coremail-Antispam: 1Uf129KBjvJXoW7uFW3Kw15Cr4Uuw1DWFy5XFb_yoW8Ar45p3
	Z7CrZ5GFZ7WrW3JwsxAFyxAFs8trsY9FWfGryfZFy7KrsIqFn5twn7Grn2vFyDAFWxZw4f
	CFykJFyj9r1qvaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UUcTdUUUUU=
X-Originating-IP: [103.29.142.67]
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/1tbiMx2EXmccoZRKMAAAsA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241026_012000_798244_8B55D5D6 
X-CRM114-Status: UNSURE (   9.06  )
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

Enable hdmi display output on Cool Pi GenBook.

Signed-off-by: Andy Yan <andyshrk@163.com>
---

 .../rockchip/rk3588-coolpi-cm5-genbook.dts    | 51 +++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-genbook.dts b/arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-genbook.dts
index 6418286efe40..8958056105b4 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-genbook.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-genbook.dts
@@ -7,6 +7,7 @@
 /dts-v1/;
 
 #include <dt-bindings/leds/common.h>
+#include <dt-bindings/soc/rockchip,vop2.h>
 #include "rk3588-coolpi-cm5.dtsi"
 
 / {
@@ -35,6 +36,18 @@ charger: dc-charger {
 		gpios = <&gpio1 RK_PC0 GPIO_ACTIVE_LOW>;
 	};
 
+	hdmi-con {
+		compatible = "hdmi-connector";
+		type = "a";
+
+		port {
+			hdmi_con_in: endpoint {
+				remote-endpoint = <&hdmi0_out_con>;
+			};
+		};
+	};
+
+
 	leds: leds {
 		compatible = "gpio-leds";
 
@@ -347,3 +360,41 @@ &usb_host1_xhci {
 	dr_mode = "host";
 	status = "okay";
 };
+
+/* HDMI CEC is not used */
+&hdmi0 {
+	enable-gpios = <&gpio4 RK_PB0 GPIO_ACTIVE_HIGH>;
+	pinctrl-0 = <&hdmim0_tx0_hpd &hdmim0_tx0_scl &hdmim0_tx0_sda>;
+	status = "okay";
+};
+
+&hdmi0_in {
+	hdmi0_in_vp0: endpoint {
+		remote-endpoint = <&vp0_out_hdmi0>;
+	};
+};
+
+&hdmi0_out {
+	hdmi0_out_con: endpoint {
+		remote-endpoint = <&hdmi_con_in>;
+	};
+};
+
+&hdptxphy_hdmi0 {
+	status = "okay";
+};
+
+&vop {
+	status = "okay";
+};
+
+&vop_mmu {
+	status = "okay";
+};
+
+&vp0 {
+	vp0_out_hdmi0: endpoint@ROCKCHIP_VOP2_EP_HDMI0 {
+		reg = <ROCKCHIP_VOP2_EP_HDMI0>;
+		remote-endpoint = <&hdmi0_in_vp0>;
+	};
+};
-- 
2.43.0



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD922D1359F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 12:40:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=344J5ku+Gt/dhWff1sAIGZQvuDp5Q5kk2nVCCnwU/2c=; b=lEr/eYNwuNi5JOUyf8dgCnv7b3
	dlFAooIT4zXvHcxLrfvPLl6mYhyCDeBaZWAw8rEc7c5SnM1qgTHu7TznAnVacuMO3jucRnM0qy7EV
	EK0WezRusAofRxoyA5cBuz86xneThSCfPKTIq/fGqXNdADksvIIz2lK3lacd5ziz/c4A3IA8Ny/ev
	OWpwLdoiOVP+gJeIJjL4dUZj984AIJr2eq9ac/xA+Mxx3s2gGyHqaBG6x4rlusUkvTRdaR7p2UHu0
	tei2bbo14nRI+gQZu0CrF5x1USCeIe5iSl4RnsFFP5y2RZwzdWuG/Ubhhus+3i3PrJfprNf/dye5U
	5kbjbJVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5P2w-0000000Amsi-3YjG;
	Mon, 28 Oct 2024 12:40:34 +0000
Received: from m16.mail.163.com ([117.135.210.3])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5Oxm-0000000AlpT-2YhX;
	Mon, 28 Oct 2024 12:35:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-ID:MIME-Version; bh=344J5
	ku+Gt/dhWff1sAIGZQvuDp5Q5kk2nVCCnwU/2c=; b=j0C/LCqQw9VuUP7JlFZLV
	f7t5n7SqTmIbLkRGzGVmDFgqtRa/8lpjWQ5JzOuHVmPYWg+5PE2b2kyTtE7o33N2
	0GxjSNIrkbxBoOCuhnLeWGyh3N35LWD3rcGnLYqYe8fH2sM22PI6/Mbp6wz3KB/g
	km/StyM/8AuBxMMjGO9Nbg=
Received: from ProDesk.. (unknown [58.22.7.114])
	by gzga-smtp-mtada-g1-3 (Coremail) with SMTP id _____wD3f+b5hB9nytgkBw--.9113S5;
	Mon, 28 Oct 2024 20:35:09 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: heiko@sntech.de
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	Andy Yan <andyshrk@163.com>
Subject: [PATCH v2 3/3] arm64: dts: rockchip: Enable HDMI display for rk3588 Cool Pi GenBook
Date: Mon, 28 Oct 2024 20:34:58 +0800
Message-ID: <20241028123503.384866-4-andyshrk@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241028123503.384866-1-andyshrk@163.com>
References: <20241028123503.384866-1-andyshrk@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wD3f+b5hB9nytgkBw--.9113S5
X-Coremail-Antispam: 1Uf129KBjvJXoW7tFy8GF45uw4rArykur18Grg_yoW8Ar4xp3
	ZrCrZ5WFZ7WrW7JwsxAryxJFs8twsYkFWxGryfZFy7tF4aqFn5twn7Grn2vFyDAFWxZ3yf
	CFykJF1j9r1DZaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zRE_M-UUUUU=
X-Originating-IP: [58.22.7.114]
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbB0gSGXmcfgjoqQQAAsl
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_053515_079375_9E55576D 
X-CRM114-Status: UNSURE (   9.71  )
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

Changes in v2:
- Remove enable-gpios as it is unevaluated

 .../rockchip/rk3588-coolpi-cm5-genbook.dts    | 50 +++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-genbook.dts b/arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-genbook.dts
index 6418286efe40..da7a19f1fe58 100644
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
 
@@ -347,3 +360,40 @@ &usb_host1_xhci {
 	dr_mode = "host";
 	status = "okay";
 };
+
+/* HDMI CEC is not used */
+&hdmi0 {
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



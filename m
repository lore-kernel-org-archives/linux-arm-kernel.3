Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AB8BD10C0B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 12:45:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6GXIRh4j3i518ko1cqgv7mz2+TyzA7OmqSNKoxe1+2M=; b=H4nnML8oqvRGzyz+FYq9ffxhNT
	I3TNU5ypGKplDrl5tuUtbAfh9qb7Zt2afiJ9C38Xh+K7PhJ7ZwehayvBPqTHZVudwhpu82zzJefvf
	OIWfw7PQ8WGOxxVjnODzxFKldNd3gmAJttNxztbLCKifvObdk+k8QphIGefvoQGP8Nvf1AKd1CuTb
	ZW+86qOZ9m9usBhXMomEpTuPVUi1Jy4RvQ1k6euAsYVgIyAu36YUhpNYO8CCilYPXREmYFnT/8xLB
	Pltwdswt+CQ3tMUL/2Vq2CwXGIjfQ0q2gbxSOt8IXFjOObVa1YrpQ6BGts7HU+uRAc9zpH1Arlz44
	yVEhGoDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5P7k-0000000AoXw-0kOS;
	Mon, 28 Oct 2024 12:45:32 +0000
Received: from m16.mail.163.com ([117.135.210.3])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5Oxo-0000000AlpI-1knB;
	Mon, 28 Oct 2024 12:35:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-ID:MIME-Version; bh=6GXIR
	h4j3i518ko1cqgv7mz2+TyzA7OmqSNKoxe1+2M=; b=A9E7NStithBvNIB9BsLnn
	uH8DNRgS8Bm0O9kkjTt2Kll5x3tPSjEXKPicflFAAWmWxQfLY27+Bn180LQHfuW9
	G+sCg6nCF8sBojvmhDWh+ZEZtP8K9K4lGtLwOHHTrrkh5E6SYFKxhLWL/am11grn
	+uyjNaBMJsH9yN0cFFeIi8=
Received: from ProDesk.. (unknown [58.22.7.114])
	by gzga-smtp-mtada-g1-3 (Coremail) with SMTP id _____wD3f+b5hB9nytgkBw--.9113S3;
	Mon, 28 Oct 2024 20:35:09 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: heiko@sntech.de
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	Andy Yan <andyshrk@163.com>
Subject: [PATCH v2 1/3] arm64: dts: rockchip: Enable HDMI0 for rk3588 Cool Pi CM5 EVB
Date: Mon, 28 Oct 2024 20:34:56 +0800
Message-ID: <20241028123503.384866-2-andyshrk@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241028123503.384866-1-andyshrk@163.com>
References: <20241028123503.384866-1-andyshrk@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wD3f+b5hB9nytgkBw--.9113S3
X-Coremail-Antispam: 1Uf129KBjvJXoWxJrWfZw48Kw18Xr13GFW5GFg_yoW8Ww17p3
	ZxurZ5GFZ3WFW7tw45Arn7tFs0yws5urW3GwnxZFy7tr4agFnYyw18GwnavFyDZFZrZayx
	CF1kJF1j9r4Dtr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pEU73DUUUUU=
X-Originating-IP: [58.22.7.114]
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/1tbiMxGGXmcfhCYMvQAAsR
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_053516_879518_7CE00911 
X-CRM114-Status: UNSURE (   9.57  )
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

As the hdmi-qp controller recently get merged, we can enable the
HDMI0 display on this board now.

Signed-off-by: Andy Yan <andyshrk@163.com>

---

Changes in v2:
- Remove enable-gpios as it is unevaluated
- Remove pinctrl setting as it use the default

 .../dts/rockchip/rk3588-coolpi-cm5-evb.dts    | 47 +++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-evb.dts b/arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-evb.dts
index a4946cdc3bb3..010a1f2761e6 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-evb.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-evb.dts
@@ -7,6 +7,7 @@
 /dts-v1/;
 
 #include <dt-bindings/leds/common.h>
+#include <dt-bindings/soc/rockchip,vop2.h>
 #include "rk3588-coolpi-cm5.dtsi"
 
 / {
@@ -22,6 +23,17 @@ backlight: backlight {
 		pwms = <&pwm2 0 25000 0>;
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
 	leds: leds {
 		compatible = "gpio-leds";
 
@@ -214,3 +226,38 @@ &usb_host1_ehci {
 &usb_host1_ohci {
 	status = "okay";
 };
+
+&hdmi0 {
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



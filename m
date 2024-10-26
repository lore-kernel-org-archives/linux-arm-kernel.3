Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EC64D10BEB
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Oct 2024 08:23:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=50erLDHaCcD3189jmEiSuXIG5d+DYHBnUbc/wg7QSIQ=; b=m1KFZ0P9TA2McClgfTS5aMbnyP
	vQckHMqg8/c72TY8pVnoZF6eRoQeYjE2AladPhmvvqCw9i9infFda0CS2oYloplqmTSKY4pjvfvyL
	PDzLbyr70mYriiJjAcmDPv6qMTLLb+fnuEfrV0lp0JhdiC9/90o88vF3/5LPyR1TZcQTkAHjr3v5V
	m7XaYMc84HAvznpVcxlnu7wQz8c+QPvgZK8t2+txbF8UOKyWaXlZ8oeZZ3xcn53O14qlIy8lsQd6p
	CsZQuEryyLsyrgDXP5/N5T8PVjL2abeHmPFcaa0Mhupe6Ct+qJLbz3H0toe8sFHv0wdLs8TV4l8gg
	CSjibaLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4c4n-00000006DFG-2KAG;
	Sat, 26 Oct 2024 08:23:13 +0000
Received: from m16.mail.163.com ([220.197.31.4])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4c1e-00000006CsC-2jWS;
	Sat, 26 Oct 2024 08:20:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-ID:MIME-Version; bh=50erL
	DHaCcD3189jmEiSuXIG5d+DYHBnUbc/wg7QSIQ=; b=lkCWm1gJaG9Vp1z/1Q5v2
	gdHxxlQ+kjBp79vpNhrG+rOP2oB2PVol7pSXVATs/I9JYZIuUarKjKplo6lWBCZ6
	KliH8hkHC7j+akeJczvVxrERzeKrl6lf0HxwDR6VgGy+trdqNN2lvFHX9GFuRkqy
	Sqx3sV/FxkFXsA43u6V4Ck=
Received: from ProDesk.. (unknown [103.29.142.67])
	by gzga-smtp-mtada-g1-0 (Coremail) with SMTP id _____wD3v9wkphxnW2U0Dg--.30094S3;
	Sat, 26 Oct 2024 16:19:53 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: heiko@sntech.de
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	Andy Yan <andyshrk@163.com>
Subject: [PATCH 1/3] arm64: dts: rockchip: Enable HDMI0 for rk3588 Cool Pi CM5 EVB
Date: Sat, 26 Oct 2024 16:19:26 +0800
Message-ID: <20241026081942.348459-2-andyshrk@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241026081942.348459-1-andyshrk@163.com>
References: <20241026081942.348459-1-andyshrk@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wD3v9wkphxnW2U0Dg--.30094S3
X-Coremail-Antispam: 1Uf129KBjvJXoWxJrW3ur13Xry3tw18Cw1kuFg_yoW8Ar4fp3
	ZxurZ5WFZ3Way2yw4ayFn7tFnYyrs5urWfG343ZFyxtr4agFnYyw1UWwn2vFyDAFZrZayx
	CF1kJF1j9r1qqw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0p_Q6pfUUUUU=
X-Originating-IP: [103.29.142.67]
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/1tbiMxuEXmccoZRKCAABs-
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241026_011959_064937_F5AEC410 
X-CRM114-Status: UNSURE (   8.84  )
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

 .../dts/rockchip/rk3588-coolpi-cm5-evb.dts    | 49 +++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-evb.dts b/arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-evb.dts
index a4946cdc3bb3..2d7feb88aeeb 100644
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
 
@@ -214,3 +226,40 @@ &usb_host1_ehci {
 &usb_host1_ohci {
 	status = "okay";
 };
+
+&hdmi0 {
+	enable-gpios = <&gpio4 RK_PB0 GPIO_ACTIVE_HIGH>;
+	pinctrl-0 = <&hdmim0_tx0_cec &hdmim0_tx0_hpd &hdmim0_tx0_scl &hdmim0_tx0_sda>;
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



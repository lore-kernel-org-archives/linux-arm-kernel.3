Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F00CE7718B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Dec 2024 09:59:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V8jlnvfGiFQXdHoaqnr4XhJM0I36scpxrnTGGq7IMPs=; b=ZW9+F6AfBF5y2aWj6nFDXkk+Qy
	tg7+HO0pmTuJl1+CA/OXGF3qOSFBHgb2o2jNuECbAL2xC5nwYmp1V7E56Ta7/kgEOnvRoaErTZg5O
	1Jnz/oftnw8U2w/kwtRt8mxlVDSdhKRlHTGui5rLJ653L6OqTR2x+bv0xj9APBINMqM4jAM7VAOph
	LwvvYNcIQqXZ7H7aqRot+s24c5BifzETYry7Affnrd5VRWehVEp+hyR6EvqIhR5xNtqtlsMkJH8U5
	FLHtTXYNOjdz537bD2ZWplkAcbj+dA3MnblBlwOf5I6F0bHOGlBwCmBSRqCcZdndXjQAdJiI/df3l
	zugPQhNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tSZ1m-00000006zWA-10th;
	Tue, 31 Dec 2024 09:59:06 +0000
Received: from m16.mail.163.com ([220.197.31.5])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tSZ0Z-00000006zIL-2UiD;
	Tue, 31 Dec 2024 09:57:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-ID:MIME-Version; bh=V8jln
	vfGiFQXdHoaqnr4XhJM0I36scpxrnTGGq7IMPs=; b=cBf9DU9a3vIO2bMOB6t+X
	nxoldOp3NQXyckWyaQD2sVlH8CfIZD9fgHBw2kAz5YXODMiNCJg+k9ZwqntMyigX
	QKQZMRGFL/+N3MnU3/bK91rmKnwgyrWFaCOdtcdKjky6xyHRYE4Z1eDd2AIX1JFO
	ktoHWzPSphzxiY0qjg6GXs=
Received: from ProDesk.. (unknown [])
	by gzga-smtp-mtada-g0-0 (Coremail) with SMTP id _____wD3dxsKwHNnTaXlCw--.25571S5;
	Tue, 31 Dec 2024 17:57:38 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: heiko@sntech.de
Cc: detlev.casanova@collabora.com,
	krzk+dt@kernel.org,
	robh@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	Andy Yan <andy.yan@rock-chips.com>
Subject: [PATCH v3 3/3] arm64: dts: rockchip: Enable hdmi display on sige5
Date: Tue, 31 Dec 2024 17:57:20 +0800
Message-ID: <20241231095728.253943-4-andyshrk@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241231095728.253943-1-andyshrk@163.com>
References: <20241231095728.253943-1-andyshrk@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wD3dxsKwHNnTaXlCw--.25571S5
X-Coremail-Antispam: 1Uf129KBjvJXoW7Ar4kKr4fJw13KF4rGr4rZrb_yoW8AryDp3
	ZrurZ3GrZ5WFW7Xwn0yry0vFn8twsY9a9xGr43XFy7Kr42gas3Gw1rGr1S9r1DZFW7Za1a
	vF1kJFyY9wsrXw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jBUDXUUUUU=
X-Originating-IP: [58.22.7.114]
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbB0hbGXmdzt4XXAgADss
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241231_015752_027776_13E860D8 
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

From: Andy Yan <andy.yan@rock-chips.com>

Enable hdmi display on sige5 board.

Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
---

(no changes since v1)

 .../boot/dts/rockchip/rk3576-armsom-sige5.dts | 47 +++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts b/arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts
index 7c7331936a7f..78798b0722a3 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts
@@ -10,6 +10,7 @@
 #include <dt-bindings/leds/common.h>
 #include <dt-bindings/pinctrl/rockchip.h>
 #include <dt-bindings/pwm/pwm.h>
+#include <dt-bindings/soc/rockchip,vop2.h>
 #include <dt-bindings/usb/pd.h>
 #include "rk3576.dtsi"
 
@@ -26,6 +27,17 @@ chosen {
 		stdout-path = "serial0:1500000n8";
 	};
 
+	hdmi-con {
+		compatible = "hdmi-connector";
+		type = "a";
+
+		port {
+			hdmi_con_in: endpoint {
+				remote-endpoint = <&hdmi_out_con>;
+			};
+		};
+	};
+
 	leds: leds {
 		compatible = "gpio-leds";
 
@@ -214,6 +226,26 @@ &gpu {
 	status = "okay";
 };
 
+&hdmi {
+	status = "okay";
+};
+
+&hdmi_in {
+	hdmi_in_vp0: endpoint {
+		remote-endpoint = <&vp0_out_hdmi>;
+	};
+};
+
+&hdmi_out {
+	hdmi_out_con: endpoint {
+		remote-endpoint = <&hdmi_con_in>;
+	};
+};
+
+&hdptxphy {
+	status = "okay";
+};
+
 &i2c1 {
 	status = "okay";
 
@@ -656,3 +688,18 @@ &uart0 {
 	pinctrl-0 = <&uart0m0_xfer>;
 	status = "okay";
 };
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
+	vp0_out_hdmi: endpoint@ROCKCHIP_VOP2_EP_HDMI0 {
+		reg = <ROCKCHIP_VOP2_EP_HDMI0>;
+		remote-endpoint = <&hdmi_in_vp0>;
+	};
+};
-- 
2.34.1



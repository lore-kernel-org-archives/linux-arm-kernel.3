Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79478E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 23:11:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rYW1zACNlXR05N8hXlqTVRHQWPGQxBhhaQxHQa09CSY=; b=oRpSBcPSrjE51/dVbNsnGWG5tr
	XoxSfXydM11BTZit0xrLBJK/sGmFMPypdPzuRFfUVieotWBQrHP42j79vmDEU2AKHtEha7cAiEjDQ
	GwOIZKIqQ7j1Xilhp35WAhlbLZk3RHpLYykfKv6L8z2DSWz4SYxc52BcF09d+0lF+S9GdcnY33Nzl
	FIoOfDRebv7RRcPsgNcoQEVusZ2bIFMhYNfgmJlQdAdOWecO3Ztsc3gWwonHfQLR+dk6v8s1XxsIo
	lDwoKHqFsgxNQDSJZutARWWK8AZjHpUb5UdL2P+/7f2guFp9YbokiIw/3Hz4d9YPtaX8soQ/xvZos
	R6oGzBZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tL9O8-0000000D7UH-0cer;
	Tue, 10 Dec 2024 23:11:32 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tL9K0-0000000D6PF-0nFH;
	Tue, 10 Dec 2024 23:07:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1733872034;
	bh=vx4alJNBe3wxQKPibHh2oj0bSnQ0HrywYGQyGDY61Os=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=KNxI40KB2dN2qoLNEriFekV3LkjQzf+DPusX2YUuMSMx9QT7g3/zh47qrUbRyZGlF
	 I4F9eDJR8cTm7eCX5/46ZDQXg2FJzvNKd7091rT3+OR9tZn2avSfBUY9h2POdZYjHJ
	 DeXw2/hZwYWIgWlaSXBP0axBqJXjfGD1rQz6C9Ysri++7epm6DTTXSU62lSZQLgiUv
	 bN0Hq571rWXPvSxYnwqqG5a+kf36eZROLM/qyIQDd+lyZCUeZWN9wicmMj5XBGbxIn
	 UN4BxosrulqgMD35AyAb81imk2/Y8sCiXrQ2Cpd148bu0tVFEMJX1SztgiY8+PRr3C
	 FiwXDRWEWHCaA==
Received: from localhost (unknown [188.27.48.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id AD46817E0A4D;
	Wed, 11 Dec 2024 00:07:14 +0100 (CET)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Wed, 11 Dec 2024 01:06:17 +0200
Subject: [PATCH v2 4/4] arm64: dts: rockchip: Enable HDMI1 on rock-5b
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241211-rk3588-hdmi1-v2-4-02cdca22ff68@collabora.com>
References: <20241211-rk3588-hdmi1-v2-0-02cdca22ff68@collabora.com>
In-Reply-To: <20241211-rk3588-hdmi1-v2-0-02cdca22ff68@collabora.com>
To: Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Alexandre ARNOUD <aarnoud@me.com>, kernel@collabora.com, 
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_150716_393087_7983B6B4 
X-CRM114-Status: UNSURE (   9.31  )
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

Add the necessary DT changes to enable the second HDMI output port on
Radxa ROCK 5B.

While at it, switch the position of &vop_mmu and @vop to maintain the
alphabetical order.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts | 44 +++++++++++++++++++++++--
 1 file changed, 42 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts b/arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts
index c44d001da16978bbbb8a93d652893a786e9ea79b..9c3793d394a6f226bbbd3a88381974ea01ca7069 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts
@@ -49,6 +49,17 @@ hdmi0_con_in: endpoint {
 		};
 	};
 
+	hdmi1-con {
+		compatible = "hdmi-connector";
+		type = "a";
+
+		port {
+			hdmi1_con_in: endpoint {
+				remote-endpoint = <&hdmi1_out_con>;
+			};
+		};
+	};
+
 	leds {
 		compatible = "gpio-leds";
 		pinctrl-names = "default";
@@ -220,10 +231,32 @@ hdmi0_out_con: endpoint {
 	};
 };
 
+&hdmi1 {
+	pinctrl-0 = <&hdmim0_tx1_cec &hdmim0_tx1_hpd
+		     &hdmim1_tx1_scl &hdmim1_tx1_sda>;
+	status = "okay";
+};
+
+&hdmi1_in {
+	hdmi1_in_vp1: endpoint {
+		remote-endpoint = <&vp1_out_hdmi1>;
+	};
+};
+
+&hdmi1_out {
+	hdmi1_out_con: endpoint {
+		remote-endpoint = <&hdmi1_con_in>;
+	};
+};
+
 &hdptxphy_hdmi0 {
 	status = "okay";
 };
 
+&hdptxphy1 {
+	status = "okay";
+};
+
 &i2c0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&i2c0m2_xfer>;
@@ -891,11 +924,11 @@ &usb_host2_xhci {
 	status = "okay";
 };
 
-&vop_mmu {
+&vop {
 	status = "okay";
 };
 
-&vop {
+&vop_mmu {
 	status = "okay";
 };
 
@@ -905,3 +938,10 @@ vp0_out_hdmi0: endpoint@ROCKCHIP_VOP2_EP_HDMI0 {
 		remote-endpoint = <&hdmi0_in_vp0>;
 	};
 };
+
+&vp1 {
+	vp1_out_hdmi1: endpoint@ROCKCHIP_VOP2_EP_HDMI1 {
+		reg = <ROCKCHIP_VOP2_EP_HDMI1>;
+		remote-endpoint = <&hdmi1_in_vp1>;
+	};
+};

-- 
2.47.0



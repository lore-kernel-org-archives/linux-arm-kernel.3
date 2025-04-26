Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8088C369CB
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Apr 2025 08:37:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mXo6YIPjrSN2c1K17qouHUGEumJJRJfHpUXH7X0cEzI=; b=RGOYjFMLkni2IuXl0+ojrzqOpI
	jweKZG4MqsksV2IHbWkuB6fd+ow3zp10ESZW+Af6drZavL4Y4d2AYQZvKNG0F9Fof+fVdxJcnYS5z
	DhnwcE1RQvFeI6lb4ab+6Jhap4ghN495BDvMsXimGt8a6fDirR68VSk55ZKcEnvJgotiZg+o9VIt/
	H24HY/TCkZbImWTvljRW68xr8aBAO7U+ZEUgfONZLPTwEmjktPeH9zdoj0pl0o28xlR1C0sn/biSd
	J5dJdvyOvNZFG4yr98S7CghOo25g7LsiotKhzate1jg930IpqprAROw3JqHKi9DM1lkjedaZ/ldbj
	+h1gFAGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8b2X-00000001kHG-3A5R;
	Sat, 26 Apr 2025 08:37:37 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8ZmH-00000001eSt-1mXu
	for linux-arm-kernel@bombadil.infradead.org;
	Sat, 26 Apr 2025 07:16:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=mXo6YIPjrSN2c1K17qouHUGEumJJRJfHpUXH7X0cEzI=; b=Up5+OYHDH0DLt9fnaoxSf4n3ZX
	kkvB7k4tvROuDBw8DIqGPBPDXnbft+sknCgJRCtVjmcKjj+zRAAE8CiXpudf7k395fEHn+PLO7AkM
	IOMVEOtZ1QxMBPYOouDgDFgXMsWRblU/TZjLFZsx8GFqC7rjk9Xseo5i+6GIC+SRLgiHoqncu5LEK
	XMWAqVXQZmFkiwlQD4BFBWYLzXiGA7FSU70FbV2Au4BXbV+bQdwirfi7aj5d4YSPh0A6xQNmWCiQl
	eKVNWMDeA+mcORQ+s3DlRsLrzGWL+sZ0onoZtavcpTPZ6nRQZubVaaARwSeOpDrfnFlnslMNwa5Js
	cXXMaM+Q==;
Received: from m16.mail.163.com ([117.135.210.4])
	by desiato.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u8ZmD-0000000CEF9-2eGg
	for linux-arm-kernel@lists.infradead.org;
	Sat, 26 Apr 2025 07:16:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-ID:MIME-Version; bh=mXo6Y
	IPjrSN2c1K17qouHUGEumJJRJfHpUXH7X0cEzI=; b=aFbWVctWoxty0ezwkpQMe
	JctZBqkfM+f/sRtxMmdyvKwTfzo4qdi9SkEYwGomYOQAm1zHZn0c9fU/bS0Jygu5
	57KgATMyS4Ep6XLUzzQHb5oAz7Ez/y6nfM0a1y71QYM7jwMH388XofUAJO0Nw3P6
	Uy8McZb+MGMQ34tuyU8N2o=
Received: from ProDesk.. (unknown [])
	by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id _____wD3H1s0iAxo+8N6Cg--.20762S3;
	Sat, 26 Apr 2025 15:16:09 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: heiko@sntech.de
Cc: krzk+dt@kernel.org,
	robh@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	inux-rockchip@lists.infradead.org,
	Andy Yan <andyshrk@163.com>
Subject: [PATCH 2/2] arm64: dts: rockchip: Enable eDP display for Cool Pi GenBook
Date: Sat, 26 Apr 2025 15:15:41 +0800
Message-ID: <20250426071554.1305042-2-andyshrk@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250426071554.1305042-1-andyshrk@163.com>
References: <20250426071554.1305042-1-andyshrk@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wD3H1s0iAxo+8N6Cg--.20762S3
X-Coremail-Antispam: 1Uf129KBjvJXoW7trWxtFW8Ww1DKw48Jr1kXwb_yoW8Zr4fpw
	nrAFZagF1furW7JwnIyrn7GF1rJw4vyrW3Ca4fZFy8tF47WFykGasrW3ySyr1UJFWIvayr
	AF1qqFy2gF1qqaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zE0PfJUUUUU=
X-Originating-IP: [58.22.7.114]
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbBkAE7XmgMf-Tn0AAAss
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250426_081642_261277_6E9D8BD1 
X-CRM114-Status: UNSURE (   9.34  )
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

Cool Pi CM5 GenBook equipped with a 1080P eDP panel, the panel
connected on board with 30/40 pin connector.

There is no hpd hooked up on the board, so we need to set
hpd-absent-delay-ms in dts.

Signed-off-by: Andy Yan <andyshrk@163.com>
---

 .../rockchip/rk3588-coolpi-cm5-genbook.dts    | 47 +++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-genbook.dts b/arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-genbook.dts
index 6dc10da5215f..738637ecaf55 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-genbook.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-genbook.dts
@@ -148,6 +148,40 @@ vcc5v0_usb_host0: vcc5v0_usb30_host: regulator-vcc5v0-usb-host {
 	};
 };
 
+&edp1 {
+	force-hpd;
+	status = "okay";
+
+	aux-bus {
+		panel {
+			compatible = "edp-panel";
+			hpd-absent-delay-ms = <200>;
+			no-hpd;
+			backlight = <&backlight>;
+			power-supply = <&vcc3v3_lcd>;
+
+			port {
+				panel_in_edp: endpoint {
+					remote-endpoint = <&edp_out_panel>;
+				};
+			};
+		};
+	};
+};
+
+&edp1_in {
+	edp1_in_vp2: endpoint {
+		remote-endpoint = <&vp2_out_edp1>;
+	};
+};
+
+&edp1_out {
+	edp_out_panel: endpoint {
+		remote-endpoint = <&panel_in_edp>;
+	};
+};
+
+
 /* HDMI CEC is not used */
 &hdmi0 {
 	pinctrl-0 = <&hdmim0_tx0_hpd &hdmim0_tx0_scl &hdmim0_tx0_sda>;
@@ -170,6 +204,10 @@ &hdptxphy0 {
 	status = "okay";
 };
 
+&hdptxphy1 {
+	status = "okay";
+};
+
 &i2c4 {
 	status = "okay";
 	pinctrl-names = "default";
@@ -383,6 +421,8 @@ &usb_host1_xhci {
 };
 
 &vop {
+	assigned-clocks = <&cru DCLK_VOP2_SRC>;
+	assigned-clock-parents = <&cru PLL_V0PLL>;
 	status = "okay";
 };
 
@@ -396,3 +436,10 @@ vp0_out_hdmi0: endpoint@ROCKCHIP_VOP2_EP_HDMI0 {
 		remote-endpoint = <&hdmi0_in_vp0>;
 	};
 };
+
+&vp2 {
+	vp2_out_edp1: endpoint@ROCKCHIP_VOP2_EP_EDP1 {
+		reg = <ROCKCHIP_VOP2_EP_EDP1>;
+		remote-endpoint = <&edp1_in_vp2>;
+	};
+};
-- 
2.43.0



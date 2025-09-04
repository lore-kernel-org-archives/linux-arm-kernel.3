Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A36BCA1013
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Sep 2025 20:34:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kIJmsH+az0/YSo7SqPN3ReyR93Ep24mQtVNKj1Tqafc=; b=tIL1Km2SHjUHhZ54iN+im/0bHF
	x7xPD37B+qN4m/bx50YQBHKvHUIffgYTlo3q++jlQeuauLQlrIFvXqh2C7kQtiUfndEe1za/attY3
	X0NShpfKNucz5mz7sTQo0ZYUGwl2CXlyFoXRHb6gZ0eTaMzjMgbGnpynnjRRK2qbamCEP+JP2eK/C
	3KSq+bNA07tMWgKGAkZN63Mqmm8QHq/ges3x65TeF5IyChbJZeL67Uz+ZPIk18F9BEQ3UiZhVO5rX
	ia1170DoyNSGtEsPyy4kyQav7C5p3wbZ/M853MuT7oQxsDR6aMmUqdczdEbPT5TpxIaNdn0duboLQ
	5u6pBtpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuGel-0000000EICy-04VF;
	Thu, 04 Sep 2025 20:34:07 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuEey-0000000DYFF-3o7P;
	Thu, 04 Sep 2025 18:26:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1757010370;
	bh=ZVdFeXDHFTGKIbHi47qBjTijLaJeWpzS+AmwXx8Vgko=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=JIrxRGq3SWliP09Sjp2aJF+aVSU4eXyl5sFSGJpZ+LY1h4oR33D6cP15Hlf30yTju
	 fcfimSXRPWisGH/8Saa8V3Y+wo1h5bZLrsUWgVyJp8u5u957qzsPJV12ocye3b+I3i
	 ppDmLp32p5vdqyK2u4xuZS+lb1IjK0eYS2VvFm9UCRBwP75BGKm7p5VvgfNb16RBNP
	 m2b9+SrHTYymy8qOqQMdm5ZkV/LXjWs55XWS0dIX5weiBzNZkgLhrwv2SGjI1AR4fD
	 wY0HQVESiosKOK8/McwjxwxxCXyunCF1og6X3KCZIcKp+HJP6FKq/thEJjb2DZ2s7n
	 rsONdHfyE5Z9g==
Received: from jupiter.universe (dyndsl-091-248-191-002.ewe-ip-backbone.de [91.248.191.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7FEBD17E013C;
	Thu,  4 Sep 2025 20:26:10 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 3F47E480048; Thu, 04 Sep 2025 20:26:10 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 04 Sep 2025 20:26:03 +0200
Subject: [PATCH RFC 2/2] arm64: dts: rockchip: add USB-C DP AltMode for
 ROCK 5B family
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250904-rock5b-dp-alt-mode-v1-2-23df726b31ce@collabora.com>
References: <20250904-rock5b-dp-alt-mode-v1-0-23df726b31ce@collabora.com>
In-Reply-To: <20250904-rock5b-dp-alt-mode-v1-0-23df726b31ce@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Frank Wang <frank.wang@rock-chips.com>, 
 Zhang Yubing <yubing.zhang@rock-chips.com>
Cc: Andy Yan <andyshrk@163.com>, 
 Maud Spierings <maud_spierings@hotmail.com>, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3114;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=ZVdFeXDHFTGKIbHi47qBjTijLaJeWpzS+AmwXx8Vgko=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGi52cIp7eVpQA0Sd4OgFJVSHe8qO0vCnXosU
 qmEq3m50tCTH4kCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJoudnCAAoJENju1/PI
 O/qay8wQAJH3PDFyf3UnbO0a1rGWzh1hcXe50Z/5Q1MxNcHheOwdmwHkWa70/uVf/bhf/mOicjJ
 Yb2DRUJalYIkOrr8fwHXOwMTSZTnyrrukuxOlhgF0hjZuP0/CAFuyTyx8G0ji35rO7PeSSXxwI/
 BY4F+r1+hBuzIcKOI+SkSYKLdYlGXdvtyzsqw3oAYbT8m+WLu4Tr00vMvm1QJ9swLh/WM4AjXMj
 OYgySJ7dJ5Pe0fwernjaqEWWuBFDKuW98HRTuPOzXGz2RFBVyBzt6qXlrStDEWAivYHV7FwdN7S
 t1y7YbS1KUMM09NTb3QY+ghMjs/5wy/swkSpBHSkimghnfvlXTpi/Di0zPOBDKVOI5oqz68c4cr
 O/Z5RMikQ2cG1IH7OtIAeCXLNNb2U+B/EuXqLPHu95zesY+d1hitUTwVF8nNUVGO2rgqxky3Sq1
 EXXpguMKIDUQdKLHYolIpUWj/CpRFwZV2qyIqAtvJiKjl7mD870NKvGgPPbBEBzNYWpfxVPS1a6
 Vxomx6Oqk6pEKz0cp/ABN8JxICgmpehOKIHs3a+lZG5TZbkUfHJgJYUvHyamG3gk6WcD8B4prky
 p1DOplrdMbLPaGmt8bYVlYETLJ+vncOcrVyMDrz2/ShMEqjkjjTfypZXpgMsjtieLG9IvbgWzLK
 diBXhm+Yz/GW3rBTPE7Y3Dg==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_112613_118846_A6C9A7BF 
X-CRM114-Status: GOOD (  10.20  )
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

Enable support for USB-C DP AltMode to the ROCK 5B/5B+/5T.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 .../boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi   | 83 +++++++++++++++++++---
 1 file changed, 72 insertions(+), 11 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi
index 3bbe78810ec6f279a36d51d2fcef4a0f3f53036b..1e284dc48bd3fc2009f5f261e116bf8dbb96d7bd 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi
@@ -177,6 +177,22 @@ &cpu_l3 {
 	cpu-supply = <&vdd_cpu_lit_s0>;
 };
 
+&dp0 {
+	status = "okay";
+};
+
+&dp0_in {
+	dp0_in_vp2: endpoint {
+		remote-endpoint = <&vp2_out_dp0>;
+	};
+};
+
+&dp0_out {
+	dp0_out_con: endpoint {
+		remote-endpoint = <&usbdp_phy0_dp_in>;
+	};
+};
+
 &gpu {
 	mali-supply = <&vdd_gpu_s0>;
 	status = "okay";
@@ -352,21 +368,21 @@ ports {
 				port@0 {
 					reg = <0>;
 					usbc0_hs: endpoint {
-						remote-endpoint = <&usb_host0_xhci_to_usbc0>;
+						remote-endpoint = <&usb_host0_xhci_hs>;
 					};
 				};
 
 				port@1 {
 					reg = <1>;
 					usbc0_ss: endpoint {
-						remote-endpoint = <&usbdp_phy0_ss>;
+						remote-endpoint = <&usbdp_phy0_ss_out>;
 					};
 				};
 
 				port@2 {
 					reg = <2>;
 					usbc0_sbu: endpoint {
-						remote-endpoint = <&usbdp_phy0_sbu>;
+						remote-endpoint = <&usbdp_phy0_dp_out>;
 					};
 				};
 			};
@@ -993,18 +1009,41 @@ &usbdp_phy0 {
 	orientation-switch;
 	status = "okay";
 
-	port {
+	ports {
 		#address-cells = <1>;
 		#size-cells = <0>;
 
-		usbdp_phy0_ss: endpoint@0 {
+
+		port@0 {
 			reg = <0>;
-			remote-endpoint = <&usbc0_ss>;
+
+			usbdp_phy0_ss_out: endpoint {
+				remote-endpoint = <&usbc0_ss>;
+			};
 		};
 
-		usbdp_phy0_sbu: endpoint@1 {
+		port@1 {
 			reg = <1>;
-			remote-endpoint = <&usbc0_sbu>;
+
+			usbdp_phy0_ss_in: endpoint {
+				remote-endpoint = <&usb_host0_xhci_ss>;
+			};
+		};
+
+		port@2 {
+			reg = <2>;
+
+			usbdp_phy0_dp_in: endpoint {
+				remote-endpoint = <&dp0_out_con>;
+			};
+		};
+
+		port@3 {
+			reg = <3>;
+
+			usbdp_phy0_dp_out: endpoint {
+				remote-endpoint = <&usbc0_sbu>;
+			};
 		};
 	};
 };
@@ -1025,9 +1064,24 @@ &usb_host0_xhci {
 	usb-role-switch;
 	status = "okay";
 
-	port {
-		usb_host0_xhci_to_usbc0: endpoint {
-			remote-endpoint = <&usbc0_hs>;
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+
+			usb_host0_xhci_hs: endpoint {
+				remote-endpoint = <&usbc0_hs>;
+			};
+		};
+
+		port@1 {
+			reg = <1>;
+
+			usb_host0_xhci_ss: endpoint {
+				remote-endpoint = <&usbdp_phy0_ss_in>;
+			};
 		};
 	};
 };
@@ -1066,3 +1120,10 @@ vp1_out_hdmi1: endpoint@ROCKCHIP_VOP2_EP_HDMI1 {
 		remote-endpoint = <&hdmi1_in_vp1>;
 	};
 };
+
+&vp2 {
+	vp2_out_dp0: endpoint@a {
+		reg = <ROCKCHIP_VOP2_EP_DP0>;
+		remote-endpoint = <&dp0_in_vp2>;
+	};
+};

-- 
2.50.1



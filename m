Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93EB2CCF2C4
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 17 Oct 2026 20:00:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b6x/Kp8xOi2aUY+TLz4iRPjIWQvgBed14O02Xbi8Tng=; b=dTfd755n8IPWlsPGJvDWW9/Hnu
	mY9H3EmD4nLSvKlMoFDmqKManX5FSPbJVMrJXHrmR+rt4ujq57yr9QuKpP1eh4KzOImJsjt6xwkKf
	lcavi3mafyq4TeCI+pjDEM+hzWIfN7JcwyLHFhvDNxH0Kgy+nfkuNSgfpADDhanzVuLAMW19+Xdvf
	gtjCRmoYv6w2NXBaOQgeJjtA8A/Ix4JXKGNsYB8cmXGhdw6zXTrGaXMKCJ7vtbmSKvsg368ITgoxr
	vw5jSFSOEHokoI+fgmHnitGe+yx61nWJckNmJ7Lsyn0Q7IfPZ44Z8Rqu5S331NC3sLJg5SBez8J80
	Cu2CGwig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIAZP-00000005BqN-1Jp4;
	Sat, 17 Oct 2026 19:59:55 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIAZM-00000005BpH-0Pdf;
	Sat, 17 Oct 2026 19:59:52 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 3790560AB6;
	Sat, 17 Oct 2026 19:59:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A96241F000C4;
	Sat, 17 Oct 2026 19:59:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792267190;
	bh=b6x/Kp8xOi2aUY+TLz4iRPjIWQvgBed14O02Xbi8Tng=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=D5iauik+evaorGOYj4sTRWa1Mn7lwhLPMj9SKBO9V3RY+iXiOWGym0uB+kC/S7s7T
	 r26g4Hu764goQ/4TWIVS7v7Bb1owWqP8DAMWyfIi1GH4+/TggUNF0pRyGUvoer1AGY
	 mFqo2DYe9VrYbyT+FNlHij94IpcMa0puJu5x4urgJeqnWZzCtV1rCfThhuXLaa2vmw
	 NqPKBcz9a3LO33t6167UOc+T/CJYWBo+Fdd3j+i5LWxM/GOAidzqVpK9g/rvNQormf
	 aGTC4M9IXbx2PAn531xXROlP14NyaJB9fHUtEvxDtvAsQUCxSgpPEBb/WPI9XMGxHZ
	 3bRLlr3rSHLOw==
Received: by venus (Postfix, from userid 1000)
	id E7A72182306; Sat, 17 Oct 2026 21:59:47 +0200 (CEST)
From: Sebastian Reichel <sre@kernel.org>
Date: Sat, 17 Oct 2026 21:59:31 +0200
Subject: [PATCH v2 2/4] arm64: dts: rockchip: Use DP AltMode defines
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261017-dp-altmode-dt-defines-v2-2-7ab3d93553dd@collabora.com>
References: <20261017-dp-altmode-dt-defines-v2-0-7ab3d93553dd@collabora.com>
In-Reply-To: <20261017-dp-altmode-dt-defines-v2-0-7ab3d93553dd@collabora.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, kernel@collabora.com, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4775;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=dLj06PdzaXoQ/MRztpv2FwAR7EE6fTRcz9YTkVy5hGI=;
 b=owEBbQKS/ZANAwAKAdju1/PIO/qaAcsmYgBq09OySAHuIBLHkMu1s6kq+78sFM5J65mx8MQZB
 EZ4KpzUmayJAjMEAAEKAB0WIQTvZg0HRj+Lcmp5VBPY7tfzyDv6mgUCatPTsgAKCRDY7tfzyDv6
 mqTcEACbBNsJys1DCkaI4czEAGO5tVlrGHdYky/SWK9bnJbDRfX3uS1NoEHAFU3eug2B50dfAY4
 m3GGe9hZXURuTkLXDotsV0SfUFqxhMJSnu/Qll6d6/oBR6Dv3DvzJEyMGKOFnUThyF3Li6NFemQ
 gyo9Ug2i8npsvF51xu8TFoAIbySH0GoemVMEdC6Nvmulnb8aI0tEsfl8IZ730gtcBYEmV58nrpQ
 oSXUW4z6GSyfbUNVQRcwtukPL6G9JfgqeN7DMvvaX3uMEGxhqlAr1pqEQCCQ13eKUP1ip/lrT7p
 WT3A3aCFVCpGo0d92WvsczaexxaveYWfYtQbiygn4iwK1Ag6simds/csZfel0nDjW4/j8dvXnl1
 QTDf9WboQzd4VhA7LD6kzZ0ZV0Zt3kT1qoCHyDwFrA3IlpUnK6ssmMIFOUeACw+Ljz1rOl+Eked
 VCdGI3mrJhkTSqzhk05qAEGsZbLUB/D9sIsw3ee9CPY7Z+xGteOa2ePWqXbID11YQM50MEXRL3B
 OWQ5YQY+aJvCsUPIrgrlDLp4jHT4sspxpz8LYZn4qP2oXcWLrS0WCnlGFYd2gAjHxSnv5qfFJR/
 7c268bhni2fvFZwdo2P18uWY4sC4lBaI+/A48qVzYDYhuZzabHBgzP41yTQExTzlnsEM2KafvOb
 mgDMrxeH3tQkjyA==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
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

From: Sebastian Reichel <sebastian.reichel@collabora.com>

Use the new USB-C DP AltMode defines for the SVID and the capabilities
VDO to make the DTs more readable. This also fixes up announcing
0xffffffff, which is simply wrong as that allows using the port in
upfacing mode (i.e. the board receiving DisplayPort data, bandwidth
above HBR3 or pin configurations not handled by USBDP.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 arch/arm64/boot/dts/rockchip/rk3576-anbernic-rg-vita-pro.dts | 8 ++++++--
 arch/arm64/boot/dts/rockchip/rk3576-armsom-cm5-io.dts        | 8 ++++++--
 arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts         | 8 ++++++--
 arch/arm64/boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi      | 8 ++++++--
 arch/arm64/boot/dts/rockchip/rk3588s-indiedroid-nova.dts     | 8 ++++++--
 5 files changed, 30 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576-anbernic-rg-vita-pro.dts b/arch/arm64/boot/dts/rockchip/rk3576-anbernic-rg-vita-pro.dts
index 358dea43f9b6..621f786147d5 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576-anbernic-rg-vita-pro.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3576-anbernic-rg-vita-pro.dts
@@ -911,8 +911,12 @@ connector {
 
 			altmodes {
 				displayport {
-					svid = /bits/ 16 <0xff01>;
-					vdo = <0xffffffff>;
+					svid = /bits/ 16 <USB_SVID_DP_ALTMODE>;
+					vdo = <VDO_DP(DP_CAP_DPAM_V2_0, DP_CAP_CABLE_TYPE_PASSIVE,
+						      DP_CAP_UHBR_13_5_UNSUPPORTED,
+						      DP_PIN_UFP_NONE, DP_PIN_DFP_C_D_E,
+						      DP_CAP_USB2_USED, DP_CAP_RECEPTACLE,
+						      DP_CAP_SIGNALLING_HBR3, DP_CAP_DFP_D)>;
 				};
 			};
 
diff --git a/arch/arm64/boot/dts/rockchip/rk3576-armsom-cm5-io.dts b/arch/arm64/boot/dts/rockchip/rk3576-armsom-cm5-io.dts
index ebb231271e45..d154e9037ed0 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576-armsom-cm5-io.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3576-armsom-cm5-io.dts
@@ -204,8 +204,12 @@ PDO_FIXED(9000, 3000, PDO_FIXED_USB_COMM)
 
 			altmodes {
 				displayport {
-					svid = /bits/ 16 <0xff01>;
-					vdo = <0xffffffff>;
+					svid = /bits/ 16 <USB_SVID_DP_ALTMODE>;
+					vdo = <VDO_DP(DP_CAP_DPAM_V2_0, DP_CAP_CABLE_TYPE_PASSIVE,
+						      DP_CAP_UHBR_13_5_UNSUPPORTED,
+						      DP_PIN_UFP_NONE, DP_PIN_DFP_C_D_E,
+						      DP_CAP_USB2_USED, DP_CAP_RECEPTACLE,
+						      DP_CAP_SIGNALLING_HBR3, DP_CAP_DFP_D)>;
 				};
 			};
 
diff --git a/arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts b/arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts
index 4ac4465e39a5..e457fb37f3b3 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts
@@ -711,8 +711,12 @@ connector {
 
 			altmodes {
 				displayport {
-					svid = /bits/ 16 <0xff01>;
-					vdo = <0xffffffff>;
+					svid = /bits/ 16 <USB_SVID_DP_ALTMODE>;
+					vdo = <VDO_DP(DP_CAP_DPAM_V2_0, DP_CAP_CABLE_TYPE_PASSIVE,
+						      DP_CAP_UHBR_13_5_UNSUPPORTED,
+						      DP_PIN_UFP_NONE, DP_PIN_DFP_C_D_E,
+						      DP_CAP_USB2_USED, DP_CAP_RECEPTACLE,
+						      DP_CAP_SIGNALLING_HBR3, DP_CAP_DFP_D)>;
 				};
 			};
 
diff --git a/arch/arm64/boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi
index 13aaf63ad093..163ad7eef4fd 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi
@@ -346,8 +346,12 @@ usb_con: connector {
 
 			altmodes {
 				displayport {
-					svid = /bits/ 16 <0xff01>;
-					vdo = <0xffffffff>;
+					svid = /bits/ 16 <USB_SVID_DP_ALTMODE>;
+					vdo = <VDO_DP(DP_CAP_DPAM_V2_0, DP_CAP_CABLE_TYPE_PASSIVE,
+						      DP_CAP_UHBR_13_5_UNSUPPORTED,
+						      DP_PIN_UFP_NONE, DP_PIN_DFP_C_D_E,
+						      DP_CAP_USB2_USED, DP_CAP_RECEPTACLE,
+						      DP_CAP_SIGNALLING_HBR3, DP_CAP_DFP_D)>;
 				};
 			};
 
diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-indiedroid-nova.dts b/arch/arm64/boot/dts/rockchip/rk3588s-indiedroid-nova.dts
index ed36c27c2320..8f6f32ee2074 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-indiedroid-nova.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-indiedroid-nova.dts
@@ -392,8 +392,12 @@ usb_con: connector {
 
 			altmodes {
 				displayport {
-					svid = /bits/ 16 <0xff01>;
-					vdo = <0xffffffff>;
+					svid = /bits/ 16 <USB_SVID_DP_ALTMODE>;
+					vdo = <VDO_DP(DP_CAP_DPAM_V2_0, DP_CAP_CABLE_TYPE_PASSIVE,
+						      DP_CAP_UHBR_13_5_UNSUPPORTED,
+						      DP_PIN_UFP_NONE, DP_PIN_DFP_C_D_E,
+						      DP_CAP_USB2_USED, DP_CAP_RECEPTACLE,
+						      DP_CAP_SIGNALLING_HBR3, DP_CAP_DFP_D)>;
 				};
 			};
 

-- 
2.53.0



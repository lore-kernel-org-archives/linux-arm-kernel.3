Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F0C2106B503
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 11:51:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/To38VV3/g+pv3VuMCUopN76WfSUJj2KyEUnMe4Sos4=; b=Zc5VG57gkALe6S6+bjD4/Wq3ja
	Fx2+Zevh1U/uKjpGxaZqBaX7vsScgjYa6xkyQwM1heUbx43q23Msut4bXM7i2mmG0wTsfS2STsjN1
	juRS5PAW4g8zYezt2rcfuX+hPNY4Rh3xeUcGl1+eMeYAo+gnnuSE0BZzFumI3hfUB/rrdhBQ9lbAG
	dJY4rJR1OzXBPXpKuaB9vyqgv82KwFJ74HOzUz6j6hTAD0G6XGIZiHZiiys8C6gfwi7k9wXPeW7fT
	m6ubPGyDSyf6QuWV6VwB9Dsax/OOr35wiBSvm2gmxwX+wIsaU2t4VRJ8QrZ+O9DsimzNqTEkXT5ie
	ub0kQmHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5Mlo-00000003JHg-3aTw;
	Wed, 25 Mar 2026 11:51:32 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5MlS-00000003J3B-2b2G;
	Wed, 25 Mar 2026 11:51:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id ECD08439C7;
	Wed, 25 Mar 2026 11:51:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CE0F6C2BCB2;
	Wed, 25 Mar 2026 11:51:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774439469;
	bh=5L+7w/FMnAPGvTLC4Uwd39hUyOqoTG0DL3LkoLgAD90=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=NHA3V2EbB9eo8/G81aLUHPHNms/fRon7e72nGV67WYo5ZWakpAjY7Khjnv1ILJM0+
	 EEmr79DImtY0KcpxV9O3yc4EWUVobbvGMoXy3Ada8PXlXdk/NTktRRkDrqVHw6tndb
	 YiDY5tcXeNT5y0oHdbJv34QKXINJEyEBtOfwS1QhkW4lfcvCY4hPcqMvErwhex4CIY
	 0E7Lk9OqrXdrxKt/RcFNtwPX6ETIOtbP8dNIW3ZmmWF+H4PR4o5eHufJ35bVlZ0cF3
	 Uq/gBcAE8ypgwX1hccpl603WnyfdXh+Cx3n7tqvToqvdIi0NBrYJ4KgPrEAVB4cnzw
	 Hj1wDrMbNwuJA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C148EFEC11B;
	Wed, 25 Mar 2026 11:51:09 +0000 (UTC)
From: Michael Riesch via B4 Relay <devnull+michael.riesch.collabora.com@kernel.org>
Date: Wed, 25 Mar 2026 12:51:11 +0100
Subject: [PATCH v3 6/9] arm64: dts: rockchip: add vicap node to rk3588
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250430-rk3588-vicap-v3-6-e38e428868cc@collabora.com>
References: <20250430-rk3588-vicap-v3-0-e38e428868cc@collabora.com>
In-Reply-To: <20250430-rk3588-vicap-v3-0-e38e428868cc@collabora.com>
To: Mehdi Djait <mehdi.djait@linux.intel.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Kever Yang <kever.yang@rock-chips.com>, 
 Jagan Teki <jagan@amarulasolutions.com>, 
 =?utf-8?q?=D0=9A=D1=83=D0=B7=D0=BD=D0=B5=D1=86=D0=BE=D0=B2_=D0=9C=D0=B8=D1=85=D0=B0=D0=B8=D0=BB?= <mai.kuznetsov.misha@gmail.com>, 
 Charalampos Mitrodimas <charmitro@posteo.net>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Collabora Kernel Team <kernel@collabora.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Michael Riesch <michael.riesch@collabora.com>
X-Mailer: b4 0.12.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774439467; l=3247;
 i=michael.riesch@collabora.com; s=20250410; h=from:subject:message-id;
 bh=hvR3DNjF4Z+gqzZ4KtJS+9HylbHwDx6q1Xxnc+ArBRM=;
 b=ixDIfg3ZxPVtoVby/vNTd2lrTGli7/Ciu2aUG8rhbq/UFyE9Hiq4fWKz5kmm6v/Ievl7njgrI
 cUIigAJXIPxAPrdXAgQHcaIw36GbeCDpWvr48GpJjsOQlVZwemERuxc
X-Developer-Key: i=michael.riesch@collabora.com; a=ed25519;
 pk=+MWX1fffLFZtTPG/I6XdYm/+OSvpRE8D9evQaWbiN04=
X-Endpoint-Received: by B4 Relay for michael.riesch@collabora.com/20250410
 with auth_id=371
X-Original-From: Michael Riesch <michael.riesch@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_045110_727506_B3DD409C 
X-CRM114-Status: GOOD (  10.09  )
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
Reply-To: michael.riesch@collabora.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Michael Riesch <michael.riesch@collabora.com>

Add the device tree node for the RK3588 Video Capture (VICAP) unit.

Signed-off-by: Michael Riesch <michael.riesch@collabora.com>
---
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi | 91 +++++++++++++++++++++++++++
 1 file changed, 91 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
index 6c593b0255c3..8b98e5c3cc8b 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
@@ -1430,6 +1430,89 @@ av1d: video-codec@fdc70000 {
 		resets = <&cru SRST_A_AV1>, <&cru SRST_P_AV1>, <&cru SRST_A_AV1_BIU>, <&cru SRST_P_AV1_BIU>;
 	};
 
+	vicap: video-capture@fdce0000 {
+		compatible = "rockchip,rk3588-vicap";
+		reg = <0x0 0xfdce0000 0x0 0x800>;
+		interrupts = <GIC_SPI 155 IRQ_TYPE_LEVEL_HIGH 0>;
+		clocks = <&cru ACLK_VICAP>, <&cru HCLK_VICAP>,
+			 <&cru DCLK_VICAP>, <&cru ICLK_CSIHOST0>,
+			 <&cru ICLK_CSIHOST1>;
+		clock-names = "aclk", "hclk", "dclk", "iclk0", "iclk1";
+		iommus = <&vicap_mmu>;
+		power-domains = <&power RK3588_PD_VI>;
+		resets = <&cru SRST_A_VICAP>, <&cru SRST_H_VICAP>,
+			 <&cru SRST_D_VICAP>, <&cru SRST_CSIHOST0_VICAP>,
+			 <&cru SRST_CSIHOST1_VICAP>,
+			 <&cru SRST_CSIHOST2_VICAP>,
+			 <&cru SRST_CSIHOST3_VICAP>,
+			 <&cru SRST_CSIHOST4_VICAP>,
+			 <&cru SRST_CSIHOST5_VICAP>;
+		reset-names = "arst", "hrst", "drst", "irst0", "irst1",
+			      "irst2", "irst3", "irst4", "irst5";
+		status = "disabled";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			vicap_dvp: port@0 {
+				reg = <0>;
+			};
+
+			vicap_mipi0: port@1 {
+				reg = <1>;
+			};
+
+			vicap_mipi1: port@2 {
+				reg = <2>;
+			};
+
+			vicap_mipi2: port@3 {
+				reg = <3>;
+
+				vicap_mipi2_input: endpoint {
+					remote-endpoint = <&csi2_output>;
+				};
+			};
+
+			vicap_mipi3: port@4 {
+				reg = <4>;
+			};
+
+			vicap_mipi4: port@5 {
+				reg = <5>;
+
+				vicap_mipi4_input: endpoint {
+					remote-endpoint = <&csi4_output>;
+				};
+			};
+
+			vicap_mipi5: port@6 {
+				reg = <6>;
+			};
+
+			vicap_toisp0: port@10 {
+				reg = <16>;
+			};
+
+			vicap_toisp1: port@11 {
+				reg = <17>;
+			};
+		};
+	};
+
+	vicap_mmu: iommu@fdce0800 {
+		compatible = "rockchip,rk3588-iommu", "rockchip,rk3568-iommu";
+		reg = <0x0 0xfdce0800 0x0 0x40>, <0x0 0xfdce0900 0x0 0x40>;
+		interrupts = <GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH 0>;
+		clocks = <&cru ACLK_VICAP>, <&cru HCLK_VICAP>;
+		clock-names = "aclk", "iface";
+		#iommu-cells = <0>;
+		power-domains = <&power RK3588_PD_VI>;
+		rockchip,disable-mmu-reset;
+		status = "disabled";
+	};
+
 	csi2: csi@fdd30000 {
 		compatible = "rockchip,rk3588-mipi-csi2", "rockchip,rk3568-mipi-csi2";
 		reg = <0x0 0xfdd30000 0x0 0x10000>;
@@ -1452,6 +1535,10 @@ csi2_in: port@0 {
 
 			csi2_out: port@1 {
 				reg = <1>;
+
+				csi2_output: endpoint {
+					remote-endpoint = <&vicap_mipi2_input>;
+				};
 			};
 		};
 	};
@@ -1478,6 +1565,10 @@ csi4_in: port@0 {
 
 			csi4_out: port@1 {
 				reg = <1>;
+
+				csi4_output: endpoint {
+					remote-endpoint = <&vicap_mipi4_input>;
+				};
 			};
 		};
 	};

-- 
2.39.5




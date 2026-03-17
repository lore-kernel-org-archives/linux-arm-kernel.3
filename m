Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9429CF33825
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 09:32:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nbGUsvFbU+gscLcuzGgtAOPXu8HqUHpDf0RrIhNL7Is=; b=KhO2WvMXXQkmDcHGBmrSP9jQtB
	X+G15ZeLjlR2xbeMn4XUaYgb3oPmVDuhBCclFPAxQmMX+YwV6d7PpIzaMbZPAXctLfjJzSHP4lJRE
	NFkDn8rMDylLiehj1L/rB5P/cz2jJLUGIVh3lJlFQsOubVCJ3y9LH+csqDaqO8vDf15AWnLeZk2Wn
	MO86jIJ8AfsFJFgGK3TQzPmDkHJeB93I7jACedcRN+C5xlAaTv6B5992i1ySFKs5LawP6ZiZgwKg6
	uZ/ENe1kgZ5TZkJIOYHV555eo2FblPh0XMycSBL3IvnPlpu5K2LXIKpGyzMq9ezpkc+96U6QH0Wzs
	ppnh/AEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Qmp-00000005sg3-3KDX;
	Tue, 17 Mar 2026 09:32:27 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Qmn-00000005sdn-2Lxr;
	Tue, 17 Mar 2026 09:32:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id CDADF6183C;
	Tue, 17 Mar 2026 09:32:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4309DC2BCC4;
	Tue, 17 Mar 2026 09:32:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773739944;
	bh=vi4e3/G+GT0yYW4Lnppucac1AE/42afeV4FuzhAojdo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=nN9Dysq+BpJJavWaN+HAaTp5D1t5NGWBV3K1bcmpTiMtvVocGeSQZ3cA+RwH5EqLm
	 qhmOTFeiZC9VNOxC6DjEU7aicDpZMoHkwcU06WpL9t3H4Ze1qidDn6psayfv3MT3+/
	 VjXXpgMni7RRyoQSBziOthR7ekRH0vyafsJZt//iBD7D9f76SDxB7wipmakVWqwj3c
	 0QfTpjpEer7lMnzXo1GrQa2542yXWi/+DyewEG6Uxij/pYm5iRo85uSGrLDH766T8f
	 BxL5+S/usXp6Wv317Vezp2bNywl1f93PYnixLbNz4ZuVWr0gSYl3fk2fBtkmGbODzs
	 pw5nHw8bn1uLA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A848F33829;
	Tue, 17 Mar 2026 09:32:24 +0000 (UTC)
From: Michael Riesch via B4 Relay <devnull+michael.riesch.collabora.com@kernel.org>
Date: Tue, 17 Mar 2026 10:32:24 +0100
Subject: [PATCH v2 6/9] arm64: dts: rockchip: add vicap node to rk3588
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250430-rk3588-vicap-v2-6-77de5ee9048e@collabora.com>
References: <20250430-rk3588-vicap-v2-0-77de5ee9048e@collabora.com>
In-Reply-To: <20250430-rk3588-vicap-v2-0-77de5ee9048e@collabora.com>
To: Mehdi Djait <mehdi.djait@linux.intel.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Kever Yang <kever.yang@rock-chips.com>, 
 Jagan Teki <jagan@amarulasolutions.com>, 
 =?utf-8?q?=D0=9A=D1=83=D0=B7=D0=BD=D0=B5=D1=86=D0=BE=D0=B2_=D0=9C=D0=B8=D1=85=D0=B0=D0=B8=D0=BB?= <mai.kuznetsov.misha@gmail.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Collabora Kernel Team <kernel@collabora.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Michael Riesch <michael.riesch@collabora.com>
X-Mailer: b4 0.12.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773739942; l=3247;
 i=michael.riesch@collabora.com; s=20250410; h=from:subject:message-id;
 bh=5m1TI1JCn0xwCW+Lu2Bsv0EUfJ/OG5gXux9j14Zr9GY=;
 b=Jr6sXsKfwnr0bmWI3Yvmdj194JbzH2OSGEd5CZTQy08iQxtnCkpLO4pfJQ5WcGS6oatN9qCbh
 8oRfDgSG5L1AnZmZxUKteBXGrPXuUmMArbhP500bubx4cmhP3jz2axb
X-Developer-Key: i=michael.riesch@collabora.com; a=ed25519;
 pk=+MWX1fffLFZtTPG/I6XdYm/+OSvpRE8D9evQaWbiN04=
X-Endpoint-Received: by B4 Relay for michael.riesch@collabora.com/20250410
 with auth_id=371
X-Original-From: Michael Riesch <michael.riesch@collabora.com>
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
index 6c593b0255c3..9c5b68fd02c7 100644
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
+				reg = <10>;
+			};
+
+			vicap_toisp1: port@11 {
+				reg = <11>;
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




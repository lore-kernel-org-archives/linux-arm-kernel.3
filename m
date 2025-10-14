Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1D0DCCD194
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Oct 2025 13:03:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SEmBCA939OWS4mfAmcDM6+KqTISrYGkdHgEDsSzoSnY=; b=f/9InBRUhMxXivQAgwNkkgu7bz
	S71yAObivMZMrSDR54Gm7VUzLRqZdNNceA90lrM5UEPuY4Pq9jXFL00MDflz9MHA6AW+ia0/c7kcB
	1BwEfbsb+gb64dpyZraB0oCiVb+1bSiBzC0rnSip+5bAPHGDh9Y+6phG3akzyIPV2vfJdqElx1XxU
	YlkmfNpWGsTYlG1FN3gMQmWw+IN87jnGwpvNnMy/G71lUJhY5t2KYqEXxoR63tvWoIapzKaa7gu/7
	wzNbbr8gZbKkQy5mjG9/4XvTSTIgpkW8lQyXRC0QA4P+zW8qwo1G+THCsGfzmKuv/spVNG/rnLsmv
	dXkF64ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8egV-0000000GMDv-3XY8;
	Tue, 14 Oct 2025 13:03:23 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8efz-0000000GLWB-3tQ0;
	Tue, 14 Oct 2025 13:02:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E85184A07E;
	Tue, 14 Oct 2025 13:02:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BE4FAC2BCB8;
	Tue, 14 Oct 2025 13:02:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760446966;
	bh=00ySgDeY2SbqvhPX9kBYvU/RMgHNCrJd0O4BG6/GCrE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=irgKxBvzMx2t4bYgyE6uBVfEdhgxzN2/um9k722kiS8oa6wHDr7tMG8Cq/T54zdsc
	 FPctOwHNMmF+Z/FgwtL8kmPOsl+Uf4U8W3Sr/CIdgN1Hzx+Ww6QN+3fJ1ZuT+8C9ao
	 GnYqRhxoCepj28/9PmV/+KfA4Cbwl4awQlI994nVvIFVZTTTwNjZ8L6X3gb3cSPejA
	 /d6hjVZff/dJp9C7oD+l1nOr1lGGx5AF1S1onooQ5HEU0XRsH7lmlE5/G/fy7oiShA
	 gJrZzjKrvZ/pwGI2Wc/rY87WOxB9fIuXIBrYcbS1ND5lOmokvULYrNrsf/0y0iKEPc
	 6cs74Vgi1FKPw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4AC3CCD192;
	Tue, 14 Oct 2025 13:02:46 +0000 (UTC)
From: Michael Riesch via B4 Relay <devnull+michael.riesch.collabora.com@kernel.org>
Date: Tue, 14 Oct 2025 15:02:01 +0200
Subject: [PATCH v12 15/18] arm64: dts: rockchip: add vicap node to rk356x
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240220-rk3568-vicap-v12-15-c6dbece6bb98@collabora.com>
References: <20240220-rk3568-vicap-v12-0-c6dbece6bb98@collabora.com>
In-Reply-To: <20240220-rk3568-vicap-v12-0-c6dbece6bb98@collabora.com>
To: Mehdi Djait <mehdi.djait@linux.intel.com>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Gerald Loacker <gerald.loacker@wolfvision.net>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Markus Elfring <Markus.Elfring@web.de>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Kever Yang <kever.yang@rock-chips.com>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Collabora Kernel Team <kernel@collabora.com>, 
 Paul Kocialkowski <paulk@sys-base.io>, 
 Alexander Shiyan <eagle.alexander923@gmail.com>, 
 Val Packett <val@packett.cool>, Rob Herring <robh@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, 
 Michael Riesch <michael.riesch@collabora.com>, 
 Michael Riesch <michael.riesch@collabora.com>
X-Mailer: b4 0.12.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760446963; l=2050;
 i=michael.riesch@collabora.com; s=20250410; h=from:subject:message-id;
 bh=lEu6UcdwUJ585mOVJj4+wXFbf1qt1nIxcP9Qq7FSezA=;
 b=X/cEUsWH0fquz2cFW0skBF0iyioBLXei2q97vfX6w/PuSsJzrtmflEuSMUFX4E3cjeICwv3bA
 xt4S1ZsE2+JCCLro/b+trgUPLvhaHbpVg6OpPkx1eSMx0bbp/+HqZLM
X-Developer-Key: i=michael.riesch@collabora.com; a=ed25519;
 pk=+MWX1fffLFZtTPG/I6XdYm/+OSvpRE8D9evQaWbiN04=
X-Endpoint-Received: by B4 Relay for michael.riesch@collabora.com/20250410
 with auth_id=371
X-Original-From: Michael Riesch <michael.riesch@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251014_060252_065857_B5F4DB79 
X-CRM114-Status: GOOD (  10.40  )
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

Add the device tree node for the RK356x Video Capture (VICAP) unit.

Signed-off-by: Michael Riesch <michael.riesch@wolfvision.net>
Signed-off-by: Michael Riesch <michael.riesch@collabora.com>
---
 arch/arm64/boot/dts/rockchip/rk356x-base.dtsi | 44 +++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi b/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi
index fd2214b6fad4..e0e4dc85a3a9 100644
--- a/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi
@@ -564,6 +564,50 @@ gpu: gpu@fde60000 {
 		status = "disabled";
 	};
 
+	vicap: video-capture@fdfe0000 {
+		compatible = "rockchip,rk3568-vicap";
+		reg = <0x0 0xfdfe0000 0x0 0x200>;
+		interrupts = <GIC_SPI 146 IRQ_TYPE_LEVEL_HIGH>;
+		assigned-clocks = <&cru DCLK_VICAP>;
+		assigned-clock-rates = <300000000>;
+		clocks = <&cru ACLK_VICAP>, <&cru HCLK_VICAP>,
+			 <&cru DCLK_VICAP>, <&cru ICLK_VICAP_G>;
+		clock-names = "aclk", "hclk", "dclk", "iclk";
+		iommus = <&vicap_mmu>;
+		power-domains = <&power RK3568_PD_VI>;
+		resets = <&cru SRST_A_VICAP>, <&cru SRST_H_VICAP>,
+			 <&cru SRST_D_VICAP>, <&cru SRST_P_VICAP>,
+			 <&cru SRST_I_VICAP>;
+		reset-names = "arst", "hrst", "drst", "prst", "irst";
+		rockchip,grf = <&grf>;
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
+			vicap_mipi: port@1 {
+				reg = <1>;
+			};
+		};
+	};
+
+	vicap_mmu: iommu@fdfe0800 {
+		compatible = "rockchip,rk3568-iommu";
+		reg = <0x0 0xfdfe0800 0x0 0x100>;
+		interrupts = <GIC_SPI 146 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&cru ACLK_VICAP>, <&cru HCLK_VICAP>;
+		clock-names = "aclk", "iface";
+		#iommu-cells = <0>;
+		power-domains = <&power RK3568_PD_VI>;
+		rockchip,disable-mmu-reset;
+		status = "disabled";
+	};
+
 	vpu: video-codec@fdea0400 {
 		compatible = "rockchip,rk3568-vpu";
 		reg = <0x0 0xfdea0000 0x0 0x800>;

-- 
2.39.5




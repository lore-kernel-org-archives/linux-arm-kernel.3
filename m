Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 232B6CA0EF5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Aug 2025 00:08:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ww6Xds5uqYhBGFBVM2/RDSmnXjrkytKoSCD6n8qZrLc=; b=qEE36ujj9vebx+KUJE9xkIewlY
	4QY020U6XEzk35ZJ7CQFNOumsmfnEYItp65tj+cya3M0aJp/dCg5lmPSIWgyqpNwmcb5Es7b3yXJI
	3F12Sdas0ykhC2zCjAUudV/Jkzm5Q9Tq32/DzMVZuO7gvEpcgFX5pbtlc6DXb08a2Vwpd1+kFzlNf
	CPVxHk7EfzyUvZp93vA+lQER+9liMbVKGiHlpURaOv9xkPxjN3NYWIqCo9aDuStCWa1ryMgGjTcxr
	IpeY1CJ5FYVDrsOz8Acce/PP64OTSAF6yR3n1sx39YgktUgZcot3J836lGTi/iaCJtD6+LGHcUjvC
	fGvT20ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo9u8-00000008yd7-1WPf;
	Tue, 19 Aug 2025 00:08:44 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo9S9-00000008vaM-1bdF;
	Mon, 18 Aug 2025 23:39:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 847D54607D;
	Mon, 18 Aug 2025 23:39:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BFE79C2BCFB;
	Mon, 18 Aug 2025 23:39:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755560387;
	bh=aZSdvEOrOWJ9ts5DS+UL4xKZ+hapoeLhXZAYdDekbBo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Mks4jQY4XNXdVrboPyU63r7wcGAD149qAB9WLX2Ltrta95Ncg3pR2xtoGIPZE5oIz
	 Da7gXlNW9I2b5HXufoxUnKiRaxFa2EBFbOB471pRCV7C3k01XiTM7xxzZbrxGv1Qfm
	 eMvZ/93lW313+spZvb+8astv4+UjoBTTmMUsuvAMY0yp9zO4L0EOiQH4x1HT31oe57
	 W0rRnIGQ5mPoa1vIWwqvfndt22es5hKm/0Yp7aXoNoZibWeEb9gMBdeO0M/0+Zgys0
	 VvSW6+BVCBZqrUezAUsS7rc7LpLuOQ8kMA7IYYc7Uaho9B4x6iK66YK8OnfSr/u6fj
	 BSRZZgeoBlh9w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7E40CA0EE4;
	Mon, 18 Aug 2025 23:39:47 +0000 (UTC)
From: Michael Riesch via B4 Relay <devnull+michael.riesch.collabora.com@kernel.org>
Date: Tue, 19 Aug 2025 01:26:02 +0200
Subject: [PATCH v10 10/13] arm64: dts: rockchip: add the vip node to px30
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240220-rk3568-vicap-v10-10-62d8a7b209b4@collabora.com>
References: <20240220-rk3568-vicap-v10-0-62d8a7b209b4@collabora.com>
In-Reply-To: <20240220-rk3568-vicap-v10-0-62d8a7b209b4@collabora.com>
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
 Michael Riesch <michael.riesch@collabora.com>, 
 Mehdi Djait <mehdi.djait@bootlin.com>
X-Mailer: b4 0.12.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755559554; l=1272;
 i=michael.riesch@collabora.com; s=20250410; h=from:subject:message-id;
 bh=m3c8bukH8JH3mEv5rImUHD4w4Q0ojy92FXQmHLGEC/M=;
 b=WkVFIPGSn7HJQ+fo0MG9h7XxAa6iGuRBWZxoSOPNxzPLu22KozfEllWyAlKKeYoICa6GMWkTz
 0Wz05qQCSr0B71gWrJOMdOs16SxmjIMbuL7rQwpEL2DwGbrIdykNyqQ
X-Developer-Key: i=michael.riesch@collabora.com; a=ed25519;
 pk=+MWX1fffLFZtTPG/I6XdYm/+OSvpRE8D9evQaWbiN04=
X-Endpoint-Received: by B4 Relay for michael.riesch@collabora.com/20250410
 with auth_id=371
X-Original-From: Michael Riesch <michael.riesch@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_163949_468956_2E1BA036 
X-CRM114-Status: GOOD (  10.15  )
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

From: Mehdi Djait <mehdi.djait@bootlin.com>

Add the device tree node for the PX30 Video Input Processor (VIP).

Signed-off-by: Mehdi Djait <mehdi.djait@bootlin.com>
[added cosmetic changes]
Signed-off-by: Michael Riesch <michael.riesch@wolfvision.net>
Signed-off-by: Michael Riesch <michael.riesch@collabora.com>
---
 arch/arm64/boot/dts/rockchip/px30.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/px30.dtsi b/arch/arm64/boot/dts/rockchip/px30.dtsi
index 46f64cd33b9b..ef52879d6a73 100644
--- a/arch/arm64/boot/dts/rockchip/px30.dtsi
+++ b/arch/arm64/boot/dts/rockchip/px30.dtsi
@@ -1280,6 +1280,18 @@ isp_mmu: iommu@ff4a8000 {
 		#iommu-cells = <0>;
 	};
 
+	cif: video-capture@ff490000 {
+		compatible = "rockchip,px30-vip";
+		reg = <0x0 0xff490000 0x0 0x200>;
+		interrupts = <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&cru ACLK_CIF>, <&cru HCLK_CIF>, <&cru PCLK_CIF>;
+		clock-names = "aclk", "hclk", "pclk";
+		power-domains = <&power PX30_PD_VI>;
+		resets = <&cru SRST_CIF_A>, <&cru SRST_CIF_H>, <&cru SRST_CIF_PCLKIN>;
+		reset-names = "axi", "ahb", "pclkin";
+		status = "disabled";
+	};
+
 	qos_gmac: qos@ff518000 {
 		compatible = "rockchip,px30-qos", "syscon";
 		reg = <0x0 0xff518000 0x0 0x20>;

-- 
2.39.5




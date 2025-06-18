Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72F2DC7115B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Jun 2025 19:11:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vC1OKgEBJoRW7BFW+L4Zt1ElSjkPpnAUqp4+kNf6zo8=; b=qRaKAU+trMUVh8c6z4c98oCGMQ
	ckkqvUUOT4TrS+0LDJBq2j9M0cBXMzOOm6k2/QIGE9c605tuWSFpA2KA1NUrFIQlu7zmzh55NVxE8
	uM4Q7JTeWaU8LNXkogHLC70rc1M68bS2kH3UbpnKUzut2ne6E6FBzlG+Vcv1QjvVBiE5Raql6lOta
	Ba8bR8mg/AWQYhk4/lRT+oounYbbVSCc6Sd80VGRyhq9h3YH7Iyr0RUkbyWCRjzwY7qnjrlWXuK88
	CNGKnLLDcQX38EoBArUs5Jd4sh5JHisSAX2s/O4JKRfZ2lgDSRimIVCl3yYjexrpGzNgfk3vjyT+7
	cQZc0JYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRyC4-0000000B9WB-45hj;
	Wed, 18 Jun 2025 19:11:32 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRv3z-0000000Ae4e-08d3;
	Wed, 18 Jun 2025 15:50:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Reply-To:Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Content-ID:Content-Description;
	bh=vC1OKgEBJoRW7BFW+L4Zt1ElSjkPpnAUqp4+kNf6zo8=; b=m1bu3FB6wrs1FfdU6OZRBQkifV
	jvdnQYENWOBok9g8pkU74NZEDtlpfAcxozrQl3HyebJGDIAFa+5NYLAYHdantwBjy2zQdlUnXzGJ5
	C8fTyfNeM9JtRj3LgoeLCvjIipzYlZ4Rf0coSJZZ/OBKBOYDpWbDojq2bdUvmxPggrszbrzM/HjiH
	FgvuMNhspALjL/sns32VvwIg4t5a1gICufXV4mCigEXIGa9Sv8VdG023Ue5O9vuRMU7UTJXPStHa6
	KlCtD8GiluqEZuB0teuYkj2kbRDAzy+q9X0QrnEwNRCUPB8yxSvYUwiwQ081Xo7u1CgBsBCp3sSWs
	ABppYn0g==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRv3u-00000004A1N-0lhV;
	Wed, 18 Jun 2025 15:50:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5630B4AA8C;
	Wed, 18 Jun 2025 15:50:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C30A3C4CEF0;
	Wed, 18 Jun 2025 15:50:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750261849;
	bh=5BRFtk/5jIDcMryMPGQHwW1SEx1AjjpWVEcTh5JdPRs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=fN9N1dg2WRhOHTDiBAvXH4xAdRt3EKsr18j5yWvDUqxlGrDps32DgjO2VEB25j/4k
	 YIAXPLvqgNw3pVdv8usGVJcMcRlz9O8hRARK6Xjl1AcdqLMQl0pLGgtw1Op4CFwq+9
	 EIWn2Noddsn8OdnyUAtDoJJkn/1um8yAIZ8dcaKbQL4ZG9Bk8JIUXNVAuTu8+k5aL5
	 V1T4o01HKnRx49n7ShO/U/mrzpHSULiZmy35QORvrA9fnvuKHAhTWaUanSOMPtjQ6H
	 20a2APn7RuspRCLW2CJkz8L4vn4T3a7PiKTlUDh2NFj+KemUhs6lH6lM5kU38TlCOi
	 SCT0d7l7wJLBg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7E70C7115D;
	Wed, 18 Jun 2025 15:50:49 +0000 (UTC)
From: Michael Riesch via B4 Relay <devnull+michael.riesch.collabora.com@kernel.org>
Date: Wed, 18 Jun 2025 17:38:05 +0200
Subject: [PATCH v9 10/13] arm64: dts: rockchip: add the vip node to px30
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240220-rk3568-vicap-v9-10-ace1e5cc4a82@collabora.com>
References: <20240220-rk3568-vicap-v9-0-ace1e5cc4a82@collabora.com>
In-Reply-To: <20240220-rk3568-vicap-v9-0-ace1e5cc4a82@collabora.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750261092; l=1272;
 i=michael.riesch@collabora.com; s=20250410; h=from:subject:message-id;
 bh=bPZJ1Uc+vxwNAO8V6hB3CEnLbtHLJAdH+/IeDgKwqBQ=;
 b=oWREpMDoRNlWONc6fEHyVeWWuaBG5sMYdKCA5y41CurdpynwdjnMsOjezOyrvfm0TPXUfzatw
 0V4Rjuv8fKNAT4MwGqbXoYDnzzd4q3KX9cRLYi1hn3dysb7ucxSYGZg
X-Developer-Key: i=michael.riesch@collabora.com; a=ed25519;
 pk=+MWX1fffLFZtTPG/I6XdYm/+OSvpRE8D9evQaWbiN04=
X-Endpoint-Received: by B4 Relay for michael.riesch@collabora.com/20250410
 with auth_id=371
X-Original-From: Michael Riesch <michael.riesch@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_165054_682579_BBFF6135 
X-CRM114-Status: UNSURE (   9.88  )
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
index feabdadfa440..7b890620a6a0 100644
--- a/arch/arm64/boot/dts/rockchip/px30.dtsi
+++ b/arch/arm64/boot/dts/rockchip/px30.dtsi
@@ -1288,6 +1288,18 @@ isp_mmu: iommu@ff4a8000 {
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




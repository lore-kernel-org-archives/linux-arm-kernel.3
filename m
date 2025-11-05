Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50719CCFA1C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Nov 2025 21:19:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nah67Wz58HCqfn8dBCUyWhoscQpKpdn3omH+G+6PS0A=; b=ZSqRQGlwteIlUtJYez4ov/jbsD
	SDDtRYfg7ygLzzAkRBMLhaSiflb4WC2QMcOqulJJQfeNlGGrDaIjQox+Y/yhCzmP4CRObeFZpGBAy
	ojmp9mtuJvDRx8LNKN50C9xYi2UbBubGwCL4ZdvvcYpKWW389aP+JK4QMBK01boAOiH/VARtgpKL3
	FC9MoBFLd69w75ToYzFgmvc3Mas9bNruh1yg+Nt/ThN1NaV1S5hBUhczsjvAbaok8A6Av/vDsxldM
	g4QZ2CSVQ/eHVURZ2oTkpV5v4tNJIaste3lGNaUIoYel1WIVj0U6LhKFp1oTV8uLQzWj1Xb3v68QK
	APlUqlVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGkuH-0000000EUYO-35DF;
	Wed, 05 Nov 2025 21:19:07 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGktx-0000000EU5D-3EZ4;
	Wed, 05 Nov 2025 21:18:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1762377520;
	bh=HT2YugA6R+JpQglGJhQu+r3GtnpE3Srg2faLNwIOQZE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=pX5785XeaN9MSnSwL2CJEFah8vNhRL8O3uSgIa5IIUsi0dsVKQvFHNPboZ1/t6VGy
	 HYMGlF/jafIWUIBCk3xUfon2NPBc/8iS7yAe6TOMu+7np1x2bdtprDcNn2WTGFcX5c
	 t9YD1NdO/D97DTeU+AuNZeMagJIob4P/4RUTgI0pyfPYexY505AVtR4IYod4lwE/iD
	 14zbJi4IQ7nOQq2nXVZRLfsFZOl8Se0bc8bOiGCKbU7u2hCgO/MHEZmy7Tp5lOFOO+
	 arFcHIVGSPsrSCy0aGHPYhJxu8F2xT+eBJsfmFn39sWISuHJXg3lY64C/eh1tAKFqu
	 /M/mfIOF6ApyQ==
Received: from beast.luon.net (unknown [IPv6:2a10:3781:2531::8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sjoerd)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 6F62117E156C;
	Wed,  5 Nov 2025 22:18:40 +0100 (CET)
Received: by beast.luon.net (Postfix, from userid 1000)
	id CC1B810F352F1; Wed, 05 Nov 2025 22:18:34 +0100 (CET)
From: Sjoerd Simons <sjoerd@collabora.com>
Date: Wed, 05 Nov 2025 22:18:07 +0100
Subject: [PATCH v3 12/13] arm64: dts: mediatek: mt7981b: Add wifi memory
 region
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251105-openwrt-one-network-v3-12-008e2cab38d1@collabora.com>
References: <20251105-openwrt-one-network-v3-0-008e2cab38d1@collabora.com>
In-Reply-To: <20251105-openwrt-one-network-v3-0-008e2cab38d1@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Ryder Lee <ryder.lee@mediatek.com>, 
 Jianjun Wang <jianjun.wang@mediatek.com>, 
 Bjorn Helgaas <bhelgaas@google.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Lee Jones <lee@kernel.org>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>, Felix Fietkau <nbd@nbd.name>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-pci@vger.kernel.org, 
 linux-phy@lists.infradead.org, netdev@vger.kernel.org, 
 Daniel Golle <daniel@makrotopia.org>, Bryan Hinton <bryan@bryanhinton.com>, 
 Sjoerd Simons <sjoerd@collabora.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_131846_015183_8582BEB8 
X-CRM114-Status: GOOD (  10.43  )
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

Add required memory region for the builtin wifi block.

Signed-off-by: Sjoerd Simons <sjoerd@collabora.com>
---
V1 -> V2: Don't set status to in this patch
---
 arch/arm64/boot/dts/mediatek/mt7981b.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt7981b.dtsi b/arch/arm64/boot/dts/mediatek/mt7981b.dtsi
index 1f4c114354660..a7be3670e0059 100644
--- a/arch/arm64/boot/dts/mediatek/mt7981b.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt7981b.dtsi
@@ -69,6 +69,11 @@ secmon_reserved: secmon@43000000 {
 			no-map;
 		};
 
+		wmcpu_emi: wmcpu-reserved@47c80000 {
+			reg = <0 0x47c80000 0 0x100000>;
+			no-map;
+		};
+
 		wo_emi0: wo-emi@47d80000 {
 			reg = <0 0x47d80000 0 0x40000>;
 			no-map;
@@ -497,6 +502,7 @@ wifi@18000000 {
 			clocks = <&topckgen CLK_TOP_NETSYS_MCU_SEL>,
 				 <&topckgen CLK_TOP_AP2CNN_HOST_SEL>;
 			clock-names = "mcu", "ap2conn";
+			memory-region = <&wmcpu_emi>;
 			resets = <&watchdog MT7986_TOPRGU_CONSYS_SW_RST>;
 			reset-names = "consys";
 			status = "disabled";

-- 
2.51.0



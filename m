Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46091E77187
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Dec 2024 11:00:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QjoOV+ZAkinCvThxRSIcNmQCq7mN+PZpFlmj0e+6WR8=; b=HuKxH0XYJWCyBCCRKjxRugXh1Y
	jsbzuw4bhvrrrfN2zJvlkn9Qd80nRXD/1ZJ4ryshxUEq8QZJjbvTRwH/jbuXfHocPWExF+3FT486v
	071PeIR9IanzlKJITtSf2zVk8lJoVOwd7Wblncg5cPFbWVjAMTQ+QTXE+Zkf+SvelN4979AKSrV3d
	pyPqeNHZG7u94aFXUS+WKRxrV2MBahCYt7pXy3+vIPo0WpkfWrdHc/DzHKjEAkzAXwBYygVfOuh5f
	sRx30GIqoGOz6o/9LV7lGVSgfNcmlOwyg/hJCOL7YLIOo4Q4uyIFnRakVYRBf1hDYAi8OuL94kLqF
	32a8cHFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNrmq-0000000GNNJ-38mP;
	Wed, 18 Dec 2024 11:00:16 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNrh0-0000000GLEh-079a;
	Wed, 18 Dec 2024 10:54:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1734519252;
	bh=epCoJXcqUsYqi+GYIyzyKTK3DIPV97DI5SVng2FaHf8=;
	h=From:To:Cc:Subject:Date:From;
	b=bfjgeqSyW/uGw9JxWiBq+jSZqZRyO7uk584FpPu5zgkQz4mc2DImn+xCrOvVnkRAP
	 yorGbIT5n7nGMKDjpl9G8VLfDPjORwZi8LisnQ7s5kGD1v2Gg4p+5DTk+JYb8rIne7
	 CSMs3gilUCf6fezlqpuXR+XYeHOTeVfbvsNPY/icHPIxcjV1t+/QcrN3k5Piovy9TS
	 7c5JCkzHl8mtIP0Ej2x8pAMslnDnpXjm/vM78hueiHWRvm7WsG9Eqqw+lOBA1TrN81
	 bNlXamfKfmMQYg8wWnDlSVxqxwTAVq7f1YY9NH43+vUTOPdKg/AsvaErhlBBbLexQK
	 3fp/nnFC2x7/w==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 15FA917E3612;
	Wed, 18 Dec 2024 11:54:12 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: linux-mediatek@lists.infradead.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com,
	macpaul.lin@mediatek.com
Subject: [PATCH] arm64: dts: mediatek: mt8188: Add tertiary eMMC/SD/SDIO controller
Date: Wed, 18 Dec 2024 11:54:09 +0100
Message-ID: <20241218105409.39165-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_025414_207428_7BC06048 
X-CRM114-Status: UNSURE (   9.46  )
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

Add a node for the third instance of the eMMC/SD/SDIO controller
found on the MT8188 SoC and keep it disabled.

It is expected that only boards that are using this controller
instance will configure and enable it.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8188.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8188.dtsi b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
index 6ef385072c9f..f2d71da50ea3 100644
--- a/arch/arm64/boot/dts/mediatek/mt8188.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
@@ -1794,6 +1794,20 @@ mmc1: mmc@11240000 {
 			status = "disabled";
 		};
 
+		mmc2: mmc@11250000 {
+			compatible = "mediatek,mt8188-mmc", "mediatek,mt8183-mmc";
+			reg = <0 0x11250000 0 0x1000>,
+			      <0 0x11e60000 0 0x1000>;
+			interrupts = <GIC_SPI 136 IRQ_TYPE_LEVEL_HIGH 0>;
+			clocks = <&topckgen CLK_TOP_MSDC30_2>,
+				 <&infracfg_ao CLK_INFRA_AO_MSDC2>,
+				 <&infracfg_ao CLK_INFRA_AO_MSDC30_2>;
+			clock-names = "source", "hclk", "source_cg";
+			assigned-clocks = <&topckgen CLK_TOP_MSDC30_2>;
+			assigned-clock-parents = <&topckgen CLK_TOP_MSDCPLL_D2>;
+			status = "disabled";
+		};
+
 		lvts_mcu: thermal-sensor@11278000 {
 			compatible = "mediatek,mt8188-lvts-mcu";
 			reg = <0 0x11278000 0 0x1000>;
-- 
2.46.1



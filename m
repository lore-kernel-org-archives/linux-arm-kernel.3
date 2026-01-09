Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88ED4D1681A
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Jan 2026 11:48:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I+5Z3RVu4YBTwrBJwNY+548d/aZzqDv8ookZBb/BtEs=; b=IvpwDdAPURTSMbqsUxToDuQe4B
	pFGLRvxive5340KWiXccODJGLTqdKbY+48PEXml3IHTbBDz0/JyKvJMGBjSotW5L5BMtEkbInUXmu
	etx0WX0pEBu5irGsFHTdLXPV2sZb2v5UXs+/fyymAJqWe5IxB7DJRAAR4Dcfrvs35QsgTjUGgu4EY
	TtMMynO+AzFyruX2/Bj9S1iITigZQkPIP54J2n+X/clyFXdjsGorKb2I3lgHQMCqAWHOg1aV+2CAk
	L2OAOKjq+xcl05uZDKtw4II2cpphDPUs10XJWZE3KTrrFGRToWHGMSKbwHsOXSLOUrAOocGHqKzxw
	HWrwkvQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veAyj-00000002FRO-4BTR;
	Fri, 09 Jan 2026 11:48:30 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veAyL-00000002Ewt-1brp;
	Fri, 09 Jan 2026 11:48:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1767959283;
	bh=O82ASAKq/ZZiQDxIMJucuo2x/rTm+Aj4VNeXdcRjSIg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cvmeO+w/9ehs0ZCizvmlkuhv/adQcZkrMmjuf7D50chvOCCqbNawnexaEz5C88Ftw
	 YKRgqeJoySCEWPUw7ic8/z47eyJa6iyq+NtS+oxnQ2Qcr0oUUsKPTkc/rcJ5cAaTvD
	 p4nesm4Nq/NqbBbwUC22BkuLi2ZVlATIZYKZPfjQFCRCd4rgiDVOxe6LrxY566EkPx
	 nLoa0W386DkrymyVvBYshtbXKGQAZeCxqjMptzHowKvOdjwBRvao6KcLNlAdVH/Tcs
	 4xgLb6GFHD9JzIvzbGq2QJ/0pxcP5fhh6XpV8uPrUXblx7UH51uyaLl+bzFvP9fb9l
	 MRMqi9aHTcyvw==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C6E7017E13D3;
	Fri,  9 Jan 2026 12:48:02 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: linux-mediatek@lists.infradead.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	sjoerd@collabora.com,
	hsinyi@chromium.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH 11/11] arm64: dts: mediatek: mt6795-xperia-m5: Add UHS pins for MMC1 and 2
Date: Fri,  9 Jan 2026 12:47:47 +0100
Message-ID: <20260109114747.37189-12-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260109114747.37189-1-angelogioacchino.delregno@collabora.com>
References: <20260109114747.37189-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260109_034805_642862_C664C0B5 
X-CRM114-Status: GOOD (  10.94  )
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

Add the UHS state pins for the MMC1 and MMC2 controllers and,
while at it, also add the correct drive strength parameters
for the default pin states for those two.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../dts/mediatek/mt6795-sony-xperia-m5.dts    | 48 ++++++++++++++++++-
 1 file changed, 46 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dts b/arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dts
index fccb948cfa45..ecd13d089ceb 100644
--- a/arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dts
+++ b/arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dts
@@ -227,8 +227,9 @@ &mmc0 {
 
 &mmc1 {
 	/* MicroSD card slot */
-	pinctrl-names = "default";
+	pinctrl-names = "default", "state_uhs";
 	pinctrl-0 = <&mmc1_pins_default>;
+	pinctrl-1 = <&mmc1_pins_uhs>;
 	vmmc-supply = <&mt6331_vmc_reg>;
 	vqmmc-supply = <&mt6331_vmch_reg>;
 	status = "okay";
@@ -236,8 +237,9 @@ &mmc1 {
 
 &mmc2 {
 	/* SDIO WiFi on MMC2 */
-	pinctrl-names = "default";
+	pinctrl-names = "default", "state_uhs";
 	pinctrl-0 = <&mmc2_pins_default>;
+	pinctrl-1 = <&mmc2_pins_uhs>;
 	vmmc-supply = <&mt6331_vmc_reg>;
 	vqmmc-supply = <&mt6331_vmch_reg>;
 	status = "okay";
@@ -324,11 +326,32 @@ pins-cmd-dat {
 				 <PINMUX_GPIO170__FUNC_MSDC1_CMD>;
 			input-enable;
 			bias-pull-up = <MTK_PUPD_SET_R1R0_01>;
+			drive-strength = <4>;
 		};
 
 		pins-clk {
 			pinmux = <PINMUX_GPIO175__FUNC_MSDC1_CLK>;
 			bias-pull-down = <MTK_PUPD_SET_R1R0_10>;
+			drive-strength = <4>;
+		};
+	};
+
+	mmc1_pins_uhs: microsd-uhs-pins {
+		pins-cmd-dat {
+			pinmux = <PINMUX_GPIO171__FUNC_MSDC1_DAT0>,
+				 <PINMUX_GPIO172__FUNC_MSDC1_DAT1>,
+				 <PINMUX_GPIO173__FUNC_MSDC1_DAT2>,
+				 <PINMUX_GPIO174__FUNC_MSDC1_DAT3>,
+				 <PINMUX_GPIO170__FUNC_MSDC1_CMD>;
+			input-enable;
+			bias-pull-up = <MTK_PUPD_SET_R1R0_01>;
+			drive-strength = <6>;
+		};
+
+		pins-clk {
+			pinmux = <PINMUX_GPIO175__FUNC_MSDC1_CLK>;
+			bias-pull-down = <MTK_PUPD_SET_R1R0_10>;
+			drive-strength = <8>;
 		};
 	};
 
@@ -341,11 +364,32 @@ pins-cmd-dat {
 				 <PINMUX_GPIO105__FUNC_MSDC2_CMD>;
 			input-enable;
 			bias-pull-up = <MTK_PUPD_SET_R1R0_01>;
+			drive-strength = <4>;
+		};
+
+		pins-clk {
+			pinmux = <PINMUX_GPIO104__FUNC_MSDC2_CLK>;
+			bias-pull-down = <MTK_PUPD_SET_R1R0_10>;
+			drive-strength = <4>;
+		};
+	};
+
+	mmc2_pins_uhs: sdio-uhs-pins {
+		pins-cmd-dat {
+			pinmux = <PINMUX_GPIO100__FUNC_MSDC2_DAT0>,
+				 <PINMUX_GPIO101__FUNC_MSDC2_DAT1>,
+				 <PINMUX_GPIO102__FUNC_MSDC2_DAT2>,
+				 <PINMUX_GPIO103__FUNC_MSDC2_DAT3>,
+				 <PINMUX_GPIO105__FUNC_MSDC2_CMD>;
+			input-enable;
+			bias-pull-up = <MTK_PUPD_SET_R1R0_01>;
+			drive-strength = <8>;
 		};
 
 		pins-clk {
 			pinmux = <PINMUX_GPIO104__FUNC_MSDC2_CLK>;
 			bias-pull-down = <MTK_PUPD_SET_R1R0_10>;
+			drive-strength = <8>;
 		};
 	};
 
-- 
2.52.0



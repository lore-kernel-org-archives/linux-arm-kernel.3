Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87579EC01B9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 09:58:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oYKl2c9T0PUJ/Zd88L75l+f8u8audmG2inQ0WTJ9Oio=; b=ddIT4u1WPCpi32luD7HKH1PMYv
	QBLiUzgNxdhDVIZFXhW8YiqDF9MhmbftX/OR1WeuT0I8Yrf2qmKVtKWyQ1c33GSj19KsYpVfEqT8X
	v2mE+3+twPpWZhgYIC/b5FSOyC2pfCySIOeH+PICXq9nxbAUKoIY0ME9RWtlMejUnTQy/cGSA1XXn
	2PGA4CB2mn3WCcBEMKOH/amfHxrFZ/PpCGeSgfaV8LtP99ckD/2/3qzuyA3DRhAXcTFiUOroJkQ9x
	0IqSzgY3Etx4M0+PFrxTH7z94OcE87ieJt3bFHtSHCsq5dCGuPsO5KVVVQgKUufFlFO3VoVuvpTUV
	T5aaGWYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4c3P-0000000GQeW-3kXk;
	Mon, 23 Mar 2026 09:58:35 +0000
Received: from pouet.aliel.fr ([65.21.61.41] helo=courrier.aliel.fr)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4c3F-0000000GQVs-3kx2;
	Mon, 23 Mar 2026 09:58:28 +0000
From: Ronald Claveau <linux-kernel-dev@aliel.fr>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aliel.fr;
	s=courrier-s1; t=1774259899;
	bh=nLzHsr5SRGXnJ4qXDllE27wn5dbe27jEjWThdkARNK4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=bnx+U5Wvh/cA2SipleVXznvvZVQWW756NQ4xJmu3oUEWx1cwUj+J8T2Yh7+JIgeuQ
	 w2znGpMOumy7zO8w4twzLcxCDKripDH1KFUkDXRghWRWxryKp/iBBhDL5Gb6E4Sf1D
	 ATTw3BzKDRbzjDKXLATkhU4oFZIw3yjTIdRiFZRY=
Date: Mon, 23 Mar 2026 10:55:28 +0100
Subject: [PATCH v3 3/9] arm64: dts: amlogic: t7: Add MMC controller nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260323-add-emmc-t7-vim4-v3-3-5159d90a984c@aliel.fr>
References: <20260323-add-emmc-t7-vim4-v3-0-5159d90a984c@aliel.fr>
In-Reply-To: <20260323-add-emmc-t7-vim4-v3-0-5159d90a984c@aliel.fr>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, 
 Johannes Berg <johannes@sipsolutions.net>, van Spriel <arend@broadcom.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mmc@vger.kernel.org, linux-wireless@vger.kernel.org, 
 Ronald Claveau <linux-kernel-dev@aliel.fr>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openssh-sha256; t=1774259894; l=2309;
 i=linux-kernel-dev@aliel.fr; s=id_ed25519; h=from:subject:message-id;
 bh=nLzHsr5SRGXnJ4qXDllE27wn5dbe27jEjWThdkARNK4=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgMGec55oxeeisqykQiUedekMYyOnR9
 BG9E/7rDWyqdNoAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QG9MimcCwQl3IDkrclTMocdwMakL26xqJ0ECX4klkPvSWc4HTeiBQxRZHQWAOyPrBYwPLHfbpf1
 eeQE/zuhbhwY=
X-Developer-Key: i=linux-kernel-dev@aliel.fr; a=openssh;
 fpr=SHA256:kch4osYZ6A1BrPps5AUs6KnfdE2wm4ocMtyTc8TmZMs
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_025826_091160_D9C11B98 
X-CRM114-Status: UNSURE (   8.08  )
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

Add device tree nodes for the three MMC controllers available
on the Amlogic T7 SoC, using amlogic,meson-axg-mmc as fallback compatible.
All nodes are disabled by default and should be
enabled in the board-specific DTS file.

Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
---
 arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi | 39 +++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
index ac8de8e9b8010..b3898669c9571 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
@@ -374,6 +374,45 @@ sec_ao: ao-secure@10220 {
 				reg = <0x0 0x10220 0x0 0x140>;
 				amlogic,has-chip-id;
 			};
+
+			sd_emmc_a: mmc@88000 {
+				compatible = "amlogic,t7-mmc", "amlogic,meson-axg-mmc";
+				reg = <0x0 0x88000 0x0 0x800>;
+				interrupts = <GIC_SPI 176 IRQ_TYPE_LEVEL_HIGH>;
+				status = "disabled";
+				clocks = <&clkc_periphs CLKID_SYS_SD_EMMC_A>,
+					 <&clkc_periphs CLKID_SD_EMMC_A>,
+					 <&scmi_clk CLKID_FCLK_DIV2>;
+				clock-names = "core", "clkin0", "clkin1";
+				assigned-clocks = <&clkc_periphs CLKID_SD_EMMC_A_SEL>;
+				assigned-clock-parents = <&xtal>;
+			};
+
+			sd_emmc_b: mmc@8a000 {
+				compatible = "amlogic,t7-mmc", "amlogic,meson-axg-mmc";
+				reg = <0x0 0x8a000 0x0 0x800>;
+				interrupts = <GIC_SPI 177 IRQ_TYPE_EDGE_RISING>;
+				status = "disabled";
+				clocks = <&clkc_periphs CLKID_SYS_SD_EMMC_B>,
+					 <&clkc_periphs CLKID_SD_EMMC_B>,
+					 <&scmi_clk CLKID_FCLK_DIV2>;
+				clock-names = "core", "clkin0", "clkin1";
+				assigned-clocks = <&clkc_periphs CLKID_SD_EMMC_B_SEL>;
+				assigned-clock-parents = <&xtal>;
+			};
+
+			sd_emmc_c: mmc@8c000 {
+				compatible = "amlogic,t7-mmc", "amlogic,meson-axg-mmc";
+				reg = <0x0 0x8c000 0x0 0x800>;
+				interrupts = <GIC_SPI 178 IRQ_TYPE_EDGE_RISING>;
+				status = "disabled";
+				clocks = <&clkc_periphs CLKID_SYS_SD_EMMC_C>,
+					 <&clkc_periphs CLKID_SD_EMMC_C>,
+					 <&scmi_clk CLKID_FCLK_DIV2>;
+				clock-names = "core", "clkin0", "clkin1";
+				assigned-clocks = <&clkc_periphs CLKID_SD_EMMC_C_SEL>;
+				assigned-clock-parents = <&xtal>;
+			};
 		};
 
 	};

-- 
2.49.0



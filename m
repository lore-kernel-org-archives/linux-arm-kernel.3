Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8509106F30F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 10:02:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qJYV2aMGvKBk7SdOxijD3x+lhGzDeP0zNnl7mW5I5/I=; b=BT4nHGUh26oijP0Nb8qtT1g4T4
	SPHqsdN/eKwp1zxzoKOmrNVOzk/8IBOZMHXNAvBO0vRnIWTRD/XoBAT1DDRg+x9aF9bNaBNG8YlGx
	0YKuTaugcXVhp5rk8LU0Txvup7Mjo3VGvhLagbvg9Y0K5xrsOeKGShQYR8LvTwoVdI19jaok2ICBt
	8qJvPgeo9pQ9Yub0dybrR/Pau1CFoqfXI/O0AfXOu0jO6GNC7OOrAUsF89Z2A1glpEhdh1T8LuhNp
	kkldpkNpYZS36NdvZ8B1EhC5m951SY2VviEINdvxybgNXHc7GwelYaS/OQEenNiZxjOYch3GiLjiB
	9eONySkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5hXZ-00000005Cx3-0ueX;
	Thu, 26 Mar 2026 10:02:13 +0000
Received: from courrier.aliel.fr ([2a01:4f9:c011:1c83::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5hXL-00000005Cq0-1dnj;
	Thu, 26 Mar 2026 10:02:07 +0000
From: Ronald Claveau <linux-kernel-dev@aliel.fr>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aliel.fr;
	s=courrier-s1; t=1774519317;
	bh=z50cReUoaX9GoqnPxRfb8M2ESTEiHmyiXX+yYCUCnAY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=jUOwOl3GEvucd0hLrjOmNy4lrVdh7/mgdS+yw2qflKrvdJpXtfb9wSJ1bDmzV1jFo
	 sxGj5fgY5PpuNTchASPtnBl+/fvUkztThC1UgDadfroVzX+9qDmlomwODW1c2K1lYZ
	 Yzkk94G+IChMyBDOHqZgO2tkYxXiSzVgpwmmayF0=
Date: Thu, 26 Mar 2026 10:59:14 +0100
Subject: [PATCH v5 3/9] arm64: dts: amlogic: t7: Add MMC controller nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260326-add-emmc-t7-vim4-v5-3-d3f182b48e9d@aliel.fr>
References: <20260326-add-emmc-t7-vim4-v5-0-d3f182b48e9d@aliel.fr>
In-Reply-To: <20260326-add-emmc-t7-vim4-v5-0-d3f182b48e9d@aliel.fr>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1774519312; l=2309;
 i=linux-kernel-dev@aliel.fr; s=id_ed25519; h=from:subject:message-id;
 bh=z50cReUoaX9GoqnPxRfb8M2ESTEiHmyiXX+yYCUCnAY=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgMGec55oxeeisqykQiUedekMYyOnR9
 BG9E/7rDWyqdNoAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QGA7rZGuJlRS3I4Zqj6o1Wl7h8UH4dEpOYz7EeGFQMRZ/lMD9CqQEq5BSkQHalit9fuCnDRIqfg
 vrG9sVZABnwI=
X-Developer-Key: i=linux-kernel-dev@aliel.fr; a=openssh;
 fpr=SHA256:kch4osYZ6A1BrPps5AUs6KnfdE2wm4ocMtyTc8TmZMs
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_030201_809389_5B5B3F8E 
X-CRM114-Status: UNSURE (   7.83  )
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
index 36d13371f56ba..fe1ced0a58967 100644
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
+				clocks = <&clkc_periphs CLKID_SYS_SD_EMMC_A>,
+					 <&clkc_periphs CLKID_SD_EMMC_A>,
+					 <&scmi_clk CLKID_FCLK_DIV2>;
+				clock-names = "core", "clkin0", "clkin1";
+				assigned-clocks = <&clkc_periphs CLKID_SD_EMMC_A_SEL>;
+				assigned-clock-parents = <&xtal>;
+				status = "disabled";
+			};
+
+			sd_emmc_b: mmc@8a000 {
+				compatible = "amlogic,t7-mmc", "amlogic,meson-axg-mmc";
+				reg = <0x0 0x8a000 0x0 0x800>;
+				interrupts = <GIC_SPI 177 IRQ_TYPE_EDGE_RISING>;
+				clocks = <&clkc_periphs CLKID_SYS_SD_EMMC_B>,
+					 <&clkc_periphs CLKID_SD_EMMC_B>,
+					 <&scmi_clk CLKID_FCLK_DIV2>;
+				clock-names = "core", "clkin0", "clkin1";
+				assigned-clocks = <&clkc_periphs CLKID_SD_EMMC_B_SEL>;
+				assigned-clock-parents = <&xtal>;
+				status = "disabled";
+			};
+
+			sd_emmc_c: mmc@8c000 {
+				compatible = "amlogic,t7-mmc", "amlogic,meson-axg-mmc";
+				reg = <0x0 0x8c000 0x0 0x800>;
+				interrupts = <GIC_SPI 178 IRQ_TYPE_EDGE_RISING>;
+				clocks = <&clkc_periphs CLKID_SYS_SD_EMMC_C>,
+					 <&clkc_periphs CLKID_SD_EMMC_C>,
+					 <&scmi_clk CLKID_FCLK_DIV2>;
+				clock-names = "core", "clkin0", "clkin1";
+				assigned-clocks = <&clkc_periphs CLKID_SD_EMMC_C_SEL>;
+				assigned-clock-parents = <&xtal>;
+				status = "disabled";
+			};
 		};
 
 	};

-- 
2.49.0



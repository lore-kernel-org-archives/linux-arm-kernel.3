Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1A43109B47A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Mar 2026 14:25:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6iG9LqwK8UZghGFZttp10pajyaDwyZY4qHwbLRT4QlU=; b=WrDhwfF4f3tUy35uJ52qdCAsxd
	V7kQ8DRwAwEAf6vKYFZW+VunGtaidL+65pn7FxO/A/14k4LQ892luDQZmEpQ3JRuEnPMwzky2AunX
	2EjJIBxxp/W6uVIu5pcb2y/wHB3G8a897HuND6qlJ2NFL6/hLSjh4KrPIEyJyjd71m8z6Gw0tIzPs
	ADcz5i+M6aJvO8RZjoBaQPZSeX+Ybsao/hUwR+soReoGMyS9kxt8IrzJ3g+V9G/z47eISbAFjq40x
	fuG9HYpXq+AO6m7bo1BUZcMjK8suGRlozVXaG3B/hfGnKRxI8COo7Fb9Exqwn7yQN/mzTnAjnLQ4q
	s5Ls2Prg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7a1g-0000000D5Jk-3ber;
	Tue, 31 Mar 2026 14:25:04 +0000
Received: from courrier.aliel.fr ([65.21.61.41])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7a1e-0000000D5Ib-1zIY;
	Tue, 31 Mar 2026 14:25:03 +0000
From: Ronald Claveau <linux-kernel-dev@aliel.fr>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aliel.fr;
	s=courrier-s1; t=1774967095;
	bh=qxFJoJrGjwGTRee41XbDZD3ZEy53tTIFlBC7/ii6Ca4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=a0bZEJnpqeyKwOWOkSPeSi4pxe5mTrY6EpukajDGCWdWkauJy8OSI4v+YdYIXvEtQ
	 feBpiHZPWWNP2FO6XJYZINfn99xKEa1dF3BRDut9OPHd2aOWarrujIP5UZZg9cplVx
	 PLcUpscbF0nSC8MiFyR2DEGphqBmk8TUi1OZ0btU=
Date: Tue, 31 Mar 2026 16:24:05 +0200
Subject: [PATCH 2/2] arm64: dts: amlogic: t7: Fix missing required reset
 property
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260331-fix-aml-t7-null-reset-v1-2-eb95b625234c@aliel.fr>
References: <20260331-fix-aml-t7-null-reset-v1-0-eb95b625234c@aliel.fr>
In-Reply-To: <20260331-fix-aml-t7-null-reset-v1-0-eb95b625234c@aliel.fr>
To: Philipp Zabel <p.zabel@pengutronix.de>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Ronald Claveau <linux-kernel-dev@aliel.fr>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openssh-sha256; t=1774967093; l=1561;
 i=linux-kernel-dev@aliel.fr; s=id_ed25519; h=from:subject:message-id;
 bh=qxFJoJrGjwGTRee41XbDZD3ZEy53tTIFlBC7/ii6Ca4=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgMGec55oxeeisqykQiUedekMYyOnR9
 BG9E/7rDWyqdNoAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QCU4/Wz8ZteqVRTInB1DatMXwUnzpYxTf+Mh7GPkDkaMVHRrsViO/qJt3PtEoSYeXtPCurOZydp
 xH1XiXwnXfAo=
X-Developer-Key: i=linux-kernel-dev@aliel.fr; a=openssh;
 fpr=SHA256:kch4osYZ6A1BrPps5AUs6KnfdE2wm4ocMtyTc8TmZMs
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_072502_665391_62373995 
X-CRM114-Status: UNSURE (   7.37  )
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

CHECK_DTBS shows missing reset required property in T7 DTBS.
A new CHECK_DTBS with this patch does not show this anymore.

Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
---
 arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
index 02a303d4ec39d..5069f29d2fbb7 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
@@ -582,6 +582,7 @@ sd_emmc_a: mmc@88000 {
 					 <&clkc_periphs CLKID_SD_EMMC_A>,
 					 <&scmi_clk CLKID_FCLK_DIV2>;
 				clock-names = "core", "clkin0", "clkin1";
+				resets = <&reset RESET_SD_EMMC_A>;
 				assigned-clocks = <&clkc_periphs CLKID_SD_EMMC_A_SEL>;
 				assigned-clock-parents = <&xtal>;
 				status = "disabled";
@@ -595,6 +596,7 @@ sd_emmc_b: mmc@8a000 {
 					 <&clkc_periphs CLKID_SD_EMMC_B>,
 					 <&scmi_clk CLKID_FCLK_DIV2>;
 				clock-names = "core", "clkin0", "clkin1";
+				resets = <&reset RESET_SD_EMMC_B>;
 				assigned-clocks = <&clkc_periphs CLKID_SD_EMMC_B_SEL>;
 				assigned-clock-parents = <&xtal>;
 				status = "disabled";
@@ -608,6 +610,7 @@ sd_emmc_c: mmc@8c000 {
 					 <&clkc_periphs CLKID_SD_EMMC_C>,
 					 <&scmi_clk CLKID_FCLK_DIV2>;
 				clock-names = "core", "clkin0", "clkin1";
+				resets = <&reset RESET_SD_EMMC_C>;
 				assigned-clocks = <&clkc_periphs CLKID_SD_EMMC_C_SEL>;
 				assigned-clock-parents = <&xtal>;
 				status = "disabled";

-- 
2.49.0



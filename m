Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDCE0C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Aug 2025 11:44:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V6ATUE4eCw/jiV1JWnK64VX5xOkhqWEWyGD6BIaf6No=; b=DaospfUlFK3QMuYv2tV7Cnlrub
	oAt23iX0mC4UcZ2ZcRi+8rcc62/s4Z8UpXRem9V9mNEwbJ3g4/bL5fKEScRz5mrsbRjg63tVHUhqi
	TyLuXkDaAX1FUiNy+tQzSFaXc2n5deYpsEBxELRsCpFh3hnCb0trhhqwd3T4DAmQiBweTkcJdz5TL
	Gg5Z8amFyVawhuC8Ifv5xDR5LwtEkH7uv9wtdsk6ddG847EnX8dg3F6+UKL/pEIK0Hjs9LK/BvwcI
	Jb/RiwLxKQXVPDsoQFh7faN5jVWQAIzG53uwEwNr+KkcSxhnQVOECpQ95jVRuBJVt5OJsSvd1WYXm
	4dzrYqAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhoBf-00000005aHj-0J4f;
	Fri, 01 Aug 2025 11:44:35 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhnmE-00000005XKE-3FsE;
	Fri, 01 Aug 2025 11:18:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1754047097;
	bh=1E5qWJ532EaXeuFQ5rmK4d9Nv2RoVjlXwP4/9o5x3c4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=YM21j3ie9AsDcLq0kEisIM0xFmGFEs/XFDgSPJIrVNEAmC0ABjM8k5jDDRw4lL9zI
	 5ll84Kz0y8GbQfylA9Fqj2d7hwkPC2rdXRuuvhtBR+eUfjHx+QDpD3dq1804voJdCY
	 +eJg6KF1rt+ESaj4dbfp8N91Vbb94XsRpc1Es6hYCxmAW10uFOoai8II4/nllzoQks
	 Yc/K/dgwZsvUrRvgiFdDJ1ldD4+LefbJBVakW9OTaYqX/D501IIe2/p6j3yVEiqh9J
	 IHDn96uwytBt5pxg8kjSLyCD5shjthi50/iJ7GJEr4xp39B3vT40X35uvMRHkGM8YI
	 4OWirEq74DZlg==
Received: from 2a01cb0892f2d600c8f85cf092d4af51.ipv6.abo.wanadoo.fr (2a01cb0892f2d600c8f85cF092d4af51.ipv6.abo.wanadoo.fr [IPv6:2a01:cb08:92f2:d600:c8f8:5cf0:92d4:af51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmassot)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3E45717E0F3C;
	Fri,  1 Aug 2025 13:18:16 +0200 (CEST)
From: Julien Massot <julien.massot@collabora.com>
Date: Fri, 01 Aug 2025 13:18:11 +0200
Subject: [PATCH 9/9] arm64: dts: mediatek: mt8183-pumkin: Fix
 pull-down/up-adv values
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250801-mtk-dtb-warnings-v1-9-6ba4e432427b@collabora.com>
References: <20250801-mtk-dtb-warnings-v1-0-6ba4e432427b@collabora.com>
In-Reply-To: <20250801-mtk-dtb-warnings-v1-0-6ba4e432427b@collabora.com>
To: kernel@collabora.com, Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Ikjoon Jang <ikjn@chromium.org>, 
 Enric Balletbo i Serra <eballetbo@kernel.org>, 
 Chen-Yu Tsai <wenst@chromium.org>, Weiyi Lu <weiyi.lu@mediatek.com>, 
 Eugen Hristev <eugen.hristev@linaro.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Julien Massot <jmassot@collabora.com>, Sean Wang <sean.wang@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-sound@vger.kernel.org, 
 linux-gpio@vger.kernel.org, Julien Massot <julien.massot@collabora.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250801_041818_971361_1641BF26 
X-CRM114-Status: GOOD (  13.32  )
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

The properties `mediatek,pull-up-adv` and `mediatek,pull-down-adv`
were using incorrect values like `<10>` and `<01>`. These values
are parsed as decimal (10 and 1 respectively), not binary.

However, the driver interprets these as bitfields:
  - BIT(0): R0
  - BIT(1): R1

So valid values are:
  - 0 => no pull
  - 1 => enable R0
  - 2 => enable R1
  - 3 => enable R0 + R1

Using `<10>` is invalid as it exceeds the accepted range.
It was likely intended as binary `0b10` (i.e., `2`),
to enable R1 only.

This patch replaces incorrect values with the correct ones
and removes the leading zero from `<01>` to avoid confusion
with bitfield notation.

Signed-off-by: Julien Massot <julien.massot@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts b/arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts
index dbdee604edab4318c1ba87b9594ce52282b0c405..bbed369db986f3f24aea470a9ad63a7c1e2cb3c9 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts
@@ -318,19 +318,19 @@ pins_cmd_dat {
 				 <PINMUX_GPIO122__FUNC_MSDC0_CMD>;
 			input-enable;
 			drive-strength = <MTK_DRIVE_14mA>;
-			mediatek,pull-up-adv = <01>;
+			mediatek,pull-up-adv = <1>;
 		};
 
 		pins_clk {
 			pinmux = <PINMUX_GPIO124__FUNC_MSDC0_CLK>;
 			drive-strength = <MTK_DRIVE_14mA>;
-			mediatek,pull-down-adv = <10>;
+			mediatek,pull-down-adv = <2>;
 		};
 
 		pins_rst {
 			pinmux = <PINMUX_GPIO133__FUNC_MSDC0_RSTB>;
 			drive-strength = <MTK_DRIVE_14mA>;
-			mediatek,pull-down-adv = <01>;
+			mediatek,pull-down-adv = <1>;
 		};
 	};
 
@@ -347,25 +347,25 @@ pins_cmd_dat {
 				 <PINMUX_GPIO122__FUNC_MSDC0_CMD>;
 			input-enable;
 			drive-strength = <MTK_DRIVE_14mA>;
-			mediatek,pull-up-adv = <01>;
+			mediatek,pull-up-adv = <1>;
 		};
 
 		pins_clk {
 			pinmux = <PINMUX_GPIO124__FUNC_MSDC0_CLK>;
 			drive-strength = <MTK_DRIVE_14mA>;
-			mediatek,pull-down-adv = <10>;
+			mediatek,pull-down-adv = <2>;
 		};
 
 		pins_ds {
 			pinmux = <PINMUX_GPIO131__FUNC_MSDC0_DSL>;
 			drive-strength = <MTK_DRIVE_14mA>;
-			mediatek,pull-down-adv = <10>;
+			mediatek,pull-down-adv = <2>;
 		};
 
 		pins_rst {
 			pinmux = <PINMUX_GPIO133__FUNC_MSDC0_RSTB>;
 			drive-strength = <MTK_DRIVE_14mA>;
-			mediatek,pull-up-adv = <01>;
+			mediatek,pull-up-adv = <1>;
 		};
 	};
 
@@ -377,13 +377,13 @@ pins_cmd_dat {
 				 <PINMUX_GPIO33__FUNC_MSDC1_DAT2>,
 				 <PINMUX_GPIO30__FUNC_MSDC1_DAT3>;
 			input-enable;
-			mediatek,pull-up-adv = <10>;
+			mediatek,pull-up-adv = <2>;
 		};
 
 		pins_clk {
 			pinmux = <PINMUX_GPIO29__FUNC_MSDC1_CLK>;
 			input-enable;
-			mediatek,pull-down-adv = <10>;
+			mediatek,pull-down-adv = <2>;
 		};
 
 		pins_pmu {
@@ -401,13 +401,13 @@ pins_cmd_dat {
 				 <PINMUX_GPIO30__FUNC_MSDC1_DAT3>;
 			drive-strength = <6>;
 			input-enable;
-			mediatek,pull-up-adv = <10>;
+			mediatek,pull-up-adv = <2>;
 		};
 
 		pins_clk {
 			pinmux = <PINMUX_GPIO29__FUNC_MSDC1_CLK>;
 			drive-strength = <8>;
-			mediatek,pull-down-adv = <10>;
+			mediatek,pull-down-adv = <2>;
 			input-enable;
 		};
 	};

-- 
2.50.1



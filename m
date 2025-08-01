Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18835C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Aug 2025 11:42:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v/6ppkvyUUjzrgDtXOAupFpcaVNhHr/xz5GxP15x020=; b=k0D+zANJyy0j641rhRKQpVa6Z8
	BCaM/2MRQygYv2nn2tlzuKGftVSUQ1BLhAlz7n8SwYPUGPA21u7yhGxVqsG0CpE+rV7oLgtespYnZ
	0RYu7T7wT+OLfSpH97uxZohTaKMJzEgxjvdtD7R+GD5tgliUmJ/nu7TWNGb55oOAeP7soi1REtIOq
	aURsCDMBqMYoeNj38Xl91V4C2LJGygos43YMbB5niFzxW+Ijvrjl92gi0v2Sru76/O0oh11cSd7LS
	1EuHLH4MZ1JhbVze+pYTngRIqHX5gUKqI5DmiokfXUEfgTgYV8qoAJlmAtd86FyjEPBPJVDd/0GHB
	y0FvIwJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uho96-00000005ZzM-31ro;
	Fri, 01 Aug 2025 11:41:56 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhnmD-00000005XJg-2q8n;
	Fri, 01 Aug 2025 11:18:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1754047096;
	bh=T6KtWc71Y7qbuML6Qis9tsMmmj0jC0rR2IZxAIr/RGY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=pJ7tz1uWPrkslNeE5KblpPKLMPa8+dYuxJJL5myyodeIfSEJxlDCQ5Zs2jQzeM3Y/
	 K8PQmx46vJfp9RhDfQEJgrJTg9m/Ju/+HdW6LOzYPQRtXRw55YmA0tkqD4ggkH0Ziz
	 tog33ZJqvVpgarA3+t6qtYdvmFXQbedELp0kRul/nKr76LloQ1Fo8B3a1N8TLjdBxF
	 mCjoKN8/8WYI5PB9aw0od4CXjdyHRlbvJ4E/xG9xYM/nkBVCpJx9O3eGabBWw9j/6g
	 ceHqiQVH8fHRsu7E1iJI5j/C069ZPTO75sQ+/Q4Eu+S/cpsrXkvA1UCevJqCp7ocbt
	 TMgfoQVvznEkw==
Received: from 2a01cb0892f2d600c8f85cf092d4af51.ipv6.abo.wanadoo.fr (2a01cb0892f2d600c8f85cF092d4af51.ipv6.abo.wanadoo.fr [IPv6:2a01:cb08:92f2:d600:c8f8:5cf0:92d4:af51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmassot)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id EE4BF17E061F;
	Fri,  1 Aug 2025 13:18:14 +0200 (CEST)
From: Julien Massot <julien.massot@collabora.com>
Date: Fri, 01 Aug 2025 13:18:10 +0200
Subject: [PATCH 8/9] arm64: dts: mediatek: mt8183-kukui: Fix
 pull-down/up-adv values
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250801-mtk-dtb-warnings-v1-8-6ba4e432427b@collabora.com>
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
X-CRM114-CacheID: sfid-20250801_041817_895963_61FBDC0F 
X-CRM114-Status: GOOD (  13.36  )
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
 arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
index 400c61d1103561db6ee0fb2d2e1c157529d03206..02bdfdb8e53c87dba0ba0024e0c69fcee825552b 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
@@ -574,19 +574,19 @@ pins-cmd-dat {
 				 <PINMUX_GPIO122__FUNC_MSDC0_CMD>;
 			input-enable;
 			drive-strength = <MTK_DRIVE_14mA>;
-			mediatek,pull-up-adv = <01>;
+			mediatek,pull-up-adv = <1>;
 		};
 
 		pins-clk {
 			pinmux = <PINMUX_GPIO124__FUNC_MSDC0_CLK>;
 			drive-strength = <MTK_DRIVE_14mA>;
-			mediatek,pull-down-adv = <10>;
+			mediatek,pull-down-adv = <2>;
 		};
 
 		pins-rst {
 			pinmux = <PINMUX_GPIO133__FUNC_MSDC0_RSTB>;
 			drive-strength = <MTK_DRIVE_14mA>;
-			mediatek,pull-down-adv = <01>;
+			mediatek,pull-down-adv = <1>;
 		};
 	};
 
@@ -603,25 +603,25 @@ pins-cmd-dat {
 				 <PINMUX_GPIO122__FUNC_MSDC0_CMD>;
 			input-enable;
 			drive-strength = <MTK_DRIVE_14mA>;
-			mediatek,pull-up-adv = <01>;
+			mediatek,pull-up-adv = <1>;
 		};
 
 		pins-clk {
 			pinmux = <PINMUX_GPIO124__FUNC_MSDC0_CLK>;
 			drive-strength = <MTK_DRIVE_14mA>;
-			mediatek,pull-down-adv = <10>;
+			mediatek,pull-down-adv = <2>;
 		};
 
 		pins-ds {
 			pinmux = <PINMUX_GPIO131__FUNC_MSDC0_DSL>;
 			drive-strength = <MTK_DRIVE_14mA>;
-			mediatek,pull-down-adv = <10>;
+			mediatek,pull-down-adv = <2>;
 		};
 
 		pins-rst {
 			pinmux = <PINMUX_GPIO133__FUNC_MSDC0_RSTB>;
 			drive-strength = <MTK_DRIVE_14mA>;
-			mediatek,pull-up-adv = <01>;
+			mediatek,pull-up-adv = <1>;
 		};
 	};
 
@@ -633,13 +633,13 @@ pins-cmd-dat {
 				 <PINMUX_GPIO33__FUNC_MSDC1_DAT2>,
 				 <PINMUX_GPIO30__FUNC_MSDC1_DAT3>;
 			input-enable;
-			mediatek,pull-up-adv = <10>;
+			mediatek,pull-up-adv = <2>;
 		};
 
 		pins-clk {
 			pinmux = <PINMUX_GPIO29__FUNC_MSDC1_CLK>;
 			input-enable;
-			mediatek,pull-down-adv = <10>;
+			mediatek,pull-down-adv = <2>;
 		};
 	};
 
@@ -652,13 +652,13 @@ pins-cmd-dat {
 				 <PINMUX_GPIO30__FUNC_MSDC1_DAT3>;
 			drive-strength = <6>;
 			input-enable;
-			mediatek,pull-up-adv = <10>;
+			mediatek,pull-up-adv = <2>;
 		};
 
 		pins-clk {
 			pinmux = <PINMUX_GPIO29__FUNC_MSDC1_CLK>;
 			drive-strength = <8>;
-			mediatek,pull-down-adv = <10>;
+			mediatek,pull-down-adv = <2>;
 			input-enable;
 		};
 	};

-- 
2.50.1



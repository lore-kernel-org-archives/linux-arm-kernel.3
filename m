Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7664AD4A5F5
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 17 Jan 2026 18:21:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J+swivt6eQwqDoeayGtIhFTsahiWsuiMT+1lF7hcTPg=; b=QVMxxtJS8rONxBBJptVUm6PwdP
	4Djy0+P6vVhSWUUJn7VHeEHiDqq8HB6v3lfP+6Z30kepJnTdqDXBL+IlKpWh26R3/epWDU2LVPdXE
	klb1+hCJjwuFSW7t5p1FvoX9uc0ELJsHzC0L/MXQRU/tcbLQIhoKeauY2N1b6frDHydcDyf29O6V+
	UZHsqxuwgMm0Xhj7p/8pU2Sp94BGajeJN4V7e/Slpyk69WL7Cw9IE+i3cHqKDCPWbww7GikHs5o2M
	vAdWzzF5XfT5O2iQ+3oMwde0cP4HZe+HZsWJLc85PP2i5Cm9HRdhNAYIgKdZ3RPer0elIpZlz5rVp
	fj81J8qA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhAvS-0000000Fisv-0U7a;
	Sat, 17 Jan 2026 18:21:30 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhAvR-0000000Fisa-122L
	for linux-arm-kernel@lists.infradead.org;
	Sat, 17 Jan 2026 18:21:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id AC0BA60166;
	Sat, 17 Jan 2026 18:21:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8372C4CEF7;
	Sat, 17 Jan 2026 18:21:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768674086;
	bh=zeRua86JJ89hp7UiCqJzAqyltlIlf9UdKVhSRxl7hlk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=aqvUkQ1+SgHeI0Amg6pNkgsy7D6ekl/qZN1xCY9O5ESc97WKkDdsE4sFQgSNKk5qb
	 qteclBkJdJIY2Qu35NG13mvXlmqATeZZNNhDJUksJJHixLzUPPhG1PO9WcP33ka78Q
	 lhfmVlc6EK64jOdYly1pKgvxnJW8R0L+zD+HSJVga04c6dblUpXpg1QmS4FlnC5tSE
	 UjDrHtB5PTRLtcbUrW9cKmfAj2AVLAYek26e01p7FGVJdDk+VvuerP7f2EbVdURHOh
	 q4SG1UzlXC/4D69IZdipnRNxGvoz/Z1/vtQTtGkS7Wu2MWY/eR8BHMAXOqxD5Fm7tr
	 zng6D6/XeTZHw==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>,
	soc@lists.linux.dev
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH 2/2] ARM: dts: nuvoton: Minor whitespace cleanup
Date: Sat, 17 Jan 2026 19:21:17 +0100
Message-ID: <20260117182117.14483-4-krzk@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260117182117.14483-3-krzk@kernel.org>
References: <20260117182117.14483-3-krzk@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1351; i=krzk@kernel.org; h=from:subject; bh=AbbknVFh8S8FlxeJ3lbLs0kMqrPQzMvQ5ZEv69l+2wo=; b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpa9Mea+eSwBtkO+3hco1lfMxKmaKiK6hVbFVAw P+Abk5xyzOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaWvTHgAKCRDBN2bmhouD 1169D/0XvbN3TfqU5y4QKjMtxZeUgAPbFgXfXeP4RepEW2eDowFu4J3sjy9vGQo1AuUT7Lc67+D 7KbcBwDSTE/aWDI4Z/HB9PK6F+cuw4wd8RTWbmLIwe05oga4Az+RRCtY7hw7R46MCeKQZUhXPgU REWrVEDDj8MaXA6tlZPfpbjgqacQ0J0Lv4fDIvPUPtgfn62Y6v9N60ZR+ue5MdLa72JD1Lpcuno WX5LyudJ/l2LWLXaDxJdXXbCEmvzwZtDT8++tfcaA9xSRpJwCH0fO6FKSqNYmHmLUa5HbW2jbDn 3Op3UlaYut5r3aH+KSrLQJ9jOtdY701vfBigFypuDKOJO+xMeheHUis0ex7/gkZnqvPJBw1mzdg l2l3cKeqUagnOCYE4DeB9A8WbEFdihT+E4zE3eO+tR4T9Nmli/6hmmrPfW1Q3ulU7oxtyAG5tvE GCR/Wc4FhTUmXvyTYJzlPzn0YE9oxet0apLLvU5h/Pbj8oyx1C0XhIZEvSpQ05s2aDlktxmKB6V eMglluXTNzLvlOlBzidRiJXYz/JAqVqsjBDEnR1nGTh93jvSJiHl0BXdJoudBsSVpJdl4LSNopR ZJriXbKmUwVyFnZvaZD5KNpfYjG+N7liwZLrUoIriEFD29/6z4Phz/iND4cCRwlNZQoW8Bdxd4+ rG6mh++MwxxQwYw==
X-Developer-Key: i=krzk@kernel.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
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

From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

The DTS code coding style expects exactly one space around '='
character.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Link: https://patch.msgid.link/20250819131725.86770-3-krzysztof.kozlowski@linaro.org
Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 arch/arm/boot/dts/nuvoton/nuvoton-common-npcm7xx.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/nuvoton/nuvoton-common-npcm7xx.dtsi b/arch/arm/boot/dts/nuvoton/nuvoton-common-npcm7xx.dtsi
index 98c35771534e..ab3c3c5713ae 100644
--- a/arch/arm/boot/dts/nuvoton/nuvoton-common-npcm7xx.dtsi
+++ b/arch/arm/boot/dts/nuvoton/nuvoton-common-npcm7xx.dtsi
@@ -154,7 +154,7 @@ sdmmc: mmc@f0842000 {
 			status = "disabled";
 			reg = <0xf0842000 0x200>;
 			interrupts = <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>;
-			clocks =  <&clk NPCM7XX_CLK_AHB>;
+			clocks = <&clk NPCM7XX_CLK_AHB>;
 			clock-names = "clk_mmc";
 			pinctrl-names = "default";
 			pinctrl-0 = <&mmc8_pins
@@ -166,7 +166,7 @@ sdhci: mmc@f0840000 {
 			status = "disabled";
 			reg = <0xf0840000 0x200>;
 			interrupts = <GIC_SPI 27 IRQ_TYPE_LEVEL_HIGH>;
-			clocks =  <&clk NPCM7XX_CLK_AHB>;
+			clocks = <&clk NPCM7XX_CLK_AHB>;
 			clock-names = "clk_sdhc";
 			pinctrl-names = "default";
 			pinctrl-0 = <&sd1_pins>;
-- 
2.51.0



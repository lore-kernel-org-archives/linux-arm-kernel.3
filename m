Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C137CA0EFA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Aug 2025 07:54:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XWQu+e3qckTJNL8m6HlHs0TTcB5ysqLyrEXC5FEmJps=; b=KZo02wugfva2gwkAkIUNtpiPBi
	UVlZNnNVowZNVqiqFdhaCMvY6+ZidROHyvu6xOjnsn2xxxbj0lROXS8nPi73gHTCspJurFHv7ZFlO
	eExN7Bm+0QbInKsxpd/QKOLCBndUg1upw2wzoGHBLXSjv8U3yuq7+dbua9bx0GXv879KPo9G68mWc
	/esW1GkcchkmzYo+daDyWAwuu/VNu0J9Usgox3U80cXwrAbwMyodxnnpWbhw8C1ShmoMxIXYgMSDj
	in4+P8tdqDOR4YBYcIOcLmpg4bizCsbxbF9H1pSyanFP4a9wm+M8Oue59KiB8FIel1BUQn3KBii0i
	spILF0aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqoVt-0000000Aukq-01c4;
	Tue, 26 Aug 2025 07:54:41 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqoHQ-0000000AsPL-0Xz4;
	Tue, 26 Aug 2025 07:39:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1756193982;
	bh=aW2Q9+sI0CAe2IAr9z7+jpyyzFSeije16F6y8ecrSBU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=MCOQI31aHnYL1kWXXYH1S2LxAqoPu7z5m1jKAvJ/7TFFEy/ImpMNu7K+Vip5eh9CE
	 AtvrXDqVbtp8JCySUL0fuIBUAS5HsFs/3kJMwT9Ic503tsTpsNu4M8CW+5E2ZHAeaj
	 YSuXp1HL7f00L6UPAgqAuWYI46GnA78lPnirMfUvmm+97tJzpFqlUePvGb+vooPAOB
	 Rowz55kq60fLuVDAXe/2HQeYBhTe6FcwZ7usnfSTAzAQd9eIp9Lq8dmCXA2RWhFFIr
	 qtmGlliXRXsl0W8cST1XwKCZo88VaoVh4845u52ip8t28nHhxn/ivOZN+mtYl29cXy
	 kTDFyuxJrpfpg==
Received: from 2a01cb0892f2d600c8f85cf092d4af51.ipv6.abo.wanadoo.fr (2a01cb0892F2D600C8F85cF092d4AF51.ipv6.abo.wanadoo.fr [IPv6:2a01:cb08:92f2:d600:c8f8:5cf0:92d4:af51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmassot)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9DA9117E0AC3;
	Tue, 26 Aug 2025 09:39:41 +0200 (CEST)
From: Julien Massot <julien.massot@collabora.com>
Date: Tue, 26 Aug 2025 09:39:37 +0200
Subject: [PATCH v3 4/6] arm64: dts: mt8183: Rename nodes to match audiosys
 DT schema
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250826-mtk-dtb-warnings-v3-4-20e89886a20e@collabora.com>
References: <20250826-mtk-dtb-warnings-v3-0-20e89886a20e@collabora.com>
In-Reply-To: <20250826-mtk-dtb-warnings-v3-0-20e89886a20e@collabora.com>
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
X-CRM114-CacheID: sfid-20250826_003944_371291_4031792B 
X-CRM114-Status: GOOD (  11.52  )
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

The DT schema for "mediatek,mt8183-audiosys" expects an
audio-controller node inside the audiosys block. Rename
the nested AFE node from "mt8183-afe-pcm" to
"audio-controller" accordingly.

Also rename the audiosys node itself from "audio-controller" to
"clock-controller" to better reflect its function.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Julien Massot <julien.massot@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8183.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
index 3c1fe80e64b9c5e32703f1e8663942a24543cf23..e2500e3c3f66d12a6fd19f29fa9fd63a6f04821f 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
@@ -1445,11 +1445,11 @@ usb_host: usb@11200000 {
 			};
 		};
 
-		audiosys: audio-controller@11220000 {
+		audiosys: clock-controller@11220000 {
 			compatible = "mediatek,mt8183-audiosys", "syscon";
 			reg = <0 0x11220000 0 0x1000>;
 			#clock-cells = <1>;
-			afe: mt8183-afe-pcm {
+			afe: audio-controller {
 				compatible = "mediatek,mt8183-audio";
 				interrupts = <GIC_SPI 161 IRQ_TYPE_LEVEL_LOW>;
 				resets = <&watchdog MT8183_TOPRGU_AUDIO_SW_RST>;

-- 
2.50.1



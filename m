Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B08F6CCF9EC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 13:28:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DkZzfISkGagLj7hn3erkw/+WBWiDXC6WPh+BwEFoGG8=; b=PNWZFqjOcVoHDA3h0KA52/jNk2
	t6HKBjNwmrFfLcAoNW+3v7+PbVCl1DyA3cvl9BzoZ/fi8i7o5X2tBOzfOHs4b43gPmmOqBTrh93xR
	ewevyC6Gul2FTrDbWDoQNqeZA9j6HhKgoAjLN/CZ8f4OQh1Gf0xZjyTaC81xGytVtCBNMcVLbxOV/
	40VOF10m7Fm8YSrHX7051zuw7Ewpcr3BQchubMHLmBmPTxJtAZ6EXfdYZFj1Fpq13YZqnwehZEUim
	GQ83EBBxedW1x0OaRrHEHUwhCmk+tObjPrIF/FOJyqmhcfslfsarvRodqZ/qjvLp3+/hY3fCcKfdq
	4Ssjn3FA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDNGz-0000000E142-3yDP;
	Mon, 27 Oct 2025 13:28:33 +0000
Received: from mxout2.routing.net ([2a03:2900:1:a::b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDNGx-0000000E11P-08sw;
	Mon, 27 Oct 2025 13:28:32 +0000
Received: from mxbulk.masterlogin.de (unknown [192.168.10.85])
	by mxout2.routing.net (Postfix) with ESMTP id C1DC25FF3F;
	Mon, 27 Oct 2025 13:28:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=routing; t=1761571706;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DkZzfISkGagLj7hn3erkw/+WBWiDXC6WPh+BwEFoGG8=;
	b=bCo/t90g+3IEBjHGaJEsHR2enazhi3OF7t/4RUdhNhnWZeCFJie6cdtlkj9+bfFn04Hwak
	CWbUFtQBjkOBx4CLi3vPKmx32sgGIrs/sGK9X0mpmlQm8PWHMo/BKMZBG07Piu10v4o7H5
	AGWazeyIIMD/RBos8lwuDrWzwM3jTsk=
Received: from frank-u24.. (fttx-pool-217.61.159.158.bambit.de [217.61.159.158])
	by mxbulk.masterlogin.de (Postfix) with ESMTPSA id 8602D122700;
	Mon, 27 Oct 2025 13:28:26 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Frank Wunderlich <frank-w@public-files.de>,
	Sean Wang <sean.wang@mediatek.com>,
	Daniel Golle <daniel@makrotopia.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v1 3/6] arm64: dts: mediatek: mt7988a: Add label for ssusb0
Date: Mon, 27 Oct 2025 14:28:13 +0100
Message-ID: <20251027132817.212534-4-linux@fw-web.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251027132817.212534-1-linux@fw-web.de>
References: <20251027132817.212534-1-linux@fw-web.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_062831_264737_69F0AE38 
X-CRM114-Status: GOOD (  10.15  )
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

From: Frank Wunderlich <frank-w@public-files.de>

Add label for ssusb0 node which is used for BPI-R4-Pro.

Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
---
 arch/arm64/boot/dts/mediatek/mt7988a.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt7988a.dtsi b/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
index 366203a72d6d..623fb450f898 100644
--- a/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
@@ -418,7 +418,7 @@ lvts: lvts@1100a000 {
 			nvmem-cell-names = "lvts-calib-data-1";
 		};
 
-		usb@11190000 {
+		ssusb0: usb@11190000 {
 			compatible = "mediatek,mt7988-xhci", "mediatek,mtk-xhci";
 			reg = <0 0x11190000 0 0x2e00>,
 			      <0 0x11193e00 0 0x0100>;
-- 
2.43.0



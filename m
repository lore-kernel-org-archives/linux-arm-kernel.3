Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2844E7718B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Dec 2024 19:32:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ooCP4AVj6ouf61L4l6iIgaeJr118tdjjjQYgYlz/msQ=; b=NZ6fwuQw+/pTVvopJNKqYr29K1
	DME32maX4gxwQ8vU2mygTFa2lD9SK2Tx78cDacDcEP5WO3/L5R4FI3esCHB73Wn464fXw2URlMi2f
	uztb9YoTOy854EvB01szya4kDBAkWP3E5KW07iMElnCPRxPbM43ra5uJphP5HowKsfvAHrD5qUrs7
	IsX4PWRUtEn4T87vaCrfejO/tL6jLlOQUf/d42iMdG7bkqKF04KqVQHQJ3oxvh7JW4b1VgX6ZQNbB
	Q0FeOgj/0z66uVROydGBNvfRJaUsleIAUZ+5Nk6FAIZLXWvLKQ4PwBITOJz0MFe6wkdUPzPcgz2Yq
	6Au7bqiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQX7J-0000000EF5V-28OO;
	Wed, 25 Dec 2024 19:32:25 +0000
Received: from out-173.mta0.migadu.com ([91.218.175.173])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQX2l-0000000EEXF-2CCJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Dec 2024 19:27:44 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1735154861;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ooCP4AVj6ouf61L4l6iIgaeJr118tdjjjQYgYlz/msQ=;
	b=CFDQeefpWl35qibFOJxQB19HfXzQTL64mOoGsi7vOLZF42pQl5WEawIFFoJ3l0FrigyMfL
	mJJQcBRSTXtuaejIjQD3imFpqgTCeOMjhD0oglA5Ow5OqqHQNcGxydxB1KOPs1BSUe8rBt
	TWzp024niCUAllC8aZ78AGYky2JISF+EXq8k4+7V1IR1fK3biNofQVd0Fb6qLobLLSP5Sx
	A8OqTiojt7TxldJZLlTZFqKMSxbsVRG813n4RzL7/BAzfB06AWc9V96myFf4dsPjatJBV8
	BSB7cNEjp+5MMiKyd1ZjIpAXRZl4cItIVXK7eeJanAmKdmvBTTeFGnQ89QRG5g==
From: Val Packett <val@packett.cool>
To: 
Cc: Val Packett <val@packett.cool>,
	Mattijs Korpershoek <mkorpershoek@baylibre.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Fabien Parent <fparent@baylibre.com>,
	Amjad Ouled-Ameur <aouledameur@baylibre.com>,
	Alexandre Mergnat <amergnat@baylibre.com>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 3/3] arm64: dts: mediatek: mt8516: add keypad node
Date: Wed, 25 Dec 2024 16:26:21 -0300
Message-ID: <20241225192631.25017-4-val@packett.cool>
In-Reply-To: <20241225192631.25017-1-val@packett.cool>
References: <20241225192631.25017-1-val@packett.cool>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241225_112743_706255_74B1E6A0 
X-CRM114-Status: UNSURE (   8.41  )
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

Add a keypad matrix node for the MT8516/MT8167 SoC.

Signed-off-by: Val Packett <val@packett.cool>
---
 arch/arm64/boot/dts/mediatek/mt8516.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8516.dtsi b/arch/arm64/boot/dts/mediatek/mt8516.dtsi
index e30623ebac0e1..b5e753759465d 100644
--- a/arch/arm64/boot/dts/mediatek/mt8516.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8516.dtsi
@@ -220,6 +220,17 @@ timer: timer@10008000 {
 			clock-names = "clk13m", "bus";
 		};
 
+		keypad: keypad@10002000 {
+			compatible = "mediatek,mt8516-keypad",
+				     "mediatek,mt6779-keypad";
+			reg = <0 0x10002000 0 0x1000>;
+			wakeup-source;
+			interrupts = <GIC_SPI 149 IRQ_TYPE_EDGE_FALLING>;
+			clocks = <&clk26m>;
+			clock-names = "kpd";
+			status = "disabled";
+		};
+
 		syscfg_pctl: syscfg-pctl@10005000 {
 			compatible = "syscon";
 			reg = <0 0x10005000 0 0x1000>;
-- 
2.47.1



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBE35EA3C5D
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Apr 2026 13:19:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=raj8KEj7nncAo56c1DXB93zAwOjYFuyy1P91EJAGKgQ=; b=X76D796O3ZwX+XwlpKDPJ4T/Uj
	nVK2iflqZ9qL+xekYx5oqpVFBPucdkOkh2ZQgJms1HV/offcTpp4p5dsfNLWqkwZvl8cSXNV6Jirg
	8YNa/2mLBLVEzZyyA1gg7/wrtoTnVhmUq9Z1q3HNG/t6isYadnQycUJvA1wNcgrQr6WYIWPOyyv42
	CwYbCfUywcmhgxcfYm0U5TW8IYUeYvEMgv8rEc2poQB3k9kRv2z5wua2vyZs60QkYARPdUvQqn/T8
	dfqjECBDA+GttbHAu4rT61eohrqm7LJC3h3GRWk71EeKgBfkSIzstBlhUjrN3Tlz26wO2XScqMKIN
	AmTCenAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wApHb-0000000ATd2-2knO;
	Thu, 09 Apr 2026 13:18:55 +0000
Received: from mxout4.routing.net ([2a03:2900:1:a::9])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wApGu-0000000ATIU-13my;
	Thu, 09 Apr 2026 13:18:23 +0000
Received: from mxbulk.masterlogin.de (unknown [192.168.10.85])
	by mxout4.routing.net (Postfix) with ESMTP id 9A4EF10086D;
	Thu,  9 Apr 2026 13:18:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=routing; t=1775740684;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=raj8KEj7nncAo56c1DXB93zAwOjYFuyy1P91EJAGKgQ=;
	b=FoAfbg0Ar/qN7/CNnYXpybCDJj45NkDPLWINkhoihBBZ+dA6MRP7rlhJOM77/eVjdXy+lJ
	Fnu+xE7q/yJphP8utODHFSMDJZtBn+He4iQw9j26j2FEMe5SsyX8D72oEj3G/3G80a2k35
	Imic6WbJPlRaNXrGFgYsdcE8k6YaFKk=
Received: from frank-u24.. (fttx-pool-217.61.155.21.bambit.de [217.61.155.21])
	by mxbulk.masterlogin.de (Postfix) with ESMTPSA id 6EC781226C0;
	Thu,  9 Apr 2026 13:18:04 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Frank Wunderlich <frank-w@public-files.de>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	Daniel Golle <daniel@makrotopia.org>,
	Andrew LaMarche <andrewjlamarche@gmail.com>
Subject: [PATCH v1 2/3] arm64: dts: mediatek: mt7988a-bpi-r4pro: update gpio-leds
Date: Thu,  9 Apr 2026 15:17:50 +0200
Message-ID: <20260409131754.121737-3-linux@fw-web.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260409131754.121737-1-linux@fw-web.de>
References: <20260409131754.121737-1-linux@fw-web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260409_061812_607732_0EC205BA 
X-CRM114-Status: UNSURE (   8.98  )
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

From: Frank Wunderlich <frank-w@public-files.de>

On the official case the red LED is named ERR, the blue LED is named ACT.​​​​​​​​​​​​​​​​
Reflect these labels in function and set them default off.

Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
---
 .../boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dtsi      | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dtsi b/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dtsi
index 759f608d1081..7f770a76775a 100644
--- a/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dtsi
@@ -61,14 +61,16 @@ gpio-leds {
 
 		led_red: sys-led-red {
 			color = <LED_COLOR_ID_RED>;
+			function = LED_FUNCTION_FAULT;
 			gpios = <&pca9555 15 GPIO_ACTIVE_HIGH>;
-			default-state = "on";
+			default-state = "off";
 		};
 
 		led_blue: sys-led-blue {
 			color = <LED_COLOR_ID_BLUE>;
+			function = LED_FUNCTION_ACTIVITY;
 			gpios = <&pca9555 14 GPIO_ACTIVE_HIGH>;
-			default-state = "on";
+			default-state = "off";
 		};
 	};
 
-- 
2.43.0



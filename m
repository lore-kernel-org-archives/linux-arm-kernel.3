Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1436AF3ED6E
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Apr 2026 09:23:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pk8wmr9hwiEMZRX2cINqvbziX6RPyqj0Zoyleo3KFtk=; b=Z6mOTwgekecpy72NJs1AqsDsVy
	SZ6l1sEPWUBKyNT2Q5VEgtevKTXjmuDygk7IwVs/t33dz+NRh5/1jmKSEWfuv3ages7ghVC96uNAf
	e3ZOS2rB6dK6rVQlswzPWTrNoEyTMT0Nxrovf82oMis8Zny+F2Xy5+6S22+dKBjk0g4Y6aC/MunNf
	/6fWcwk7a6ktC5Mk3SHuJca+IjemiqSE5FAJvlhFXlPwvAd3mMGiuvT4EtcgFXVu5zOf2UFjN+NV/
	wgmpF+mzXcdAnw4j4t7AUPhpbkYHwur1bRX/h9f6X6L1JA4pVhRWtCkE/a6r3BoLknJZpNIL8iQNA
	odgsJlJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBr2k-0000000ECEM-1s3i;
	Sun, 12 Apr 2026 09:23:50 +0000
Received: from mxout4.routing.net ([2a03:2900:1:a::9])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBr2e-0000000EC9l-3fhc;
	Sun, 12 Apr 2026 09:23:47 +0000
Received: from mxbulk.masterlogin.de (unknown [192.168.10.85])
	by mxout4.routing.net (Postfix) with ESMTP id C7897100605;
	Sun, 12 Apr 2026 09:23:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=routing; t=1775985819;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pk8wmr9hwiEMZRX2cINqvbziX6RPyqj0Zoyleo3KFtk=;
	b=PsOOc1RwdABs3euMq+yJKe4a8e4jNwWREcGzQW1x1wkee4G8wMjCsxrxrrCPspn98k93ES
	SvyxpCLMITqQPQp2BPAlSzPm7SqHqP9i8nD7mVtfioJJzzdsqIi6n2j8BJb02qbH+qJuBl
	Ux52hxG9STp3coYEhasM+/JohfDf54o=
Received: from frank-u24.. (fttx-pool-80.245.78.225.bambit.de [80.245.78.225])
	by mxbulk.masterlogin.de (Postfix) with ESMTPSA id 9FFF11226B6;
	Sun, 12 Apr 2026 09:23:39 +0000 (UTC)
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
Subject: [PATCH v2 3/4] arm64: dts: mediatek: mt7988a-bpi-r4pro: update gpio-leds
Date: Sun, 12 Apr 2026 11:23:31 +0200
Message-ID: <20260412092333.6371-4-linux@fw-web.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260412092333.6371-1-linux@fw-web.de>
References: <20260412092333.6371-1-linux@fw-web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260412_022345_081787_ADD9A768 
X-CRM114-Status: UNSURE (   9.78  )
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
v2:
- dropped default-state as suggested by daniel
---
 arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dtsi b/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dtsi
index 759f608d1081..bbd6c16a8cb0 100644
--- a/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dtsi
@@ -61,14 +61,14 @@ gpio-leds {
 
 		led_red: sys-led-red {
 			color = <LED_COLOR_ID_RED>;
+			function = LED_FUNCTION_FAULT;
 			gpios = <&pca9555 15 GPIO_ACTIVE_HIGH>;
-			default-state = "on";
 		};
 
 		led_blue: sys-led-blue {
 			color = <LED_COLOR_ID_BLUE>;
+			function = LED_FUNCTION_ACTIVITY;
 			gpios = <&pca9555 14 GPIO_ACTIVE_HIGH>;
-			default-state = "on";
 		};
 	};
 
-- 
2.43.0



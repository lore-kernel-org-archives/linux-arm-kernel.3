Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 793BEC43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Jun 2026 14:41:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0HPhwFtkXvquAUDYvZqrHytOvvPkaGYk3vsC80cW3dk=; b=EdC+ZoU/qhOc8rl252hO1ctOpe
	zC7AWXmNhIOUAZb5db/HT3RCd8NA+swlD9tdikSGR4/J3Jym+z939ReQbEi2I3BRLCt6Q73rgoL+V
	N/d43qPkjVilRF3VSoSuv/zMiVV/AcBV+kb0c78YKBE+hzWxh+5tQ32AkeLKBf971rj85L6yKDWGJ
	FFAEltysiEsqNvraD+v2R7waErj3xg4ji+7ABp6B2C/9CJxpzIQuAvTG6DwjBHBVU+wnhAkFRxlsh
	THIcLPf2rEwJ0VpGgMz0jBU56H4kOAv/dgCRwZGGkvDhYsYyd5n4HxtvkCPc7ax/Nc6J/icLzyO/C
	7HB7DgzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd7jo-0000000BU2u-3Hyh;
	Fri, 26 Jun 2026 14:41:00 +0000
Received: from smtp-1909.mail.infomaniak.ch ([2001:1600:19:8e30::1909])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd7jk-0000000BU11-2h6U
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Jun 2026 14:40:59 +0000
Received: from smtp-3-0001.mail.infomaniak.ch (smtp-3-0001.mail.infomaniak.ch [10.4.36.108])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4gmyyq3sCRzspR;
	Fri, 26 Jun 2026 16:40:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=0leil.net;
	s=20231125; t=1782484851;
	bh=0HPhwFtkXvquAUDYvZqrHytOvvPkaGYk3vsC80cW3dk=;
	h=From:Date:Subject:To:Cc:From;
	b=kbfEwjZs5NrTcHkqTfsl8NYqNIp7n77UhG5v9cIkEvGqsLft0Cy/9flMNyDAEbeCV
	 ruUSAHxJKTe3Cfs/6aHMrY877vtXzB4++d4g/JN3m4/YvwrxUqb1c1kDUlyUbrF/bl
	 IpFUGfvdDkqbDQn+7oeavtf2TdN1X49hdfxJSkfvrxI0bEFCrmbznKRGE/BOmuwbOy
	 aEcECZ4kyL5AovQ9i805jDSu9z0JqoX4Z++YdElO24NLTIv/oSPa7cYOgiKITJKJjt
	 SIrbR3wtKq97A42IfdwULZdR8sZPbKBDx20zRgOJ4quVoO/dIB2F6abLf5OsqtlLIx
	 r9Iav44fT9Vsw==
Received: from unknown by smtp-3-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4gmyyp1m8tz3Fy;
	Fri, 26 Jun 2026 16:40:50 +0200 (CEST)
From: Quentin Schulz <foss+kernel@0leil.net>
Date: Fri, 26 Jun 2026 16:40:38 +0200
Subject: [PATCH] arm64: dts: rockchip: fix eMMC reset polarity on PX30
 Ringneck
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260626-ringneck-emmc-polarity-v1-1-90cefe57b316@cherry.de>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMwQ6CMAyA4VchPdukG8kwvorxAKXOqgzSoYEQ3
 t2px+/w/xtkMZUMp2oDk7dmHVOBO1TAtzZFQe2LwZMPFHxA0xST8ANlGBin8dmazis2riGqOXR
 H8lDiyeSqy298vvydX91deP7eYN8/sFCo3HoAAAA=
X-Change-ID: 20260626-ringneck-emmc-polarity-717003c6b802
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Quentin Schulz <quentin.schulz@theobroma-systems.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Quentin Schulz <quentin.schulz@cherry.de>, stable@vger.kernel.org
X-Mailer: b4 0.15-dev-47773
X-Infomaniak-Routing: alpha
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260626_074056_815786_2DB673A3 
X-CRM114-Status: GOOD (  12.40  )
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

From: Quentin Schulz <quentin.schulz@cherry.de>

According to the Jedec 5.1 specification, the device is held in reset
when RST_n is low, therefore the polarity of the line must be that, as
specified in the Device Tree binding (mmc/mmc-pwrseq-emmc.yaml).

Due to the wrong polarity, eMMC devices with RST_n_FUNCTION[162]
bitfield [1:0] set to 0x1 (the default is 0x0) will be held in reset
forever.

Cc: stable@vger.kernel.org
Fixes: c484cf93f61b ("arm64: dts: rockchip: add PX30-µQ7 (Ringneck) SoM with Haikou baseboard")
Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
PX30 Ringneck is affected by the same issue that Cobra and PP-1516 have
and for which patches[1][2] have already been sent.

Out of the other boards I own, RK3588 Tiger and Jaguar also have an
inverted polarity but I tried making the eMMC chip care about the reset
line polarity to no avail, therefore I'm not changing them until we
figure out a setup in which we can reproduce the issue.

There are a handful of other Rockchip boards with an inverted polarity
but I don't own any of them so I will not change them either.

[1] https://lore.kernel.org/linux-rockchip/20260609081728.30616-2-jakobunt@gmail.com/
[2] https://lore.kernel.org/linux-rockchip/20260612-pp1516-emmc-polarity-v1-1-4816c1c909f7@cherry.de/
---
 arch/arm64/boot/dts/rockchip/px30-ringneck.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/px30-ringneck.dtsi b/arch/arm64/boot/dts/rockchip/px30-ringneck.dtsi
index 973b4c5880e24..29794216592d8 100644
--- a/arch/arm64/boot/dts/rockchip/px30-ringneck.dtsi
+++ b/arch/arm64/boot/dts/rockchip/px30-ringneck.dtsi
@@ -26,7 +26,7 @@ emmc_pwrseq: emmc-pwrseq {
 		compatible = "mmc-pwrseq-emmc";
 		pinctrl-0 = <&emmc_reset>;
 		pinctrl-names = "default";
-		reset-gpios = <&gpio1 RK_PB3 GPIO_ACTIVE_HIGH>;
+		reset-gpios = <&gpio1 RK_PB3 GPIO_ACTIVE_LOW>;
 	};
 
 	leds {

---
base-commit: 4edcdefd4083ae04b1a5656f4be6cd83ae919ef4
change-id: 20260626-ringneck-emmc-polarity-717003c6b802

Best regards,
--  
Quentin Schulz <quentin.schulz@cherry.de>



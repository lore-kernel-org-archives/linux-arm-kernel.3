Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A98CD4417A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Nov 2024 16:03:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lF7c/5ReSc9aXICwwIMh2nFYQX2teN1fzO0JC+vmihk=; b=PBFm1dEhFFSlIHiNz6BhRXIzov
	5NBfJd3l8muoZ/X4vvb48/RkJtyCA/6mbysJ0HZfl5qh5Mwfs9ayvyNon1kVml1gReefVTP6Lg7b5
	QDb8hJmTGemhbT6IfrwzyQeyebXKlgoMM40ugKiZa4bwPeOmwhxh+rrpNMoe9qaHbhMtcA+iDpQRN
	VdfKtw0igayk6fCcclLyTg2Te/ygKW73PWzhrBYx1Qr4Dl2Y9Jxfh2vHUxSjGAe71eKTaN0LZKWb7
	Tmikc0lW8Z0QVTpXg7cBLpePxgwA9hTExcF9oQgwAwlqfgwX56qnxi9rFP3eE9HfQvpVRe6YXNBgx
	L1ZW0FGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDQh6-0000000Cxq4-0uke;
	Tue, 19 Nov 2024 16:03:12 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDQeB-0000000CxMz-3pRI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Nov 2024 16:00:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1732032012; x=1763568012;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Ol4pjF1rs0IdAv1vX85TbwzkYznXpOC2KWkPl4N/csY=;
  b=pQ9GLS3Wz+++Xcq3fI6HhUYqlMJAlG5ZQIraKWPyhw+28ynoJbcqzsl1
   OnhlWIn37xfcVJcsH/1x6HJaSYnMGHj6iZY4lhwcBjod2Xs6sgB++udAj
   2VttSUTjY7n9Cu2Spj7L42ieE9I/Cil3kh/QloYWDnEEdxvM+za108FAT
   7ecE4zbxVUPbLQXn9uzeh5EYFHKqVxeOFTcS5Jy7KNc9/w6ybv/tI2N91
   pVQXTHRkRCtBvr/+bmVie+fzU59lAYbM10pllPHBzNVebO/GLF9V0LBzT
   x7i+h2jA80clfBE+JJ21NKtK3Kl3Xbv0aqf/pDw0mqFocgfZr42TTkU95
   w==;
X-CSE-ConnectionGUID: jx9uf5d4QJWO8ovvuPewRw==
X-CSE-MsgGUID: zerSjUQ+SmaIvFgELvLcuQ==
X-IronPort-AV: E=Sophos;i="6.12,166,1728975600"; 
   d="scan'208";a="34515000"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 19 Nov 2024 09:00:11 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 19 Nov 2024 09:00:10 -0700
Received: from ROB-ULT-M91496.microchip.com (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Tue, 19 Nov 2024 09:00:08 -0700
From: <cristian.birsan@microchip.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Cristian Birsan
	<cristian.birsan@microchip.com>, Mihai Sain <mihai.sain@microchip.com>
Subject: [PATCH 2/2] ARM: dts: microchip: sama5d27_wlsom1_ek: Add no-1-8-v property to sdmmc0 node
Date: Tue, 19 Nov 2024 18:01:07 +0200
Message-ID: <20241119160107.598411-3-cristian.birsan@microchip.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241119160107.598411-1-cristian.birsan@microchip.com>
References: <20241119160107.598411-1-cristian.birsan@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241119_080012_023738_6835F2BF 
X-CRM114-Status: GOOD (  11.25  )
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

From: Cristian Birsan <cristian.birsan@microchip.com>

Add no-1-8-v property to sdmmc0 node to keep VDDSDMMC power rail at 3.3V.
This property will stop the LDO regulator from switching to 1.8V when the
MMC core detects an UHS SD Card. VDDSDMMC power rail is used by all the
SDMMC interface pins in GPIO mode (PA0 - PA13).

On this board, PA10 is used as GPIO to enable the power switch controlling
USB Vbus for the USB Host. The change is needed to fix the PA10 voltage
level to 3.3V instead of 1.8V.

Fixes: 5d4c3cfb63fe ("ARM: dts: at91: sama5d27_wlsom1: add SAMA5D27 wlsom1 and wlsom1-ek")
Suggested-by: Mihai Sain <mihai.sain@microchip.com>
Signed-off-by: Cristian Birsan <cristian.birsan@microchip.com>
---
 arch/arm/boot/dts/microchip/at91-sama5d27_wlsom1_ek.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/microchip/at91-sama5d27_wlsom1_ek.dts b/arch/arm/boot/dts/microchip/at91-sama5d27_wlsom1_ek.dts
index 15239834d886..35a933eec573 100644
--- a/arch/arm/boot/dts/microchip/at91-sama5d27_wlsom1_ek.dts
+++ b/arch/arm/boot/dts/microchip/at91-sama5d27_wlsom1_ek.dts
@@ -197,6 +197,7 @@ qspi1_flash: flash@0 {
 
 &sdmmc0 {
 	bus-width = <4>;
+	no-1-8-v;
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_sdmmc0_default>;
 	status = "okay";
-- 
2.34.1



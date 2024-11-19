Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47611D4417D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Nov 2024 16:03:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VBHmSGGoFGws0gUWk12eJKyQ+GybId9GUjoGMOIxfO4=; b=FQy0Z/WlT1jIhXgVGvlYMApEVZ
	+fvVmPV+JUS3GExswX4JFxE7QLe4Zn0XLH2vNjBcuZ8fkxn/BpltFXxSNa03ccSXkdRw1XYtyU6o7
	a/n7rItSF8JFEN8hUOKAM/vmOCYym/C/RofZC9iPhUCg5Q9tCCndOTXkJNaWjBAPugxv9qPju5TvK
	M0tHCJf4IKYPuPERaNqN1cilKtsyC/ZRCgRESz5Rj8khtMmy84t1dVB84FNmghTV7Z3ndmEw+t+ky
	QdJDoCkHBvvotOpUZxGWnDmEvNVk2cNPl1ICorKIlcIaEYBKEYP+FLt3K4El+1yUuBJ63GGo7hSZD
	sT3BygnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDQh9-0000000CxsG-13N8;
	Tue, 19 Nov 2024 16:03:15 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDQeQ-0000000CxQD-1emA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Nov 2024 16:00:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1732032027; x=1763568027;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=PG6VH6poG77y4wIxB0EeV+toD0HtWQliEBYkvGMzVwU=;
  b=hECG18y96rxC69stRnk7og+70ZKUbFW5HKfawMrWAfbK976V578dewEc
   VsIn8S/gF2yoxhOcGl8JWad3uEoLpYp/FWsxljbfhgLBMVkNMsfkTjexL
   sHs3qua+GarmirTJ3ob9DXL03GyfdM8ildlLVOZU36/xvMbuDMC1Xm0jF
   7NZvO0T8dzVQF5uxxHQKddq51unfJydPmTVQQEkd9cPB3x5ii73UgOdNp
   kRsAx2euRa/cYboTgOrqffV/j42HZA8AQE9spGdGwhV7Q5QnIvUzcG9/E
   Gj2+Mk2/PaUTyr7/+HtBab/HYFe9TwsVXoi0PscfE7xPHG4MBnaXdBm9O
   A==;
X-CSE-ConnectionGUID: 46Cw/aZBStWTzefJ58UrTA==
X-CSE-MsgGUID: 0CjZsGGURZu82JzWAfSU8g==
X-IronPort-AV: E=Sophos;i="6.12,166,1728975600"; 
   d="scan'208";a="265672241"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 19 Nov 2024 09:00:26 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 19 Nov 2024 09:00:07 -0700
Received: from ROB-ULT-M91496.microchip.com (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Tue, 19 Nov 2024 09:00:05 -0700
From: <cristian.birsan@microchip.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Cristian Birsan
	<cristian.birsan@microchip.com>, Mihai Sain <mihai.sain@microchip.com>
Subject: [PATCH 1/2] ARM: dts: microchip: sama5d29_curiosity: Add no-1-8-v property to sdmmc0 node
Date: Tue, 19 Nov 2024 18:01:06 +0200
Message-ID: <20241119160107.598411-2-cristian.birsan@microchip.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241119160107.598411-1-cristian.birsan@microchip.com>
References: <20241119160107.598411-1-cristian.birsan@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241119_080026_442467_129319A1 
X-CRM114-Status: GOOD (  11.37  )
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

On this board, PA6 is used as GPIO to enable the power switch controlling
USB Vbus for the USB Host. The change is needed to fix the PA6 voltage
level to 3.3V instead of 1.8V.

Fixes: d85c4229e925 ("ARM: dts: at91: sama5d29_curiosity: Add device tree for sama5d29_curiosity board")
Suggested-by: Mihai Sain <mihai.sain@microchip.com>
Signed-off-by: Cristian Birsan <cristian.birsan@microchip.com>
---
 arch/arm/boot/dts/microchip/at91-sama5d29_curiosity.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/microchip/at91-sama5d29_curiosity.dts b/arch/arm/boot/dts/microchip/at91-sama5d29_curiosity.dts
index 951a0c97d3c6..5933840bb8f7 100644
--- a/arch/arm/boot/dts/microchip/at91-sama5d29_curiosity.dts
+++ b/arch/arm/boot/dts/microchip/at91-sama5d29_curiosity.dts
@@ -514,6 +514,7 @@ kernel@200000 {
 
 &sdmmc0 {
 	bus-width = <4>;
+	no-1-8-v;
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_sdmmc0_default>;
 	disable-wp;
-- 
2.34.1



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1A43CD5BC9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 May 2026 09:25:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G3/0SgtMhtyUnpy/VI8oodK74FkxjvIe57/jcAaI9bc=; b=E+1hgqveueX4o8F82uVExYZ+HL
	tRrxCyG8Sq38WHgyHIRrKgLL/hyjILylC2MTkQ+joyNQHlofHGcDUZ6YJcUAob66doUCxjEJRPgdF
	g90/vjLwM3BeupkE0xk8JPvKPqu2y2hJOAtBvg8bC9rNLQruhtNIZAc1FI1MHnZPdrkICn2IU3Wix
	B9oytDYlWLZH/BunlDQIvgMHnHRZ4lyLC4MYDRwzre54BOEkxewvE6/ielsrXM+IJqV8P8ACNAlat
	pQy2U1fGeeX1Do1r896BLP8lDJF3EI0QukiB3YOo1AUy7puo25ziV2fIL7YSS8hZJ3qEYAy2rSI/W
	pWOvjq7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRRYU-0000000GnlE-2wh2;
	Mon, 25 May 2026 09:25:02 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRRYT-0000000Gnjx-3Yst;
	Mon, 25 May 2026 09:25:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=G3/0SgtMhtyUnpy/VI8oodK74FkxjvIe57/jcAaI9bc=; b=XgTBMaW+K+IAXuQba3enNkmm/d
	QjQRx0BWo5VVF05KbdaV2G0sAh0MXeROOrUUTvqoLN+eJTl1aRfWxKrevIGWurBvpI7Ty3LDeAtFJ
	eBLCw5sZOib+XkxKIYmNJ6szr+NaCKwx4wXkkjbp5O53Se2Zheh28au1fjOUDEQdue2XB5DPETHzH
	Ssdm7dQTLbmJSiAg71SxKRpTvWpXDAZS2WrhUo4Y+w5CrHF4bomv8hGBaRDy6OWGWXAouC8Sliycc
	7q/4xWdpu+sww5yORNHK2MKnxScKHwDKRt6zD/1kAcb0RbWRTk9a9nbfkQS1Rm91Aq8afpCy2i6L3
	w9geqAuQ==;
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRRYQ-00000008tGj-29Mr;
	Mon, 25 May 2026 09:25:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1779701098; x=1811237098;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=pKstJqIbxk0Ue2zAoMPdklquNi0PqQrfx/ZrdyDQFRs=;
  b=j4HTwf4KOW5k6cYb95gQG1oGtmtwY9L2uYAZaTPImROL6riN1mWXNXMs
   maNuFYrXCEILXB1dpBTzxXco1+sace73QGWlL5/aFwBBG9qFt66WvLDs8
   hZr+SeK0OpgFeoZFarHxOUoh2KXqjhs6qD7IQc073UDLF5ycFVNzh6yO1
   u1NYGCcxNbksxre4luIJfeV4j4yqXxm6hplVYpARdui5mglw979kyW7M6
   960cB65veKKqMCERUh9DiZynzSXBJ+sSc+zhYvjTCvtPE3H7ze8bVZ5V0
   YgOlApievxM6gaZ0ClDrw5DEQ+G0xPV6ZGyw4dnuJnXcJa1IaedvVSouS
   g==;
X-CSE-ConnectionGUID: XjipzVgLS1yUI+zFzoxh8A==
X-CSE-MsgGUID: UR006FT3QhKmEXG5+z8Sxw==
X-IronPort-AV: E=Sophos;i="6.24,167,1774335600"; 
   d="scan'208";a="66842536"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2026 02:24:55 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex4.mchp-main.com (10.10.87.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.41; Mon, 25 May 2026 02:24:55 -0700
Received: from che-lt-i67131.microchip.com (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Mon, 25 May 2026 02:24:47 -0700
From: Manikandan Muralidharan <manikandan.m@microchip.com>
To: <alexandre.belloni@bootlin.com>, <Frank.Li@nxp.com>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <nicolas.ferre@microchip.com>,
	<claudiu.beznea@tuxon.dev>, <linux@armlinux.org.uk>,
	<mturquette@baylibre.com>, <sboyd@kernel.org>, <bmasney@redhat.com>,
	<aubin.constans@microchip.com>, <Ryan.Wanner@microchip.com>,
	<romain.sioen@microchip.com>, <tytso@mit.edu>,
	<cristian.birsan@microchip.com>, <adrian.hunter@intel.com>,
	<npitre@baylibre.com>, <linux-i3c@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-clk@vger.kernel.org>
CC: Durai Manickam KR <durai.manickamkr@microchip.com>, "Manikandan
 Muralidharan" <manikandan.m@microchip.com>
Subject: [PATCH v7 4/5] ARM: dts: microchip: add I3C controller
Date: Mon, 25 May 2026 14:54:04 +0530
Message-ID: <20260525092405.1514213-5-manikandan.m@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260525092405.1514213-1-manikandan.m@microchip.com>
References: <20260525092405.1514213-1-manikandan.m@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260525_102459_215301_42CFA2F4 
X-CRM114-Status: UNSURE (   9.02  )
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

From: Durai Manickam KR <durai.manickamkr@microchip.com>

Add I3C controller for sama7d65 SoC.

Signed-off-by: Durai Manickam KR <durai.manickamkr@microchip.com>
Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>
---
Changes in v3:
- Remove clock-names property as the driver acquires and enables
  clocks in bulk using devm_clk_bulk_get_all_enabled

 arch/arm/boot/dts/microchip/sama7d65.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/microchip/sama7d65.dtsi b/arch/arm/boot/dts/microchip/sama7d65.dtsi
index 67253bbc08df..ec200848c153 100644
--- a/arch/arm/boot/dts/microchip/sama7d65.dtsi
+++ b/arch/arm/boot/dts/microchip/sama7d65.dtsi
@@ -1055,5 +1055,13 @@ gic: interrupt-controller@e8c11000 {
 			#address-cells = <0>;
 			interrupt-controller;
 		};
+
+		i3c: i3c@e9000000 {
+			compatible = "microchip,sama7d65-i3c-hci";
+			reg = <0xe9000000 0x300>;
+			interrupts = <GIC_SPI 105 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&pmc PMC_TYPE_PERIPHERAL 105>, <&pmc PMC_TYPE_GCK 105>;
+			status = "disabled";
+		};
 	};
 };
-- 
2.25.1



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 877B6E77197
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  5 Jan 2025 15:05:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=SZYwc4vBlldLtmS7t8q5HbKKN19HNEjLlzpxgjKSx50=; b=AVsl44fy5zauqJUK/ZaWRTf7Ie
	h3Ejeap9VtLA52e9se/xy6nXXUByNdOqlj7Ez6Vxq4gQw95HwHiuOjrbAwn5cRbrsfLXwiqaoHX7p
	8Lpx9i2Uei9T+aPa//gNG2ZdGDF23x4Kf1CcY/J3X9uRsjs8mKfVrCsSQW0+mnweXdKVOXZdzAUVb
	Kv7ekoVZ0AKG0vxnqfpVXJTMdqaTO8RDy+QcVY0eZOXNkIRelkglJqI0a+ea0LZ11IlWUrCo1AcUI
	vJDCEyLYhJFLKz+fYrb8uafjUjS8zyxRhZi12KmoO38a20jTN637Z/V3fSDXzudQZV1n28TbL5deL
	sJexR4Vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUSBn-0000000GxbZ-09Iy;
	Sun, 05 Jan 2025 15:05:15 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUSAb-0000000GxQv-2C2E;
	Sun, 05 Jan 2025 15:04:03 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-436345cc17bso98274795e9.0;
        Sun, 05 Jan 2025 07:04:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736089440; x=1736694240; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=SZYwc4vBlldLtmS7t8q5HbKKN19HNEjLlzpxgjKSx50=;
        b=E8tlAwS+A8Vb1KCQYpNqThJNGAJIZWzjOWCzvbuaAT7tiBjkdhAC6+62JRBQjIrp3w
         AL0O7mhtUBISM7SDVcpkUCNiYG9jG/5OoCgr7i3mbRt3vhLyAdCswAfQqpDfY0mgrUV3
         yhPu7QlGNRGZDqEDjb8mw/WTSezIU536gXxrJGBLPRuNH4olmlMv/Vc/X655btt+OjGi
         Z+MXD3R729eYxIxOkvcJYnutEM528iWxeG6Q//fuIT84np5R9AqVDTuLWhpxzVamWqt2
         ZTG7slO+onbMVa5LwS9KHK1uPnh6ibQeciHvAawl/lwzyVxqcztjcuxMvN2No06e2anA
         dtDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736089440; x=1736694240;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SZYwc4vBlldLtmS7t8q5HbKKN19HNEjLlzpxgjKSx50=;
        b=Oy+gU4SbQbXwO5dcNNJ2DamaHKD6sPJUAKIxC5PFYmFMjHNtuT2dtbDB/v1G5vp8kH
         9l79LO5fanubZML5TE7XdzVsmH1xeqVRYnCNz0GBMI4UEO9WoQ2rS1jVVLILdqTgnDlu
         4FctHB1m3gSA8Un7mm7VcGIDr5JKW9kQCKVZmJcUvnPlsLlrqNxQS9nB+jlP22bCavD/
         6rvErjFCZeGDDSkhncmEdNTI4KY8b8p4SSsHEDX4lmx1OBXyJuQ1WeVqgV7+n4HYCiXJ
         zOCKxW0LFrVB9EKRMX7LhE2kKMTxMVhiphP7W9V4CzJs/bZ7aEbA7koNN9f0x+Jbo7Yt
         N+Ww==
X-Forwarded-Encrypted: i=1; AJvYcCUCwt1f6XNoodiv35PX7ny1BXSGbIbQ0WGVs2clsFpSLm6t7wvD7kggU9c1kdwgKDsXpB6mt9uBgkmDLWU7CD6t@lists.infradead.org, AJvYcCUgmxTPZELuQ8Wa38xQYpAgjwpD8FCOvlLSzjPjqctpkdfORJABgGpwsaeUNVybtH7le9j/gz0CK8U7rkDgak0=@lists.infradead.org
X-Gm-Message-State: AOJu0YwzVkmA1oZD+6cdwWoASNg0L0QJsLDThGSNAT2DZTBHRllK/frJ
	5w4gBDdPEcuel23AP2fs0GFrbtBZ6N2JoHz7Je7aliZ3TVY87+8X
X-Gm-Gg: ASbGncveNPd+DOZ6KjCVa+e1heRjUxnKVkeDgNvPWCgtfe3pYgHUGt4WZtSqlPJdRi7
	6vMDf6RxuuMaF7sCsA16ZOyn1YOOjCE/YkiG+Ekc/YBIb5RAed64qd/oXJHgX9MwFaRj4lp0FWr
	WEo3AbgX9jVlxKZenKjYrx3SZNbacBZN4kUeHhMnsFDQgXfkQGOexHYkH/YieFh+I8qkI2JAxYm
	oWajRahGP2OwmzPRL3AoV3bTgzD2CH0TIHdBQ+V7ozllatDWAxoq25IQRyy3z/hPnguBFDUC4PD
	d+BnOqdEJQNSnAfp+tf1GWTN4ob6UzshrNeKgKq6MQ==
X-Google-Smtp-Source: AGHT+IHebaAAInYSXzL9iYrnBo2kfWHp3RSAI5cBP+sHWmXA2QcdnbuRh4mwWoMTcHs0UGfwg1l6cQ==
X-Received: by 2002:a7b:cd95:0:b0:436:30e4:4590 with SMTP id 5b1f17b1804b1-43668b7a1d0mr407669125e9.32.1736089439765;
        Sun, 05 Jan 2025 07:03:59 -0800 (PST)
Received: from localhost.localdomain (host-95-246-253-26.retail.telecomitalia.it. [95.246.253.26])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4366128a62asm536258685e9.44.2025.01.05.07.03.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jan 2025 07:03:58 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Daniel Danzberger <dd@embedd.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	upstream@airoha.com
Subject: [PATCH 1/3] arm64: dts: airoha: en7581: Add Clock Controller node
Date: Sun,  5 Jan 2025 16:03:02 +0100
Message-ID: <20250105150328.15172-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250105_070401_577004_1B01D9B0 
X-CRM114-Status: GOOD (  10.44  )
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

Add Clock Controller node for EN7581 SoC to correctly expose supported
clock for any user in the SoC.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 arch/arm64/boot/dts/airoha/en7581.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/airoha/en7581.dtsi b/arch/arm64/boot/dts/airoha/en7581.dtsi
index 55eb1762fb11..f584409e72cd 100644
--- a/arch/arm64/boot/dts/airoha/en7581.dtsi
+++ b/arch/arm64/boot/dts/airoha/en7581.dtsi
@@ -2,6 +2,7 @@
 
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/clock/en7523-clk.h>
 
 / {
 	interrupt-parent = <&gic>;
@@ -142,6 +143,13 @@ gic: interrupt-controller@9000000 {
 			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_LOW>;
 		};
 
+		scuclk: clock-controller@1fa20000 {
+			compatible = "airoha,en7581-scu";
+			reg = <0x0 0x1fb00000 0x0 0x970>;
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+		};
+
 		uart1: serial@1fbf0000 {
 			compatible = "ns16550";
 			reg = <0x0 0x1fbf0000 0x0 0x30>;
-- 
2.45.2



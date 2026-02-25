Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB69EEFD20D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Feb 2026 08:56:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5/Ky4c0jFhB/iJHIyTFIfBgG41nIfDEnt72OI6C/+fQ=; b=VNNOf4eSTJC4f5vX3aOXeEbWRz
	RayrhInq3Smb7oetpiJqZo74Kdv+wOGQGqwa895k2mw4tZD0YpDvFdX5IMw3AZlPjeVQ5JKiMslmk
	GC5mz/4R6z2vIYpcC9rLmoM9xw4CN+ASW6j7H5UQdKqjDoaluNWZAYaa+vthd9O66tTxvW5XlJljj
	Wr3Fcppd/oMsmBmETFOnATkxoRA/lPo3pKe6VBsBnevwPiRXuxnpBkqSQVZ/atELBCJhJbLlSVB6H
	SOayCCfiGelS6eTDFRLoC86ElFN/kgruQ7ljUAM5y3B1yepHuKSMOTPWalOn6zJRlqMN6+CB9vngU
	h46KW4bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvAh9-00000003av8-1XyX;
	Wed, 25 Feb 2026 08:56:35 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvAh7-00000003au4-2sDE
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 25 Feb 2026 08:56:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=5/Ky4c0jFhB/iJHIyTFIfBgG41nIfDEnt72OI6C/+fQ=; b=DI3M/ksx2+Bpp8SMdOYetpm7wr
	Caqw4fcxtIWWtNz8dZa+fubF0guunElDGz1WLmnBLU1a6VD0Ek/0tJi8B7O+DtHQfELRNkPcAreUz
	DSned49NIcploVBqie1SgBzy6HGaKdo5iR3VNDRtdVs90IMWD/fSIO49SAzNxAR12Eb+CbZnJzQqb
	IYnVRzYrwKNp8pwnQOdiXPb8GJ9YSb8IB1zAB6wVbwdn3dBpAlLOcFLBOlf2ZinULLitzXhh5Nm0y
	cWXKTMO0XFpWdh95mgNtSjRIZoMKt1PnWmYwdNUNjhHEEZn6jSE1lfIfRt8mJAyOO597BfqQ1zMMg
	1eiHPbBQ==;
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvAh4-00000008bmd-34q4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Feb 2026 08:56:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1772009790; x=1803545790;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=6v34uZLFPaLXSyOKm1xWqZsBnN+gU3NkxSz33eF+XEI=;
  b=0kvn5er/jkPyiK8eiL2OXfnqCC978PWZupoie5NW2mUfx5WY9yUuRmF1
   FRYgVx9BhGJ77i240BICzF/clu+UeRUuuu5jUb7SUC1yXoosxC6U7xCzU
   c3qMLoIzn88zaRmsPJ0dAah8EFMjURpqaqvrWjITV11ApeJp0Zbj7OL0z
   RtZ/SgopUjNSZYAmV29ifAmn2cL9Q/jcfZQHv0spNe9JUp5P2gF6Cm8YW
   X204SwCvz7BiEpqQe8Z5SafmcYPbl0QEu0V+ko95zQEA1yWHGqERTlojr
   LaBf3ZdmZ/1+c22dJBgkqyakuWqQIc5DYRicGSCT/3kMl5W70hXq//DyF
   Q==;
X-CSE-ConnectionGUID: CuTHRctdSuOo+CeX/pVyrg==
X-CSE-MsgGUID: /tnDRAcCQmC9hLXsVoUJvg==
X-IronPort-AV: E=Sophos;i="6.21,310,1763449200"; 
   d="scan'208";a="61258797"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2026 01:56:21 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.87.152) by
 chn-vm-ex1.mchp-main.com (10.10.87.30) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.35; Wed, 25 Feb 2026 01:56:11 -0700
Received: from che-lt-i67131.microchip.com (10.10.85.11) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Wed, 25 Feb 2026 01:56:00 -0700
From: Manikandan Muralidharan <manikandan.m@microchip.com>
To: <andrzej.hajda@intel.com>, <neil.armstrong@linaro.org>,
	<rfoss@kernel.org>, <Laurent.pinchart@ideasonboard.com>, <jonas@kwiboo.se>,
	<jernej.skrabec@gmail.com>, <airlied@gmail.com>, <simona@ffwll.ch>,
	<maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
	<tzimmermann@suse.de>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <nicolas.ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>,
	<linux@armlinux.org.uk>, <ebiggers@google.com>, <martin.petersen@oracle.com>,
	<ardb@kernel.org>, <tytso@mit.edu>, <dri-devel@lists.freedesktop.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
CC: Ryan Wanner <Ryan.Wanner@microchip.com>, Manikandan Muralidharan
	<manikandan.m@microchip.com>
Subject: [PATCH 3/6] ARM: dts: microchip: sama7d65: add LVDS controller
Date: Wed, 25 Feb 2026 14:24:27 +0530
Message-ID: <20260225085430.480052-4-manikandan.m@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260225085430.480052-1-manikandan.m@microchip.com>
References: <20260225085430.480052-1-manikandan.m@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_085631_149352_3043D76A 
X-CRM114-Status: UNSURE (   9.33  )
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

From: Ryan Wanner <Ryan.Wanner@microchip.com>

Add support for LVDS controller node

Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>
---
 arch/arm/boot/dts/microchip/sama7d65.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm/boot/dts/microchip/sama7d65.dtsi b/arch/arm/boot/dts/microchip/sama7d65.dtsi
index b2fe76115aec..8aa38f29082b 100644
--- a/arch/arm/boot/dts/microchip/sama7d65.dtsi
+++ b/arch/arm/boot/dts/microchip/sama7d65.dtsi
@@ -304,6 +304,15 @@ pwm {
 			};
 		};
 
+		lvdsc: lvds-controller@e1408000 {
+			compatible = "microchip,sama7d65-lvds", "microchip,sam9x75-lvds";
+			reg = <0xe1408000 0x100>;
+			interrupts = <GIC_SPI 104 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&pmc PMC_TYPE_PERIPHERAL 104>;
+			clock-names = "pclk";
+			status = "disabled";
+		};
+
 		aes: crypto@e1600000 {
 			compatible = "microchip,sama7d65-aes", "atmel,at91sam9g46-aes";
 			reg = <0xe1600000 0x100>;
-- 
2.25.1



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C2E8C61DCB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Aug 2026 15:02:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lgyRAX691+dPee2wS+kYKvMuKZnnQ8dpo3wSmi/bPIU=; b=gwQnYnkI2ICxegkmpbf9QiwpTE
	BezPOewGBwGpenENGA745CQbkKc8uVpVu8lPEhzWonCB7D2TKOD5rTlTtdqdWuh3Lbxi3MZx76kfw
	kvbURb8Af6vtSwuyV0rjYDrmdIM9IM2lXwbM0cTRmlozCcu27gZvChR8AZxdj10r6FlaD3U+O+wVI
	+Gm4KGdsY8B/1kr4bkEBmRCGhgvYpHMah33sR4+cVJCQZNMNlZK/X1w5W1nG0EU407AqQ3PKKcQU0
	Nf2HrNx7ZwE1FQh/fGJKI2EP+m1z26IdWUfj6dyuuom4GhCm6FUlxyuoxrHtT1UylLq3a1vb1mtBS
	KpGQMWWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzy67-000000062l0-1QDx;
	Fri, 28 Aug 2026 15:02:27 +0000
Received: from mx.nabladev.com ([178.251.229.89])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzy63-000000062jM-2fai
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Aug 2026 15:02:24 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 397FB11D0AA;
	Fri, 28 Aug 2026 17:02:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1787929337; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=lgyRAX691+dPee2wS+kYKvMuKZnnQ8dpo3wSmi/bPIU=;
	b=Uq5xrl3beHun1dOTIQsWriWCLv/odlot+SXmeVGN5jCAOIS7o3KZgex6ogOTtOoz1OnpoW
	GfURJ92iGnzXCfCaynyffePhUyPjTjodd59yLNa0AI+a0GnjvhHxxHAbkyl0LTqtfrKhoj
	onmWJV2l5UeuY8khTp+mK+hrLU9z4NHSKuaVAavySWforJ0UxPIEMQSmibihmsBul/Z/RI
	bxRrIswbR0u+j/vJpSFUqJd2qg1mRPvzmqinFg/S3KXrnFiCgfuBN469vjvSQ0BrSFoWAG
	KNh2wbsuiyccQ4wGVHTw+O3gbl1ooVo522bKEegVWpHh2hyItT0ak242Wparig==
From: Marek Vasut <marex@nabladev.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marex@nabladev.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-usb@vger.kernel.org
Subject: [PATCH 3/3] ARM: dts: stm32: Use STM32MP15xx compatible string for OHCI USB controller
Date: Fri, 28 Aug 2026 17:01:28 +0200
Message-ID: <20260828150202.173109-3-marex@nabladev.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260828150202.173109-1-marex@nabladev.com>
References: <20260828150202.173109-1-marex@nabladev.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260828_080223_824793_8D18E5DA 
X-CRM114-Status: GOOD (  11.81  )
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

Use accurate STM32MP15xx compatible string for OHCI USB controller in
addition to "generic-ohci" fallback compatible string. This is future
proof, and drivers can match on the accurate compatible string in case
they need to discern this controller from the generic-ohci one.

Signed-off-by: Marek Vasut <marex@nabladev.com>
---
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-usb@vger.kernel.org
---
 arch/arm/boot/dts/st/stm32mp151.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/st/stm32mp151.dtsi b/arch/arm/boot/dts/st/stm32mp151.dtsi
index e7fec8b49ae16..c37005c00ad65 100644
--- a/arch/arm/boot/dts/st/stm32mp151.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp151.dtsi
@@ -504,7 +504,7 @@ crc1: crc@58009000 {
 		};
 
 		usbh_ohci: usb@5800c000 {
-			compatible = "generic-ohci";
+			compatible = "st,stm32mp15-ohci", "generic-ohci";
 			reg = <0x5800c000 0x1000>;
 			clocks = <&usbphyc>, <&rcc USBH>;
 			resets = <&rcc USBH_R>;
-- 
2.53.0



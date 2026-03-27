Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A418610ED64A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 11:30:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EW/J3uG57P2+e3hbk/Z/tZY99p2uCsKKPBg7y6l/n9o=; b=l+DnhV/EU8npEnDexUx6XxhYS3
	A79JIyrz8BGR950GccGbzMj83ufEXB9Jk89mgA68PYdY+G6rwYhFuArZGZ09yZaITJb79g/J0L1/Q
	AXQGhaYQBm/XsYAtcCxZ1+J7T6kX+PmilfwVIZMkYwmSfV0vTEXa4omdR70w8ls3mARGl7e/ZLlAx
	KojzsO2/x199YrQj/sDV5pLG5Z9Gh/INIIo+Wsg0zjXs9LsSsCspwzrn7VpzXRk2sl0fiZ9bMhkyZ
	mgEoKCz2JH5vH2tIl54dvb+d9nY7ayqq3/5IAmmi+OIZwtlYbUKaZ+XIYXLoNuuKCVgFlVWuO1pYv
	nqArhk/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w65OV-00000007Dp8-3G0H;
	Fri, 27 Mar 2026 11:30:27 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w65OS-00000007DnM-2oWw
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Mar 2026 11:30:25 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AA2F635A5;
	Fri, 27 Mar 2026 04:30:17 -0700 (PDT)
Received: from e142021.cambridge.arm.com (e142021.arm.com [10.1.36.137])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 22CC03F915;
	Fri, 27 Mar 2026 04:30:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1774611023; bh=Y3T8xRAs7JXDcEo+gWDq1I9uwUeHLYQQvz2VKR+rIUI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ifRKBWRHlSdvntmE1SxaosuGSreCu5yjtYQl5wL/Ksnz/TA9plMpK522zRHKs0rok
	 Qw8edHAldAkI5OwAbfOI/umOzqQN/zYTaEb2TghGB70uk8Ev72CEZb208hXOggt9mT
	 eK0h/2GyC/f9D5KNdTFJ5mPrrDPXykBjpk3CAr5E=
From: Andre Przywara <andre.przywara@arm.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/3] arm64: dts: allwinner: a523: Add missing GPIO interrupt
Date: Fri, 27 Mar 2026 11:30:06 +0000
Message-ID: <20260327113006.3135663-4-andre.przywara@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260327113006.3135663-1-andre.przywara@arm.com>
References: <20260327113006.3135663-1-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_043024_750138_DC009C43 
X-CRM114-Status: GOOD (  11.01  )
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

Even though the Allwinner A523 SoC implements 10 GPIO banks, it has
actually registers for 11 IRQ banks, and even an interrupt assigned to
the first, non-implemented IRQ bank.
Add that first interrupt to the list of GPIO interrupts, to correct the
association between IRQs and GPIO banks.

This fixes GPIO IRQ operation on boards with A523 SoCs, as seen by
broken SD card detect functionality, for instance.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
Fixes: 35ac96f79664 ("arm64: dts: allwinner: Add Allwinner A523 .dtsi file")
Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
---
 arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
index 9335977751e2..cea5b166c00f 100644
--- a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
@@ -128,7 +128,8 @@ gpu: gpu@1800000 {
 		pio: pinctrl@2000000 {
 			compatible = "allwinner,sun55i-a523-pinctrl";
 			reg = <0x2000000 0x800>;
-			interrupts = <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>,
+			interrupts = <GIC_SPI 67 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 71 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 75 IRQ_TYPE_LEVEL_HIGH>,
-- 
2.43.0



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AC60C43458
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 11 Jul 2026 21:02:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YxKx3is/yCeVSwU3UhNrLTwlQPWlNmb1dz/uD0wRxXw=; b=upcUdCLHGgAhCdmaXrhRLHB023
	gQ4SG0IDRWoYE/hWdrkcut8d5G2C161ZWLOLtIE8kmF1L2MOxhfcQQv+8r3bufbuG3eT4ZW6nM4im
	wawCmjJxUFUBOQAxg3mDatfJZ65nL76U36sr0Oe1TOF/i/PEF73y2avsQpLo2ZMH0DuUFhI+w9ug8
	4stQ7sHtvnqmjcrTObITJquzB1fl5OKweAfYiKaEDbuhVDBPAQv/49lggyLKm4FgKjVDfQgw7aYYf
	JXRcZMEmVuiCfKRffPdvwr5UhzZOMqHTmwguitQewGmo0CBwcUSFtIU4v5i6gbTpf3W1nCKGy3ilI
	CwVtCW5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wieph-00000006t0e-2L73;
	Sat, 11 Jul 2026 21:01:57 +0000
Received: from mx.nabladev.com ([2a00:f820:417:0:178:251:229:89])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiepe-00000006syt-2Pif
	for linux-arm-kernel@lists.infradead.org;
	Sat, 11 Jul 2026 21:01:56 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E2117119846;
	Sat, 11 Jul 2026 23:01:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1783803710; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=YxKx3is/yCeVSwU3UhNrLTwlQPWlNmb1dz/uD0wRxXw=;
	b=Nmt32673ywguMRBqEVI498ph9uGH3f01nXTPRFB2E2pb5njYXYCnLc6sJKfdMPjDPlNTJC
	W+kKpPEBZnDeZ2E9GIkCv2E88lfg7dVZ3dnzhNnhBeRdsOPB7/ZRd/GAWvf+nDpAWrcP1V
	8EZfuabofjtadEeGIbzkuLq2skXrU3m4Yj1QIDYBlDuQDQXTZaMPPFqBujk5jn6XbC27SI
	WHi1P6/rQoyUbyqBWYzqpEa+a81U8tMNo72GV1LUAehYirKUYuEnZFuer2DruNxujBZe/r
	CaGw04XUOVA6Kecw3u/JdWKfskErUQtjPp7vL4ygxSlYtDTLpCLCXN3rAMh0MA==
From: Marek Vasut <marex@nabladev.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marex@nabladev.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	kernel@dh-electronics.com,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH 04/10] arm64: dts: st: Fix SDMMC1 indent on stm32mp251
Date: Sat, 11 Jul 2026 22:59:33 +0200
Message-ID: <20260711210131.236025-5-marex@nabladev.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260711210131.236025-1-marex@nabladev.com>
References: <20260711210131.236025-1-marex@nabladev.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260711_140154_825005_5BB1362A 
X-CRM114-Status: UNSURE (   9.67  )
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

Drop bogus space. No functional change.

Signed-off-by: Marek Vasut <marex@nabladev.com>
---
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>
Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: kernel@dh-electronics.com
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-gpio@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-stm32@st-md-mailman.stormreply.com
---
 arch/arm64/boot/dts/st/stm32mp251.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/st/stm32mp251.dtsi b/arch/arm64/boot/dts/st/stm32mp251.dtsi
index 9c63fdb5a885a..66f3f83b8731f 100644
--- a/arch/arm64/boot/dts/st/stm32mp251.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp251.dtsi
@@ -1657,7 +1657,7 @@ sdmmc1: mmc@48220000 {
 				arm,primecell-periphid = <0x00353180>;
 				reg = <0x48220000 0x400>, <0x44230400 0x8>;
 				interrupts = <GIC_SPI 123 IRQ_TYPE_LEVEL_HIGH>;
-				clocks = <&rcc CK_KER_SDMMC1 >;
+				clocks = <&rcc CK_KER_SDMMC1>;
 				clock-names = "apb_pclk";
 				resets = <&rcc SDMMC1_R>;
 				cap-sd-highspeed;
-- 
2.53.0



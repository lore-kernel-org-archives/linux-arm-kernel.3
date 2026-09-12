Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16F6DC88E53
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 12 Sep 2026 20:45:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Myy3smEvql/qodoHPfYgXGKdcJUKumaY+uFvrhTMU5M=; b=TxNEYRT6HtAq3AsPv2G2pQ7h94
	3TTiubbAPGDU+qFsFDN0ve32oORHOVrIc5heEeGXQ7kPjWLZA5jWmvj2HmmSwCz7+kEp4k30hwO6H
	TXUTSfvmC+xzJ1185d7kqqCkjgVFFJ4aGzmF8W7eaT2mGSwYs0gVCRQkUwvbDeC2rpgeA+JePbPwj
	x4F1pbxfmavMFS9X+fLgIPGl8v39ErjEBuu84+YxKyCRKkL3XVfMEMws4piqb1+9ySKlaCzEQE3xq
	Ew9tGdDxp2db7OCeojWCCR+Yep7s+7FtZXhZ+kOQTn31qZ1YNCTfVugHQL7Fzd7pmWMkxi7bATkQ2
	ZKDZdEmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5UbA-00000001C91-2zYj;
	Sat, 12 Sep 2026 20:45:20 +0000
Received: from mout01.posteo.de ([185.67.36.65])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5Ub2-00000001C69-09wi
	for linux-arm-kernel@lists.infradead.org;
	Sat, 12 Sep 2026 20:45:14 +0000
Received: from submission (posteo.de [185.67.36.169]) 
	by mout01.posteo.de (Postfix) with ESMTPS id BF224240028
	for <linux-arm-kernel@lists.infradead.org>; Sat, 12 Sep 2026 22:45:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.net;
	s=1984.8680eb; t=1789245904;
	bh=Myy3smEvql/qodoHPfYgXGKdcJUKumaY+uFvrhTMU5M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:From;
	b=ahGVWikQWzElFIqOcmtCZv6GyrHrNdCT13y08LejH4cvzx87/fX/9QqXntFKyrNpk
	 QVBVvLbmhdVx06AFRD04peCv1B8VEtU7XeMtF74uBj4nCGyKv3cN1ax6NkU39CyMTT
	 IrNeqZTvhAAqlKf3XKheadISthEvgKq2KyCyTX5mct+iBD+S8fW+XBXg7xHnCTRpJ0
	 Zl9BaBCywdudLwNCiirOakAFDk5uanx/aG4QO6azDnN8HUIKF9RIJPbMY0ah+7hXRG
	 yA7MUd8FLW4pHZDtiHdPhCdXyIWr9eMIbu/qwkqwTH+Bk8AavvstpHBZPykjVdj9DJ
	 93rszw+rOoxLQ==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4hj3M32998z9rxG;
	Sat, 12 Sep 2026 22:45:03 +0200 (CEST)
From: Mateusz Nowicki <mateusz.nowicki@posteo.net>
To: alexandre.torgue@foss.st.com,
	mcoquelin.stm32@gmail.com
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] arm64: dts: st: add sdmmc2 node on stm32mp251
Date: Sat, 12 Sep 2026 20:45:04 +0000
Message-ID: <20260912204454.219606-2-mateusz.nowicki@posteo.net>
In-Reply-To: <20260912204454.219606-1-mateusz.nowicki@posteo.net>
References: <20260912204454.219606-1-mateusz.nowicki@posteo.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260912_134512_224165_C3179627 
X-CRM114-Status: UNSURE (   8.96  )
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

Add the SDMMC2 controller, the same PL18x/SDMMC2 block as SDMMC1 with
its own delay block in SYSCFG (DLYBSD2). It is used for the eMMC on
the STM32MP257F-DK and STM32MP257F-EV1 boards.

Signed-off-by: Mateusz Nowicki <mateusz.nowicki@posteo.net>
---
 arch/arm64/boot/dts/st/stm32mp251.dtsi | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp251.dtsi b/arch/arm64/boot/dts/st/stm32mp251.dtsi
index 9c63fdb5a885..0d10023ec1e3 100644
--- a/arch/arm64/boot/dts/st/stm32mp251.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp251.dtsi
@@ -1667,6 +1667,21 @@ sdmmc1: mmc@48220000 {
 				status = "disabled";
 			};
 
+			sdmmc2: mmc@48230000 {
+				compatible = "st,stm32mp25-sdmmc2", "arm,pl18x", "arm,primecell";
+				arm,primecell-periphid = <0x00353180>;
+				reg = <0x48230000 0x400>, <0x44230800 0x8>;
+				interrupts = <GIC_SPI 197 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&rcc CK_KER_SDMMC2>;
+				clock-names = "apb_pclk";
+				resets = <&rcc SDMMC2_R>;
+				cap-sd-highspeed;
+				cap-mmc-highspeed;
+				max-frequency = <120000000>;
+				access-controllers = <&rifsc 77>;
+				status = "disabled";
+			};
+
 			ethernet1: ethernet@482c0000 {
 				compatible = "st,stm32mp25-dwmac", "snps,dwmac-5.20";
 				reg = <0x482c0000 0x4000>;
-- 
2.55.0



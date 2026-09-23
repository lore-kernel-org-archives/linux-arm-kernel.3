Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53BCBC982FA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 11:47:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kDt4WyxgQNcRXLafMjpuldGxED7+3K9ipqHfql1hMXk=; b=DHkkndjYftaRFs+O/Mvw7k+gRP
	8Oeh/gb+wPia6QZgayftC+XRtFwVvCOmkwdhsRrIcllMQ8/OqbGODK7winLGdQD9t5IXvlR3xIRaA
	BixA7iD8C7ASdDUuj/Zm52gTu8m8/DPu64z3rFJR8phcwT5zBPXkhzbZlSrb8LnU0Y0G1DKbL3W6Q
	wvDCsXCWef6BGhSD/8X87Q9HZLvY8ZWy5sU+jJ1gtlM2zNbAIecc6XbQ7tCwY7DN75rnOyZBW/xnh
	7+mkWAuMmOOjnJIF01cMYzdd29H/s0z4FlfnjCubExFCldE5tZjmRexPtp71/pOlRV/OcKhQNeQmK
	2pzSTVkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9LRz-000000087a9-0RFW;
	Wed, 23 Sep 2026 11:47:47 +0000
Received: from mout02.posteo.de ([185.67.36.66])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9LRw-000000087Ys-3VJZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 11:47:46 +0000
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id B93A0240107
	for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 13:47:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.net;
	s=1984.8680eb; t=1790164060;
	bh=kDt4WyxgQNcRXLafMjpuldGxED7+3K9ipqHfql1hMXk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:From;
	b=O9x+SGVxx6GMsazDpF7WbXnnL2DhDu1H81xxEnmZ036seD3fhTQ8FPHwmYXwybDRx
	 pJkdtD8YkmA83v1zelF8NRfEsATQEC8bz6uDXw60+BVQNSAMsXRT0WkK7yzaHwDWEe
	 oDkBJXC03EDXoM5ZBvcDbOZOKOxBaTADdKO6aqmMTbRJSlJ399zX7bL/TlHmb17vre
	 9kMc96M+oY0NibE7LviuAegYF6FDL8a7MrWmCOoKUXhaay+Uib37jjRmu6KMNw6Mai
	 YKwVM6dKPdU7z6jNWpTUbwiE7WDLtvq7YVs5L2eSt83MFwJd1LhdpvzDctYNDVnsA4
	 DkEaqiQaVa6JA==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4hqZvv0x16z9rxG;
	Wed, 23 Sep 2026 13:47:39 +0200 (CEST)
From: Mateusz Nowicki <mateusz.nowicki@posteo.net>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Mateusz Nowicki <mateusz.nowicki@posteo.net>
Subject: [PATCH v2 2/2] arm64: dts: st: enable eMMC on stm32mp257f-dk
Date: Wed, 23 Sep 2026 11:47:40 +0000
Message-ID: <20260923114714.140842-3-mateusz.nowicki@posteo.net>
In-Reply-To: <20260923114714.140842-1-mateusz.nowicki@posteo.net>
References: <20260923114714.140842-1-mateusz.nowicki@posteo.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_044745_028646_AB3D1E3F 
X-CRM114-Status: UNSURE (   9.26  )
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

Enable the 8-Gbyte eMMC v5.1 connected to SDMMC2 with an 8-bit bus on
the STM32MP257F-DK. VDDIO2 is tied to the 1.8 V rail on this board, so
the DDR52 and HS200 modes are used.

Use the _b pin groups, the _a groups do not give reliable reads in
HS200 mode on this board. Tested in HS200 mode at 100 MHz.

Signed-off-by: Mateusz Nowicki <mateusz.nowicki@posteo.net>
---
 arch/arm64/boot/dts/st/stm32mp257f-dk.dts | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp257f-dk.dts b/arch/arm64/boot/dts/st/stm32mp257f-dk.dts
index 8daf3dfd5133..a7ad91d5beed 100644
--- a/arch/arm64/boot/dts/st/stm32mp257f-dk.dts
+++ b/arch/arm64/boot/dts/st/stm32mp257f-dk.dts
@@ -21,6 +21,8 @@ / {
 	aliases {
 		ethernet0 = &ethernet1;
 		serial0 = &usart2;
+		mmc0 = &sdmmc1;
+		mmc1 = &sdmmc2;
 	};
 
 	chosen {
@@ -279,6 +281,23 @@ &sdmmc1 {
 	status = "okay";
 };
 
+&sdmmc2 {
+	pinctrl-names = "default", "opendrain", "sleep";
+	pinctrl-0 = <&sdmmc2_b4_pins_b &sdmmc2_d47_pins_b>;
+	pinctrl-1 = <&sdmmc2_b4_od_pins_b &sdmmc2_d47_pins_b>;
+	pinctrl-2 = <&sdmmc2_b4_sleep_pins_a &sdmmc2_d47_sleep_pins_a>;
+	non-removable;
+	no-sd;
+	no-sdio;
+	st,neg-edge;
+	bus-width = <8>;
+	mmc-ddr-1_8v;
+	mmc-hs200-1_8v;
+	vmmc-supply = <&scmi_vdd_emmc>;
+	vqmmc-supply = <&scmi_vddio2>;
+	status = "okay";
+};
+
 &usart2 {
 	pinctrl-names = "default", "idle", "sleep";
 	pinctrl-0 = <&usart2_pins_a>;
-- 
2.55.0



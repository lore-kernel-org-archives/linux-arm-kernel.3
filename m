Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E2C8FEFB70
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Feb 2026 17:52:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hh7UQCTikODzVqp9l9EedwaKfGKmYZUbC4uOp2F0oWE=; b=F/AaEF22X3PQZIgmi9ziIbWwG+
	08ynyXbhV7rhpbT+W4wQryjJgiBSqinsYX085lbRPMPyk+oYrRBJEREzvaxIUQuIGDlQMnLztFHVy
	iBht/BGLU1/VRBUFlFUxi0vtYIMJxJliR9IBmaWyTxIaVkIEZg2xvZ2C+pJCvZs/7F5j7G2q6kIZA
	aIoAFL3UFrGflTjygpBIdq3KboRZgYnr8N/mwrn43OvM6OyIseWBdkbLmD8KhM4CfM4b4WfELE0wy
	bJXCzOo78UgrVOslQyJv71AQ1Rtq/oWvW/NOu4VKbIrKhv5eE80QYaj6jU0e3MBqhMzmpOPN6xOAu
	dDN2pTNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw20W-00000008pj8-00GL;
	Fri, 27 Feb 2026 17:52:08 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw20T-00000008piI-42Bs
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Feb 2026 17:52:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 09D26600AA;
	Fri, 27 Feb 2026 17:52:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CAF7C116C6;
	Fri, 27 Feb 2026 17:52:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772214724;
	bh=tKKtBVOvZWHv6aIPkC7sIoW5DK8EutIUgmSN3eswTBA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=G81d3nsoIkSP4l8EnshSuzG53FbA2uBKo7cHmYqM4QAN9wBs6KEUmqrXchmKOEmeA
	 GtIfbAnXwStm69ApGhzxRvzH/Ah+R/2n9A/UQM/0aBGnqQXEuwhJYe1SAXIx6pIEQJ
	 araXge3dpXQ7YTPJ6aGk2YEA2t2AKgwgVGTYGdsNGufsh8aKTmV4OB2zf/ukUfSK3h
	 AJBCxCUPnEHqgENsX/+mtyE6pykB+LDjg7cIg6l3RqB0QQQgkuNUImoHyU0Zyo7hvJ
	 MMElxskvLzf5mAHWn8SxZIh/sztYhv69LIqUtgTtgsRxodmdaE0n6Fg8NlHACTZ9pa
	 O+vhlqHBX1oSw==
Received: by wens.tw (Postfix, from userid 1000)
	id 2E4965FEC0; Sat, 28 Feb 2026 01:52:02 +0800 (CST)
From: Chen-Yu Tsai <wens@kernel.org>
To: Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mark Brown <broonie@kernel.org>
Cc: linux-sunxi@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-spi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] arm64: dts: allwinner: sun55i-t527: avaota-a1: Add SPI NAND
Date: Sat, 28 Feb 2026 01:51:55 +0800
Message-ID: <20260227175157.2339758-4-wens@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260227175157.2339758-1-wens@kernel.org>
References: <20260227175157.2339758-1-wens@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

The Avaota A1 board has a SPI NAND chip connected to spi0 on the PJ
pins with support for QSPI.

Enable spi0 and add a device node for the SPI NAND chip.

Signed-off-by: Chen-Yu Tsai <wens@kernel.org>
---
 .../boot/dts/allwinner/sun55i-t527-avaota-a1.dts  | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts b/arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts
index 7c24121de88f..474354fbfcec 100644
--- a/arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts
+++ b/arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts
@@ -403,6 +403,21 @@ &rtc {
 	assigned-clock-rates = <32768>;
 };
 
+&spi0  {
+	pinctrl-names = "default";
+	pinctrl-0 = <&spi0_pj_pins>, <&spi0_cs0_pj_pin>,
+		    <&spi0_hold_pj_pin>, <&spi0_wp_pj_pin>;
+	status = "okay";
+
+	nand@0 {
+		compatible = "spi-nand";
+		reg = <0>;
+		spi-max-frequency = <100000000>;
+		spi-rx-bus-width = <4>;
+		spi-tx-bus-width = <4>;
+	};
+};
+
 &uart0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart0_pb_pins>;
-- 
2.47.3



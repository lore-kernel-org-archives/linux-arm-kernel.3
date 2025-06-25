Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17DE4C7EE32
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Jun 2025 18:59:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=meSVgdj+UAKUSguxGuiTGcrfA+VdhouFn9WCbbVm/Ns=; b=H2MH61vHMH/DIabYhosL8W+ts/
	OguQ9xE0HuTAOSr4v2PYVbRkcdvXjqfweS+MNgLn6rFV+KD/67KrPlckmo7DuruUpNdTC1tWIxBkv
	i6v3cLgoQkVbFAtGiuiv3/ptt1t15ulzJoUNoRZPkXqkrEAMr5dhSfAodhazlivfxcDqaYwbAJF15
	G0QOAFJEf+gd2JdakQ+VwvEnNSci7E16n1UXcK9CK8nGobveb13cJ/3O2fUD7FQJKTO5HCbJXL+fZ
	7aYCHvqNSpjENHaeRAxY2Gddnby8/DCBQ5gtdsCCBAU+pcMO8mX36ksujOJIuIJP5DNeB+76lCS4E
	Fx4VlYeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUVLJ-00000009foq-3lNz;
	Wed, 25 Jun 2025 18:59:33 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUPzt-00000008lhW-3Rcf
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Jun 2025 13:17:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2E7226135E;
	Wed, 25 Jun 2025 13:17:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4105C4CEEE;
	Wed, 25 Jun 2025 13:17:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750857424;
	bh=2wjz3+JKr8b/GuKvZURR2QiYdmWce02dMigkYvBt0Gk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=F3AopbvJ164+Etui5cLAx3/wbfJEr+coRlX2u6OyEm1akxuq0i/AL7fUXVMBTjiLv
	 LLjT9xl8src5NZV1o1yIMp4eh/9b3evLl2JUGSyNIWStmk/jPDDgT3Dz9XQTQJJgPt
	 zN0zX6f4dp+DGSrZ6Dun2F8eNQAiu0fkFrAN4H0HR0BhP4BjUACuf3pgjS1fzcvORZ
	 eM/2PRlGQaASki9zmJmbSRbsO4qU8zRsyX38v9xy7KruT8eZtgAdiMnkbTdZQTtHba
	 ZvCo1AFMvM3IoKuTr1AdyHdp2Mpw0cF9hym7nj2PrZZZOmsP7J0hhvgTijm9Cy2OIe
	 hm1ciZ94ZlrVQ==
Received: by wens.tw (Postfix, from userid 1000)
	id 794825FF4F; Wed, 25 Jun 2025 21:17:02 +0800 (CST)
From: Chen-Yu Tsai <wens@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: devicetree@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Andre Przywara <andre.przywara@arm.com>
Subject: [PATCH v2 4/5] arm64: dts: allwinner: a523: Add UART1 pins
Date: Wed, 25 Jun 2025 21:16:51 +0800
Message-Id: <20250625131652.1667345-5-wens@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250625131652.1667345-1-wens@kernel.org>
References: <20250625131652.1667345-1-wens@kernel.org>
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

From: Chen-Yu Tsai <wens@csie.org>

UART1 is normally used to connect to the Bluetooth side of a Broadcom
WiFi+BT combo chip. The connection uses 4 pins.

Add pinmux nodes for UART1, one for the RX/TX pins, and one for the
RTS/CTS pins.

Reviewed-by: Andre Przywara <andre.przywara@arm.com>
Signed-off-by: Chen-Yu Tsai <wens@csie.org>
---
 arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
index 30613a0b1124..6f62201fd739 100644
--- a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
@@ -168,6 +168,20 @@ uart0_pb_pins: uart0-pb-pins {
 				allwinner,pinmux = <2>;
 				function = "uart0";
 			};
+
+			/omit-if-no-ref/
+			uart1_pins: uart1-pins {
+				pins = "PG6", "PG7";
+				function = "uart1";
+				allwinner,pinmux = <2>;
+			};
+
+			/omit-if-no-ref/
+			uart1_rts_cts_pins: uart1-rts-cts-pins {
+				pins = "PG8", "PG9";
+				function = "uart1";
+				allwinner,pinmux = <2>;
+			};
 		};
 
 		ccu: clock-controller@2001000 {
-- 
2.39.5



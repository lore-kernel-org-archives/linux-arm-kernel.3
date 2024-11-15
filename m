Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75D31D68BCD
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Nov 2024 19:35:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=782p0RNd3JpUcGfUVFZg+iZql1YzlR33ZMn2I5iTeJk=; b=0OB1/itjbZIiVzSqyUfhdbX8dy
	2B7d7k+C3AYnABcJzNCzznFxJKgCcWd5miCPpKKIANuXeBUAYZAQw2ICEKftPGlqLel/Cg8XkQb3N
	CkSybkMtgt/z8s64b3GLAun1uQhFqbVKeKlpE9iCpEKDcIBeU3D+T8shRqsIANhNmH+mVW57/9HUE
	8HUQS1aDMtpyBnv7vvtYUgoE4VS8llsNfFaA0IPaO1lxngYagYIpdM6VXPz0ZGRKbYuBYYQbDnEBA
	5u0+1wtVntGKaqJz7/jUTXfYDvw6bgx3Ve5Nzz4ywu1gE9PxHCys1/VTmc6la4nwuhrxIGxSLRyGU
	zcGGnSHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tC26M-00000003s0W-3G9e;
	Fri, 15 Nov 2024 19:35:30 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tC251-00000003ren-0rkb
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 Nov 2024 19:34:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id F1AE6A42A5C;
	Fri, 15 Nov 2024 19:32:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 599EBC4CECF;
	Fri, 15 Nov 2024 19:34:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731699245;
	bh=ZimSmYTYEdCO/HuGAE0r6zdmsNnecnPZd2u48S1TEAQ=;
	h=From:To:Cc:Subject:Date:From;
	b=ITABjjG3H9hZVuc8EnvbwpRtzzKpDXMuTmuZB4KocLheWinw6ngSY5juRbAHy1BK9
	 1nAgSjxQyRD1EuSWt5ontGn6jwcvrjOt2/wOxGH4gXLGkUejKvuPL3BUnnFN+sjcJT
	 3yu+Sa1qvt3TBfM2QlgjeIkwDPYZOTPrlh3oyTqfGb8zkRp30gkF1zwCvqkuntWsvO
	 DKF0eETjPjw0+djUunjUAE0y/5gE4dycvLhLY8tcVE2fBQVg1HzCU6dYj1HSfXfPfm
	 psR99A0K3BxCGCnSrnmNre0/l0BF8zy1Viq41o2bybkLHbLviUPheWkHAI47qbtoGd
	 VF/1aHPRk1jRQ==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: ti: Remove unused and undocumented "ti,(rx|tx)-fifo-depth" properties
Date: Fri, 15 Nov 2024 13:33:59 -0600
Message-ID: <20241115193359.3618020-1-robh@kernel.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241115_113407_304278_25859F3B 
X-CRM114-Status: UNSURE (   8.45  )
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

Remove "ti,(rx|tx)-fifo-depth" properties which are both unused in the
kernel and undocumented. Most likely they are leftovers from downstream.

There are similar properties, but DP83867_PHYCR_FIFO_DEPTH_4_B_NIB
represents the default value so adding them is not necessary.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 arch/arm64/boot/dts/ti/k3-am642-tqma64xxl-mbax4xxl.dts | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am642-tqma64xxl-mbax4xxl.dts b/arch/arm64/boot/dts/ti/k3-am642-tqma64xxl-mbax4xxl.dts
index e06a3b178b34..8f64d6272b1b 100644
--- a/arch/arm64/boot/dts/ti/k3-am642-tqma64xxl-mbax4xxl.dts
+++ b/arch/arm64/boot/dts/ti/k3-am642-tqma64xxl-mbax4xxl.dts
@@ -201,8 +201,6 @@ cpsw3g_phy0: ethernet-phy@0 {
 		reset-gpios = <&main_gpio0 44 GPIO_ACTIVE_LOW>;
 		reset-assert-us = <1000>;
 		reset-deassert-us = <1000>;
-		ti,rx-fifo-depth = <DP83867_PHYCR_FIFO_DEPTH_4_B_NIB>;
-		ti,tx-fifo-depth = <DP83867_PHYCR_FIFO_DEPTH_4_B_NIB>;
 		ti,rx-internal-delay = <DP83867_RGMIIDCTL_2_00_NS>;
 		ti,clk-output-sel = <DP83867_CLK_O_SEL_OFF>;
 	};
@@ -230,8 +228,6 @@ icssg1_phy03: ethernet-phy@3 {
 		reset-gpios = <&main_gpio1 47 GPIO_ACTIVE_LOW>;
 		reset-assert-us = <1000>;
 		reset-deassert-us = <1000>;
-		ti,rx-fifo-depth = <DP83867_PHYCR_FIFO_DEPTH_4_B_NIB>;
-		ti,tx-fifo-depth = <DP83867_PHYCR_FIFO_DEPTH_4_B_NIB>;
 		ti,rx-internal-delay = <DP83867_RGMIIDCTL_2_00_NS>;
 		ti,clk-output-sel = <DP83867_CLK_O_SEL_OFF>;
 	};
@@ -242,8 +238,6 @@ icssg1_phy0c: ethernet-phy@c {
 		reset-gpios = <&main_gpio1 51 GPIO_ACTIVE_LOW>;
 		reset-assert-us = <1000>;
 		reset-deassert-us = <1000>;
-		ti,rx-fifo-depth = <DP83867_PHYCR_FIFO_DEPTH_4_B_NIB>;
-		ti,tx-fifo-depth = <DP83867_PHYCR_FIFO_DEPTH_4_B_NIB>;
 		ti,rx-internal-delay = <DP83867_RGMIIDCTL_2_00_NS>;
 		ti,clk-output-sel = <DP83867_CLK_O_SEL_OFF>;
 	};
-- 
2.45.2



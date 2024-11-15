Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1170D68BCF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Nov 2024 19:38:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2GX8XmMEdAzroD52uOqhRXB3+Q6bdiODxs28heLJRAE=; b=IjEWsWeYX4xQ/rOlVHcVuXqyrB
	bLZknqsaF6Hv5SW6SAdG6FpWvcZp2GPeV1LaTAo/q5YCthAFTJNfa3K2qQhNbENecxRnxZcDGwMV7
	7a99IgqE3b9IIljI8/JIv2XRBFCEmI0Gk2K94lF1IiOJ39bW5jpAcXg0uWLbQoL07neSdWeuKdhzn
	wO1PkVqZztqinq2aDv2jUzp9eQuO1phkGjoKZvgtn8Y9GNKq8MrFA2CAnPk0ALvf4ovlgqev+EDzZ
	vtzOjGYtJiGC1Wy4d2kpa1gAPZ8BGeCZJE/riqy6mc7NMvejfw2evHGEuPMCzbTKQo7ApBqptVmbt
	iJZcYQ5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tC294-00000003sh3-0TG0;
	Fri, 15 Nov 2024 19:38:18 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tC263-00000003rvK-3zxX
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 Nov 2024 19:35:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 078DA5C5F47;
	Fri, 15 Nov 2024 19:34:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDEE9C4CECF;
	Fri, 15 Nov 2024 19:35:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731699310;
	bh=IxUUtQsWk3PURpycsSmzgb1xBSlDbCJ37q6nf31dtYk=;
	h=From:To:Cc:Subject:Date:From;
	b=YvrqaNCpK6PsNp0tlPJ6cpBhvBb8IfGZ8O4vbfTp43LaUKuT5UOyxwnbuDi1UMENf
	 yak0kqkudR+KSp/CIk4mVnbr+yBxQaRw/3wrmC81mTBS+cbkRSBEb/Cmz5MhhuoC4Y
	 U+bf71uyQqSz/JoMsUGcl0KeLnuIx2wwGWv7VdRzksIyWb7ResMfV2C0CRzvGZeeg4
	 uVMLibsIEZ3M/BnBl5S8Gx21s1aEC8s3a5pwdczlV6nvH4YuYkM2OQFNZ/WKdGDJVr
	 RtWwQg+ERnux8df2dlrlhlQbP9CZ6IusklRSMNa3twuuEvDVAPzIWUIBLiCwP7p1lM
	 bXNktSRkLJekg==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Shawn Guo <shawnguo@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: freescale: Remove unused and undocumented "cooling-(min|max)-state" properties
Date: Fri, 15 Nov 2024 13:35:03 -0600
Message-ID: <20241115193504.3619533-1-robh@kernel.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241115_113512_032662_591FCEAB 
X-CRM114-Status: UNSURE (   8.87  )
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

Remove "cooling-(min|max)-state" properties which are both unused in the
kernel and undocumented. Most likely they are leftovers from downstream.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../boot/dts/freescale/fsl-ls1028a-kontron-sl28-var3-ads2.dts   | 2 --
 arch/arm64/boot/dts/freescale/fsl-lx2160a-cex7.dtsi             | 2 --
 2 files changed, 4 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var3-ads2.dts b/arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var3-ads2.dts
index d9fac647f432..1d53b529af88 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var3-ads2.dts
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var3-ads2.dts
@@ -19,8 +19,6 @@ / {
 
 	pwm-fan {
 		compatible = "pwm-fan";
-		cooling-min-state = <0>;
-		cooling-max-state = <3>;
 		#cooling-cells = <2>;
 		pwms = <&sl28cpld_pwm0 0 4000000>;
 		cooling-levels = <1 128 192 255>;
diff --git a/arch/arm64/boot/dts/freescale/fsl-lx2160a-cex7.dtsi b/arch/arm64/boot/dts/freescale/fsl-lx2160a-cex7.dtsi
index d32a52ab00a4..aef63a4f698c 100644
--- a/arch/arm64/boot/dts/freescale/fsl-lx2160a-cex7.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-lx2160a-cex7.dtsi
@@ -94,8 +94,6 @@ i2c@1 {
 			fan-temperature-ctrlr@18 {
 				compatible = "ti,amc6821";
 				reg = <0x18>;
-				cooling-min-state = <0>;
-				cooling-max-state = <9>;
 				#cooling-cells = <2>;
 			};
 		};
-- 
2.45.2



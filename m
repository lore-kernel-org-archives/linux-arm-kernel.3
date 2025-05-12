Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38246C3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 May 2025 10:30:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=nXScF52OMdGrpN6Do3NutLJ2FOkI/yad6RCGY/UtQfA=; b=DEiT3d0fI+O1+XhpVQEEG0WlQz
	r0lrO4+RDD/HXfI3luuaEs9p14mYzkkBafqC4A6u1N6UOhRNRD5ALdKiW7mAhPS+Enruy4sho3TSz
	8tZUPihCYcojGdnO5nNLY/Ehw2A8i/1lqbzRmW4J0kLsLeceffYP8gT2D+w6lAeLMzrfvI8nTRS0y
	1sRuygrhyC/fm/GAWCsteOI1E26wEB2JPjUtnoJcsk9ou41I340bmrrmb+Up+QeAg456Pn7lW1/68
	cOxHn8xm8ZlGx/bK9KorbaLs91Azb1Ga3Oe7k9Woc0fisXXd7sKVd7BAIiDUkgAntuLj+Nnm0xpN7
	4XcRTsjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEQQ3-000000096VN-3b7P;
	Mon, 12 May 2025 10:29:59 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEQ8O-000000094Do-1NAg
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 May 2025 10:11:45 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A391B150C;
	Mon, 12 May 2025 03:11:24 -0700 (PDT)
Received: from usa.arm.com (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 745753F673;
	Mon, 12 May 2025 03:11:34 -0700 (PDT)
From: Sudeep Holla <sudeep.holla@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>
Subject: [PATCH] arm64: dts: arm: Drop the clock-frequency property from timer nodes
Date: Mon, 12 May 2025 11:11:32 +0100
Message-Id: <20250512101132.1743920-1-sudeep.holla@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_031144_417023_46AA3A0C 
X-CRM114-Status: UNSURE (   7.62  )
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

Drop the clock-frequency property from the timer nodes, since it must be
configured by the boot/secure firmware.

Cc: Liviu Dudau <liviu.dudau@arm.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
---
 arch/arm64/boot/dts/arm/corstone1000.dtsi  | 1 -
 arch/arm64/boot/dts/arm/foundation-v8.dtsi | 1 -
 arch/arm64/boot/dts/arm/juno-base.dtsi     | 1 -
 arch/arm64/boot/dts/arm/rtsm_ve-aemv8a.dts | 1 -
 4 files changed, 4 deletions(-)

diff --git a/arch/arm64/boot/dts/arm/corstone1000.dtsi b/arch/arm64/boot/dts/arm/corstone1000.dtsi
index 56ada8728b60..f35a5c96f3da 100644
--- a/arch/arm64/boot/dts/arm/corstone1000.dtsi
+++ b/arch/arm64/boot/dts/arm/corstone1000.dtsi
@@ -109,7 +109,6 @@ timer@1a220000 {
 			reg = <0x1a220000 0x1000>;
 			#address-cells = <1>;
 			#size-cells = <1>;
-			clock-frequency = <50000000>;
 			ranges;
 
 			frame@1a230000 {
diff --git a/arch/arm64/boot/dts/arm/foundation-v8.dtsi b/arch/arm64/boot/dts/arm/foundation-v8.dtsi
index 083be35495b3..a4b2b78d4df3 100644
--- a/arch/arm64/boot/dts/arm/foundation-v8.dtsi
+++ b/arch/arm64/boot/dts/arm/foundation-v8.dtsi
@@ -77,7 +77,6 @@ timer {
 			     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
 			     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
 			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>;
-		clock-frequency = <100000000>;
 	};
 
 	pmu {
diff --git a/arch/arm64/boot/dts/arm/juno-base.dtsi b/arch/arm64/boot/dts/arm/juno-base.dtsi
index 055764d0b9e5..9ccb80821bdb 100644
--- a/arch/arm64/boot/dts/arm/juno-base.dtsi
+++ b/arch/arm64/boot/dts/arm/juno-base.dtsi
@@ -10,7 +10,6 @@ / {
 	memtimer: timer@2a810000 {
 		compatible = "arm,armv7-timer-mem";
 		reg = <0x0 0x2a810000 0x0 0x10000>;
-		clock-frequency = <50000000>;
 		#address-cells = <1>;
 		#size-cells = <1>;
 		ranges = <0 0x0 0x2a820000 0x20000>;
diff --git a/arch/arm64/boot/dts/arm/rtsm_ve-aemv8a.dts b/arch/arm64/boot/dts/arm/rtsm_ve-aemv8a.dts
index 7f7226711d4b..a4a29193d4eb 100644
--- a/arch/arm64/boot/dts/arm/rtsm_ve-aemv8a.dts
+++ b/arch/arm64/boot/dts/arm/rtsm_ve-aemv8a.dts
@@ -116,7 +116,6 @@ timer {
 			     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
 			     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
 			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>;
-		clock-frequency = <100000000>;
 	};
 
 	pmu {
-- 
2.34.1



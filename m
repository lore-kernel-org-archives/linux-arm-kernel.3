Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB236C79FBD
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Jan 2026 19:47:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=UD9iK+q2pIW9Gl4M0KMaVvHXVFEbjqWrf11eTTNsMsI=; b=s9eh2Ea91PFQzOxE4l4iAiKFN9
	VcEnAEizgguXi5mpJOadiccJsIT2bSKiYwXfQZLaMod0Xybhy0Rgbd/10ji6cdPBPnV6E9EdDRE9m
	ZFHVdWcVj7R6XyeiTYRnO/K1voa+NmRWJE3Bs9seBPOV843FQKpw9flEsmsGLo5m8iDLo/SOjqMyY
	SGJ9KnM5HY3Ujfclkuqoql1P54yqja8eUDW4xODlU0kY2u8mpsZzivoOrVLEvO1xuR/UFJUvXDZqv
	E/aftMFoC1mAcRSi03zkxiLnv5iRt2kDUbO+gCLIeJcYhBC69YjMAxxM1izV5B6g1y9Hp4MuufvVG
	PGbKXykA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcqXa-0000000Bzyr-2RW3;
	Mon, 05 Jan 2026 19:46:58 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcqXY-0000000BzxO-26Hp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Jan 2026 19:46:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A6FC043C3F;
	Mon,  5 Jan 2026 19:46:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E0DEC116D0;
	Mon,  5 Jan 2026 19:46:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767642415;
	bh=1iZEURVnC5EHBu7RqBBmRA9ws4DI038EuiShk+6L6ak=;
	h=From:To:Cc:Subject:Date:From;
	b=XvPttCa0iUhdJKH1lrTp45IYnscelYmdPBYoAOUheFKu85kDzl4aNNNcDVIAF+xQs
	 o714Lsu8J8IhefgiLzEUpOSVCaamuNHhcgUG/8NAqkk5TrAWH5Oj8Au49r6L/nLr6x
	 6bfKoXBR6X7ohBQDKHA2VWBmKCWfiNgQhn1pRC10PF0X6J/IxVbAJlSE8NOo7YYAXx
	 +LPuud+fgAygUa/MzIu3k9X+MiC580Trksqedx+fLZt53kkpao3SllRQnaYDV/XWRY
	 EnDhsGojwSraPGlc30iVhw/0E4wN9O+x6aqjNI5Ht4j4vp5EGdLFAhZRwbx09xdZfs
	 AWoGqYkVMHveg==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: marvell: change regulator-gpio to regulator-fixed
Date: Mon,  5 Jan 2026 13:46:52 -0600
Message-ID: <20260105194653.3189515-1-robh@kernel.org>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_114656_561350_5D0CBD56 
X-CRM114-Status: UNSURE (   9.36  )
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

A "regulator-gpio" must have a GPIO control, hence the name. There's no
GPIO on a couple of Marvell platforms at least as far as the DT is
defined, so change the regulator type from GPIO to fixed.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 arch/arm64/boot/dts/marvell/armada-3720-gl-mv1000.dts | 9 ++-------
 arch/arm64/boot/dts/marvell/cn9131-db-comexpress.dtsi | 3 ++-
 2 files changed, 4 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/marvell/armada-3720-gl-mv1000.dts b/arch/arm64/boot/dts/marvell/armada-3720-gl-mv1000.dts
index 9f4bafeddd82..a881a3326dba 100644
--- a/arch/arm64/boot/dts/marvell/armada-3720-gl-mv1000.dts
+++ b/arch/arm64/boot/dts/marvell/armada-3720-gl-mv1000.dts
@@ -26,16 +26,11 @@ memory@0 {
 	};
 
 	vcc_sd_reg1: regulator {
-		compatible = "regulator-gpio";
+		compatible = "regulator-fixed";
 		regulator-name = "vcc_sd1";
-		regulator-min-microvolt = <1800000>;
+		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
 		regulator-boot-on;
-
-		gpios-states = <0>;
-		states = <1800000 0x1
-			3300000 0x0>;
-		enable-active-high;
 	};
 
 	keys {
diff --git a/arch/arm64/boot/dts/marvell/cn9131-db-comexpress.dtsi b/arch/arm64/boot/dts/marvell/cn9131-db-comexpress.dtsi
index 6f3914bcfd01..71c225221617 100644
--- a/arch/arm64/boot/dts/marvell/cn9131-db-comexpress.dtsi
+++ b/arch/arm64/boot/dts/marvell/cn9131-db-comexpress.dtsi
@@ -15,8 +15,9 @@ / {
 };
 
 &ap0_reg_sd_vccq {
+	compatible = "regulator-fixed";
 	regulator-max-microvolt = <1800000>;
-	states = <1800000 0x1 1800000 0x0>;
+	/delete-property/ states;
 	/delete-property/ gpios;
 };
 
-- 
2.51.0



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9E60C83F03
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  6 Jul 2025 19:35:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A+rNZKyzd+TJoDd+vorp/tU828hMvkaBKKfTQBm4oOI=; b=UmC4MNBMWrS3Hp3/8WhknFl4eT
	gu2dMppPr72eBJFrbDE+rxFi9i2sxyPwvt4WTdSQPo8T+NU6bIJkbU9HdgRBucfEZmm0iDoSUSVu0
	QXKQ7TKC56RjX0CddxEBUX4yBJ5k+18A3mgcm2BIJxVRIRZS+FSs1MVOEAnajlLj6+49h+mBFZCXJ
	K2qgc+L8G8DRDisPtLnfvObAmzMmb/0QfxIMXkwqygqiTq/Ki3RPfMRnFnA3iKhywWoqg29FhEQC8
	Da2K3DIba/8rZv7VG7Idh9mhNwZ5cdrwB4/b1DrbYCRGYfS99y3aYjGbeJb53blzx12H9FRK8uRPB
	ny57OFAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYV8z-00000000jhb-0slT;
	Sun, 06 Jul 2025 19:35:21 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYUON-00000000fFr-1beb
	for linux-arm-kernel@lists.infradead.org;
	Sun, 06 Jul 2025 18:47:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BF8FD45E91;
	Sun,  6 Jul 2025 18:47:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 28DC9C4AF11;
	Sun,  6 Jul 2025 18:47:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751827630;
	bh=r8OPi+V5RSDBOd4VSGf3X7RVxzB62bXpNusFQZ+zrDM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=eE2l42chQKFkR6nzaI8333RpO7Utts6Ldi7Of3JbRr8kl+pybS/o5+S7VtiGx2T3t
	 qnJRjwPuq6CXDaLmeO2zJWNQ541Kh3/vdhwIEKFoqyqTZpGRyE8VNPM5K5xoKJxQsk
	 mq3sAHvRLB5MI1NCCx132eemGjtmcsEODzDJuv56QhFelA7XaUvYqfVv+Gk56z5+oy
	 7tGRVbQTBNjShsP/glbjov+LZI0t0TC+8AGzr1pObWvsJepONYLh+cBvkZyQC5dLK3
	 fgADjEu/jHuZft7UB072pFZ51bgDfvKnBV5craMrwq8prK+zLud1kaNdr25g+mPYuK
	 Tvd+mvVRqaTzg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FF28C83F10;
	Sun,  6 Jul 2025 18:47:10 +0000 (UTC)
From: Frank Li via B4 Relay <devnull+Frank.Li.nxp.com@kernel.org>
Date: Sun, 06 Jul 2025 14:47:04 -0400
Subject: [PATCH 08/11] ARM: dts: lpc: change node name 'button[0-9]' to
 button-[0-9]'
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250706-lpc18xxx_dts-v1-8-7ae8cdfe8d7d@nxp.com>
References: <20250706-lpc18xxx_dts-v1-0-7ae8cdfe8d7d@nxp.com>
In-Reply-To: <20250706-lpc18xxx_dts-v1-0-7ae8cdfe8d7d@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Vladimir Zapolskiy <vz@mleia.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, vz@mleia.com, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751827628; l=3156;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=O0CmtFMiA/5+GFcpd4plsq9QzGUKBGisD91DfDl49E8=;
 b=MpIN6S64nW8nXpZdaC2MRTHAIxiu0ClgbIRwnjCtlNHbaKWtdyPPIQZtmPeGxj/aG/u5F0Etg
 vn4Iu0iyIxvDZly3zAZsrvgAshrigE6bOxrghsweoUiAe8/IFO+vxWH
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-Endpoint-Received: by B4 Relay for Frank.Li@nxp.com/20240130 with
 auth_id=121
X-Original-From: Frank Li <Frank.Li@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250706_114711_487563_4ACCB01B 
X-CRM114-Status: UNSURE (   9.83  )
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
Reply-To: Frank.Li@nxp.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Frank Li <Frank.Li@nxp.com>

Change node name 'button[0-9]' to button-[0-9]' to fix below CHECK_DTB
warning:
 arch/arm/boot/dts/nxp/lpc/lpc4350-hitex-eval.dtb: pca_buttons (gpio-keys-polled): 'button0', ... do not match any of the regexes: '^(button|...', 'pinctrl-[0-9]+'

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm/boot/dts/nxp/lpc/lpc4350-hitex-eval.dts    | 16 ++++++++--------
 arch/arm/boot/dts/nxp/lpc/lpc4357-ea4357-devkit.dts | 10 +++++-----
 2 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/lpc/lpc4350-hitex-eval.dts b/arch/arm/boot/dts/nxp/lpc/lpc4350-hitex-eval.dts
index 9d36283efe0f6ea26efedae9f7246c04f00cbdb7..18f757c569057f6e1bac6ab9d78bf936c7cad0c3 100644
--- a/arch/arm/boot/dts/nxp/lpc/lpc4350-hitex-eval.dts
+++ b/arch/arm/boot/dts/nxp/lpc/lpc4350-hitex-eval.dts
@@ -43,50 +43,50 @@ pca_buttons {
 		poll-interval = <100>;
 		autorepeat;
 
-		button0 {
+		button-0 {
 			label = "joy:right";
 			linux,code = <KEY_RIGHT>;
 			gpios = <&pca_gpio 8 GPIO_ACTIVE_LOW>;
 		};
 
-		button1 {
+		button-1 {
 			label = "joy:up";
 			linux,code = <KEY_UP>;
 			gpios = <&pca_gpio 9 GPIO_ACTIVE_LOW>;
 		};
 
 
-		button2 {
+		button-2 {
 			label = "joy:enter";
 			linux,code = <KEY_ENTER>;
 			gpios = <&pca_gpio 10 GPIO_ACTIVE_LOW>;
 		};
 
-		button3 {
+		button-3 {
 			label = "joy:left";
 			linux,code = <KEY_LEFT>;
 			gpios = <&pca_gpio 11 GPIO_ACTIVE_LOW>;
 		};
 
-		button4 {
+		button-4 {
 			label = "joy:down";
 			linux,code = <KEY_DOWN>;
 			gpios = <&pca_gpio 12 GPIO_ACTIVE_LOW>;
 		};
 
-		button5 {
+		button-5 {
 			label = "user:sw3";
 			linux,code = <KEY_F1>;
 			gpios = <&pca_gpio 13 GPIO_ACTIVE_LOW>;
 		};
 
-		button6 {
+		button-6 {
 			label = "user:sw4";
 			linux,code = <KEY_F2>;
 			gpios = <&pca_gpio 14 GPIO_ACTIVE_LOW>;
 		};
 
-		button7 {
+		button-7 {
 			label = "user:sw5";
 			linux,code = <KEY_F3>;
 			gpios = <&pca_gpio 15 GPIO_ACTIVE_LOW>;
diff --git a/arch/arm/boot/dts/nxp/lpc/lpc4357-ea4357-devkit.dts b/arch/arm/boot/dts/nxp/lpc/lpc4357-ea4357-devkit.dts
index 9dc8c3cc2211001f30a5a15c3a04a240e4acd86b..7ccb4c2ca57102ac2d31c21c72a45bd3d72f2d86 100644
--- a/arch/arm/boot/dts/nxp/lpc/lpc4357-ea4357-devkit.dts
+++ b/arch/arm/boot/dts/nxp/lpc/lpc4357-ea4357-devkit.dts
@@ -60,31 +60,31 @@ gpio_joystick {
 		poll-interval = <100>;
 		autorepeat;
 
-		button0 {
+		button-0 {
 			label = "joy_enter";
 			linux,code = <KEY_ENTER>;
 			gpios = <&gpio LPC_GPIO(4,8) GPIO_ACTIVE_LOW>;
 		};
 
-		button1 {
+		button-1 {
 			label = "joy_left";
 			linux,code = <KEY_LEFT>;
 			gpios = <&gpio LPC_GPIO(4,9) GPIO_ACTIVE_LOW>;
 		};
 
-		button2 {
+		button-2 {
 			label = "joy_up";
 			linux,code = <KEY_UP>;
 			gpios = <&gpio LPC_GPIO(4,10) GPIO_ACTIVE_LOW>;
 		};
 
-		button3 {
+		button-3 {
 			label = "joy_right";
 			linux,code = <KEY_RIGHT>;
 			gpios = <&gpio LPC_GPIO(4,12) GPIO_ACTIVE_LOW>;
 		};
 
-		button4 {
+		button-4 {
 			label = "joy_down";
 			linux,code = <KEY_DOWN>;
 			gpios = <&gpio LPC_GPIO(4,13) GPIO_ACTIVE_LOW>;

-- 
2.34.1




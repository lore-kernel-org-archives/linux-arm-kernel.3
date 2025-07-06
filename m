Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5510AC83F03
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  6 Jul 2025 19:33:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ycTQoXqs3vyEBOV17ZB2EKSlQwWdpuNT/70rUFDfP5A=; b=wb/riUJ1M2vhHBrcFawBt0nTSR
	+A+2wSeM8thaonVAKHsqUvGQfQ4LuQzaCYiUFEmlwuDo3sbEzNe1Kw/tWPAghL4XySmTK4CnMIyj+
	9OtYnvRRNFxa59wC8T5jAV2YyliBvx/5hAe8fH+vP9oRDAKQMGPXWhrtL5DL5+YhWqk2TaLfpnKmu
	z79E1LqiySPV4aTBiOSWExkQvfYQIsnZb5tYBKuz5AFz5ocRRVFGZaPs1wN2oLJeKnMbxNR61SCGs
	1XMz0gbkkBXaCto6xCe/+XMWnKLATmeO7oopWfvJrgr9pkGz31q1Vx1Grd2/uDBi4CKrVuA7gfpy7
	/0EeLQpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYV6h-00000000jUX-1NRA;
	Sun, 06 Jul 2025 19:32:59 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYUON-00000000fFp-1bnT
	for linux-arm-kernel@lists.infradead.org;
	Sun, 06 Jul 2025 18:47:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id AD8CE45E71;
	Sun,  6 Jul 2025 18:47:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 118B5C4CEFD;
	Sun,  6 Jul 2025 18:47:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751827630;
	bh=cYKi1nKEQtPpEC56jfEYVjdgARMq5mSaGSQw8ZO46xU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=CXiyeq+kUHuECyv0BvHB1OzRXT7Qm37tiGBla9NUOoHOlpes6E9az1e6w2Sv7WMLg
	 qPSkLRbZpvdTdFBC9gzWVB3I/0j8b38rvTtUpK7Mp1bxBk4kIdFy7/yiYZ42fyu01+
	 A2p4+Tjgu0geE/L+aBO3Wj46+Hf0nXJKeeRU4RsNLoOaKA+QO7dv+CObfJF9GZhTcL
	 RmF8hSFvEmidyc8C1fvZ66eVYhDzozgeIfkfI2IXJObc/8wyfQpEaJXmad2ZxXHScc
	 QsN2EbXkpIxW4wLs9liE+5XVTtwZPk5snz7Ut9K1chORJLzExXSrFxaYwXY6rkVuq2
	 noUtNQcdRVJsg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0722BC83F0A;
	Sun,  6 Jul 2025 18:47:10 +0000 (UTC)
From: Frank Li via B4 Relay <devnull+Frank.Li.nxp.com@kernel.org>
Date: Sun, 06 Jul 2025 14:47:02 -0400
Subject: [PATCH 06/11] ARM: dts: lpc: add cfg surfix in pinctrl child node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250706-lpc18xxx_dts-v1-6-7ae8cdfe8d7d@nxp.com>
References: <20250706-lpc18xxx_dts-v1-0-7ae8cdfe8d7d@nxp.com>
In-Reply-To: <20250706-lpc18xxx_dts-v1-0-7ae8cdfe8d7d@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Vladimir Zapolskiy <vz@mleia.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, vz@mleia.com, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751827628; l=2395;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=C46qx9YdKR7+A8ab/w/tK7krHL9bwS57NbQPc2tNY80=;
 b=mONXrEurSKEf03/G3au1NNn/+xNJ+nsG8ew8/egbYiET3eBCC0K+YSx5zLKNvFL/0fKBlnvlX
 LRSdFVwJ1zxB0oOaNEs1069aCBI2DFTNS9nze09PLJ3zm98zs36rV1C
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-Endpoint-Received: by B4 Relay for Frank.Li@nxp.com/20240130 with
 auth_id=121
X-Original-From: Frank Li <Frank.Li@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250706_114711_477567_04F46D30 
X-CRM114-Status: GOOD (  10.81  )
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

Add cfg surfix in pinctrl child node to fix below CHECK_DTB warning:
arch/arm/boot/dts/nxp/lpc/lpc4337-ciaa.dtb: pinctrl@40086000 (nxp,lpc1850-scu): ssp-pins: 'ssp1_cs', 'ssp1_miso_mosi', 'ssp1_sck' do not match any of the regexes: '^pinctrl-[0-9]+$', '_cfg$'
        from schema $id: http://devicetree.org/schemas/pinctrl/nxp,lpc1850-scu.yaml#

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm/boot/dts/nxp/lpc/lpc4337-ciaa.dts          | 6 +++---
 arch/arm/boot/dts/nxp/lpc/lpc4357-ea4357-devkit.dts | 8 ++++----
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/lpc/lpc4337-ciaa.dts b/arch/arm/boot/dts/nxp/lpc/lpc4337-ciaa.dts
index beddaba85393e61a07da5175fa9e7fb081bbac3f..5ff43c825944dcfa523e8be2fdf49f1ad8e0a884 100644
--- a/arch/arm/boot/dts/nxp/lpc/lpc4337-ciaa.dts
+++ b/arch/arm/boot/dts/nxp/lpc/lpc4337-ciaa.dts
@@ -108,14 +108,14 @@ i2c0_pins_cfg {
 	};
 
 	ssp_pins: ssp-pins {
-		ssp1_cs {
+		ssp1_cs_cfg {
 			pins = "p6_7";
 			function = "gpio";
 			bias-pull-up;
 			bias-disable;
 		};
 
-		ssp1_miso_mosi {
+		ssp1_miso_mosi_cfg {
 			pins = "p1_3", "p1_4";
 			function = "ssp1";
 			slew-rate = <1>;
@@ -124,7 +124,7 @@ ssp1_miso_mosi {
 			input-schmitt-disable;
 		};
 
-		ssp1_sck {
+		ssp1_sck_cfg {
 			pins = "pf_4";
 			function = "ssp1";
 			slew-rate = <1>;
diff --git a/arch/arm/boot/dts/nxp/lpc/lpc4357-ea4357-devkit.dts b/arch/arm/boot/dts/nxp/lpc/lpc4357-ea4357-devkit.dts
index 60bcfa5e0518e55eb3e642f146d1c96f2ebd5267..9dc8c3cc2211001f30a5a15c3a04a240e4acd86b 100644
--- a/arch/arm/boot/dts/nxp/lpc/lpc4357-ea4357-devkit.dts
+++ b/arch/arm/boot/dts/nxp/lpc/lpc4357-ea4357-devkit.dts
@@ -403,7 +403,7 @@ spifi_cs_cfg {
 	};
 
 	ssp0_pins: ssp0-pins {
-		ssp0_sck_miso_mosi {
+		ssp0_sck_miso_mosi_cfg {
 			pins = "pf_0", "pf_2", "pf_3";
 			function = "ssp0";
 			slew-rate = <1>;
@@ -412,7 +412,7 @@ ssp0_sck_miso_mosi {
 			input-schmitt-disable;
 		};
 
-		ssp0_ssel {
+		ssp0_ssel_cfg {
 			pins = "pf_1";
 			function = "ssp0";
 			bias-pull-up;
@@ -452,12 +452,12 @@ uart3_tx_cfg {
 	};
 
 	usb0_pins: usb0-pins {
-		usb0_pwr_enable {
+		usb0_pwr_enable_cfg {
 			pins = "p2_3";
 			function = "usb0";
 		};
 
-		usb0_pwr_fault {
+		usb0_pwr_fault_cfg {
 			pins = "p8_0";
 			function = "usb0";
 			bias-disable;

-- 
2.34.1




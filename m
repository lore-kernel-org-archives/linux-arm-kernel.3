Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5756C83F09
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  6 Jul 2025 19:42:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pJ6hf/45mzyAk0YVzIPl8IF9m5amuh4Pzg7xGOZElsI=; b=IlsNaNIU0QGSHaIfWnlhm6OnXA
	v4PupFOJZ0PvLNpYtcoFhulcaE+lYxoQOFCsBIOpfyGjFIL20/G3QfgBmhy8e8j2Ad6Nr5KvCK74V
	xwS07pQTmyJY0rzsGe+iS5HWzOvplt7Jg2SUMejbLm/Bn6cC9dNUPCOksiYZZ5OqBzvN5GyPcd6s/
	WrvL1f2Ic91d5LH9EGBYQTjeNODYQwBuScKU2mFZpS6yXwGYXL8BK5WYoJMg3CgzMGm8Drjv9Lq75
	iKX7BNCMly3mOYiZEKP4af3e7G7zc4FcajEBPCf38di63IQq8SZphJS0D5h/smYOJp7ALyHtzwvwu
	RwAWWPaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYVFt-00000000k5y-1bIo;
	Sun, 06 Jul 2025 19:42:29 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYUON-00000000fFt-32xv
	for linux-arm-kernel@lists.infradead.org;
	Sun, 06 Jul 2025 18:47:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id BE6F7A53D95;
	Sun,  6 Jul 2025 18:47:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id F1D6CC4CEF5;
	Sun,  6 Jul 2025 18:47:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751827630;
	bh=L7bpd1ZTMa/RO66jEZFS9u+3RkkUMvyZlh52Z6kGVtk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=dvlYc9uNoTXQWqk/8z7aijiK3mOHrrsIz1KmOGdw31mZ9by1RjNzXn1jZFcQYHvO9
	 O9yqPbmEpiouP0ttPpY05zOGikyis/WXatC5UZ0ldq01CCMSK+PNntspIWpYgeqULV
	 ii8eVeZUYWLDz56b2SDU3PJ+QIgFNy+WSu7NI6dwhUj1OEfq8PpJTYBOglhK8oorN1
	 YDxmGuD5t672YMyZuEZNyKW4UpUp+RjXwBqapHX7nVMNLKxTVkSY3DSkeK8/gDBcJI
	 4iAuHrnuxa5bkTFA3X5qJnad8GFvf4RBIGlRGpqoUQp7pY1DzrUJaMCGvv/y2dmV0l
	 4WuuArBeVxCUA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5705C83F0E;
	Sun,  6 Jul 2025 18:47:09 +0000 (UTC)
From: Frank Li via B4 Relay <devnull+Frank.Li.nxp.com@kernel.org>
Date: Sun, 06 Jul 2025 14:46:59 -0400
Subject: [PATCH 03/11] ARM: dts: lpc4350-hitex-eval: change node name flash
 to flash@0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250706-lpc18xxx_dts-v1-3-7ae8cdfe8d7d@nxp.com>
References: <20250706-lpc18xxx_dts-v1-0-7ae8cdfe8d7d@nxp.com>
In-Reply-To: <20250706-lpc18xxx_dts-v1-0-7ae8cdfe8d7d@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Vladimir Zapolskiy <vz@mleia.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, vz@mleia.com, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751827628; l=2299;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=kvKeu0uSL6H9Hui96OrSfKpctNLAKlofzyW2bVVv/us=;
 b=DmxS+F+3f/HV99/JI5dVWvAPzHZmvs9RZBdcB6bZxK7BpzRNWq/oaa6MaGA5njXoJkS+Jmurj
 kKzC2N09XRbDa5xHksZKRuzpSVj3WqhMGYIlpHDpX2G4Wbg0MCfv7Mn
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-Endpoint-Received: by B4 Relay for Frank.Li@nxp.com/20240130 with
 auth_id=121
X-Original-From: Frank Li <Frank.Li@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250706_114711_914947_7D388388 
X-CRM114-Status: GOOD (  10.63  )
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

Change node name 'flash' to 'flash@0' to fix below CHECK_DTB warnings.
arch/arm/boot/dts/nxp/lpc/lpc4350-hitex-eval.dtb: flash-controller@40003000 (nxp,lpc1773-spifi): Unevaluated properties are not allowed ('flash' was unexpected)
        from schema $id: http://devicetree.org/schemas/mtd/nxp,lpc1773-spifi.yaml#

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm/boot/dts/nxp/lpc/lpc4350-hitex-eval.dts    | 3 ++-
 arch/arm/boot/dts/nxp/lpc/lpc4357-ea4357-devkit.dts | 3 ++-
 arch/arm/boot/dts/nxp/lpc/lpc4357-myd-lpc4357.dts   | 3 ++-
 3 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/lpc/lpc4350-hitex-eval.dts b/arch/arm/boot/dts/nxp/lpc/lpc4350-hitex-eval.dts
index 93d0c2e99e7ced638adbfc8bfccd47d17bbb89e8..8fc89fb6eef1e839ad256ae33942e607fed862c6 100644
--- a/arch/arm/boot/dts/nxp/lpc/lpc4350-hitex-eval.dts
+++ b/arch/arm/boot/dts/nxp/lpc/lpc4350-hitex-eval.dts
@@ -451,8 +451,9 @@ &spifi {
 	pinctrl-names = "default";
 	pinctrl-0 = <&spifi_pins>;
 
-	flash {
+	flash@0 {
 		compatible = "jedec,spi-nor";
+		reg = <0>;
 		spi-rx-bus-width = <4>;
 		#address-cells = <1>;
 		#size-cells = <1>;
diff --git a/arch/arm/boot/dts/nxp/lpc/lpc4357-ea4357-devkit.dts b/arch/arm/boot/dts/nxp/lpc/lpc4357-ea4357-devkit.dts
index 4aefbc01dfc0fe7abbf87a8cdd0d8da179aae3d5..60bcfa5e0518e55eb3e642f146d1c96f2ebd5267 100644
--- a/arch/arm/boot/dts/nxp/lpc/lpc4357-ea4357-devkit.dts
+++ b/arch/arm/boot/dts/nxp/lpc/lpc4357-ea4357-devkit.dts
@@ -582,8 +582,9 @@ &spifi {
 	pinctrl-names = "default";
 	pinctrl-0 = <&spifi_pins>;
 
-	flash {
+	flash@0 {
 		compatible = "jedec,spi-nor";
+		reg = <0>;
 		spi-cpol;
 		spi-cpha;
 		spi-rx-bus-width = <4>;
diff --git a/arch/arm/boot/dts/nxp/lpc/lpc4357-myd-lpc4357.dts b/arch/arm/boot/dts/nxp/lpc/lpc4357-myd-lpc4357.dts
index 846afb8ccbf1de08cccaf445106beeeddee93454..22f7dd671c90d56cc4295151583fd4135c8b707b 100644
--- a/arch/arm/boot/dts/nxp/lpc/lpc4357-myd-lpc4357.dts
+++ b/arch/arm/boot/dts/nxp/lpc/lpc4357-myd-lpc4357.dts
@@ -569,8 +569,9 @@ &spifi {
 	pinctrl-0 = <&spifi_pins>;
 
 	/* Atmel AT25DF321A */
-	flash {
+	flash@0 {
 		compatible = "jedec,spi-nor";
+		reg = <0>;
 		spi-max-frequency = <51000000>;
 		spi-cpol;
 		spi-cpha;

-- 
2.34.1




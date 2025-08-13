Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B7BEC87FCF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Aug 2025 09:57:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EKgUCuvkxnrGfpgJntdePQt93ZROzNuJFzpPEPxAwFI=; b=gW0WktLzg8w0/Q+Xz8MEa1T1IT
	5r+WD90T+ZeFwVijCjr80OitYTgQkj4b2Uby4MxI5oBPaBtvdruuwMzUUCfR+tKhI3wUzGBg52wOl
	Gz/8CprJ/LEhOjkM8Mxog4ri5qj3dzzFdRn8DLVI7XbaIMILC4tBAir8K8219I8Mz/cxxVe0tqzNc
	vQNCuVCyhdeIbc9Laata70NNAEcUPHjWnbOwIl6/+Z1sr7lIHBquahtcfeqSbKDtHSTKjoTOmasCZ
	ZvQEsWfaVK0DXQZq2cKVi+xdvToDTDlfUKcvhhgrJ9KbsKwD6X6ZquZOTHCcUAS9WKv6DzgiSfHFE
	rwAXHoQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um8Ej-0000000DILM-1v8P;
	Wed, 13 Aug 2025 09:57:37 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um8B5-0000000DHo3-1gig
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Aug 2025 09:53:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D1D88601F5;
	Wed, 13 Aug 2025 09:53:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4E650C4CEFD;
	Wed, 13 Aug 2025 09:53:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755078830;
	bh=Ha5dEuqV8NyStkOm/Hu12jV5CVCm/XkYT4uR220+Lss=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=M67J4EERGcUplYJuGDjL9tQgqb74vyC5oU4EvnobEEgKyg1qGffMQ0Pqrv+/dALKm
	 CF46C9aTvB/EqBATFcA9LM0s2+cSdFLGZwN15jRAMZWVKAUxU/833cTGparhhVUglY
	 ZqOpIPEbxjHGh4OSe8SkTVTdCXaRjUX6ZTyeDp2XDkYnvTg/nwe0kP2dP7gD2XuC5z
	 qgnuZp+xIDOfaYV3YOGtp/kME275f5cW/bdrMtjBKNKfBTFSZXfTSV9XOp03VAlEIh
	 UAapdOkQryyXc63CAPCBPMl2hx2MSf/1BbVeJpwPXEIc4pteV27su+/TbA4Fetw53F
	 9ak0knWU+vxSg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45E30CA0EE6;
	Wed, 13 Aug 2025 09:53:50 +0000 (UTC)
From: Janne Grunau via B4 Relay <devnull+j.jannau.net@kernel.org>
Date: Wed, 13 Aug 2025 11:53:35 +0200
Subject: [PATCH 3/5] arm64: dts: apple: t600x: Add bluetooth device nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250813-apple-dt-sync-6-17-v1-3-209f15d10aa0@jannau.net>
References: <20250813-apple-dt-sync-6-17-v1-0-209f15d10aa0@jannau.net>
In-Reply-To: <20250813-apple-dt-sync-6-17-v1-0-209f15d10aa0@jannau.net>
To: Sven Peter <sven@kernel.org>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Neal Gompa <neal@gompa.dev>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Mark Kettenis <kettenis@openbsd.org>, 
 Hector Martin <marcan@marcan.st>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Janne Grunau <j@jannau.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5002; i=j@jannau.net;
 s=yk2024; h=from:subject:message-id;
 bh=C2YwY38W49BVPlqekZccmVQQ104q7sB0ZkEUHkDIXu8=;
 b=owGbwMvMwCW2UNrmdq9+ahrjabUkhow5CWuYtHo0f/1vSt+eLWglGlpdeSL2geTTZU0lMgohR
 ydJTjrXUcrCIMbFICumyJKk/bKDYXWNYkztgzCYOaxMIEMYuDgFYCJyoowMF9nPxilazN7M9eP+
 lHzWNZv+W4TZrhPbOW1P6Jss5vw3sYwMd2Ifrxfc0bTw+5R2+Y1XRJ6sWSm6Ycq+qiuOT1f+ito
 XygIA
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419
X-Endpoint-Received: by B4 Relay for j@jannau.net/yk2024 with auth_id=264
X-Original-From: Janne Grunau <j@jannau.net>
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
Reply-To: j@jannau.net
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Hector Martin <marcan@marcan.st>

Add bluetooth PCIe device nodes to specify per device brcm,board-type
and provide the bootloader filled "local-bd-address" and calibration
data.

Signed-off-by: Hector Martin <marcan@marcan.st>
Signed-off-by: Janne Grunau <j@jannau.net>
---
 arch/arm64/boot/dts/apple/t6000-j314s.dts      | 4 ++++
 arch/arm64/boot/dts/apple/t6000-j316s.dts      | 4 ++++
 arch/arm64/boot/dts/apple/t6001-j314c.dts      | 4 ++++
 arch/arm64/boot/dts/apple/t6001-j316c.dts      | 4 ++++
 arch/arm64/boot/dts/apple/t6001-j375c.dts      | 4 ++++
 arch/arm64/boot/dts/apple/t6002-j375d.dts      | 4 ++++
 arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi | 8 ++++++++
 arch/arm64/boot/dts/apple/t600x-j375.dtsi      | 8 ++++++++
 8 files changed, 40 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t6000-j314s.dts b/arch/arm64/boot/dts/apple/t6000-j314s.dts
index ac35870ca129ce353b04296800b197bf684d0bd7..1430b91ff1b152e5a23025d5377f189601bb5a09 100644
--- a/arch/arm64/boot/dts/apple/t6000-j314s.dts
+++ b/arch/arm64/boot/dts/apple/t6000-j314s.dts
@@ -20,3 +20,7 @@ / {
 &wifi0 {
 	brcm,board-type = "apple,maldives";
 };
+
+&bluetooth0 {
+	brcm,board-type = "apple,maldives";
+};
diff --git a/arch/arm64/boot/dts/apple/t6000-j316s.dts b/arch/arm64/boot/dts/apple/t6000-j316s.dts
index 77d6d8c14d741e9b6a0dc44f764ea54f966e0d59..da0cbe7d96736b1491497243bdbd1d13c9ab6c62 100644
--- a/arch/arm64/boot/dts/apple/t6000-j316s.dts
+++ b/arch/arm64/boot/dts/apple/t6000-j316s.dts
@@ -20,3 +20,7 @@ / {
 &wifi0 {
 	brcm,board-type = "apple,madagascar";
 };
+
+&bluetooth0 {
+	brcm,board-type = "apple,madagascar";
+};
diff --git a/arch/arm64/boot/dts/apple/t6001-j314c.dts b/arch/arm64/boot/dts/apple/t6001-j314c.dts
index 0a5655792a8f1cb6d0029bf9f967aa74cf6c01f7..c37097dcfdb304d8fcdf77de82e494e158d94c72 100644
--- a/arch/arm64/boot/dts/apple/t6001-j314c.dts
+++ b/arch/arm64/boot/dts/apple/t6001-j314c.dts
@@ -20,3 +20,7 @@ / {
 &wifi0 {
 	brcm,board-type = "apple,maldives";
 };
+
+&bluetooth0 {
+	brcm,board-type = "apple,maldives";
+};
diff --git a/arch/arm64/boot/dts/apple/t6001-j316c.dts b/arch/arm64/boot/dts/apple/t6001-j316c.dts
index 9c215531ea543e9afe8c131f7c8dc68cfaae666c..3bc6e0c3294cf98c89dddfb4891eefbe8aae7020 100644
--- a/arch/arm64/boot/dts/apple/t6001-j316c.dts
+++ b/arch/arm64/boot/dts/apple/t6001-j316c.dts
@@ -20,3 +20,7 @@ / {
 &wifi0 {
 	brcm,board-type = "apple,madagascar";
 };
+
+&bluetooth0 {
+	brcm,board-type = "apple,madagascar";
+};
diff --git a/arch/arm64/boot/dts/apple/t6001-j375c.dts b/arch/arm64/boot/dts/apple/t6001-j375c.dts
index 88ca2037556cec4307d27bba0244d7ba7f45b184..2e7c23714d4d0007b7096d469f32c689944c85ff 100644
--- a/arch/arm64/boot/dts/apple/t6001-j375c.dts
+++ b/arch/arm64/boot/dts/apple/t6001-j375c.dts
@@ -20,3 +20,7 @@ / {
 &wifi0 {
 	brcm,board-type = "apple,okinawa";
 };
+
+&bluetooth0 {
+	brcm,board-type = "apple,okinawa";
+};
diff --git a/arch/arm64/boot/dts/apple/t6002-j375d.dts b/arch/arm64/boot/dts/apple/t6002-j375d.dts
index f56d13b37eaff1c3c14815575a71024661669296..2b7f80119618ad1b497b67597c55968585bd92a9 100644
--- a/arch/arm64/boot/dts/apple/t6002-j375d.dts
+++ b/arch/arm64/boot/dts/apple/t6002-j375d.dts
@@ -42,6 +42,10 @@ &wifi0 {
 	brcm,board-type = "apple,okinawa";
 };
 
+&bluetooth0 {
+	brcm,board-type = "apple,okinawa";
+};
+
 /* delete unused always-on power-domains on die 1 */
 
 /delete-node/ &ps_atc2_usb_aon_die1;
diff --git a/arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi b/arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi
index b699672a5543c1c172f9a788d36287c0b09051e1..c0aac59a6fae4f6f4b387483665349a8e2521c1e 100644
--- a/arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi
+++ b/arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi
@@ -13,6 +13,7 @@
 
 / {
 	aliases {
+		bluetooth0 = &bluetooth0;
 		serial0 = &serial0;
 		wifi0 = &wifi0;
 	};
@@ -105,6 +106,13 @@ wifi0: wifi@0,0 {
 		local-mac-address = [00 10 18 00 00 10];
 		apple,antenna-sku = "XX";
 	};
+
+	bluetooth0: bluetooth@0,1 {
+		compatible = "pci14e4,5f71";
+		reg = <0x10100 0x0 0x0 0x0 0x0>;
+		/* To be filled by the loader */
+		local-bd-address = [00 00 00 00 00 00];
+	};
 };
 
 &port01 {
diff --git a/arch/arm64/boot/dts/apple/t600x-j375.dtsi b/arch/arm64/boot/dts/apple/t600x-j375.dtsi
index 95560bf3798bfebe133afafba674005a3e62ddcc..ed38acc0dfc36a1e30b1d44f1a8dcee089e87232 100644
--- a/arch/arm64/boot/dts/apple/t600x-j375.dtsi
+++ b/arch/arm64/boot/dts/apple/t600x-j375.dtsi
@@ -11,6 +11,7 @@
 
 / {
 	aliases {
+		bluetooth0 = &bluetooth0;
 		serial0 = &serial0;
 		wifi0 = &wifi0;
 	};
@@ -90,6 +91,13 @@ wifi0: wifi@0,0 {
 		local-mac-address = [00 10 18 00 00 10];
 		apple,antenna-sku = "XX";
 	};
+
+	bluetooth0: bluetooth@0,1 {
+		compatible = "pci14e4,5f71";
+		reg = <0x10100 0x0 0x0 0x0 0x0>;
+		/* To be filled by the loader */
+		local-bd-address = [00 00 00 00 00 00];
+	};
 };
 
 &port01 {

-- 
2.50.1




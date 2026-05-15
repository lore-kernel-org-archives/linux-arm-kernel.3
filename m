Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77399CD4851
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 May 2026 21:40:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XNjSF0BuHIS43aXN3xvCmUPCSiH3rB9apJtNwPEINiA=; b=aB5OxefbzlGgxmi/BNFwZPrWLU
	QJ+SR7gBLZ0DfdVZe8wC35JCmMj4L9R0gh3OeJMEaNTMoLgbxd8HFN5TZRmV5lm/64EcUGCkV1Aa/
	JO6h5Wwom60dPWsqi5m723tztR/nwTyl1Y1aIAePdDRkyPf9zFNoZx1R6FHY3X+XEqamJuo9dYl+3
	Q6sgtuYnlm0WlbS3y4n/L8ZGyrtsgWv5FXEtnm0O1ZpjB5P1hOflWjloa8DtRvca7MZ/AVUKhvu4A
	WSM+sD3CRi4qZ67rkCJR/PRXxGG9c4baF1Rht2r3fIZI3eVA6jqOiAqodaMys+Q8rnaD+tzY7rFoE
	OFQ7iDNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wO0Gt-00000009Xkt-1xNp;
	Fri, 15 May 2026 21:40:39 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wO0Gr-00000009Xij-0HRg
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 May 2026 21:40:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5A9D1443B4;
	Fri, 15 May 2026 21:40:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3D21DC2BCFA;
	Fri, 15 May 2026 21:40:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778881236;
	bh=iHR42uvynaw9Y8gIAY8rdBOv8ZX9fIc9NWtVHx2Zq3I=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=VPiZRLZCz5TXnuoSJO7dQLfx0FU/jV4n0/EpWtp1wUhbxOOCgIBpqW0sA+wYH2Bgd
	 IIONWjr4TRaL50sa0SC8JOfy0azol6a0EKbYtW7Yt02Uz0+CHC36YYazZrJpDCOv4H
	 W9IPYGQ71WUW7/f6D3u2H/3hbAqMpcVOy2XnXZg7QkKvdqprSTSXJorQXAwgmPcr6v
	 D0Zks8u4Ze3JaPJFjw1CMD/pWhn4SOMcduXdqLElaikmwIR3XcUq0YQJKkggvqIsWg
	 TAS43jv9TKoTdo2USsbat0T8uUcYIuZ4sc9VRNnOwLSPXtmtRjVNSumenckSC1WoLD
	 4OZqgDEjz+KrA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 355D9CD4F3C;
	Fri, 15 May 2026 21:40:36 +0000 (UTC)
From: Frank Li via B4 Relay <devnull+Frank.Li.nxp.com@kernel.org>
Date: Fri, 15 May 2026 17:40:34 -0400
Subject: [PATCH 3/6] ARM: dts: imx: Add bus-type for ov5642/ov5640
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260515-imx25_dts_simple_warning_2-v1-3-b06bff192a05@nxp.com>
References: <20260515-imx25_dts_simple_warning_2-v1-0-b06bff192a05@nxp.com>
In-Reply-To: <20260515-imx25_dts_simple_warning_2-v1-0-b06bff192a05@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778881235; l=1774;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=HGMs+AFWVIG/7Db0qb4OWvzhAHmrd9vKYw4rG4RNH/M=;
 b=BrOivWXgIRm6WZZQFShvH95LUpQF7Ss1xcHT4UfO/710V+1sIlkj1h/Wd+IZPa2kE/HFX76hq
 udFGBEuy6jEB5qPuPvkaMk0/k8QHcioEeOjEOLfl+n3gl4ScLOt0j3x
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-Endpoint-Received: by B4 Relay for Frank.Li@nxp.com/20240130 with
 auth_id=121
X-Original-From: Frank Li <Frank.Li@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_144037_155502_94BA6EEB 
X-CRM114-Status: GOOD (  10.10  )
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

Add bus-type (MEDIA_BUS_TYPE_PARALLEL) for ov5642/ov5640. i.MX53 and
i.MX6UL only supports parallel csi interface. Fix below CHECK_DTBS
warnings:
  arm/boot/dts/nxp/imx/imx53-smd.dtb: ov5642@3c (ovti,ov5642): port:endpoint: 'bus-type' is a required property

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm/boot/dts/nxp/imx/imx53-smd.dts         | 2 ++
 arch/arm/boot/dts/nxp/imx/imx6ul-14x14-evk.dtsi | 1 +
 2 files changed, 3 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/imx53-smd.dts b/arch/arm/boot/dts/nxp/imx/imx53-smd.dts
index a1e19f9709b2c7c7d02812f2b5c2afd382fb5d86..8c02731c7ba9db794627e085feb8a4e957d8c5c3 100644
--- a/arch/arm/boot/dts/nxp/imx/imx53-smd.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx53-smd.dts
@@ -5,6 +5,7 @@
 
 /dts-v1/;
 #include <dt-bindings/input/input.h>
+#include <dt-bindings/media/video-interfaces.h>
 #include "imx53.dtsi"
 
 / {
@@ -314,6 +315,7 @@ camera: ov5642@3c {
 		port {
 			ov5642_to_ipu_csi0: endpoint {
 				remote-endpoint = <&ipu_csi0_from_parallel_sensor>;
+				bus-type = <MEDIA_BUS_TYPE_PARALLEL>;
 				bus-width = <8>;
 				hsync-active = <1>;
 				vsync-active = <1>;
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-14x14-evk.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ul-14x14-evk.dtsi
index 3d147b160ecf150f2f3b6afa8b5873fabc2ba96f..32afe4130e21126bf6e476db1091c4a45b8cf5bc 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ul-14x14-evk.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6ul-14x14-evk.dtsi
@@ -217,6 +217,7 @@ camera@3c {
 		port {
 			ov5640_to_parallel: endpoint {
 				remote-endpoint = <&parallel_from_ov5640>;
+				bus-type = <MEDIA_BUS_TYPE_PARALLEL>;
 				bus-width = <8>;
 				data-shift = <2>; /* lines 9:2 are used */
 				hsync-active = <0>;

-- 
2.43.0




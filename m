Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ED7D606A325
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Nov 2026 16:00:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=09Qejr2g;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JIltwHE7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:Message-Id:Content-Type:MIME-Version:Subject:
	Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=rSXU4MdQ526YDwpFQqmQayTOK2c15g71hi0jEnqqt1k=; b=09Qejr2gcH68PQLLYmtELxwnRW
	JXGBupb105Brtmw88jFt2qb9kky9/RKYHLARCIdhuhtGNlPJ1ecRdycRj+rDnuwMURP7alzMn00iC
	7T3G+LovygJU8SsTMBfPQ59UH5jHuRf+gyx4MncXYuQH6YCldBaHINRxwvmFP/bQ2KVTRkPFqOREm
	3eWsmLaEwIIVtLRsSKwD53nI8rE3pBHbfejrvsh280USiUq9P4c7vIrl//C/NRLeooj1h/CFjeQag
	b/fSL47W+DItt/G4hy9bowA7po07RJaiJ/qG7u3PhaqZUL3ATP2uy5CacKCpi/bisCmTK8X7nEDIX
	TNSHbqGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNXyS-0000000EeEN-2Nd9;
	Sun, 01 Nov 2026 16:00:00 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNXyQ-0000000EeEH-3Sj0
	for linux-arm-kernel@lists.infradead.org;
	Sun, 01 Nov 2026 15:59:58 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 1727943386;
	Sun,  1 Nov 2026 15:59:58 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793548798;
	b=Pk9196040DLrjqR/1GRCXe03ZYBu9/u663vs11Ux8KjjQ0xD4FgEfeBrn9m+6q6gavn/
	 lUhdPNByOKY1VRx20lRciYVCJfM+EeT+y0TeNgyzkf8NSJxeKo69YU5myhN7AZmqWB8B0
	 KbyFZgvYuKWt4hgfEawQ6e8i++lSGnqNeOHbdYU6r0VtsFNHE/zjEHdHAbnapwq2ilT0r
	 wuHLy9jTd+G/IAXb7FZE5OHyTFyKQoXEsJGRl9CPztzUSjv7qGp6EaxWBvJvaWzfqikoZ
	 bs3NvKJC3GFdX0Bl7uX5Jwu/3USwPySHL/O6hcdSDMd64ydZh3CKvVVprUDvQ32C9zw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793548798;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key:X-Endpoint-Received:X-Original-From:Reply-To:
	 Content-Transfer-Encoding;
	bh=rSXU4MdQ526YDwpFQqmQayTOK2c15g71hi0jEnqqt1k=;
	b=B/Y+BSKH6mSTDsBGjWgAY47rfP2h5EnGfIn6jXobnWwHY1DxuFy4W9eN+MSw2dzgKzpO
	 9DDGqpjvwyGNAO/kIC6jA7C/3o9nhZ7oxZNOLNLZZcOz/q7r39FSNgCqbd5MOfDZNbsde
	 HZCrvvXFynh7+1QjoNizvE/1a9EYgM7lK6Pl3V+RbfLgj5umNmvHORsdTdk6CkZcsbQdB
	 50HuYq3sHuExy/7IJc86tJ8Lkji2N3mnyWnwp3/pNWyNYsRdCQqOpfIFc1G1oNLeULSLz
	 vYk9lwImyfrEZzUJ2BfVcFWF5xt6+YDy31HlkAlUNMGGUWoVrcsrdt9XKpSbered14w==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 750931F000C1;
	Sun,  1 Nov 2026 15:59:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793548797;
	bh=rSXU4MdQ526YDwpFQqmQayTOK2c15g71hi0jEnqqt1k=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=JIltwHE7SI6ouhYgSjhCFz4VL7YEzP+uv0OB7CP2S6FJ2EqATSXMRX5X9nOH4VP0W
	 iA+UpQNBb+u0JyMt6ze4eXIFn6XfjElXJ4mFueKRi2X6oAStGnok5L80QyIuc+AmhE
	 uwrxDynhF/4Qw49bgTBDVp8Py9Avt7fDsMEadcXoMwAXTOSi24wXJgrnBnJEKU3dDY
	 NGXI2IjaSKEhmKAtcXukoYuLpyiIqPFukk07ZLjQVDrzCFqowpS0XzKwWP6qxP1txb
	 zZfPW1vomDrv+LYxbDDLlXMGIqrLc41hvMzFugWeGGDeWBrEg490Qw0vW77aRWTmeV
	 rNMNGJiON6WRg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id C5F14461D4;
	Sun,  1 Nov 2026 15:59:56 +0000 (UTC)
From: Vincent Jardin via B4 Relay <devnull+vjardin.free.fr@kernel.org>
Date: Sun, 01 Nov 2026 16:59:41 +0100
Subject: [PATCH] arm64: dts: freescale: lx2160a-nbxv3: fix 1588 and id line
 names
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261101-for-upstream-nbxv3-dts-line-names-v1-1-7c8eecb2da9f@free.fr>
X-B4-Tracking: v=1; b=H4sIAOxh52oC/x3NQQqDQAxA0atI1g1MRivYq5QuZmqsAY2SWBHEu
 3fo8m3+P8HZhB0e1QnGu7gsWkC3Ct5j0g+j9MUQQ2yJAuGwGH5X34zTjJqPvcZ+c5xEGTXN7Nj
 VmSKle26aAKWzGg9y/B/P13X9AHbiLQZzAAAA
To: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Vincent Jardin <vjardin@free.fr>
Cc: imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793548796; l=2193;
 i=vjardin@free.fr; s=20260525; h=from:subject:message-id;
 bh=ISKcvjfV02vWOp4oL9uUzMIK04tsXq8YeCeMJLgxIRQ=;
 b=ZpoRWP4cOckBlkls/HAiGexv6R8q/Ujap61DCpqzW7toDGxkec9a0p0haztMsR1/0Wrm0qOy1
 TMyw/wzpTv/Ds+8XHmoHyhh6EriJoQdy8mNOryfZrfYMnO+gR86BtjP
X-Developer-Key: i=vjardin@free.fr; a=ed25519;
 pk=hppgLeFpGpKOi7LNwGEZ4jOYofJCoGd4Jf1ltAabiLw=
X-Endpoint-Received: by B4 Relay for vjardin@free.fr/20260525 with
 auth_id=871
X-Original-From: Vincent Jardin <vjardin@free.fr>
Content-Transfer-Encoding: 7bit
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Reply-To: vjardin@free.fr
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Vincent Jardin <vjardin@free.fr>

Let's properly support 1588 on this board and fix the names.

Fixes: 565b6713a460 ("arm64: dts: freescale: add Nodebox v3 CPU Module")
Signed-off-by: Vincent Jardin <vjardin@free.fr>
---
 .../boot/dts/freescale/fsl-lx2160a-nbxv3.dtsi      | 22 ++++++++++------------
 1 file changed, 10 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/fsl-lx2160a-nbxv3.dtsi b/arch/arm64/boot/dts/freescale/fsl-lx2160a-nbxv3.dtsi
index 9c5588a75cdd..5591ae262707 100644
--- a/arch/arm64/boot/dts/freescale/fsl-lx2160a-nbxv3.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-lx2160a-nbxv3.dtsi
@@ -169,7 +169,6 @@ &gpio1 {
 
 	status = "okay";
 
-	/* Platform reset, no consumer node: released at boot */
 	pltrst-hog {
 		gpio-hog;
 		gpios = <29 GPIO_ACTIVE_LOW>;
@@ -206,9 +205,9 @@ &gpio3 {
 		"altfn:ec1-rxd1", "altfn:ec1-rxd0",
 		"altfn:ec1-rx-clk", "altfn:ec1-rx-dv",
 		"", "",
-		"ptp-refclk-in",
+		"altfn:tsec1588-clk-out",
 		"", "", "", "", "", "", "", "",
-		"u1700-zl30733-pps-out",
+		"altfn:tsec1588-trig-in1",
 		"",
 		"ethsw-mdio-en",
 		"usb1-oc#",	/* USB1_PWRFAULT and USB2_PWRFAULT pads: one wired-OR net */
@@ -247,21 +246,20 @@ eeprom@52 {
 		pagesize = <32>;
 	};
 
-	/* Board ID straps */
 	gpio@74 {
 		compatible = "ti,tca9539";
 		reg = <0x74>;
 		#gpio-cells = <2>;
 		gpio-controller;
 		gpio-line-names =
-			"boardid-0x0001", "boardid-0x0002",
-			"boardid-0x0004", "boardid-0x0008",
-			"boardid-0x0010", "boardid-0x0020",
-			"boardid-0x0040", "boardid-0x0080",
-			"boardid-0x0100", "boardid-0x0200",
-			"boardid-0x0400", "boardid-0x0800",
-			"boardid-0x1000", "boardid-0x2000",
-			"boardid-0x4000", "boardid-0x8000";
+			"boardid-0x01", "boardid-0x02",
+			"boardid-0x04", "boardid-0x08",
+			"boardid-0x10", "boardid-0x20",
+			"boardid-0x40", "boardid-0x80",
+			"test-mode-tp1500",
+			"gnd-p11", "gnd-p12", "gnd-p13",
+			"gnd-p14", "gnd-p15", "gnd-p16",
+			"gnd-p17";
 	};
 
 	u800: gpio@75 {

---
base-commit: cbbddb6b08cc9900a87cccaa9b22bbe06aa4f50a
change-id: 20261101-for-upstream-nbxv3-dts-line-names-93b121a5b440

Best regards,
-- 
Vincent Jardin <vjardin@free.fr>




Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 530D5CD4F39
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 May 2026 12:53:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=UHmiCWR0BD8AAt0d/+D6Dm6Xr0telhLVotHuENhq3CQ=; b=UIHmJ/fb6BngyHe5ilFSQqrBug
	3ZUsl0yirJ6w4O9X5ukNYzJuW7EddbX+UWgAWzrAAppu8ULVx3xa9rBY60O7H7t0NmeBcpvBhDSKH
	PXEs8t24GHA/EZggt9MaTZ4cq6P2RMz+BEPsyPoDmhofhEBEnPPSyMS9bT305pxybtcCTClks2/Xn
	vxGpdFhGTTL7ZKAkSBZ6uBkXnEEWrZT1CR6NLu3NVMZoONZD0t7n/dLghIrhJ+aNq468e3YYRitJw
	QZfEIfxnr5egtdWprkdC9Io6OAabIojCBDctlDRINqkr70vLuvZTbIlWzRGWGt5ZkPt1XdsbPS88U
	OS7ncxGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNVZQ-00000005WOQ-2Qin;
	Thu, 14 May 2026 12:53:44 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNVZO-00000005WO6-34WQ
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 14 May 2026 12:53:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=UHmiCWR0BD8AAt0d/+D6Dm6Xr0telhLVotHuENhq3CQ=; b=M/KjhjCRScuQarFPLWRIveHQn+
	V9x+mjWJByKF0GHO9/BEdEQk+vjVtqmjQh7EWbre44uUeTWCSEpK36LdiOW9/XCTNjzUeq7BURE4U
	cP2Q0vMeGgAj2Rjmb3GJF41kyovr/o9ZYLPGhHoxqHbj9TOyL5NLexOrh8N3tg8yH05YnAV9Bq62l
	OuIlQcHLbZRqo+jbVTvd+wLduMD3KxPLntgsK/+y8Vo6oEq0TerYf975YPb0mizDYS4p6ZuRUPgb9
	Do6yMWWjjs/6eVa+axLB6NyfRXyC+ZftL1xsUhjavVcchO4gKZS/PWQaY3Tyd4gxe3t380S5IV9NU
	z8wzeSog==;
Received: from mout-p-103.mailbox.org ([2001:67c:2050:0:465::103])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNVZL-00000002v9p-0Gxq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 May 2026 12:53:41 +0000
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4gGVcv4WLVz9tvF;
	Thu, 14 May 2026 14:53:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1778763215;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=UHmiCWR0BD8AAt0d/+D6Dm6Xr0telhLVotHuENhq3CQ=;
	b=rtYJOeaH9551PM8icB9+/T5CMJde9sMKKxRZ2hA2vxE3BTkB0qsQRjKm8t73fKSrejzNJI
	GNDcgoohr/4uuvnrTzxFqYob1hXWgHsAds7Zz4qHsrXu7FJ+EaA1LOEhPxk1ZVYZlZGxLT
	fB8s644Q4RgOoll6kkn+WSjjScKJgDArIjJ9MzQhgpWNwbgaHwFosDKvxA26RLsVoMF30C
	wer+hRWIZucoXnksWBpXuFUtthxAAhprIYETSWgBaY+ibSs+0jPf36it8Cj7akRz0WHsu2
	wQXIM5s314kfyVzkOcvbdgbkYl5goucE4jWy6smH1TdGtWt8qmq5+VI7SF9kZg==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b="FgGv+/Ua";
	spf=pass (outgoing_mbo_mout: domain of marek.vasut+renesas@mailbox.org designates 2001:67c:2050:b231:465::202 as permitted sender) smtp.mailfrom=marek.vasut+renesas@mailbox.org
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1778763213;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=UHmiCWR0BD8AAt0d/+D6Dm6Xr0telhLVotHuENhq3CQ=;
	b=FgGv+/UaaA1FrJ2PTQGZHjHVgfmj6Duif0TgB7L/gXkW3tbwUCZO4/tkuQNsNn8Hf7GDCS
	Vlpg1N4+6FlBxxuSJxxQO7KvOqsZ3fVNxUYIykdu4ePXmvsmzqYrBSt9rD3ZMEDGyO1CNN
	cnTn8BRVLtqxJoHvg0J14vr7ErHgjOxb7LCyl1sLiz5W8qmw2LaXcAAPBVzNajt1HuDT+2
	Co9/PPsMG1g6BOf0wBNf1aiN1jdMA+S8y1gNvze20hKEU6sEz7SXMCNnis/Jb0+Ax+iBGN
	r9XsKF6K1WNaJv4Yv+yZ4lz1Odomdmv5nntmSypqD1+IfOf7LfB2ikaLcBw8Og==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Marc Zyngier <maz@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2] arm64: dts: renesas: r8a78000: Fix GIC-720AE View 1 Redistributor description
Date: Thu, 14 May 2026 14:53:06 +0200
Message-ID: <20260514125328.20954-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: f4t9kpem6b31uiyxzjhci76j4kc6iz93
X-MBO-RS-ID: fea83fbeaf2ff1a254c
X-Rspamd-Queue-Id: 4gGVcv4WLVz9tvF
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_135339_615381_F9F9EEE7 
X-CRM114-Status: GOOD (  13.31  )
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

The Renesas R-Car X5H (R8A78000) SoC contains Arm CoreLink GIC-720AE
Generic Interrupt Controller with Multi View capability. Firmware has
access to configuration View 0, Linux kernel has access to View 1.

The Arm CoreLink GIC-720AE Generic Interrupt Controller Technical
Reference Manual, currently latest r2p1 [1], chapter "5. Programmers
model for GIC-720AE", subchapter "5.4 Redistributor registers
for control and physical LPIs summary", part "5.4.3 GICR_TYPER,
Redistributor Type Register", "Table 5-50: GICR_TYPER bit descriptions"
on page 200, clarifies register "GICR_TYPER" bit 4 "Last" behavior
in Multi View setup as follows:

"
Last
Last Redistributor:

0 ... This Redistributor is not the last Redistributor on the chip.
1 ... This Redistributor is the last Redistributor on the chip.
      When GICD_CFGID.VIEW == 1, for views 1, 2, or 3 this bit
      always returns 1.
"

On this SoC, GICD_CFGID.VIEW is 1 and the Linux kernel has access to
View 1, therefore Linux kernel GICv3 driver will interpret register
"GICR_TYPER" bit 4 "Last" = 1 in the first Redistributor in continuous
Redistributor page as that first Redistributor being the one and only
Redistributor and will stop processing the continuous Redistributor
page further. This will prevent the other Redistributors from being
recognized by the system and used for other PEs.

Because the hardware indicates that the continuous Redistributor page
is not continuous for View 1, 2, or 3, describe every Redistributor
separately in the DT. This makes all Redistributors for all cores
accessible in Linux.

[1] https://documentation-service.arm.com/static/69ef3c1cd35efd294e335c43
    Arm® CoreLink™ GIC-720AE Generic Interrupt Controller
    Revision: r2p1 / Issue 12 / 102666_0201_12_en

Fixes: 63500d12cf76 ("arm64: dts: renesas: Add R8A78000 SoC support")
Acked-by: Marc Zyngier <maz@kernel.org>
Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Magnus Damm <magnus.damm@gmail.com>
Cc: Marc Zyngier <maz@kernel.org>
Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
---
V2: - Update GIC-700AE documentation link to generated PDF
    - Update commit message to match the PDF
    - Add AB from Marc
---
 arch/arm64/boot/dts/renesas/r8a78000.dtsi | 36 +++++++++++++++++++++--
 1 file changed, 34 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a78000.dtsi b/arch/arm64/boot/dts/renesas/r8a78000.dtsi
index 3ec1b53d27828..73be51787265c 100644
--- a/arch/arm64/boot/dts/renesas/r8a78000.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a78000.dtsi
@@ -689,8 +689,40 @@ gic: interrupt-controller@39000000 {
 			#interrupt-cells = <3>;
 			#address-cells = <0>;
 			interrupt-controller;
-			reg = <0 0x39000000 0 0x10000>,
-			      <0 0x39080000 0 0x800000>;
+			#redistributor-regions = <32>;
+			reg = <0x0 0x39000000 0x0 0x10000>,
+			      <0x0 0x39080000 0x0 0x40000>,
+			      <0x0 0x390c0000 0x0 0x40000>,
+			      <0x0 0x39100000 0x0 0x40000>,
+			      <0x0 0x39140000 0x0 0x40000>,
+			      <0x0 0x39180000 0x0 0x40000>,
+			      <0x0 0x391c0000 0x0 0x40000>,
+			      <0x0 0x39200000 0x0 0x40000>,
+			      <0x0 0x39240000 0x0 0x40000>,
+			      <0x0 0x39280000 0x0 0x40000>,
+			      <0x0 0x392c0000 0x0 0x40000>,
+			      <0x0 0x39300000 0x0 0x40000>,
+			      <0x0 0x39340000 0x0 0x40000>,
+			      <0x0 0x39380000 0x0 0x40000>,
+			      <0x0 0x393c0000 0x0 0x40000>,
+			      <0x0 0x39400000 0x0 0x40000>,
+			      <0x0 0x39440000 0x0 0x40000>,
+			      <0x0 0x39480000 0x0 0x40000>,
+			      <0x0 0x394c0000 0x0 0x40000>,
+			      <0x0 0x39500000 0x0 0x40000>,
+			      <0x0 0x39540000 0x0 0x40000>,
+			      <0x0 0x39580000 0x0 0x40000>,
+			      <0x0 0x395c0000 0x0 0x40000>,
+			      <0x0 0x39600000 0x0 0x40000>,
+			      <0x0 0x39640000 0x0 0x40000>,
+			      <0x0 0x39680000 0x0 0x40000>,
+			      <0x0 0x396c0000 0x0 0x40000>,
+			      <0x0 0x39700000 0x0 0x40000>,
+			      <0x0 0x39740000 0x0 0x40000>,
+			      <0x0 0x39780000 0x0 0x40000>,
+			      <0x0 0x397c0000 0x0 0x40000>,
+			      <0x0 0x39800000 0x0 0x40000>,
+			      <0x0 0x39840000 0x0 0x40000>;
 			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
-- 
2.53.0



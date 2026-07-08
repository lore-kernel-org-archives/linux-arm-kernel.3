Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B00CC43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 22:25:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oAE7KuHcbYdI24x5VMTp+PIHL311ilvREmVKh4uXwos=; b=E5byIS5RPCSztnQAdMIaSetf5Z
	nojr5AwHbcD0hkzp7yfc6w7iWrMKmFo3k4uVYLdeMbX6vkUBF8t5VI33oI1EWd4sVtg0FzVImxMjv
	NoueOwxl1jl2HaHGV9x5YDZsy+LgoP88fO27QWSs3dl95t/ViJTMG5h0izelht9owzotHNggW1fHp
	PmnTs3DJanEwF48mGwrIMPd2G4rm4Z3thRVa7P0o7YUo0Xt2oRm5cwdxenuF6W5ysCoto5DjPlJkr
	7M8wTvVKwEBx6dgHM88Vo8Aa9jb4m5YYhqQwQN6f1iNQqHIrx9mW85hIX9xUDhZ7xxGWoyzdxKCZS
	0mfFaNkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whahb-00000000XUb-1GRU;
	Wed, 08 Jul 2026 22:25:11 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whaha-00000000XTm-2DWs
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jul 2026 22:25:10 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A5CC76001A;
	Wed,  8 Jul 2026 22:25:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0EF971F000E9;
	Wed,  8 Jul 2026 22:25:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783549509;
	bh=oAE7KuHcbYdI24x5VMTp+PIHL311ilvREmVKh4uXwos=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=Ut0hY5DYQ2RIOniDc3GH7aZTRr7UMrVkXLH5pe6+yNYfwbzeOw9q3E+WpeSz3LqMP
	 vZP8z5S2zpnGG6cIPL7xqR+FCupXI6FcobeDn1mIH4btMuPMcnjrUmMGi6xfqmk25G
	 AmwyS2HlsKxtj1iuvlrf4z1T4VMAC8psTLadLOGipFCanlpMhQge4D2kgaU3R1jUE8
	 AxRciLMKIemUNOBjNKXUQGE+xqK9SpC/M5epti+EOqD+G9cBezMLvzoaum3nlibCkB
	 gfDj2qrIdNQFJLhw4eMAPhakZjs+odf+VwOTb4opM7bk2APxW21cSd6FoTOuuYD4Cu
	 5bgMSo6+2nXmw==
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 09 Jul 2026 00:24:57 +0200
Subject: [PATCH 3/3] ARM: dts: ixp4xx: Drop the reg-offset hack
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-ixp4xx-little-endian-v1-3-e9622d0ba9e4@kernel.org>
References: <20260709-ixp4xx-little-endian-v1-0-e9622d0ba9e4@kernel.org>
In-Reply-To: <20260709-ixp4xx-little-endian-v1-0-e9622d0ba9e4@kernel.org>
To: Russell King <linux@armlinux.org.uk>, Imre Kaloz <kaloz@openwrt.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.15.2
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

The reg-offset hack only works when the IXP4xx platform is
running in big endian mode, and it is there to byte-offset
the byte where the serial registers appear in the BE config.

This is clearly wrong, workarounds need to be in the
drivers. Drop the reg-offset.

Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 arch/arm/boot/dts/intel/ixp/intel-ixp4xx.dtsi | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/arch/arm/boot/dts/intel/ixp/intel-ixp4xx.dtsi b/arch/arm/boot/dts/intel/ixp/intel-ixp4xx.dtsi
index 0adeccabd4fe..b0f98da8def4 100644
--- a/arch/arm/boot/dts/intel/ixp/intel-ixp4xx.dtsi
+++ b/arch/arm/boot/dts/intel/ixp/intel-ixp4xx.dtsi
@@ -84,11 +84,6 @@ pci@c0000000 {
 		uart0: serial@c8000000 {
 			compatible = "intel,xscale-uart";
 			reg = <0xc8000000 0x1000>;
-			/*
-			 * The reg-offset and reg-shift is a side effect
-			 * of running the platform in big endian mode.
-			 */
-			reg-offset = <3>;
 			reg-shift = <2>;
 			interrupts = <15 IRQ_TYPE_LEVEL_HIGH>;
 			clock-frequency = <14745600>;
@@ -98,11 +93,6 @@ uart0: serial@c8000000 {
 		uart1: serial@c8001000 {
 			compatible = "intel,xscale-uart";
 			reg = <0xc8001000 0x1000>;
-			/*
-			 * The reg-offset and reg-shift is a side effect
-			 * of running the platform in big endian mode.
-			 */
-			reg-offset = <3>;
 			reg-shift = <2>;
 			interrupts = <13 IRQ_TYPE_LEVEL_HIGH>;
 			clock-frequency = <14745600>;

-- 
2.55.0



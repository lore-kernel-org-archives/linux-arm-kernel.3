Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76F7FC5DF66
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 12:00:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X7+46xUhDdpJ5WOOvhru9CtiWKcPRuQPn7W3aBJaaKc=; b=EyWWruaN3OuDw4MOHyiPZeNsI4
	jOc5F0PdRluTiJdY9SskFVFLUZc9Fa0bpwB08vL62TVwN9gNxXm9IFSVqMYHW1XGglApS2ElScwKC
	KdrmzDS7+NoDZrCL8wuTGkcZYTSmn/jtJSS4CvWACchu809xpA2fVlx+EL7uEltOrrWx6gfLlxXLN
	hgapZ9l2j7H2HemSM2nFN8VdL6nTNxi0uxN9gZDa0If37fQ32J/Csna8UPWfTMjuKEXVaKYxo4QaM
	4XBwQhiAAnGAW7aqPZNW+jg+Ybbp/42YvNumnc3iCOg5I13H73wqYvK6YOQX14q6y3LF+21X5ct82
	OoisXQJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuU6O-00000000bCe-3W3m;
	Thu, 13 Aug 2026 12:00:04 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuU6L-00000000b6y-43Gu
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Aug 2026 12:00:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4BBFD60A69;
	Thu, 13 Aug 2026 12:00:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A92B0C2BCF7;
	Thu, 13 Aug 2026 12:00:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1786622401;
	bh=QuSGcF61AVWkzhKL0jYfDHaSvxefEdFczuPQKJ89HbU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=mV9ZD6KORpZX3aSre9b73YbK5k3GbWTd2UbuLiYJ7or8Ps/V8z5rQVjXPTmPxEp2f
	 zcctvfeaVzeetgQ+romqdBE9j4/ia6RfZDioB+0sPIicz5ma4uQPH49bbp77fDs4VE
	 23i3kvhrsvCTGCeSz9sLGm5mfPU4jSCjksVnIJs4/64m9IrU8+vg36VOaH9+cawZaS
	 /O4P10T9Gq8iKWjw5YxKpd1yDVYRQz6TjECyCU8fQCJmu6ERXErDOwykjkeJ3soHl0
	 1lYr/Nyadt+ZZ3APPXsyNyhR0b+h+WLc5vEMoVgAGTQOGaiw1ERuJDvfd7ysQ8xx4i
	 Win88jo8o1oqg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AA88C5DF6E;
	Thu, 13 Aug 2026 12:00:00 +0000 (UTC)
From: Colin Huang via B4 Relay <devnull+u8813345.gmail.com@kernel.org>
Date: Thu, 13 Aug 2026 19:59:44 +0800
Subject: [PATCH v5 14/15] ARM: dts: aspeed: anacapa: Use default SPI2
 memory mapping
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260813-anacapa-devlop-phase-devicetree-v5-14-c7058f63dc67@gmail.com>
References: <20260813-anacapa-devlop-phase-devicetree-v5-0-c7058f63dc67@gmail.com>
In-Reply-To: <20260813-anacapa-devlop-phase-devicetree-v5-0-c7058f63dc67@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 colin.huang2@amd.com, Colin Huang <u8813345@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786622378; l=819;
 i=u8813345@gmail.com; s=20260202; h=from:subject:message-id;
 bh=oxTF20CYiA7RH6T7z/fDB4EwQ1KdT7fYEEX/g/uzaW4=;
 b=yqV5uqb6ufRzAE5RQBXJYWysUIhzgVy0VSJP+HK2eco3jzvaBlc5EzKqNhmEsySCR4W0wyfZJ
 +muB2m33F5VC6z+kLptDpOQkx5MBIr9Br537nLY+hjPowEzW6s4nKP+
X-Developer-Key: i=u8813345@gmail.com; a=ed25519;
 pk=Zlg0WqpCw4qbswOqamTBTXIchwR/3SnYZpy7rjaGMdQ=
X-Endpoint-Received: by B4 Relay for u8813345@gmail.com/20260202 with
 auth_id=761
X-Original-From: Colin Huang <u8813345@gmail.com>
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
Reply-To: u8813345@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Colin Huang <u8813345@gmail.com>

Remove the board-specific SPI2 reg property override and rely on the
default SPI2 memory window definition provided by aspeed-g6.dtsi.

Signed-off-by: Colin Huang <u8813345@gmail.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt1.dts | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt1.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt1.dts
index f27ec52f9d56..d613b5b9d6b0 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt1.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt1.dts
@@ -1062,7 +1062,6 @@ &sgpiom0 {
 
 // BIOS Flash
 &spi2 {
-	reg = <0x1e631000 0xc4>, <0x50000000 0x8000000>;
 	pinctrl-0 = <&pinctrl_spi2_default>;
 
 	pinctrl-names = "default";

-- 
2.34.1




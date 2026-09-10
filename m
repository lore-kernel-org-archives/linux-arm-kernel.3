Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0BC8C88E40
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 13:36:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lUrthc0mjWtIG21zXxlKv/9dxgTyY+Ugh6OTxSDOHVg=; b=xBk7u4ci/toA4BXRRXcnuFHRz8
	9UZL/tEBjdr3h90VmSXwuKzaMVakV1kl+aiYr1QfpTYNN1JBgweVntEKhXNAMDikMzsc2WxiLM+cX
	+a7FB8nXtTcBAlEXfc0JVxQE6qUPvR7ay6PKmZRMa+i9fMKPg1Ydj6Ble8seWrdlMDjGeGjOgwxiM
	hkBuCg+XEMu/jmsgx0Rv0fVjf8jZg0Io0I/750oBujrRo+FymtM3opu6k0oejgPuLZtCmvh9hCeLs
	UU/uNgJcSFlvQKfu4lMyGPbG9XKj0nFjW9KqbXe06pAlq6fqgn5G4xrRL+OKosg6SiYVBhSmxUdUy
	FDA2AuDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4ewn-0000000EV96-2OaQ;
	Thu, 10 Sep 2026 13:36:13 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4ewN-0000000EUQZ-0Gmb;
	Thu, 10 Sep 2026 13:35:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1789047345;
	bh=WW3bgWtvchm/ZVcwcd6Is+/46qWg55ayuKIPjH66+G4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=WaLMUQSlhh3h07Nbscy1WypZiWeRgCtdUty5bDukiVtUWe+slwf2F+5mwo72TIszm
	 6T6Q9GhSwTMpD21k4q6ue77OEJJfShmRKASXhWyGIHHquFBLPY/iDfVRqQk4OXHc5J
	 pVYgJ8iLZbH4QE9D5TOqI0qtxsKUJBgF+TWOG4xR76WFh4n0Gbl25hw+KKg6WErh1G
	 6DVeIKVnsb5hhNcsdjPAKN9gpUAfjTCorZdxvufBadjCL9MIeJ2fTcG8PrJG5byocv
	 XAHTnomjWRar1KzjhajgPr2iG/PREbZllrHeEFekek6serh1cSVAc+rcCnZ++JXJFG
	 R9osiRz2gQf2w==
Received: from [192.168.0.15] (unknown [100.64.0.170])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 2FC8917E03E1;
	Thu, 10 Sep 2026 15:35:43 +0200 (CEST)
From: Detlev Casanova <detlev.casanova@collabora.com>
Date: Thu, 10 Sep 2026 09:34:50 -0400
Subject: [PATCH v2 8/8] arm64: dts: rockchip: Rename rk3588 HDMI audio
 cards
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-fix-rockchip-hdmi-audio-names-v2-8-1396a6168e20@collabora.com>
References: <20260910-fix-rockchip-hdmi-audio-names-v2-0-1396a6168e20@collabora.com>
In-Reply-To: <20260910-fix-rockchip-hdmi-audio-names-v2-0-1396a6168e20@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Johan Jonker <jbx6244@gmail.com>, Alex Bee <knaerzche@gmail.com>, 
 Christian Hewitt <christianshewitt@gmail.com>, 
 Robin Murphy <robin.murphy@arm.com>, 
 Nicolas Frattaroli <frattaroli.nicolas@gmail.com>, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
 David Summers <beagleboard@davidjohnsummers.uk>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Detlev Casanova <detlev.casanova@collabora.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_063547_535705_45F2CFFA 
X-CRM114-Status: GOOD (  12.36  )
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

Rename the two cards from "hdmi0"/"hdmi1" to "RK3588 HDMI0"/"RK3588
HDMI1" so they identify the SoC in user-visible ALSA fields and match
the naming scheme used across the rest of the Rockchip family.

Fixes: b8c6c136971c0 ("arm64: dts: rockchip: Add HDMI audio outputs for rk3588")
Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
---
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi  | 2 +-
 arch/arm64/boot/dts/rockchip/rk3588-extra.dtsi | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
index 376ad04e0786..7892e18a7835 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
@@ -376,7 +376,7 @@ hdmi0_sound: hdmi0-sound {
 		compatible = "simple-audio-card";
 		simple-audio-card,format = "i2s";
 		simple-audio-card,mclk-fs = <128>;
-		simple-audio-card,name = "hdmi0";
+		simple-audio-card,name = "RK3588 HDMI0";
 		status = "disabled";
 
 		simple-audio-card,codec {
diff --git a/arch/arm64/boot/dts/rockchip/rk3588-extra.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-extra.dtsi
index b251bb129cdb..2bcf30d8a338 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-extra.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-extra.dtsi
@@ -11,7 +11,7 @@ hdmi1_sound: hdmi1-sound {
 		compatible = "simple-audio-card";
 		simple-audio-card,format = "i2s";
 		simple-audio-card,mclk-fs = <128>;
-		simple-audio-card,name = "hdmi1";
+		simple-audio-card,name = "RK3588 HDMI1";
 		status = "disabled";
 
 		simple-audio-card,codec {

-- 
2.55.0



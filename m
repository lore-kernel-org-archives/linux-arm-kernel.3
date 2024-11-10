Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A5ABD12D4F
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 10 Nov 2024 18:46:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=X6EGSkrXWrC2versQkLjecqlYEVZvqpe//AxlHQPJPQ=; b=1lofC/U7+9Auj48eUd/oNi8i9e
	M/4MM5kTpfoQGTh6xBb0/MveBWNL1+jjXWIYYmt9AXAAwg9n2rrUyWtzp3Nvft6SRCEEh3sAWfNZZ
	VKiLnTimKdBGF4l/vPpms9eAYlJmPiAp2o225aiSmxHKbHEE/OgbR2a+WWUZoyJCAlf9odcKK3kX+
	jQMMaasnlOcrG4dGfC4ADwDwGgh2qc3FH5t2opCve2oICmcOnGqQ53rY8qXXoFsKgwa9kbwnTlC3r
	WqJRrvD1fHJUGPC4piaMRsEzI8iAZJXbBMhXNZpxRLWxN6J9WgaeZ/RuAzGsTcPtApqnsDN+bebex
	pC4c/pmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tACxC-0000000FOhC-26Mh;
	Sun, 10 Nov 2024 18:46:30 +0000
Received: from mail.manjaro.org ([116.203.91.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tACvO-0000000FOU4-3tf2;
	Sun, 10 Nov 2024 18:44:41 +0000
From: Dragan Simic <dsimic@manjaro.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=2021;
	t=1731264275;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=X6EGSkrXWrC2versQkLjecqlYEVZvqpe//AxlHQPJPQ=;
	b=CCJKo2cWjI4Mxc4eGn3IUgNYzhD53NPu8INSky9AsCs5fEs+ftNK/ZXkAtInhwlVQ4VzW5
	oomFijPvRBOuL0HLmU9WkXoGx7JqEMbKoXbYI4GszQ8ToisntDvgB0IAkt0QtJRIRmRO0K
	xLLbDV2kctwiu7JV01v5pt9/e0s9Jy8gSnndcFIzLEbatVKmLozM4WE99KOdJnGcZxuCi8
	ARQmYbuvWX0sDmcHlO04bs+Sz4SGJOmLY0aWjOVp5zG7Drvwb78JL1LwX3J8RSGcJvGHhR
	5JBsoGFz1IuJrvOHJ3z4Sm7p2MAi8weGEGFPOlTkb38B0hLV9MJTt5lDx/q8qg==
To: linux-rockchip@lists.infradead.org
Cc: heiko@sntech.de,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] arm64: dts: rockchip: Fix vdd_gpu voltage constraints on PinePhone Pro
Date: Sun, 10 Nov 2024 19:44:31 +0100
Message-Id: <0718feb8e95344a0b615f61e6d909f6e105e3bf9.1731264205.git.dsimic@manjaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=dsimic@manjaro.org smtp.mailfrom=dsimic@manjaro.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241110_104439_150705_080D638E 
X-CRM114-Status: GOOD (  12.81  )
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

The regulator-{min,max}-microvolt values for the vdd_gpu regulator in the
PinePhone Pro device dts file are too restrictive, which prevents the highest
GPU OPP from being used, slowing the GPU down unnecessarily.  Let's fix that
by making the regulator-{min,max}-microvolt values less strict, using the
voltage range that the Silergy SYR838 chip used for the vdd_gpu regulator is
actually capable of producing. [1][2]

This also eliminates the following error messages from the kernel log:

  core: _opp_supported_by_regulators: OPP minuV: 1100000 maxuV: 1150000, not supported by regulator
  panfrost ff9a0000.gpu: _opp_add: OPP not supported by regulators (800000000)

These changes to the regulator-{min,max}-microvolt values make the PinePhone
Pro device dts consistent with the dts files for other Rockchip RK3399-based
boards and devices.  It's possible to be more strict here, by specifying the
regulator-{min,max}-microvolt values that don't go outside of what the GPU
actually may use, as the consumer of the vdd_gpu regulator, but those changes
are left for a later directory-wide regulator cleanup.

[1] https://files.pine64.org/doc/PinePhonePro/PinephonePro-Schematic-V1.0-20211127.pdf
[2] https://www.t-firefly.com/download/Firefly-RK3399/docs/Chip%20Specifications/DC-DC_SYR837_838.pdf

Fixes: 78a21c7d5952 ("arm64: dts: rockchip: Add initial support for Pine64 PinePhone Pro")
Cc: stable@vger.kernel.org
Signed-off-by: Dragan Simic <dsimic@manjaro.org>
---
 arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts b/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts
index 1a44582a49fb..956d64f5b271 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts
@@ -410,8 +410,8 @@ vdd_gpu: regulator@41 {
 		pinctrl-names = "default";
 		pinctrl-0 = <&vsel2_pin>;
 		regulator-name = "vdd_gpu";
-		regulator-min-microvolt = <875000>;
-		regulator-max-microvolt = <975000>;
+		regulator-min-microvolt = <712500>;
+		regulator-max-microvolt = <1500000>;
 		regulator-ramp-delay = <1000>;
 		regulator-always-on;
 		regulator-boot-on;


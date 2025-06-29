Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 018D6C83029
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 29 Jun 2025 13:05:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nOCOpdzyJGYo0WmyPHPzo5U4cOQf2vkC3N8qsd5gyAo=; b=V+ayA116EjxIV4OtqBgmBnPhL0
	E5J5HUF9m05IDBpoLiMEYy/47DNVQRgHmq0MTsVXlhVzy8dv4j4QWljXaItQBwhO+5Dgetb4yQLxC
	thX8qwmP62MFe1aHunaaZNXkdJ1DIcvNTZOHnHZfkFKzDxzmUFXllhCOPzaHtpAn+VSREAbiwXGVk
	BI9RdaUcyPdNe94Fzy81O8+BAuSttjxSVou8w4sgruMh8Lx2RaRRgiQcS8HkdRdUthUW+p9v9OqCV
	JEv6/4nO0uzVHR+X/7D9lt7UnuJWcsnZ43F8JQVJhH0Afo4IwRiUANbTDkYQh1hhnyGhb42tKTVR0
	RWhdm1iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVriJ-00000000GMv-1nZC;
	Sun, 29 Jun 2025 13:04:55 +0000
Received: from out-170.mta0.migadu.com ([2001:41d0:1004:224b::aa])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVrJG-00000000Dj9-145v
	for linux-arm-kernel@lists.infradead.org;
	Sun, 29 Jun 2025 12:39:03 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow.org; s=key1;
	t=1751200740;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nOCOpdzyJGYo0WmyPHPzo5U4cOQf2vkC3N8qsd5gyAo=;
	b=GQ4CNfk0xYcLdg3QU3SXwDgtJBjFrtjYOnP60c4J65IbFhmbgdnKCiH808hU9zytHkA6cT
	tF1pijGHtg+ob3gSyJ5Ehr8trcQT//uH1wtvJ7VtSBtwp+5l4muHaDGZwlF2waUSLay3um
	ERbafNgcMmplUtgHVNXeOcieTH6IS26Hi0yI8aU82SqTvR3CUyvKAgLw+33Fu1pMxuJ8SM
	sad/A6QKkgijKK3sYl+ymD479c+DSvBr2qgu/G1d8kJhIncalUZ6quNT9DLKVN7RoS5ZHV
	L2ijJLuopUDuvnDtsAjPcasKPa4O4Sidnvhc6Nl3a34aMdG3miwguqRFRVEWKg==
From: Diederik de Haas <didi.debian@cknow.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Dragan Simic <dsimic@manjaro.org>,
	Quentin Schulz <quentin.schulz@cherry.de>,
	Johan Jonker <jbx6244@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Diederik de Haas <didi.debian@cknow.org>
Subject: [PATCH v3 10/10] arm64: dts: rockchip: Drop regulator-compatible property on rk3399
Date: Sun, 29 Jun 2025 14:34:51 +0200
Message-ID: <20250629123840.34948-11-didi.debian@cknow.org>
In-Reply-To: <20250629123840.34948-1-didi.debian@cknow.org>
References: <20250629123840.34948-1-didi.debian@cknow.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250629_053902_421671_23B7A57C 
X-CRM114-Status: UNSURE (   8.04  )
X-CRM114-Notice: Please train this message.
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

The regulator-compatible property has never existed in the
regulator/fcs,fan53555.yaml binding, so drop it.

This fixes the following DTB validation warnings:

  Unevaluated properties are not allowed
  ('regulator-compatible' was unexpected)

Signed-off-by: Diederik de Haas <didi.debian@cknow.org>
---
 arch/arm64/boot/dts/rockchip/rk3399-hugsun-x99.dts   | 2 --
 arch/arm64/boot/dts/rockchip/rk3399-rock-4c-plus.dts | 2 --
 2 files changed, 4 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-hugsun-x99.dts b/arch/arm64/boot/dts/rockchip/rk3399-hugsun-x99.dts
index 81c4fcb30f39..352c8efb37e0 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-hugsun-x99.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3399-hugsun-x99.dts
@@ -211,7 +211,6 @@ &i2c0 {
 	vdd_cpu_b: syr827@40 {
 		compatible = "silergy,syr827";
 		reg = <0x40>;
-		regulator-compatible = "fan53555-reg";
 		pinctrl-0 = <&vsel1_pin>;
 		regulator-name = "vdd_cpu_b";
 		regulator-min-microvolt = <712500>;
@@ -229,7 +228,6 @@ regulator-state-mem {
 	vdd_gpu: syr828@41 {
 		compatible = "silergy,syr828";
 		reg = <0x41>;
-		regulator-compatible = "fan53555-reg";
 		pinctrl-0 = <&vsel2_pin>;
 		regulator-name = "vdd_gpu";
 		regulator-min-microvolt = <712500>;
diff --git a/arch/arm64/boot/dts/rockchip/rk3399-rock-4c-plus.dts b/arch/arm64/boot/dts/rockchip/rk3399-rock-4c-plus.dts
index 15da5c80d25d..962b8b231c96 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-rock-4c-plus.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3399-rock-4c-plus.dts
@@ -421,7 +421,6 @@ vdd_cpu_b: regulator@40 {
 		compatible = "silergy,syr827";
 		reg = <0x40>;
 		fcs,suspend-voltage-selector = <1>;
-		regulator-compatible = "fan53555-reg";
 		pinctrl-0 = <&vsel1_gpio>;
 		vsel-gpios = <&gpio1 RK_PC1 GPIO_ACTIVE_HIGH>;
 		regulator-name = "vdd_cpu_b";
@@ -440,7 +439,6 @@ vdd_gpu: regulator@41 {
 		compatible = "silergy,syr828";
 		reg = <0x41>;
 		fcs,suspend-voltage-selector = <1>;
-		regulator-compatible = "fan53555-reg";
 		pinctrl-0 = <&vsel2_gpio>;
 		vsel-gpios = <&gpio1 RK_PB6 GPIO_ACTIVE_HIGH>;
 		regulator-name = "vdd_gpu";
-- 
2.50.0



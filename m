Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 393E9CA9ED0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Oct 2026 11:53:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5XRtjL0/iwMeo8iuZcV+Re1/5O1DqBVnsRc9l0KWEZ4=; b=YqbMAl8Y2eWAjAt2kW2CMasiip
	BaZENcQejVXN89fjiaTZxjV3qdWFYTNM2bymJwp2utQUN1YEsDb0ft51EPS7qYP/aBul+3AddLjsl
	E9/th7i46OPDILUbG74VIP2VmRqz47sgVExfpcKRZ/J4oepDbPQlo/jWZ+IpLuO9W5BAN8ij20RZH
	EcQHvy3YwM/EMd5W/PzNrVP3fQ9Vw7n918IrB95KafEygOd4qteIYjFl4vtIJRczXueCZWqv3FfgM
	8hl4hPCtHUIrD+vob4aKO+NIHeEWH6mIFPYJPmGjD4u4iqtlAh6/71Dy/BcthXFCsw8lzB0QFhohG
	HZIGXVTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGEaS-0000000ANmy-1DlY;
	Mon, 12 Oct 2026 11:53:00 +0000
Received: from mail.cyberchaos.dev ([2a0f:4ac0::3a11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGEaE-0000000ANhH-3Eid
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Oct 2026 11:52:49 +0000
From: Yureka Lilian <yureka@cyberchaos.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cyberchaos.dev;
	s=mail; t=1791805961;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5XRtjL0/iwMeo8iuZcV+Re1/5O1DqBVnsRc9l0KWEZ4=;
	b=yubsY+YskhxkFmcm5Rn7jrQcwFAPvlo6QLrt62mnPJCZvA68eszGfJ8bD7BmvgMo+ZgjWY
	KY6m7Ep5ZxfquUjdkVpAHZw7HSINthzzSjEOJWiPx14cRLXlOg2Q5PFHeGj6P6TXxMfpUK
	MoORNx+cEInMFD6WlkICSRiExAe81kc=
Date: Mon, 12 Oct 2026 13:52:33 +0200
Subject: [PATCH 2/5] arm64: dts: apple: t8140: Group cache-related
 properties of cpus
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-apple-a18-pro-dt-pinctrl-i2c-v1-2-6c757966a99e@cyberchaos.dev>
References: <20261012-apple-a18-pro-dt-pinctrl-i2c-v1-0-6c757966a99e@cyberchaos.dev>
In-Reply-To: <20261012-apple-a18-pro-dt-pinctrl-i2c-v1-0-6c757966a99e@cyberchaos.dev>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Andi Shyti <andi.shyti@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-i2c@vger.kernel.org, Yureka Lilian <yureka@cyberchaos.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_045247_080784_77BE6F2F 
X-CRM114-Status: UNSURE (   8.84  )
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

The dt-check-style from 7.3 raised an issue on the ordering, but
the one from current linux-next allows the cache properties to be
grouped, improving readability.

Signed-off-by: Yureka Lilian <yureka@cyberchaos.dev>
---
 arch/arm64/boot/dts/apple/t8140.dtsi | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/apple/t8140.dtsi b/arch/arm64/boot/dts/apple/t8140.dtsi
index 150d91bdf6fc..40559da62923 100644
--- a/arch/arm64/boot/dts/apple/t8140.dtsi
+++ b/arch/arm64/boot/dts/apple/t8140.dtsi
@@ -60,8 +60,9 @@ cpu_e0: cpu@0 {
 			compatible = "apple,tahiti-e";
 			reg = <0x0 0x0>;
 			cpu-release-addr = <0 0>;
-			d-cache-size = <0x10000>;
 			enable-method = "spin-table";
+
+			d-cache-size = <0x10000>;
 			i-cache-size = <0x20000>;
 			next-level-cache = <&l2_cache_0>;
 		};
@@ -71,8 +72,9 @@ cpu_e1: cpu@1 {
 			compatible = "apple,tahiti-e";
 			reg = <0x0 0x1>;
 			cpu-release-addr = <0 0>;
-			d-cache-size = <0x10000>;
 			enable-method = "spin-table";
+
+			d-cache-size = <0x10000>;
 			i-cache-size = <0x20000>;
 			next-level-cache = <&l2_cache_0>;
 		};
@@ -82,8 +84,9 @@ cpu_e2: cpu@2 {
 			compatible = "apple,tahiti-e";
 			reg = <0x0 0x2>;
 			cpu-release-addr = <0 0>;
-			d-cache-size = <0x10000>;
 			enable-method = "spin-table";
+
+			d-cache-size = <0x10000>;
 			i-cache-size = <0x20000>;
 			next-level-cache = <&l2_cache_0>;
 		};
@@ -93,8 +96,9 @@ cpu_e3: cpu@3 {
 			compatible = "apple,tahiti-e";
 			reg = <0x0 0x3>;
 			cpu-release-addr = <0 0>;
-			d-cache-size = <0x10000>;
 			enable-method = "spin-table";
+
+			d-cache-size = <0x10000>;
 			i-cache-size = <0x20000>;
 			next-level-cache = <&l2_cache_0>;
 		};
@@ -104,8 +108,9 @@ cpu_p0: cpu@10100 {
 			compatible = "apple,tahiti-p";
 			reg = <0x0 0x10100>;
 			cpu-release-addr = <0 0>;
-			d-cache-size = <0x20000>;
 			enable-method = "spin-table";
+
+			d-cache-size = <0x20000>;
 			i-cache-size = <0x30000>;
 			next-level-cache = <&l2_cache_1>;
 		};
@@ -115,8 +120,9 @@ cpu_p1: cpu@10101 {
 			compatible = "apple,tahiti-p";
 			reg = <0x0 0x10101>;
 			cpu-release-addr = <0 0>;
-			d-cache-size = <0x20000>;
 			enable-method = "spin-table";
+
+			d-cache-size = <0x20000>;
 			i-cache-size = <0x30000>;
 			next-level-cache = <&l2_cache_1>;
 		};

-- 
2.55.0



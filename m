Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DC64C98317
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 13:23:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=asFSRPzAeSqh5Upg0pBvvouJIpJ240yq43ylJBSx25Y=; b=op15miJwBVTOq8t2Z6r8VGVPSd
	DuZWngmTVlN1vyjQqnSnz5dgt2aa0Ujzz7DsVsHCD/Mz29LQVlyqikcwqmrHvwXylt+2QB/UgShIQ
	TrYPocNAWXVi6bZLwW2cM1VQTo9WKJ9jUL9bDSuj2WKbE2wHdADbtRMupFv6wB0m6GDAairFmd6GL
	OqFRUzXq5eB6yNFjqsEsWey2zifTKmEuRhTi1PQgZr6gbUkbGxSvuKluwMa+QJpHvigukD0Q/U7GA
	aNV8UeCoLwlmE9SYjZB8isdFSxuEfvrQS3mTlWDe8B7UwkXF5HEc7C/KfdPL2hk/gxc4W+gZZBuSc
	SRlD6TZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9jPb-0000000B4f8-1cB3;
	Thu, 24 Sep 2026 13:22:55 +0000
Received: from [195.39.247.168] (helo=mail.cyberchaos.dev)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9jPY-0000000B4c4-0YWI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 13:22:53 +0000
From: Yureka Lilian <yureka@cyberchaos.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cyberchaos.dev;
	s=mail; t=1790256156;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=asFSRPzAeSqh5Upg0pBvvouJIpJ240yq43ylJBSx25Y=;
	b=g456k/HpL8JbzCiYLSwKSwARfDAjU/ie0GWp5WS07QQFjmWdSyTe8F5lX58GZllZDnNkeF
	5LLmzVS9dKmYEaLQ0IwG1Habrpm6iRVcEioKALKaMctDSxLSvTNtGKarDMx0VL4c6p/EzQ
	1arMu6mKIDajOYfHoSbmg3SW5wO3abk=
Date: Thu, 24 Sep 2026 15:22:25 +0200
Subject: [PATCH 3/3] dts: apple: t8132: Fix some line-length-related
 dt-check-style issues
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-apple-dts-m4-dt-style-check-v1-3-3ec651d75baf@cyberchaos.dev>
References: <20260924-apple-dts-m4-dt-style-check-v1-0-3ec651d75baf@cyberchaos.dev>
In-Reply-To: <20260924-apple-dts-m4-dt-style-check-v1-0-3ec651d75baf@cyberchaos.dev>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Yureka Lilian <yureka@cyberchaos.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_062252_408485_0AD0821D 
X-CRM114-Status: UNSURE (   9.36  )
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

This fixes most `dt-check-style --mode=strict` issues related to line
length. Lines up to 82 columns are left as-is.

Signed-off-by: Yureka Lilian <yureka@cyberchaos.dev>
---
 arch/arm64/boot/dts/apple/t8132-jxxx.dtsi | 3 ++-
 arch/arm64/boot/dts/apple/t8132.dtsi      | 9 ++++++---
 2 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/apple/t8132-jxxx.dtsi b/arch/arm64/boot/dts/apple/t8132-jxxx.dtsi
index 09ab380a00e9..108c546545d5 100644
--- a/arch/arm64/boot/dts/apple/t8132-jxxx.dtsi
+++ b/arch/arm64/boot/dts/apple/t8132-jxxx.dtsi
@@ -22,7 +22,8 @@ chosen {
 		stdout-path = "serial0";
 
 		framebuffer0: framebuffer@0 {
-			compatible = "apple,simple-framebuffer", "simple-framebuffer";
+			compatible = "apple,simple-framebuffer",
+			             "simple-framebuffer";
 			reg = <0 0 0 0>; /* To be filled by loader */
 			power-domains = <&ps_disp_fe>, <&ps_dptx_phy>;
 			/* Format properties will be added by loader */
diff --git a/arch/arm64/boot/dts/apple/t8132.dtsi b/arch/arm64/boot/dts/apple/t8132.dtsi
index 350ad7b3772b..76e96846c695 100644
--- a/arch/arm64/boot/dts/apple/t8132.dtsi
+++ b/arch/arm64/boot/dts/apple/t8132.dtsi
@@ -216,7 +216,8 @@ soc: soc {
 		#size-cells = <2>;
 
 		pmgr: power-management@380700000 {
-			compatible = "apple,t8132-pmgr", "apple,t8103-pmgr", "syscon", "simple-mfd";
+			compatible = "apple,t8132-pmgr", "apple,t8103-pmgr",
+			             "syscon", "simple-mfd";
 			reg = <0x3 0x80700000 0 0x14000>;
 			#address-cells = <1>;
 			#size-cells = <1>;
@@ -234,7 +235,8 @@ aic: interrupt-controller@381000000 {
 
 			affinities {
 				e-core-pmu-affinity {
-					cpus = <&cpu_e0 &cpu_e1 &cpu_e2 &cpu_e3 &cpu_e4 &cpu_e5>;
+					cpus = <&cpu_e0 &cpu_e1 &cpu_e2
+					       &cpu_e3 &cpu_e4 &cpu_e5>;
 					apple,fiq-index = <AIC_CPU_PMU_E>;
 				};
 
@@ -269,7 +271,8 @@ pinctrl_nub: pinctrl@3881f0000 {
 		};
 
 		pmgr_mini: power-management@388280000 {
-			compatible = "apple,t8132-pmgr", "apple,t8103-pmgr", "syscon", "simple-mfd";
+			compatible = "apple,t8132-pmgr", "apple,t8103-pmgr",
+			             "syscon", "simple-mfd";
 			reg = <0x3 0x88280000 0 0x4000>;
 			#address-cells = <1>;
 			#size-cells = <1>;

-- 
2.55.0



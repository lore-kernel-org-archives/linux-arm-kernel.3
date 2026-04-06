Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B4D2E9D839
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Apr 2026 05:17:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IEpbo76BUf/rkfncOen6yTNMoRQFRYSlFdTa/66FIWU=; b=RP30DWImvk51EYCj+w58HqeAb4
	qddRmiy4NPxxCsdLN4YYykdQzv6MCY4EgqJmdlXCS+z5qiZaNLeNQ/NZ+8z73OWolbHuUK+WDMPGl
	+x09uQn124h6qYY/bUjD6nv8QTDx4ogUGcC9r2HPiLtC+uLohMOlZcIAZBRptQ83Chk63xMl9ig7x
	Ir2DH+4gyGyE0Y2z1RoabhfT5rxJ2Stz6/Cp/W42T5LpyuxH3JrD2UGJY/L676sxI3/cuLRygKTtE
	cyqkdcNJcZ4/zArIa97hap4rZLaD7Bm5N/3vo4/XvVpEbUN1SuDiyBqZLH/xDTH4uMCOA6qS0WJBP
	fMybQOOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9cKf-00000004nZh-3zMM;
	Mon, 06 Apr 2026 05:17:05 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9cKa-00000004nWp-1au9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Apr 2026 05:17:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1D72D4436D;
	Mon,  6 Apr 2026 05:16:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id ED062C2BCAF;
	Mon,  6 Apr 2026 05:16:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775452619;
	bh=xNcZFgEqDIUns0Obvn61O5XixASjDMHrcRowxJhKaoo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=AmucSSJumEnytgtzcd4GFcwyI02m9vC3fNxNCz8/P9EDJcoayNIuDCD4vLCr8RAt6
	 urLJbqcCibMLmyFQVKHGPA7PxG9bR38cU9F3p3idZ0IcIwHlAsvVDF700uWQoqv0iw
	 ku8qwnpaS5T/ReUa04Qz3B9Q/I5+NS6pLuXOmt11KxbWKOKkbcgoD9JKRwCOa52LOa
	 IYGIvSVPCV/hVoDP6CfSdGC9KwiHpx6RiJZ52bxB3uQJnsswYLkXY1HkV09GZyWjmf
	 x5DIGefUeS3sMPmp9QiTVWzu58pUM/ar+f14Zn9ax7weLFnYF+1wyGp0bGE9e03ZvK
	 nAzqazFskX5hQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBE2DE9D834;
	Mon,  6 Apr 2026 05:16:58 +0000 (UTC)
From: Alexandre Messier via B4 Relay <devnull+alex.me.ssier.org@kernel.org>
Date: Mon, 06 Apr 2026 01:16:57 -0400
Subject: [PATCH v2 1/4] ARM: dts: qcom: msm8974pro-htc-m8: add status LEDs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260406-m8-dts-additions-v2-1-c4c4bd50af48@me.ssier.org>
References: <20260406-m8-dts-additions-v2-0-c4c4bd50af48@me.ssier.org>
In-Reply-To: <20260406-m8-dts-additions-v2-0-c4c4bd50af48@me.ssier.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Luca Weiss <luca@lucaweiss.eu>, linux-arm-kernel@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Alexandre Messier <alex@me.ssier.org>, 
 Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 linux-leds@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775452618; l=1446;
 i=alex@me.ssier.org; s=20240603; h=from:subject:message-id;
 bh=3h5eC7Cp5T5BYkF0l8ntqlN3+V3NGs9ZIeqd8JvOxHw=;
 b=sT3B97jdTe8Yb/ZHQ+q1ZRpJQ68qZtgaFiRNDGqvLlpowcS/qjCejlAw3utpaVFmInN/ye8fg
 /cs7prl6aO1BxL2M2iwoqLHHdr4rAoW2JMSczMMPwKnaDx0p4WybynC
X-Developer-Key: i=alex@me.ssier.org; a=ed25519;
 pk=JjRqVfLd2XLHX2QTylKoROw346/1LOyZJX0q6cfnrKw=
X-Endpoint-Received: by B4 Relay for alex@me.ssier.org/20240603 with
 auth_id=168
X-Original-From: Alexandre Messier <alex@me.ssier.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260405_221700_503233_73BCF856 
X-CRM114-Status: GOOD (  11.16  )
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
Reply-To: alex@me.ssier.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Alexandre Messier <alex@me.ssier.org>

Add support for the notification LEDs on the HTC One M8.

Two LEDs are available, one orange and one green. Together,
they both form a single notification source, so use a
multicolor LED node to describe this arrangement.

Cc: Lee Jones <lee@kernel.org>
Cc: Pavel Machek <pavel@kernel.org>
Cc: linux-leds@vger.kernel.org
Signed-off-by: Alexandre Messier <alex@me.ssier.org>
---
 arch/arm/boot/dts/qcom/qcom-msm8974pro-htc-m8.dts | 25 +++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/arch/arm/boot/dts/qcom/qcom-msm8974pro-htc-m8.dts b/arch/arm/boot/dts/qcom/qcom-msm8974pro-htc-m8.dts
index 402372834c53..37df271dbdeb 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8974pro-htc-m8.dts
+++ b/arch/arm/boot/dts/qcom/qcom-msm8974pro-htc-m8.dts
@@ -3,6 +3,7 @@
 #include "pm8841.dtsi"
 #include "pm8941.dtsi"
 #include <dt-bindings/input/input.h>
+#include <dt-bindings/leds/common.h>
 
 / {
 	model = "HTC One (M8)";
@@ -64,6 +65,30 @@ vreg_vph_pwr: vreg-vph-pwr {
 	};
 };
 
+&pm8941_lpg {
+	qcom,power-source = <1>;
+
+	status = "okay";
+
+	multi-led {
+		color = <LED_COLOR_ID_MULTI>;
+		function = LED_FUNCTION_STATUS;
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		led@6 {
+			reg = <6>;
+			color = <LED_COLOR_ID_GREEN>;
+		};
+
+		led@7 {
+			reg = <7>;
+			color = <LED_COLOR_ID_ORANGE>;
+		};
+	};
+};
+
 &pm8941_vib {
 	status = "okay";
 };

-- 
2.53.0




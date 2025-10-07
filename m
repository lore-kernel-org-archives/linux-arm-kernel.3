Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F736CCD184
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Oct 2025 05:56:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TLGop4OK29hxKHQtTuqqD5IFVhY/hUHe9EtrddV+gOs=; b=jZgC7NUSM2gMGX+bTaIyI90MBz
	ldZMupveyjXNjT8kl3sfRoR09pp9IGob69UZf6ptpobWamfsq2Mir5BzJUcrvm7vJuq4R4JyIwExe
	2P9+t5pZkOm4bCoXACmypo9fKhIVMdg98gZ/+78DUHUZEGiSPKxMxvnGkYjtRza4whkPyfBRz9szQ
	A4WsU1OCB5r0gK2sImBBSszgRsZCS9/UKo65VMBnIbf4hkGmKZvBeDKGGayLoOkx+bqAOBPcxz7YE
	89rHJewiCSIDdBfsos6qi0UsJE9UNgQG49usjZbinWaGRLJbfdZtGXTVKEjx3o6UpR7oldEbsBBj4
	lof2IEUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v60fy-00000001JVv-3Fod;
	Tue, 07 Oct 2025 05:55:54 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v60fu-00000001JS4-1E8x
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Oct 2025 05:55:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2A42046724;
	Tue,  7 Oct 2025 05:55:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id F0A75C4CEF7;
	Tue,  7 Oct 2025 05:55:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759816549;
	bh=tMwh0QHl8Hu2JecD1WtzMDyQHfSdOnSqC0ACkO9sSko=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=ARIclD/71sg5Ya2R2lZSqueQ5161gxrLHffSgOKOuk+ULdmF6gVNxEonHOD+pg4VJ
	 sKgJ7Y0uImiIvFy/xF83ucORwPTiJxPApvHwGj86V4k1EAx0LvAI7idw2dvW8M7IVE
	 lMeV5sRW8pmqlhCIYZy1i9mLFIDMqhx7R84HBvNbgizoHaYLl73+Zt/tvCG4Ij8Cl1
	 obD4485xvLN2g6LD12ofEzpCcILovY8xHKT55p1p68XcoQ5h+nEZfRiXD5vFV6QEfN
	 CtbZhXFB4w/0jcWuoOfC3HDUcBxGaCU3kY1a/qFQAlxRGBe9BGzCdQnVYI6tugo7yh
	 CZNWnYtJEP3aw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4D16CCA470;
	Tue,  7 Oct 2025 05:55:48 +0000 (UTC)
From: Alexandre Messier via B4 Relay <devnull+alex.me.ssier.org@kernel.org>
Date: Tue, 07 Oct 2025 01:55:42 -0400
Subject: [PATCH 1/4] ARM: dts: qcom: msm8974pro-htc-m8: add status LEDs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251007-m8-dts-additions-v1-1-53d7ab3594e7@me.ssier.org>
References: <20251007-m8-dts-additions-v1-0-53d7ab3594e7@me.ssier.org>
In-Reply-To: <20251007-m8-dts-additions-v1-0-53d7ab3594e7@me.ssier.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Luca Weiss <luca@lucaweiss.eu>, linux-arm-kernel@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Alexandre Messier <alex@me.ssier.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1759816548; l=1141;
 i=alex@me.ssier.org; s=20240603; h=from:subject:message-id;
 bh=SD/8uvnSr2d+2HzDqbM9fG8xyKZ/sbIt2qlYS8ZUIlw=;
 b=ayzUpHLzZDtFDSLQFCgmQwsof3hOVov+Hc3pyvAr5CeWtT7F7NPP3fm36Bi76I5/DawD96nHd
 /0DyfTMD93KByNS4LQbX1th9EaO9m9MX76vy3QjObJkqeM86uUEFa+h
X-Developer-Key: i=alex@me.ssier.org; a=ed25519;
 pk=JjRqVfLd2XLHX2QTylKoROw346/1LOyZJX0q6cfnrKw=
X-Endpoint-Received: by B4 Relay for alex@me.ssier.org/20240603 with
 auth_id=168
X-Original-From: Alexandre Messier <alex@me.ssier.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251006_225550_362890_1C4F4800 
X-CRM114-Status: GOOD (  10.10  )
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

Two LEDs are available, one amber and one green.

Signed-off-by: Alexandre Messier <alex@me.ssier.org>
---
 arch/arm/boot/dts/qcom/qcom-msm8974pro-htc-m8.dts | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm/boot/dts/qcom/qcom-msm8974pro-htc-m8.dts b/arch/arm/boot/dts/qcom/qcom-msm8974pro-htc-m8.dts
index b896cc1ad6f7..9c3859069aba 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8974pro-htc-m8.dts
+++ b/arch/arm/boot/dts/qcom/qcom-msm8974pro-htc-m8.dts
@@ -3,6 +3,7 @@
 #include "pm8841.dtsi"
 #include "pm8941.dtsi"
 #include <dt-bindings/input/input.h>
+#include <dt-bindings/leds/common.h>
 
 / {
 	model = "HTC One (M8)";
@@ -64,6 +65,24 @@ vreg_vph_pwr: vreg-vph-pwr {
 	};
 };
 
+&pm8941_lpg {
+	qcom,power-source = <1>;
+
+	status = "okay";
+
+	led@6 {
+		reg = <6>;
+		color = <LED_COLOR_ID_GREEN>;
+		function = LED_FUNCTION_STATUS;
+	};
+
+	led@7 {
+		reg = <7>;
+		color = <LED_COLOR_ID_AMBER>;
+		function = LED_FUNCTION_STATUS;
+	};
+};
+
 &pm8941_vib {
 	status = "okay";
 };

-- 
2.51.0




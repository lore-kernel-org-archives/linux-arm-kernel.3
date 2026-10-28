Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9484E60A2637
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Oct 2026 16:06:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=y7NtLhbI;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=OLkBDKp4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=wXXJVVE7DxQ4okK75gXR5XkOT+hE06hRlYWzlQtBB0Y=; b=y7NtLhbIrS8Tk2
	4vUszzeFs2GOlKQbyNHfPNqmt/IhCydZUdjseA3zyObL3FpAAVizvaBTFjqqL+U+11n2tGYY9PeqC
	qJ0WcXmgLdFnisM/Coh1jWCCSta84potoys5k2P7Mj0umMZTPRkxkeMtdnWLvx+iMeNa40T/jp0SU
	DBS5oEX+0LBJqau7UsvcTgf5bMeSpX22HYtZ8bbMBCLUQD3K+D6OZQQ+8ql5MGmU/Nr0Njid+8F6p
	eTOrA5il9kyVeCUidjH0/iL0ro3mB5iMZpiOryUPfajwarLw24noBb7G6SM/OC3iitylfNXpyEUFQ
	sX5HUlSE/y1qcl9CDFkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM6Aj-00000007UW4-236Z;
	Wed, 28 Oct 2026 16:06:41 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM6Aa-00000007UOk-1a0s
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Oct 2026 16:06:34 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4a2167bd087so11749305e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 28 Oct 2026 09:06:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793203591; x=1793808391; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wXXJVVE7DxQ4okK75gXR5XkOT+hE06hRlYWzlQtBB0Y=;
        b=OLkBDKp4MFG+0RvhRdWV2jaxqaRneU5oevX7wqe25VA5VAvAdjMsdT5pyKKYepF8nR
         4BccTXUpHMxynhJA/NJ42jVYftv6WLTO9FVjsHgDaFO1CiH2BfMt4olzvePBz2Hdo2Pr
         7UkpWpZG8z2x35Uftr29p8vaMIZWGOkgLo2qj5HozZ6T6FNQWrdjnPHI84BFw0lM6mnR
         VFmz4GwNxexUO8PDxKjufOUKJmHKvdnQ6cQoMsSM2WKKn5y9rebxPO+lrp9BEgLA7Kjj
         BHkJZbEUPMPptsY+EQq6e+DRW45sM3yXX2BZ68IAJGwKBiM47/NgaU0ZE23UGBSv5H9x
         kcBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793203591; x=1793808391;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wXXJVVE7DxQ4okK75gXR5XkOT+hE06hRlYWzlQtBB0Y=;
        b=fGkrJIjFT9GqDx92laoAAabdrfL0Kw5/StennQUHr13Vigddglp2gkb9EOcVSD3vab
         5orPqSBqb364u8dYpi2hVF5G9Oao41b6RwehPNI8+gbi8Jx0BwmfqgVqDjyKrtOkHiSn
         VTPqorvWPIrmPM7vzn5/vBTLBAM35bRBECbzFMCmPY0MoghOCqw7B7DMiYBOCGHxs5Mo
         3RrFzB7AuMf0nW3UStdP4aer/KpjiLZpjuW0c2Go4Oe2bBCo4sYLxUvy0Ngj31ssAQXN
         YpYXaCemuIU8+mp6t56WZ0wmkqW4W22AX0UpK+vuFxwBZGqURaeqq4ZFo4Lyj76m6QKv
         WFqw==
X-Forwarded-Encrypted: i=1; AKwUvBxLFzdnqphGdpZVKawQpqNeUCOtZm/8DVAShUzDnk6Xmjz7oFhYjD1eyyT3+dDrZZ157CWrg3tdWJ0AI15R/H9a@lists.infradead.org
X-Gm-Message-State: AFq9FYJjtI2xZrPO51UMU1jgDgLxMW32wykUy4KUT5ugMbrqTdyJmluy
	WHNW+ys9FG6VArURzZVzlrotPk+Sc/jlQiH/2nAPpMyY9n1/7H7mnPjEY4eoDHrQ4dc=
X-Gm-Gg: AYBFou3THj0MlQKvrdOF1E/tThEPtGLHJc+oxQB0oTJMIgZc36tIKzAUuLFX8MYdiHV
	I64scwvbFdFMn5aSnLxC2SiNl0Pr2YIvTK5bIPuGnJc/HbwgfivbDlYPVJecuusf436XC7zJfAW
	8H8D8Z+B/rtXeEiYBMTJuJgMAjml1qL22wl4wV/YIQOr79ZEWneoA1dImdciaR2AoQ0LPAqW/cK
	gpM5G26agrVkmBUvrxQ40tnCd6u3VRLMTIbwja1f5auKm33FlrN76bV94Mk0SVeUQpmU0pKPMiT
	jk6z3J9noiXIBwPh/HSAfofFYJnuW6ykBPUkad3ULenoCKvZFcM1gsBRY4wp+IyBJCSlZxTpoH7
	xxK6KDWy9oRcsYx1enoEcDhCh772xL0mTdC6S6tw3b55Uy4n0Tbq4bWxSKycUX11zNt81b1vrAk
	UPSUbnokzu/Pt+8t0hjeluD1jBJcYVfM1Zl+FoeYc5AFmvOxLoKGoGhAbY5WgqI3+CAYxKXp8FH
	nPzv/uyGxXe63ZjoDjlvmljMDTLUq3yG33XFzYVRj24ysXl2zc0oVFNIMz0fbfObuhvhJhBLYDm
	jlihOLdY6pN0SIvx1VtHPUgM8WiqXYuCHHo6twOW226q9bexDjpqfjA/pjo35AwPZK9PP5hAX1A
	VwRYuOgc0Edo/KkgSK15ZYCzX2Q==
X-Received: by 2002:a05:600c:1f87:b0:4a5:1cf1:b7bd with SMTP id 5b1f17b1804b1-4a966a563ebmr60980175e9.16.1793203590626;
        Wed, 28 Oct 2026 09:06:30 -0700 (PDT)
Received: from z13-ek5.local ([151.40.161.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa81a896ecsm1625875e9.9.2026.10.28.09.06.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 09:06:30 -0700 (PDT)
From: Ettore Chimenti <ettore.chimenti@linaro.org>
Date: Wed, 28 Oct 2026 17:06:07 +0100
Subject: [PATCH v2 6/9] ARM: dts: omap: dm816x: Update USB node
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261028-patch-ektor5-dm8168-dts-v2-6-4544429251e2@linaro.org>
References: <20261028-patch-ektor5-dm8168-dts-v2-0-4544429251e2@linaro.org>
In-Reply-To: <20261028-patch-ektor5-dm8168-dts-v2-0-4544429251e2@linaro.org>
To: Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
 Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Christopher Obbard <chris.obbard@oss.qualcomm.com>, 
 Andrew Goodbody <andrew.goodbody@linaro.org>, 
 Paul Walmsley <paul@pwsan.com>, Russell King <linux@armlinux.org.uk>, 
 Rouven Czerwinski <rouven.czerwinski@linaro.org>
Cc: linux-omap@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Ettore Chimenti <ettore.chimenti@linaro.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793203582; l=2910;
 i=ettore.chimenti@linaro.org; s=20261014; h=from:subject:message-id;
 bh=slycG2bg5gDe3DFzSfzkYLyssn6vrxkDhJMrxvxkKfw=;
 b=CAn3Pa2ZHnYtIwdjo6NSmPuazofF42Njlg4liHLqzDNdRICH3wGD2TnpAM+QNrywnOh9XkpyP
 YVhwhSGAVfEDcW7aKsQtTiqLmkDtN1AhmfNWnU1CKy0guzhJ8JEi11x
X-Developer-Key: i=ettore.chimenti@linaro.org; a=ed25519;
 pk=wCaUblFVaqhuBTQt/hAtysafsAaEsqj/yOD9SPlz6NM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_090632_487020_B2E780FA 
X-CRM114-Status: GOOD (  13.45  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Andrew Goodbody <andrew.goodbody@linaro.org>

USB node was not working correctly with DMA enabled as the supporting
code had been updated without updating this SoC's device tree. Bring the
device tree more up to date so that it works with DMA enabled.

Signed-off-by: Andrew Goodbody <andrew.goodbody@linaro.org>
Signed-off-by: Ettore Chimenti <ettore.chimenti@linaro.org>
---
 arch/arm/boot/dts/ti/omap/dm816x.dtsi | 45 +++++++++++++++++++++--------------
 1 file changed, 27 insertions(+), 18 deletions(-)

diff --git a/arch/arm/boot/dts/ti/omap/dm816x.dtsi b/arch/arm/boot/dts/ti/omap/dm816x.dtsi
index e3d49651b44e..b839ee29e9eb 100644
--- a/arch/arm/boot/dts/ti/omap/dm816x.dtsi
+++ b/arch/arm/boot/dts/ti/omap/dm816x.dtsi
@@ -574,19 +574,28 @@ uart3: serial@48024000 {
 		};
 
 		/* NOTE: USB needs a transceiver driver for phys to work */
-		usb: usb_otg_hs@47401000 {
-			compatible = "ti,am33xx-usb";
-			reg = <0x47401000 0x400000>;
-			ranges;
+		usb: target-module@47400000 {
+			compatible = "ti,sysc-omap4", "ti,sysc";
+			ti,hwmods = "usb_otg_hs";
+			reg = <0x47400000 0x4>,
+			      <0x47400010 0x4>;
+			reg-names = "rev", "sysc";
+			ti,sysc-mask = <SYSC_OMAP4_SOFTRESET>;
+			ti,sysc-midle = <SYSC_IDLE_FORCE>,
+					<SYSC_IDLE_SMART>;
+			ti,sysc-sidle = <SYSC_IDLE_SMART>;
+			ti,sysc-delay-us = <2>;
+			clocks = <&default_clkctrl DM816_USB_OTG_HS_CLKCTRL 0>;
+			clock-names = "fck";
 			#address-cells = <1>;
 			#size-cells = <1>;
-			ti,hwmods = "usb_otg_hs";
+			ranges = <0x0 0x47400000 0x8000>;
 
-			usb0: usb@47401000 {
+			usb0: usb@1000 {
 				compatible = "ti,musb-dm816";
-				reg = <0x47401400 0x400
-				       0x47401000 0x200>;
-				reg-names = "mc", "control";
+				reg = <0x1000 0x200>,
+				      <0x1400 0x400>;
+				reg-names = "control", "mc";
 				interrupts = <18>;
 				interrupt-names = "mc";
 				dr_mode = "host";
@@ -622,11 +631,11 @@ &cppi41dma 11 1 &cppi41dma 12 1
 					"tx14", "tx15";
 			};
 
-			usb1: usb@47401800 {
+			usb1: usb@1800 {
 				compatible = "ti,musb-dm816";
-				reg = <0x47401c00 0x400
-				       0x47401800 0x200>;
-				reg-names = "mc", "control";
+				reg = <0x1800 0x200>,
+				      <0x1c00 0x400>;
+				reg-names = "control", "mc";
 				interrupts = <19>;
 				interrupt-names = "mc";
 				dr_mode = "host";
@@ -662,12 +671,12 @@ &cppi41dma 26 1 &cppi41dma 27 1
 					"tx14", "tx15";
 			};
 
-			cppi41dma: dma-controller@47402000 {
+			cppi41dma: dma-controller@2000 {
 				compatible = "ti,am3359-cppi41";
-				reg = <0x47400000 0x1000>,
-				      <0x47402000 0x1000>,
-				      <0x47403000 0x1000>,
-				      <0x47404000 0x4000>;
+				reg =  <0x0000 0x1000>,
+				       <0x2000 0x1000>,
+				       <0x3000 0x1000>,
+				       <0x4000 0x4000>;
 				reg-names = "glue", "controller", "scheduler", "queuemgr";
 				interrupts = <17>;
 				interrupt-names = "glue";

-- 
2.56.0



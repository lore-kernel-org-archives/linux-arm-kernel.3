Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B678606A334
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 22:46:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=VwsbkR3G;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hyA3GuhO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=0g1OT4dACORpc1EFN+wgx+XwdWT726Bj1M4N83rR7xA=; b=VwsbkR3Go88wVH
	1CpLDErWVWWyLQkVyUf4lsFMd8u6+p2T0qhRP6WocYwhd/eqo5Ki9n6wzthlGeROsV9AE9l3/2hPz
	shs5unKwJT3G+7gYomWLgBLDtG+GxuCV2kRPzbp8p3myq4TzCzIzlnzdgde4AObgzojtgo0kd0Y9x
	kOpa77gr/AE8KL6SxPOGP0pxN1YPIBiGs5nwsSrPqdEP4Q7vRL1vBzdK8ERzEc33qTvAKlied+Zps
	wS2d9fZWYGDze4hwZP6GjZkzQ71h/2I0w9odD6vGioE+LfkmVRbAObaVJC0W6LXc37p/86GyYENwp
	QiMNsnoicNivvxCsFJwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOMEx-00000003jcE-0fIP;
	Tue, 03 Nov 2026 21:40:23 +0000
Received: from mail-ot1-x331.google.com ([2607:f8b0:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOMEo-00000003jST-2X4I
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 21:40:15 +0000
Received: by mail-ot1-x331.google.com with SMTP id 46e09a7af769-85ac281604dso20071a34.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Nov 2026 13:40:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793742013; x=1794346813; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0g1OT4dACORpc1EFN+wgx+XwdWT726Bj1M4N83rR7xA=;
        b=hyA3GuhObGUEK+uLCc5jW7dcL74aTRku1xa4EQzGdaY89Sku23CkO9VZCWeot6+FxR
         Oatty/rEst9F+3kktMlo8tSseIDNWerDHEyS4K/AFcLz8svvvUj+bDJnAYQXk2Y+JTeR
         O1hD63JGCsKyztHseC3ULkMDRm+068qcmZLsLAPklkvIwhLtPO9UQgNTPVYRUXDVflrz
         g3/fFVZY/8uHPOKEXIMG+akqW8PIe8YBteoy2x/E4HnaEc2F9fk28c5Q7uEp35EM9jae
         uaDcNwYnePB2gOtLunIN2buFKTtsLxF2Yx0eXf/JxaAqB731GYgSHlA8yHy0f6LDRgr7
         iSZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793742013; x=1794346813;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0g1OT4dACORpc1EFN+wgx+XwdWT726Bj1M4N83rR7xA=;
        b=nmzadJE0qL+4DES9QDf/t7QF3vBjB08SwrrTxjdbwDAW0OPXxIN3f4FgW6tAi1J8rc
         iHRFiNegglXhm6I2ZpENfBgCu9kOK3Q0gAf2boZyn1br4yrDd+F2p/gpuFjjwo2lRVQp
         Cg7yxl3nLQWZPthmIDPr2g+5LwpsoBGsZ3XUrBp6eTYezez1jZP133DN31GXO1yymR99
         BYu2NVJL5BfFKFPc0TgXXDF+kEBQNwFzatRuMNfylae+0hvTFK6tE393JnIMMKEOkjmR
         KBBJOd7GKr9btIPTu4EYV0AufzOTKK58gjJFWtufZomk2R2PA/Qb/MIYtPGM/ON/zqTm
         D6nA==
X-Forwarded-Encrypted: i=1; AKwUvBzbMLjaDtCvrNnkdrRf1DiS/dECjsMN+dGsPufL8sJQes0CmZWNDBLaK43oCADfu+7JN21Hw5rsQzJGxrYfL+UU@lists.infradead.org
X-Gm-Message-State: APuU4Z8R01pNWD8VJnvfnt+IrwZ2JSDLdQvrSJvHls76QAAGl4LpkZH/
	tfw8stpewR2uUdUwHzvlcHV4r3IQc90aYxbOBAX6hFH51NOLBJWonfjnD0OPeZTg
X-Gm-Gg: AYBFou0NjDbDgBIpKgHuV979gSmtVH4UP/E2Vr9Qy/AirLF0kNeHnzQetkRamJXjOqB
	hhLkr9jGYcgKG8nIerVZQ+r1Oz89NlI7Er04PmNhncfMYOoZQlS0mzrN2AS760veSen9vZOSUQp
	AiuXR5tQJYxOAIPQOKISpvXMv4tz+bDxK5T/dq1AeIQU2qYe5s9n0xkaFB2t5zOZ7E2PxXvsXYG
	BbPmxionZ9KNZDMYxNYS0saM1AWLdXtmbZJi9t5cs07710etZuK20Hzc66nR5mgpaTsWwXuqAok
	jeZXZLj7gGpMU0Gk9mDi13Fg4dmU5W71XDxbebtTa0w/iHJZfm2Y3ZVvfZOsoqKWxTo+dDyPp1B
	s6V8edSEvQ4Z3h4e+HEGaBEDF8O7Yl5FYEzevqam1y5XJ0ofmNTrpZRer2zzuyrVyyJdhj9YNMJ
	0x8nIvruAKmszrJ/8QllwtHzqciK4bEqnHbe4GUFvj3aKCxRqeOhbcY+cChrmNaXJ0pJzZS/IVI
	7J2XQjYte82Er6Bru5IwjctGrlHXtzJxj7yfgq/o1h2mqptqhvJUfMk+BO1RGjP9cGQx7m1CDTx
	zuHle9jl6+xFXrLMH+QsctQ4dMOsCFpx2f2Oq7bFd2bkeEdEVfnbiVI8eEmB6TV07Fx1kWMBND7
	sZRAJWrJXacAFEp5KbpeUNX4qZC9ZX2SyhKfinLgjvRjrEHw+IyJaj5s4TPSZe5sjZd/2vJ8AhM
	vwHwH1UTmUdbCR7yJ+CvF3HvxZShQrMOmH10ZK+bTd56pm3QJ3Hl0Z
X-Received: by 2002:a05:6808:6f87:b0:55c:859:adc with SMTP id 5614622812f47-5640def4593mr9802652b6e.55.1793742013486;
        Tue, 03 Nov 2026 13:40:13 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-567a9f9115csm27060b6e.11.2026.11.03.13.40.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 13:40:13 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 03 Nov 2026 14:40:01 -0700
Subject: [PATCH v7 08/12] arm64: dts: allwinner: h616: describe the UART
 integration
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261103-submit-h616-uart-fifo-v1-v7-8-c9e248d685c1@gmail.com>
References: <20261103-submit-h616-uart-fifo-v1-v7-0-c9e248d685c1@gmail.com>
In-Reply-To: <20261103-submit-h616-uart-fifo-v1-v7-0-c9e248d685c1@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_134014_662754_29727A17 
X-CRM114-Status: GOOD (  10.41  )
X-Spam-Score: -1.9 (-)
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Identify the H616 UART integration on each of the six controllers. The
specific compatible selects its fixed FIFO depth and integration-specific
register setup. The driver uses that depth to derive the shared DesignWare
receive thresholds.

Retain snps,dw-apb-uart as the generic fallback. H618 includes this DTSI
and uses the same UART integration.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
index c6b3a3f8359a..b4b2f85726e0 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
@@ -550,7 +550,7 @@ mmc2: mmc@4022000 {
 		};
 
 		uart0: serial@5000000 {
-			compatible = "snps,dw-apb-uart";
+			compatible = "allwinner,sun50i-h616-uart", "snps,dw-apb-uart";
 			reg = <0x05000000 0x400>;
 			interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>;
 			reg-shift = <2>;
@@ -563,7 +563,7 @@ uart0: serial@5000000 {
 		};
 
 		uart1: serial@5000400 {
-			compatible = "snps,dw-apb-uart";
+			compatible = "allwinner,sun50i-h616-uart", "snps,dw-apb-uart";
 			reg = <0x05000400 0x400>;
 			interrupts = <GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>;
 			reg-shift = <2>;
@@ -576,7 +576,7 @@ uart1: serial@5000400 {
 		};
 
 		uart2: serial@5000800 {
-			compatible = "snps,dw-apb-uart";
+			compatible = "allwinner,sun50i-h616-uart", "snps,dw-apb-uart";
 			reg = <0x05000800 0x400>;
 			interrupts = <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>;
 			reg-shift = <2>;
@@ -589,7 +589,7 @@ uart2: serial@5000800 {
 		};
 
 		uart3: serial@5000c00 {
-			compatible = "snps,dw-apb-uart";
+			compatible = "allwinner,sun50i-h616-uart", "snps,dw-apb-uart";
 			reg = <0x05000c00 0x400>;
 			interrupts = <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>;
 			reg-shift = <2>;
@@ -602,7 +602,7 @@ uart3: serial@5000c00 {
 		};
 
 		uart4: serial@5001000 {
-			compatible = "snps,dw-apb-uart";
+			compatible = "allwinner,sun50i-h616-uart", "snps,dw-apb-uart";
 			reg = <0x05001000 0x400>;
 			interrupts = <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>;
 			reg-shift = <2>;
@@ -615,7 +615,7 @@ uart4: serial@5001000 {
 		};
 
 		uart5: serial@5001400 {
-			compatible = "snps,dw-apb-uart";
+			compatible = "allwinner,sun50i-h616-uart", "snps,dw-apb-uart";
 			reg = <0x05001400 0x400>;
 			interrupts = <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>;
 			reg-shift = <2>;

-- 
2.53.0



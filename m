Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3096460850A5
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 19:55:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=GTs1dYGg;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=N0kWoMSE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=DRBWX4J/Ak94TbpMM7HoAnpLEmSCyB3p+1+fdXZAg3w=; b=GTs1dYGgILz8J+
	RBx/vIhBqVKhOCTZi2qQBfrzTgu6SrCpVseHI55R6cOhETvWN/fMMNXx/fA2XUYce2pnVN9NetacC
	ItYoSK9ZP10FLSfNlk1euHGxSl+3AdqU99vQc64Fn0ElsdbIXeT0W5Vih8C9PS1V1JGjY2+NY+clb
	HOX5ee/MiVsytp1qdeUMqX+k3XLyAcQ7Wfc2rVYUsJEkf5RqN8QsVNffEQIGJFWu5v3PmBtkFX29s
	Zq4SjPPzuEW8UQro/53TE7ba0inLbysfzqKJ40Yb4g/YcZ8SpUFs9dlWdLcVGT3kwcxBBveDn4Jsu
	XA9CSdHna68nTdrHM/jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNy7y-00000000EMB-0CHg;
	Mon, 02 Nov 2026 19:55:34 +0000
Received: from mail-oa1-x32.google.com ([2001:4860:4864:20::32])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNy7v-00000000EIC-0eBa
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 19:55:32 +0000
Received: by mail-oa1-x32.google.com with SMTP id 586e51a60fabf-49de8ea072cso1537389fac.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 11:55:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793649330; x=1794254130; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DRBWX4J/Ak94TbpMM7HoAnpLEmSCyB3p+1+fdXZAg3w=;
        b=N0kWoMSEuorfg3qhTMm+vP0RNvmtHFiYDUPl+AAc1+lA+cwB1kG8BLA2mMsAsVfJlx
         71xGlJP/3TUOkZYbzvBWKKJQkpnLJE/8Mrwrf9CE1cmW+ZxP/sUfKdDVRCrOavrZyM6N
         rwwAziTvWyHV1XF0gaLNwNPRZ8PH87mIqGTV0rGg6xlFgEXcOhmIwdUVJOcJ7VL3Mwpk
         OO+WQKPdFeNrF/Ruga7qSpCTyjNnRU57ZhIH6SQubeWefxEUcGoRIsVhbocpuSngvw85
         oRTwSSWcWtWzo0fUEr231BF0jrLGB7wpLxmRjias1Anl0vn2DEKVwdKrzgzb3qOYfjW6
         x+9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793649330; x=1794254130;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DRBWX4J/Ak94TbpMM7HoAnpLEmSCyB3p+1+fdXZAg3w=;
        b=qapRBiEAcx0moLPo8QZulqfNfetrWH20ZbjGalW3TSMxxbiLrMtn+clxDdYLEHz0OQ
         Avw5i/DpWNvVo3x6+Sm/WfByzPhk3xVImjg55Fw5RnE8sPEautHypJ1awJ/njSKikq3H
         ji/5u0vEQUY6mVIefUfNiaxKoXcsqdXe8vhSV7M3GoLAsEnql9LdQoqZjazYFm+n2/Ft
         abpa++o2ZLoU2uJCbYtZL4HWLgqvbZMIK98FwZq8pGXgprN1fZbqJT7ds6wSsEqEw9fh
         AVdMIvggRJRMMN27Ya+DKKrciyv6a6SQ7tzCyVxC16/ov5Jbw9UP+c6W5z8Cucy5igo5
         SLOw==
X-Forwarded-Encrypted: i=1; AKwUvByfTbjOts1mSwjZgYC3q6YMV0kiqfSSdoyU3mjwIDDCT0UHD8CW8EIZ8+qtiBPjb0guGM3deSbU2d5lbZdF046Y@lists.infradead.org
X-Gm-Message-State: APuU4Z+DepO/2LsDec/cAni4tqyxuE6MGqKI0OjCEec5ZLelRFbK5Kp7
	SL1QLW1llbdLbjLpJGxVrMgKsEb5BJzesc4NL8IVDu5yGrWt1+pAJrGw
X-Gm-Gg: AYBFou3trCuxLrf8Q+AiIvCH8iLlmOeefRuKPzFSECC1Z2L8/c3lriW14iBEJV9X6VH
	SLGeWixDvPI3ObB4DD3RqOo0AOCD7YxhWEN/CzLChlxcbr6fQfHvUpkVe+MHrDG5EZzz89UuSiy
	D9vpx40PgZzDfxgkl5vWOSDUamKHFCTdEv9//OO04KNmym506T4pnrqTE6hYXDklgoxHKSw5I1k
	upPhM/MiRDSmG4PUEBzbzdNOgzN3Yj4orm49cX2g4gor6vCd/E9WJ4nyO9dN13XK6UIKaoFZinE
	SZYPTNFaPBBWsTy8RUxd/9Ui2RehJx3pRSWHVdisswG5yy//w/sQbtW4scTMMAfm45C/vs2I72D
	Jrko2GnkDHIzz51j/HueYvDrYVgstBQDRDCGWQDHASq1fMshcsAd1vx2i4pl7f+qsUu7jjR/rbR
	N32mpjW+yXpWuZS7gLV17EuRzVgQmHUAKhLMhqgvuBqJi2/dffS9ctuCFLrYKl7TxTm0np+NxFH
	D+WZz4FmYJZ30yHXsU51KEnHR+F4mOQEDuDjbE4eohhPZ30KITJJcDIuEd6IDF8UpmdkDhiV1wP
	cAFeqS9O9zQYc3PwoFYoR/QHN0z/79qjMG1ZJnqzeD6u00UZAaiN40w4jlTemBUFuGeMbeGqz+u
	9QT7oxVQJ/p8aaOAd+Lq6wtyQtkJe+dQ7OLzXjamArG6kpDR5LWmdjPPd3ZQQV1rghvHW9adgF+
	CI3D4ySSy1DuhAYFNvDjytwz61yjjQZpnP4ZPrQojdAhTIlKOdEBCtwzC6jG8FloLTRGOMGkPG
X-Received: by 2002:a05:6870:3d86:b0:4a7:4cd1:6f37 with SMTP id 586e51a60fabf-4a90764ba69mr6695598fac.19.1793649330169;
        Mon, 02 Nov 2026 11:55:30 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a921353dcfsm7809249fac.0.2026.11.02.11.55.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 11:55:29 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 02 Nov 2026 12:55:20 -0700
Subject: [PATCH v6 5/8] arm64: dts: allwinner: h616: describe the UART
 integration
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261102-submit-h616-uart-fifo-v1-v6-5-25afcb346b0c@gmail.com>
References: <20261102-submit-h616-uart-fifo-v1-v6-0-25afcb346b0c@gmail.com>
In-Reply-To: <20261102-submit-h616-uart-fifo-v1-v6-0-25afcb346b0c@gmail.com>
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
X-CRM114-CacheID: sfid-20261102_115531_209148_6A88182B 
X-CRM114-Status: GOOD (  11.51  )
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
specific compatible describes the fixed FIFO capacity, register layout
and receive-trigger mapping.

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



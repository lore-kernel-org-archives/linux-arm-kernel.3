Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06079606A332
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Oct 2026 07:34:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=AA/1jdGg;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Pt72G1RK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=hMLYY/97Uq9CVtG7QdmP7izisduGXF/upTM7pDvQJmw=; b=AA/1jdGg3xRjW2
	CHlQ1xvi0SAIKfWJBYkoNXgr3sc+Vf/x0vhjktXWrHPW1iJ338KuYXFxfdJBUhP0gImMeMgOuvKPX
	etK7v64HIv/OtUwqFG+CcxXISw4l2iMirqWNchxoqf3WfeWK+2/fKonzuM1v3p+Turzy9/rerX7/t
	xpWSalEwlhhO8jSkDcnIcNVK/VcknkWPZPwhG7bailP0dyJdMH90YlzTjmQxKH+DZp1hZfX8l5J+9
	xAkD0qEIAGUqax1vba/AbqW7/VZ/jttN97i5XI6h8NElKEcEUwC5D7+kYNAcNc8kGWQK1s1igXoek
	Xt3AgeM5Y1+KvAeTmBQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK9n6-0000000Flqg-00k2;
	Fri, 23 Oct 2026 07:34:16 +0000
Received: from mail-oi1-x22a.google.com ([2607:f8b0:4864:20::22a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK9mt-0000000FlgV-1AQP
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Oct 2026 07:34:06 +0000
Received: by mail-oi1-x22a.google.com with SMTP id 5614622812f47-4f14642adb4so312346b6e.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Oct 2026 00:34:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792740842; x=1793345642; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hMLYY/97Uq9CVtG7QdmP7izisduGXF/upTM7pDvQJmw=;
        b=Pt72G1RKr+M9toGLrLlzDKgtdnklF1HI+LeYbuIdHk+AWL9RsIxumnoP6Dth0ba2ff
         OOANfLwCA6HpYUKHOPL9SBCWYJTBLk5LGm8sCHxgkhll5fi8dr4J3gvIvz41bonViSGt
         BdSl2rwoAJd2/sja21Yncpx93t7Uafl18aBnlVi1R3z94JYTJZDEkL7WnPwXm5+M0OyF
         UKnLrd/BYV1Yagjh9cv+FDK9XfDXTk7Km7Tgunu1PPu2+/zgnAOBd8E7p9TrvfPNfE/A
         PjSdE3XieZNVV2QdpWYt598HMqesaoRO78MsHNplRJQmEFlAChJI1jLv7nQlgaCeG7cg
         ZvHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792740842; x=1793345642;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hMLYY/97Uq9CVtG7QdmP7izisduGXF/upTM7pDvQJmw=;
        b=n5U+qPVY5FpDHmzyczdpCZrhFacAspsfbsLFuTaO88yVumtZyfoyqYY2nHHztXa1Fc
         dozp4LdgoruL0JKvGsfUNgj6n0KTGawJSZxLBCVmhPOojElLWqPdFAFSwByvTRv2Qg6w
         pvfFRUZuQunVQMNcgiKdPS3EX+wSAUjDYJCjm/LoxvI4r6kDpRqlwxvuYJYWmnSw3jt6
         lP6qRFwz2yLxsz7/7rAYd5+0gUsjbLAs4jUu3FrCqsTbn2RkWDcOOl2///WD1XSimIH6
         bH+ybWC3+RLW/Pp13YU08X72TX5lLcg1Bs19XAJb5TiFK1a6Yq96Y2hOgMpBuMkLttpq
         qb+Q==
X-Forwarded-Encrypted: i=1; AKwUvBxzpI/FcjYRBxD5FAmaVKXXMwWAX11sXL2t+TzCK4Io8Iy4WkeYMYcVL4AfJM23SbSNqsv5FueN4s/nVEH0L4cu@lists.infradead.org
X-Gm-Message-State: AFq9FYKBHKpO5DvVSJRANd77qVCE86VHA/NrOvXxcz3fcSvPGzpZ0kMr
	1BS3BA7TkiY3osmKO6ru/Y4egSbI+qoRl1YnXmj75DiCGLA5toOSj+nv
X-Gm-Gg: AYBFou1UCmPSn5M7Cvfn5Ou1MTJ/1w2EJ5xYBqR/eJIC6XieiBvVJnfJxZ1mAVuxUqw
	UfygUpMRGzQmGRqAqVXXhQ8+zzQcJJpc4iSrNg9wqDOSoRhZqeslImHpW1OUbSbGriPS0F4cs2v
	MLxZPHEiJW/SHb/kWxBnuNC79ayfWnF1vyZgTEF7CmduCArpIT5eWUqE19equLm8KuJ/tdNr+T1
	3njsDmsOfzEN38ElR2P4vdJULTNSYSje8MlSEJzipSxZt85KVKhOgyjnODAMPEAflqX0cReX9Yv
	1JU2YPJBM/rfbC6m2aiodAAfmNvcf4OW3oUrkbdYSJ1PEQpnEmGzH53EesMYJgWUANcywZcqhes
	LTp+UwIBWpO5AZzPE/49DR1MZPOQakcMv7BfiQULN5EPs8kzuf3S0DBQ5/Kd6Jz/qH5I5l+jFAo
	lA43RDgGtW5ZzkNFzr6HogX9EZAnbTd8UiM7P6N/J8aOFviHHnAdeSHF03V1P3nYm2uXP43vSfP
	y740l6ff3cyEGeadiO7SESNG+B9WxKCGPNplPEBFP7ULqdZIxmc9DwXMA6am/dak3kXPxlmmJEo
	1a1RkiKvCAgy3UsVIe+uooRxFteYCDvbeCxvSNRGAcccgYcIVTtq2maFWLoGKOFRmSI9lKlM1T8
	mgLHhE7sdhGNPyuRk/eRYbspF2YJyG6TQEAu61HR7i3sCrdE4yhhA9QRXRMKdQT2HmEz2y81rMr
	gWl90=
X-Received: by 2002:a05:6808:5092:b0:4e8:3707:d4cf with SMTP id 5614622812f47-55be7a45f4cmr859576b6e.0.1792740842142;
        Fri, 23 Oct 2026 00:34:02 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-55be9880a99sm909562b6e.14.2026.10.23.00.34.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 00:34:01 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 23 Oct 2026 01:33:51 -0600
Subject: [PATCH 3/3] arm64: dts: allwinner: h616: identify the UART
 integration
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261023-submit-h616-uart-fifo-v1-v1-3-e4a3bae2eba8@gmail.com>
References: <20261023-submit-h616-uart-fifo-v1-v1-0-e4a3bae2eba8@gmail.com>
In-Reply-To: <20261023-submit-h616-uart-fifo-v1-v1-0-e4a3bae2eba8@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_003403_384704_0FEA27A1 
X-CRM114-Status: GOOD (  10.02  )
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

Use the H616 UART compatible for all six controllers so the driver can
select their fixed 256-byte FIFO configuration and register layout.
Retain the generic DesignWare compatible as a fallback for older kernels.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
index 1598e86259ab..6905c9eaa249 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
@@ -538,7 +538,7 @@ mmc2: mmc@4022000 {
 		};
 
 		uart0: serial@5000000 {
-			compatible = "snps,dw-apb-uart";
+			compatible = "allwinner,sun50i-h616-uart", "snps,dw-apb-uart";
 			reg = <0x05000000 0x400>;
 			interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>;
 			reg-shift = <2>;
@@ -551,7 +551,7 @@ uart0: serial@5000000 {
 		};
 
 		uart1: serial@5000400 {
-			compatible = "snps,dw-apb-uart";
+			compatible = "allwinner,sun50i-h616-uart", "snps,dw-apb-uart";
 			reg = <0x05000400 0x400>;
 			interrupts = <GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>;
 			reg-shift = <2>;
@@ -564,7 +564,7 @@ uart1: serial@5000400 {
 		};
 
 		uart2: serial@5000800 {
-			compatible = "snps,dw-apb-uart";
+			compatible = "allwinner,sun50i-h616-uart", "snps,dw-apb-uart";
 			reg = <0x05000800 0x400>;
 			interrupts = <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>;
 			reg-shift = <2>;
@@ -577,7 +577,7 @@ uart2: serial@5000800 {
 		};
 
 		uart3: serial@5000c00 {
-			compatible = "snps,dw-apb-uart";
+			compatible = "allwinner,sun50i-h616-uart", "snps,dw-apb-uart";
 			reg = <0x05000c00 0x400>;
 			interrupts = <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>;
 			reg-shift = <2>;
@@ -590,7 +590,7 @@ uart3: serial@5000c00 {
 		};
 
 		uart4: serial@5001000 {
-			compatible = "snps,dw-apb-uart";
+			compatible = "allwinner,sun50i-h616-uart", "snps,dw-apb-uart";
 			reg = <0x05001000 0x400>;
 			interrupts = <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>;
 			reg-shift = <2>;
@@ -603,7 +603,7 @@ uart4: serial@5001000 {
 		};
 
 		uart5: serial@5001400 {
-			compatible = "snps,dw-apb-uart";
+			compatible = "allwinner,sun50i-h616-uart", "snps,dw-apb-uart";
 			reg = <0x05001400 0x400>;
 			interrupts = <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>;
 			reg-shift = <2>;

-- 
2.53.0



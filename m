Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16DD1606A31F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Oct 2026 23:06:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=EiY3Slgf;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zyHH2PGR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=DRBWX4J/Ak94TbpMM7HoAnpLEmSCyB3p+1+fdXZAg3w=; b=EiY3SlgffXrLQm
	d3ZucA1DhokBmisiG+9vjFUoZKJ6dlvF9Za6ZTDsg58RtRx32NFgHXBkV0S/zjBwpjT2R7G2qtBOa
	ZZZaYJWH2LleVN3OReDKOm2GZVBb6r6fe8gvANMqqwfeYffqKAqdJg3eZkn/XD1fqA0Bb6ji8xssr
	PsQXnFrLi4yQqnbLQdVjyAYgjrDzsFLKPKsd3RBKLsQVKvJm1wAgsNXsH/aSwD4w+kc9Q+vXMVf68
	ls+Ho5KISx40DJDTs57KMaioJ1r0mg/K8PjAqJIYfJqGCxScKOWqB/zylYA3NFQ2nwB1BCSL7NSLG
	zmQfvQshSLbtZkJrAmsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLqEs-00000005tWj-3VDO;
	Tue, 27 Oct 2026 23:05:54 +0000
Received: from mail-ot1-x32a.google.com ([2607:f8b0:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLqEq-00000005tUG-2fUx
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Oct 2026 23:05:53 +0000
Received: by mail-ot1-x32a.google.com with SMTP id 46e09a7af769-84621d8c7aaso194679a34.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Oct 2026 16:05:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793142351; x=1793747151; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DRBWX4J/Ak94TbpMM7HoAnpLEmSCyB3p+1+fdXZAg3w=;
        b=zyHH2PGRyJDVyQ/aygi9QbECUxRvhl71ygUFU3okVi0AyzJcZbezU/Hi0RnvCZ+372
         uoutijMRXh7DpRi5BKRWryPeK8NALDIqWk2noIc8F1nbFWzS1LfR+TbNO+6xL0fdWvPh
         /vjsXgdOeeIwERUu4jX+lOsQwdmSa1c14ppRykurWDdt2qmW+IYPbNFP8ZzUy+2TPigA
         NYhpy2uwGiZGkIaL+Lsskn4SCu12Zylfkhe4dsxyiEZjYJ1A7ggKepKP9sjZj27liOkX
         fCY0gJLPXqpm7DILxGItH5LL4eG+vIUbUs9OaUfbDWe0LFypHSnyOaQrILVjeWTBoZIL
         umXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793142351; x=1793747151;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DRBWX4J/Ak94TbpMM7HoAnpLEmSCyB3p+1+fdXZAg3w=;
        b=lCcxBphR5cw52pZh1suAkkZQ5M9jerNd9mGnlRcv1zfgKDFGO/o98ODxgQjAWuTSZQ
         iararFRSO24rr+InIfzVSwFvdIZYTRnoueyi/fZMdsGMxN5XFhHIIRMnTrFVdxrUwRpU
         VVY0oxG/EfqA9nqiFnMP2LxqjgXQoHXHC9aLVVEkKMnIZjLFXZdpJEOWq0baLx5UsRTy
         0NzmMgCIwlzR1u8du28v8fz49mQMTybOb5ChTGDGFmBBYMhAljy/Jyv3bciMHIw/kzy3
         doc5Wv8uy6veXfdFcZAP1/nUdrenw3AMCReG4FWNm5iKpL4oFDz5Pkkejo66/zIbcZjL
         oWtg==
X-Forwarded-Encrypted: i=1; AKwUvBxFrFK2HVF+iPA6HRxMFTZBjUb2XBwVYKhk6k9iDlcoqSi9u3R1+FcIWXiJ+2nWWib9O/3ea3aLygDsi4u0Ipqf@lists.infradead.org
X-Gm-Message-State: AFq9FYIrfLekcAk3QPk/o4OwAB61g8EO+5e7Ru1PKLcfYt8vu6/GtfnD
	0EeLfwWLQ/k+yNqQhKBTQ9mFeZytXMKMP221Vgyt46DtmtWm8tmm8qfq
X-Gm-Gg: AYBFou3sNO5DqweQN1tYq7OTBq7YfkINg7/DLnyZAebAB3cObhMrJsRNAxdChjsKBwm
	KuL2Pne78YXhLCh1q0tvuwMyNe35xLhaCmIPoBCnYhT4PCVoFrsdk+rcKmTZzzXo1zSAgJNr8eT
	tsmvuLFk5vduPp7ugWTuYXBrGpM6SwCU+MgLu/uHfETOZ694hSvlbX6kkuZj/UnAb5NjLtqg5II
	Oxo/hFDQQYB+9FP1lVbWx6PxMqk9DckwmFS9qw+mwOIe6EIMNvftakGoX3gjmaG4SDDkIJWt2sb
	YPad0QMZ1StcWgxgr+HpKwR0M2kcUUcRvKFa5kqVS1d+ifLRU6D7qx9BFLZxt7+3qVD046kl9Bw
	pBW4RoLG+CUXjF0OQ47X4lRYpKNYTNe2isLhOUKqMKdpchauA0Jw2OBx9jfYZTy6hctejoLbKc+
	oJ3wTIFPw4Xmpe9HdFMf1yv+WMJhv13HG2U/PpVE2MDp1dQcaZuEI4tTalzAQM+hCP9+thmE20H
	UsUAEC+lE7GcSMqQWg7X5WJ+/krNYEMw6N/Q1EzF3ls0EQ53OyGlZiHZKqAgKkWEC0vEjouQEXj
	CnBAoucCI4dsLYtLV2CJQV58EAWcdjxzM7qdoiTC3l7Bea0H0ZGXqhUCAmUnk1O5uz2M5wqAR0O
	2rzhwQJAe9c1tPduFbkoiK+MNmU4wXdYOfp1S7mOIOocgBAd8qJ6r1hhOOCKGo+CykF9lq7JTn1
	Otbw==
X-Received: by 2002:a05:6830:2406:b0:805:8b7d:d8d7 with SMTP id 46e09a7af769-85abf964f20mr834577a34.7.1793142351612;
        Tue, 27 Oct 2026 16:05:51 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-850fb0741c9sm12093328a34.10.2026.10.27.16.05.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 16:05:51 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 27 Oct 2026 17:05:33 -0600
Subject: [PATCH v4 5/5] arm64: dts: allwinner: h616: describe the UART
 integration
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261027-submit-h616-uart-fifo-v1-v4-5-d37e018fd0a6@gmail.com>
References: <20261027-submit-h616-uart-fifo-v1-v4-0-d37e018fd0a6@gmail.com>
In-Reply-To: <20261027-submit-h616-uart-fifo-v1-v4-0-d37e018fd0a6@gmail.com>
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
X-CRM114-CacheID: sfid-20261027_160552_686707_9E23C696 
X-CRM114-Status: GOOD (  11.63  )
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



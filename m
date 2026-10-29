Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24CFD606A324
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 18:47:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=j+hL4C4D;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qS9sB+9t
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=DRBWX4J/Ak94TbpMM7HoAnpLEmSCyB3p+1+fdXZAg3w=; b=j+hL4C4D1mlEMs
	ut0H9Hmdf5HLV1J2BF5lCTN844PFMbcQTS7xNDAOr4mbr6+nhIqTbAIG0GsRrBcNKJAQ/yfnd8lfo
	NZSrkmFUbdaBY+AOJuNpv7veY1CZ5g37fjPobaMRNL62aZaWdbMz5R7an76Qui7vI9DFu4gLf+zA6
	0A0vtCpgcGJ2wUULNbaJDMy3PS35awQSjj8FveKmH6u0ydu+kuv8fVS0ZWYlqVz1uy3uT/V3Tla4W
	5IDoP4ta1L5GgYr7tDVwFyi7DfBXuLS+qFnPAUMCksdaPk7CzX1QYMx2sVR57ZgCoLBkbUG2f3RV8
	YRVSsvtFubdG2iAOmaEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMVAD-0000000AAAW-2Ixz;
	Thu, 29 Oct 2026 18:47:49 +0000
Received: from mail-oo1-xc2f.google.com ([2607:f8b0:4864:20::c2f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMVA3-0000000AA4z-45P4
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Oct 2026 18:47:41 +0000
Received: by mail-oo1-xc2f.google.com with SMTP id 006d021491bc7-6b1afdf5196so1052486eaf.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Oct 2026 11:47:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793299658; x=1793904458; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DRBWX4J/Ak94TbpMM7HoAnpLEmSCyB3p+1+fdXZAg3w=;
        b=qS9sB+9tbzLSDMfYSVh3439npGA/Qb8fw/yKkdTqI14LD2k5ZBUMVI8Zk8D5zoI5VE
         HUrLX6D1EJjjKGj8vCVJGDt7lQSJFKm7XUa/0tPlLKZDfv5EAcbHpjLdDuTkinZUF4UR
         31k4KnwUC3QMJYA9gx6jNCkrBCa9ix/b8U4mXPXSsTRx6Kr1tQqmoj9SWMoOqHg9uzwh
         5WbsB70hmqCjd+qP4N9H5DjZ6T4t7+/bje2utERBvScxFuZYfJPKUhxPdNW7Bq88mINX
         6nBHY3PNnIH13yK4k7ZbjIu5XLMv/91d2UF9siyjrvp8Cv10ifFJpe7CZzkkfg5fYfIB
         b39Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793299658; x=1793904458;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DRBWX4J/Ak94TbpMM7HoAnpLEmSCyB3p+1+fdXZAg3w=;
        b=aMDuug7nP0Gsg0ESEyx1Up97cEvvVUJ2z3+qYz0n6ylY97yUyMwBVt2IvbfjNMO7M3
         bg0UHcA3gZp/5UAveKKQSIc2zae7NP9wxfQrxrWfi17EupWUKd0jHGJk8LzEvf0ZJsJf
         4nrGGJexW8elnN1eHBioIeVXL1FGZ/iyDxyfEFlWt6aY0zSBQI3YOkQKan2T/ThHfWQo
         ChVWEcR9CcPdzKqBqkepahaHCQtlYpcIcvQ61UtWJHrRmp0n6B0YHeOkc81PQcS6M2q6
         YTX6u8S/mtYLDJZDjDolRuDUU01xs1RYn3FGJab89wbJraIh+WHXQQjvs3XoGRE7B4R7
         3rhQ==
X-Forwarded-Encrypted: i=1; AKwUvBxIgDQKSHB6hFD/VeIJDoxbAc3LyRIXb1Uk/3F5UenuDSzlboraTXXSjB9vbFLnyfFWL5+8q2jepbkvtmSpqwMp@lists.infradead.org
X-Gm-Message-State: AFq9FYI9RqE6rQFhrPjvSXDVos06rPlJcpfAqVNc+FIJKdO1eT19nlA6
	f1ydvFRwiLwAfBqQTDcrHFmGEkTGUTxlmE2QZl4AQpwqoIIKyLnRsUq/
X-Gm-Gg: AYBFou17Omh5O7WdxG3SRwCD/RMTHoNvJ+Lqow5OR+IcFM+EPYZsMbt10V76rGMeHIB
	K0+iw3cmOLU1i/7U7SCMgchOM6CPv6PteJVZlDRqNjZnXJSOjjyz/cN6+c14PlpLd/GYzfWDYEH
	8G8M0u9J7SN+TnGiuQw/WGc+wGBwPG8QTZ+NA9dO7wS7/j646QibV8PTM8WjDnSVS3R6USLgelB
	uDUivIE6oQ1OkmJW5rot8AdcfzxoI1ry+U/bSC0UyOT7FvNu1OoTLF2nFWQunhX4YEDxe+69u1E
	1SualQWCS2pku66fo4IKPYAjP07Tzqq9pXCQmrYwz035hBJym7a7cRJouLhk/efKmqtYMtDBsBq
	tGdmZB/IsX9Kkn30RgqPUwbH5WCPYay24Z1qrSAv5xSeQ0rzOqHDgIgBgO37/zbS1CGTlxhzmz3
	5lznkx627QuvcFGqq0HK9VMx9pB3ZZcXXOOzudaTnHOxGDqUo4OYkfYu/P3HNJY++KfI1tid2VO
	SYt7j3ZQ4xHB8eSyqbUPwsnpJZ5wz34c1tWOu0+6sFA1HslHv2hbo/eUQYW9/qNSgDudpTcAOKZ
	Y43wExlIsv0DToCjC+RO3LxOK64gLEd7C+NvjG3S1JnRSmYMLbqrzt2BoMVFDM6VrElYMJ1wEkZ
	RIs6+wIuRvW6DBKZ6IpaHL4BKnIQudJ++nNb27jy1uGob2HYsN+6wpfTmwRfPiKbTzZ9qhpDWuv
	F6sh+m1qOU2RNXBLgrhht7pubEarcBNtD05tILTRoYoAsJxXWop5GOmKk3dkaCh993C0Fz2tA7
X-Received: by 2002:a05:6820:c44b:10b0:70e:1dd8:6712 with SMTP id 006d021491bc7-714f29f3ee8mr66212eaf.72.1793299658351;
        Thu, 29 Oct 2026 11:47:38 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85d354cfb83sm221871a34.14.2026.10.29.11.47.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 11:47:37 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 29 Oct 2026 12:47:26 -0600
Subject: [PATCH v5 5/8] arm64: dts: allwinner: h616: describe the UART
 integration
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261029-submit-h616-uart-fifo-v1-v5-5-53b433aebbf8@gmail.com>
References: <20261029-submit-h616-uart-fifo-v1-v5-0-53b433aebbf8@gmail.com>
In-Reply-To: <20261029-submit-h616-uart-fifo-v1-v5-0-53b433aebbf8@gmail.com>
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
X-CRM114-CacheID: sfid-20261029_114740_028763_F1CD2A81 
X-CRM114-Status: GOOD (  10.97  )
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



Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06077606A324
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Oct 2026 21:19:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=d7J282r0;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=mfoa39mH
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=mVsOr+ec2L55sOlcfZggstu7WJwFcYb+XFa3A0v3Vtw=; b=d7J282r0Mvdk01
	5W0/z0whutAblTXBwkdFyEP2xrehc8YeqBQfj77/J2FZifVSjsfyPzBVkyvXDOuJGRGAc9pdep8d2
	LwEf/1TGcuEm5Wuqo1ssaJPq64z2JR7zcxojGAjRzm7hL0qatx2BDiQh/Ajx0LNBPGBWl3JAOKmuO
	au3Pt7TVxQBEUaGaMIpO/48w03GSry9XwxkqxBfmz/K5MoSpJ2zxSlz8PucEYCUupDQ3HmfTygzhB
	sQbwGfu5LEpuiWsNYgZpzHY0WZHMBw0G+BBT1D4ZPxGFmUNu0EhPSazrAO9jCfmeEuMJ2rYyaeEWc
	paF5rz/8iYT+wnB5bHmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKMfs-0000000GyqE-0fHv;
	Fri, 23 Oct 2026 21:19:40 +0000
Received: from mail-ot1-x32e.google.com ([2607:f8b0:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKMfn-0000000GyoF-3dTl
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Oct 2026 21:19:36 +0000
Received: by mail-ot1-x32e.google.com with SMTP id 46e09a7af769-843ea301d60so957196a34.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Oct 2026 14:19:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792790375; x=1793395175; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mVsOr+ec2L55sOlcfZggstu7WJwFcYb+XFa3A0v3Vtw=;
        b=mfoa39mHdHqWAkX5df/cX+3pb56tcLoCJka9VowDirLsVUVBmmj+IKWZEnyZI4q0Bc
         DqjKpjrzCkmXrZ/oKI3lE3LNJD3PPchQoaRZ//gQbo2dEYzncb5sKMgOc5+x5d0BP8U5
         dLf8Ows03dK9dCW9vXFqa9PCxW0NR2XMMsyvXCOzoeeVg/m+tjw7cJjwgxcdTL6qN12u
         B4WKj8b7RTAjYVSt/rx+Aquv3PrJmuE/5zMxN6cfQmiUhPkGsbsXAKRpHWuhoLk3IvRO
         u2ZgmF5lp9pZeOs3dDDdnxuzY77AB3lDLjStlCV3uj87Ahl8+7zhrq8A6jSDNhgqH658
         4l2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792790375; x=1793395175;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mVsOr+ec2L55sOlcfZggstu7WJwFcYb+XFa3A0v3Vtw=;
        b=bggLa9pJq4vjRBxJ1qyOA175Z6Avuu85J5lXqyISacG0UubNGUuVUI4PBKDoCkwLJ7
         HYY1C+pt83TYmQWFFLTgp6EPrhu6H3SDF1meWpTSaW0kKXF42rHV2aqNU0FhY2ePTm6t
         Aj+LZJp0zeWQVmQAPaIOq/vCfYoDFOLHgwhvjnGeEI9Oslt/KhJNJOJrQ8ZX2lG0ee3U
         uiZgPz+ry10B8cJZTZmio45UybXitCKMNEWEGI2DkTpO+DhxK/WPi+HndIuCInMVTmp/
         IDUN6QBXjQRzXA/bGmkh7F/MhrOc9UTlSqVVHA5HCIQvWeLejcLnF+k5B2FReSsN81VA
         Q7lQ==
X-Forwarded-Encrypted: i=1; AKwUvBx3TeCMkJC/RLokhc3irA7fcbjm839vviUstRsBcBA3dgj5ywTIodcJFdAmsx3BBYR1eE1tP/5wcSRKS+XEBiJK@lists.infradead.org
X-Gm-Message-State: AFq9FYI6hq0jA8hfrMDQFQSFFzB7R9NY163ez1/BlXfKT+r7YiKiVef4
	IgD5JF07U1O0J8d33l2WQayFP9n9y2jlRUXotgD1XK9DquZEqw1PHrhS
X-Gm-Gg: AYBFou04545aBuPoE0D1XIyi0j0WXNdwWjFx8WWWz1ck+Wz+TPvdLN8qr3Cg/st6X+Q
	Yts/ztfFfeXYRB9hBIhPBNn0SfCYEgwdgxardoOKTNqok1LVtScQIWD4eD1Mlhj+qY4M3cqc6Eq
	VXiCNUcNa+RwEpjUhfnnz1EIDvFs4XVrklF6bfcY3VpHzXHiIbX7+7lve/9qZOEnuQoEPjqWsNV
	kK1ZYMxyL9rrsdoXZl/SLtghP1SFSLgSn5XWukxyQ+MVv4WJzKN+C1FOGt0nG19HjMciYUOZgrX
	8zcFlupC+IYfikbOujJiIMfsCZ8LCBOeLejoAf7/9M5jp6BiwMaosrz/8k4YwQtILfgph9iav+8
	njLwW+HOYAz1FYp2P3lXz5PdPX4WZWWnJUxohaZCyJ5Z+INrFAFyorpJnJi7sBUFqBybHx7jC6O
	f/9XlCNPRild10haCYQDGK4jccmMhiWuwXiOaU/DB6j44HWgFvjlOj1NMdB4rhAEoOl3z7bnB+5
	CnLXgux3z5sQS4hjl0m8/Z2czUTXQ+zBGaepjzQrDPisJsoPRRKIMkGyRd0jqnqnTcaCGr15spG
	ZbvkROXGU4UuNHuyaGt940jHA3ysRqZ8VqbCEH6riyqwc53RFGOqi5yVi4qEjH0s7NWO3vI0wbB
	YPP3c0GWJ439U6vnn8N1yajrfseaXTi5NMsp3/4uh0LN5ADmJSHAVXuh9/0ex7y4le+gra80SCg
	5iuA==
X-Received: by 2002:a05:6830:906:b0:7fa:5c49:523e with SMTP id 46e09a7af769-850fecc32fcmr525089a34.23.1792790375055;
        Fri, 23 Oct 2026 14:19:35 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-850f8458d8esm565721a34.1.2026.10.23.14.19.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 14:19:34 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 23 Oct 2026 15:19:29 -0600
Subject: [PATCH v2 3/3] arm64: dts: allwinner: h616: identify the UART
 integration
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261023-submit-h616-uart-fifo-v1-v2-3-af0593504635@gmail.com>
References: <20261023-submit-h616-uart-fifo-v1-v2-0-af0593504635@gmail.com>
In-Reply-To: <20261023-submit-h616-uart-fifo-v1-v2-0-af0593504635@gmail.com>
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
X-CRM114-CacheID: sfid-20261023_141935_936767_1F832643 
X-CRM114-Status: GOOD (  10.06  )
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



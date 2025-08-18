Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6239CCA0EE9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Aug 2025 18:03:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jj1Unxa4GjFf+agCHEEH87Fl+a2vGrW6RlHdXp1wINk=; b=ZqaczkLz7b3ovCGMaH/ovx6jU9
	XuktiwFw5VegmFhbFbB5fevSFO7fr95JthRUNbHfiyY5l+olqUIWpn/DcFt9T1wrUciy3+gL5PmAi
	T29soxvo+KhzmQYvy0T8t1dTpYhFreKogkKuBfSmZuypiJkPPS7CvuN4zrwnFyjz4NFzeqp6GFI6W
	PKByG7ps0G5fPtaw2NsCJdXGjMNsZKiTE5MnhnRgICh75jPfJbQDH1N6FDzqoYkQBva3dWONjoKKq
	RaXQM3iiBwiiSB3s4jbqG9I6vW4IKJG4aY7HT3D6Z1N59vFot2Q8wtF9Kyj5545p86vrilwMgLFNx
	u14eZeTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo4Ci-00000008HBZ-3vzr;
	Mon, 18 Aug 2025 18:03:32 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo3VR-0000000878I-2sgk;
	Mon, 18 Aug 2025 17:18:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1755537527;
	bh=tG75RaA58L/LbFXL/IjWTkyLvWG0PIm7lTQ07gOgyks=;
	h=From:Date:Subject:To:Cc:From;
	b=lGTMioqsaBVhRC4NA/nukTupkmMEdAZeL0x9eWRd+v0qKfz29PDNWEmu+xO+Ss5rC
	 xvgg/ImvpXzSI2xf6Lge6DXD/li0DH0VG51txmUpNLFYCY4SKQyNCXQYY2Ov+UzfS6
	 SlPV3CTYVHZGWDuJrQKuHBT2bAS1rMi6mPIIj0UiaX8B7PZx6TjHDbWAY1j6efNQuJ
	 uGZC+b95LyRdIwhFsRzkZFOcz0mrJPous9NdSLVWDCHDI0VVY4YfPRKlGfALqGMcLJ
	 0uSf6SLrYt8vp6aeXB32Yw7FbujPdVZlwzZAaCpGeFQky8nuRsuktH8UVkIQx981PL
	 DGuH4SCqnek8g==
Received: from jupiter.universe (dyndsl-091-248-210-167.ewe-ip-backbone.de [91.248.210.167])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id CE23A17E0237;
	Mon, 18 Aug 2025 19:18:47 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 89697480044; Mon, 18 Aug 2025 19:18:47 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Mon, 18 Aug 2025 19:18:40 +0200
Subject: [PATCH] arm64: dts: rockchip: Enable RK3576 watchdog
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250818-rk3576-watchdog-v1-1-28f82e01029c@kernel.org>
X-B4-Tracking: v=1; b=H4sIAG9go2gC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDC0ML3aJsY1NzM93yxJLkjJT8dF0zSxPjNEtDI9NUEyMloK6CotS0zAq
 widGxtbUA9CCZE2EAAAA=
X-Change-ID: 20250818-rk3576-watchdog-6943f9125e42
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel@collabora.com, Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=989; i=sre@kernel.org;
 h=from:subject:message-id; bh=tG75RaA58L/LbFXL/IjWTkyLvWG0PIm7lTQ07gOgyks=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGijYHceec+cj0s2bKOj3NvdMhql0msA/UW6T
 iYDN9l6MKIk0IkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJoo2B3AAoJENju1/PI
 O/qaDvUP/3x2qieJs/eT58aqP4wqmebgzmOIfe4kGht0vvoveETDxQrQOtnXnZVbyE1HmpLq9Ix
 LXrzmOgFPl6hFjunDUVBi0iDvtjx6V/3K4M+B56p2iCIp1Y1RCu3zbbK25zAifSNc9oKkZdXHnK
 3LWQoZpaNcVB/pTOjwj/9VTz1dUAwq7LReBdWDc8r2U7T7AN2JtrEe1ZtirR5dFzOfuyZ67WESF
 X9wTYBRrtSojoI8mVv0AHJSIbvwUGPD1vfcq5qK9hZyzdG51DMYXrXKEHnTVW92NlDlxtraiLb5
 8rVwFn+icLVS6jllwXFyagfeh+dvJ63IlKUBDuqlF7gWkIIHOCe+u7xljTbXpyrbCgI4wlVbqc8
 5jUqbTsozyjdlArhBRFeu2GkI7eUIKHSWboxeUynANkDcGuseB8AZzPz55QoWzF3/YPphjIJIud
 TbdH41GbgN6sz6tLN/3Miv3hcFzzpZS1AYRfpJrgcEaGpesO8yBk5dFqScvkdIPD3jvVw9CahKc
 r20sOEdgzGQdR0Nn1zO0mWIvpVSx7De9GSgAlsKBuThKD/xU8KUGIaukxRJlNfzAoQOiSC/iKNk
 Ej0uH/DfSlLWXb6soXhtZ/L5LjCDH89acZsAh/BU34gVss55EqLKoIYhl3+CkAYerE2rhFafVpJ
 BGb8zxN0nvcc/hWup+aAxZQ==
X-Developer-Key: i=sre@kernel.org; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_101849_876862_B372B0A8 
X-CRM114-Status: GOOD (  10.26  )
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

The RK3576 watchdog does not need any board specific resources, so
let's enable it by default just like we do for RK3588.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 arch/arm64/boot/dts/rockchip/rk3576.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576.dtsi b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
index c3cdae8a54941a75821aa6a642c535ced66a116a..1bffed162c307d3981a540d5727d477f0e6f47aa 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
@@ -2073,7 +2073,6 @@ wdt: watchdog@2ace0000 {
 			clocks = <&cru TCLK_WDT0>, <&cru PCLK_WDT0>;
 			clock-names = "tclk", "pclk";
 			interrupts = <GIC_SPI 40 IRQ_TYPE_LEVEL_HIGH>;
-			status = "disabled";
 		};
 
 		spi0: spi@2acf0000 {

---
base-commit: e05818ef75bee755fc56811cb54febf4174d7cf2
change-id: 20250818-rk3576-watchdog-6943f9125e42

Best regards,
-- 
Sebastian Reichel <sre@kernel.org>



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4E31C87FCF
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  9 Aug 2025 16:21:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iI9DhKGp9hj+DzXPu2GlHt0QcDxxsGOk832BL3LM2Hs=; b=cHNoAnMygr5hLDBZ9ZLwe5DJHS
	DYmwF2WFDYsaoZ7RjteNOc929TIGbMBON0W+K5G7E9GHM1OtXnCSM5tFJHkuwF8U3zJDrimXrjMrU
	NkxjtO4qEcJSuQKTDQcAdGhi8A06AXt5jLnI2GM9L1SAm0umECtU3oGZbgW98MlVyN90sVQE8baJY
	iwqWFrnS3NY1e0EPvJxI3Scz54tLe1d4xn9RsmGEKQFgX1qqczabYIoR0Q8CvdB6UnhfcMKdaTvEy
	lwrqGzb27sRsJRc7yVjp5qPko+l+bHWkC3qoGSZDVmlqKGTg4v6nh9ZkRDoNMJ008eFZ98/8HCvdV
	hiwUKalQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukmJa-00000004gD2-3DOO;
	Sat, 09 Aug 2025 16:21:02 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukmH5-00000004fy0-16ut
	for linux-arm-kernel@lists.infradead.org;
	Sat, 09 Aug 2025 16:18:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6450A61428;
	Sat,  9 Aug 2025 16:18:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B2737C4CEF1;
	Sat,  9 Aug 2025 16:18:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754756304;
	bh=Ym2P+ekDEEegX+3UjM/QGAdR0kffoWcIHKXwIKpTqxc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=eDTugSf6nLEL4MnLxkD9CW9289CYSvdFcUZXFgdBu+QzrMwyM3JDbmde84YrqgdDY
	 CxCNg05LXvgfmBOkHKJowUfWBg3TNIH7wECRo/PYJRnfM+clN6AZVlet5D07P9Pebs
	 2KrNMzl8STivOzMMtMYA6oVRIhoDYsOLJWlVPV2uxv9OhK24ekFcfFIbDyk/INWFtV
	 1fsRZrSb0DTKxm1gP5aw5ttUElmvdY4BuedRUWrsAHBkjYmgtLlRq7G7led9RSxnH5
	 207QcKbSXZEaQgxW0heFn2PF+JhPcUt10E+N7+jmFoeccVRkPvrhJH/+nQiRfUkJGG
	 LukmMWxmaMRZA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A14ECA0EC0;
	Sat,  9 Aug 2025 16:18:24 +0000 (UTC)
From: =?utf-8?q?J=2E_Neusch=C3=A4fer_via_B4_Relay?= <devnull+j.ne.posteo.net@kernel.org>
Date: Sat, 09 Aug 2025 18:18:07 +0200
Subject: [PATCH v2 2/3] ARM: dts: allwinner: orangepi-zero2: Add default
 audio routing
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250809-opz-audio-v2-2-f4fd15552a82@posteo.net>
References: <20250809-opz-audio-v2-0-f4fd15552a82@posteo.net>
In-Reply-To: <20250809-opz-audio-v2-0-f4fd15552a82@posteo.net>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754756302; l=1692;
 i=j.ne@posteo.net; s=20240329; h=from:subject:message-id;
 bh=MNIFx+OhapBMs8FasylcBkObgSQEZMhAy+EBWCVQkAk=;
 b=wHIiYEunlGpmpYxfLe/S8ow0gBeBtJYtg7Np+1pF7G8x0teIiBYaUY11k1CQ+rGiTA3kz1Bk2
 W0koQwJWCQ0CHuiazLSiYbvQzJlyo+hyPbscDKkuOyIVvIS3OCK9on1
X-Developer-Key: i=j.ne@posteo.net; a=ed25519;
 pk=NIe0bK42wNaX/C4bi6ezm7NJK0IQE+8MKBm7igFMIS4=
X-Endpoint-Received: by B4 Relay for j.ne@posteo.net/20240329 with
 auth_id=156
X-Original-From: =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
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
Reply-To: j.ne@posteo.net
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: "J. Neuschäfer" <j.ne@posteo.net>

The Orange Pi Zero Plus 2 has the same pinout[1] as the Orange Pi
Zero[2] (with the possible exception of line-out left/right being
swapped), and the Orange Pi Zero Interface Board is sold[3] as
compatible with both of them. We can thus use the same audio routing.

[1]: http://www.orangepi.org/html/hardWare/computerAndMicrocontrollers/details/Orange-Pi-Zero-Plus-2.html
[2]: https://linux-sunxi.org/Xunlong_Orange_Pi_Zero#Expansion_Port
[3]: https://orangepi.com/index.php?route=product/product&product_id=871

Signed-off-by: J. Neuschäfer <j.ne@posteo.net>
---

v2:
- new patch
---
 .../boot/dts/allwinner/sun8i-h3-orangepi-zero-plus2.dts    | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm/boot/dts/allwinner/sun8i-h3-orangepi-zero-plus2.dts b/arch/arm/boot/dts/allwinner/sun8i-h3-orangepi-zero-plus2.dts
index 7a6444a10e2534458b7380882ea4fd42bd54fea8..97a3565ac7a819be6b18d324fa6f65d0d1d2b2ad 100644
--- a/arch/arm/boot/dts/allwinner/sun8i-h3-orangepi-zero-plus2.dts
+++ b/arch/arm/boot/dts/allwinner/sun8i-h3-orangepi-zero-plus2.dts
@@ -99,6 +99,20 @@ wifi_pwrseq: pwrseq {
 	};
 };
 
+/*
+ * Audio input/output is exposed on the 13-pin header and can't be used for
+ * anything else. However, adapter boards may use different audio routing.
+ * - http://www.orangepi.org/html/hardWare/computerAndMicrocontrollers/details/Orange-Pi-Zero-Plus-2.html
+ * - Allwinner H3 Datasheet, section 3.1. Pin Characteristics
+ */
+&codec {
+	allwinner,audio-routing =
+		"Line Out", "LINEOUT",
+		"MIC1", "Mic",
+		"Mic",  "MBIAS";
+	status = "disabled";
+};
+
 &de {
 	status = "okay";
 };

-- 
2.48.0.rc1.219.gb6b6757d772




Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3687EE677F8
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  2 Nov 2024 09:44:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gF4/ZNsAK1S1Q0ruvMfpDSairoKQHeLYMeqLyk6oG4w=; b=NrSYMhfK77gcVpHX3oOTO85t0K
	wYKAC9UsW5cNC/O5FuETnbduJFdFssFwYLKi7WPL0s0yz5mbj0rMMUASXwV7XiueiaA8J4uIoFX+b
	HGH+STuUZPjiZLNh5QnakIqtii+amJB6Qu+nWpLEynEXMjAfxQgYDwcAY6TzyidLv18uTZ0InLK9+
	0Y0mLYCuDXlYg/1JD6UbWV1EQJkXBolcWwuS70Q79Q/1PVbwIguMMYX8eaIkxLdUqgTOa3f5+uxV1
	y39/eAj5WVSYniDxTmobKLGRQOd9ehmhD4eTWjtFbvPVZ5j+ZlzUnbmDv5JuK+W9OrLee0dVEKOoq
	aRh23jGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7AgM-00000009Pik-07Jh;
	Sat, 02 Nov 2024 09:44:34 +0000
Received: from fw2.prolan.hu ([193.68.50.107])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7AYe-00000009Ooy-3L4T
	for linux-arm-kernel@lists.infradead.org;
	Sat, 02 Nov 2024 09:36:38 +0000
Received: from proxmox-mailgw.intranet.prolan.hu (localhost.localdomain [127.0.0.1])
	by proxmox-mailgw.intranet.prolan.hu (Proxmox) with ESMTP id 7A705A0B13;
	Sat,  2 Nov 2024 10:36:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prolan.hu; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=mail; bh=gF4/ZNsAK1S1Q0ruvMfp
	DSairoKQHeLYMeqLyk6oG4w=; b=Aax1zlUo5IrrmsA+XX6SDjcSAQkEwxNfJ56L
	bP827L6qd0N+lU0F5auKJy/y3r5mZN+yB8OM3FGnQwnBWbBgx30u4qQenmu/e8do
	KI+x4C2dEG0LgWQR0ZepfZ0HEMpofPMxUTwqM/u/DLkTWR8G4LYa0DJkb5BJ1ujZ
	nCyihq97aBo8krJxLY07urhZpC+cBs/fvuBO+fkjubUKxF5bedhD0GkPqOaGA3vE
	I8C4XM5K9m6z5M1jZ64rj5rxK9iMgScs7a8KoRb4A09jrljj3PsR9bPnfS+Wrqs8
	aj+eQiVadv+8VtYBGZ6Y4kRS4IPuC1ZQimbiY5os6RBfjQ/Cdx/u+7LGmIpXeeZa
	MQ+L3qrXJWPN3oWMCfiHEf3glekwftBK+nZUfBwbdqsN8dSCuo7iYEnVbpF4Bi1W
	Wuuv203zZ5unzZHmMNW0b3RiY/4D+kzPTIoDC/niBxbWYWzIwSmXqQoC4kCvFnU9
	PWhlUFiH6X1Q+Un6lvPdw6QTZ+PbR6QQxaY/6U+aX9nypR0Wgb1h/i1kiqzlSX2E
	v+vv2vM5GMPLXS9ziIxrP9HuSibFpg30wxNvbsVdlopGqJB3OotTwoFxADI6fsik
	AIGWhhYiBbFn55Tlj1660kE84yjLMC0vzVh4rzsodga+YkgZbuNEFoL8uoyPzn2L
	BAgiwrg=
From: =?UTF-8?q?Cs=C3=B3k=C3=A1s=2C=20Bence?= <csokas.bence@prolan.hu>
To: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-sunxi@lists.linux.dev>, <linux-kernel@vger.kernel.org>
CC: Mesih Kilinc <mesihkilinc@gmail.com>,
	=?UTF-8?q?Cs=C3=B3k=C3=A1s=2C=20Bence?= <csokas.bence@prolan.hu>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec
	<jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>
Subject: [PATCH v5 5/5] ARM: dts: suniv: f1c100s: Add support for DMA
Date: Sat, 2 Nov 2024 10:31:44 +0100
Message-ID: <20241102093140.2625230-6-csokas.bence@prolan.hu>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241102093140.2625230-1-csokas.bence@prolan.hu>
References: <20241102093140.2625230-1-csokas.bence@prolan.hu>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ESET-AS: R=OK;S=0;OP=CALC;TIME=1730540194;VERSION=7979;MC=2738325872;ID=220022;TRN=0;CRV=0;IPC=;SP=0;SIPS=0;PI=3;F=0
X-ESET-Antispam: OK
X-EsetResult: clean, is OK
X-EsetId: 37303A2980D94855667067
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241102_023637_003917_6E6554CD 
X-CRM114-Status: UNSURE (   9.71  )
X-CRM114-Notice: Please train this message.
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

From: Mesih Kilinc <mesihkilinc@gmail.com>

Allwinner suniv F1C100s now has DMA support. Enable it under device
tree.

Signed-off-by: Mesih Kilinc <mesihkilinc@gmail.com>
[ csokas.bence: Rebased on current master ]
Signed-off-by: Csókás, Bence <csokas.bence@prolan.hu>
---
 arch/arm/boot/dts/allwinner/suniv-f1c100s.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm/boot/dts/allwinner/suniv-f1c100s.dtsi b/arch/arm/boot/dts/allwinner/suniv-f1c100s.dtsi
index 3c61d59ab5f8..290efe026ceb 100644
--- a/arch/arm/boot/dts/allwinner/suniv-f1c100s.dtsi
+++ b/arch/arm/boot/dts/allwinner/suniv-f1c100s.dtsi
@@ -6,6 +6,7 @@
 
 #include <dt-bindings/clock/suniv-ccu-f1c100s.h>
 #include <dt-bindings/reset/suniv-ccu-f1c100s.h>
+#include <dt-bindings/dma/sun4i-a10.h>
 
 / {
 	#address-cells = <1>;
@@ -159,6 +160,15 @@ usbphy: phy@1c13400 {
 			status = "disabled";
 		};
 
+		dma: dma-controller@1c02000 {
+			compatible = "allwinner,suniv-f1c100s-dma";
+			reg = <0x01c02000 0x1000>;
+			interrupts = <18>;
+			clocks = <&ccu CLK_BUS_DMA>;
+			resets = <&ccu RST_BUS_DMA>;
+			#dma-cells = <2>;
+		};
+
 		ccu: clock@1c20000 {
 			compatible = "allwinner,suniv-f1c100s-ccu";
 			reg = <0x01c20000 0x400>;
-- 
2.34.1




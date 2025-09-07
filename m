Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E7D9CA101F
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  7 Sep 2025 14:23:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dp3mbKpbeOTM7hUlr+9KFCMGYCnCRALve92LtVVLL6M=; b=c8x5DkhRW6F0Noqijn0nC+JBTI
	q6fRBg978QEIGB/3flVS7w7ASBPUEC8k9v4yvAwh9la1grvZaiL6v8XkNzNUgacHKoWALDfKpHDGU
	RWq1v6HSFjv8SHwbuk0J4GBg2bN3Hj54Ds+cw8MDSs20AOGdv6RviNvbPmmZT45Vd2skr4fPPj/k0
	Am9m6oRGgCvx2XUTi5FUsWvW+70mQoBxOP6u7LTRehyjshzMf8ui6QdqwFtNHUxknzzoqsTx355JX
	TQkkyaJhI+69h2alpFXa6ml8SaWufp0CCtX4ViTZVSGpy29VlwsoHqNTm5G7afQngQ5TGYeafU1oQ
	wSl/ZNyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvGJ1-0000000BSpV-160v;
	Sun, 07 Sep 2025 14:23:47 +0000
Received: from mx.olsak.net ([37.205.8.231])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvFua-0000000BN6t-1ig0
	for linux-arm-kernel@lists.infradead.org;
	Sun, 07 Sep 2025 13:58:34 +0000
DKIM-Signature: a=rsa-sha256; bh=dp3mbKpbeOTM7hUlr+9KFCMGYCnCRALve92LtVVLL6M=;
 c=relaxed/relaxed; d=dujemihanovic.xyz;
 h=Subject:Subject:Sender:To:To:Cc:Cc:From:From:Date:Date:MIME-Version:MIME-Version:Content-Type:Content-Type:Content-Transfer-Encoding:Content-Transfer-Encoding:Reply-To:In-Reply-To:In-Reply-To:Message-Id:Message-Id:References:References:Autocrypt:Openpgp;
 i=@dujemihanovic.xyz; s=default; t=1757253361; v=1; x=1757685361;
 b=TdyiqN3Nhu70bCJRNLEeXc5IKSx26y0NWHiAW+kL7V4qmGipK9asSXZ1rIZ6Pi3TzT3RnIEM
 d2xUhsivV0U1KO6qnSIZklEVAH8jKmqE2L2XUPQ6AnmH5Qe6MyFF9g3HBAiY/NU612EtlQ+uL7d
 PQO9v/mHxGw3+pGOvyJ+wkNCHRpobD8IBvU/+jvvNlTaPK8eUMuls12jG25LQ4ty2peYFeV5h7f
 9RHMbB8QfEFJR2IX7w342/Rxqq/7CxAQlIO217QbBAig4+tSB59OCaiw4IbNXquTLF3Dni/qW/z
 b4LGAMM+LY5YcmIVQBI9BxDtonq7Y+BmXs+6KU8q4rEGA==
Received: by mx.olsak.net (envelope-sender <duje@dujemihanovic.xyz>) with
 ESMTPS id cf15d4bb; Sun, 07 Sep 2025 15:56:01 +0200
From: =?utf-8?q?Duje_Mihanovi=C4=87?= <duje@dujemihanovic.xyz>
Date: Sun, 07 Sep 2025 15:55:15 +0200
Subject: [PATCH 2/9] arm64: dts: marvell: samsung,coreprimevelte: Correct
 CD GPIO
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250907-pxa1908-dts-v1-2-da776eb29e45@dujemihanovic.xyz>
References: <20250907-pxa1908-dts-v1-0-da776eb29e45@dujemihanovic.xyz>
In-Reply-To: <20250907-pxa1908-dts-v1-0-da776eb29e45@dujemihanovic.xyz>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>, 
 Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: Karel Balej <balejk@matfyz.cz>, David Wronek <david@mainlining.org>, 
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
 =?utf-8?q?Duje_Mihanovi=C4=87?= <duje@dujemihanovic.xyz>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=979; i=duje@dujemihanovic.xyz;
 s=20240706; h=from:subject:message-id;
 bh=ifag7Tho57hQxJ2BLXtabDmC2XZUT9SI6SYVIH9Ngjw=;
 b=owGbwMvMwCW21nBykGv/WmbG02pJDBl7+975vf5n7P9drmLPXqV5Oy/6+k9MLe36bPLC/JIwT
 9T/CiaVjlIWBjEuBlkxRZbc/47XeD+LbN2evcwAZg4rE8gQBi5OAZjISwmGf+rfIt/XxTWXK6Ys
 PFukxsNxJy0jboocz6UmQ7+cfz1xRxj+F3GbqnecL+L7ohTgFDnd6cqyu+d2OGud3qijZ/NlqUs
 lCwA=
X-Developer-Key: i=duje@dujemihanovic.xyz; a=openpgp;
 fpr=6DFF41D60DF314B5B76BA630AD319352458FAD03
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250907_065832_611961_E3C4B864 
X-CRM114-Status: UNSURE (   8.63  )
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

Right now, the CD GPIO is defined as active high with a cd-inverted
property. Just define the GPIO as active low instead.

Signed-off-by: Duje Mihanović <duje@dujemihanovic.xyz>
---
 arch/arm64/boot/dts/marvell/mmp/pxa1908-samsung-coreprimevelte.dts | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/marvell/mmp/pxa1908-samsung-coreprimevelte.dts b/arch/arm64/boot/dts/marvell/mmp/pxa1908-samsung-coreprimevelte.dts
index b9628b1f59f2f749804799e3d9faa48e3036e81a..aa161982ca43844287d212e8a24884d2b8440fed 100644
--- a/arch/arm64/boot/dts/marvell/mmp/pxa1908-samsung-coreprimevelte.dts
+++ b/arch/arm64/boot/dts/marvell/mmp/pxa1908-samsung-coreprimevelte.dts
@@ -330,8 +330,7 @@ &sdh2 {
 &sdh0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&sdh0_pins_0 &sdh0_pins_1 &sdh0_pins_2>;
-	cd-gpios = <&gpio 11 0>;
-	cd-inverted;
+	cd-gpios = <&gpio 11 GPIO_ACTIVE_LOW>;
 	bus-width = <4>;
 	wp-inverted;
 };

-- 
2.51.0



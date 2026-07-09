Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 418B3C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 14:30:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G9SS4RRFgejIsvLMPbiWVv9A7y7YkOLri9IbuCYhP2U=; b=iZtyq2m6h+7j8+4A2mccouPPdm
	h2Dxs5dQEaJf7Lisi5+KnYeCleTPtn8YC/MYCZVpOnBt8olr22gv2TBz5/oHgtyecFmvasyBEdfJR
	RkFc6//rq1SEOXXWF+HH+DIgE5ewMB0tER2BbWEf+bTYwNBJYLVrd9L/GOds5g7NJjcBQhgkeVVlN
	0Qr0lSmonqmtYRmvY4WE4MJnTzrrzncFCpcA34KH22htW17oCTY+tDScWvcwEwDnuUJco3jNJt2CD
	LIndhVurziscI7Wg795nZtnvPOMLRQxhPb4JSavZHkGNef7bopIHJs6ZunX1f9SdnQ1qFMnXtYAHt
	Kna0XO3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whplw-00000002lfo-0JZV;
	Thu, 09 Jul 2026 14:30:40 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whplu-00000002lf3-24Pc;
	Thu, 09 Jul 2026 14:30:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id AF0E261385;
	Thu,  9 Jul 2026 14:30:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5A9A1C2BCB7;
	Thu,  9 Jul 2026 14:30:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1783607437;
	bh=zKNYhWho75+rU/ABdikQ1xUai+mDK7/BIyEbsmIRsHo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=D0dMSXbb+k6nwjW3MWTkcPR/co+JjqhIn9OnMv2FfAyyc4bX+3779YGy6u9f/yR1J
	 HvCwsm1cMjXKwkH2qcYWNTuIaftDjdwNuJuqU2OggP0s55J9YNFPuYj1SU1yv2OnyQ
	 NnjlLxxaTv5OkYyH+BDolW+2QS7seRtwcetE6QkWs1TQaaZd8WbuxmwxiVWsuQ4KMv
	 OqT6QgIq79XltKAHjF32Mp+96BomT8j0YhCQLwaxWAzpOcft3ddDdBOdSvT+YQt3ka
	 xqNF7CU4nlPU/xMDDNSV7zefow9jf9Dgi7ytN3z1diF6ZfYg7As6AhQwvQSq6kUEQQ
	 n7Jb6m7h/Q+2A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CA92C43458;
	Thu,  9 Jul 2026 14:30:37 +0000 (UTC)
From: Roman Vivchar via B4 Relay <devnull+rva333.protonmail.com@kernel.org>
Date: Thu, 09 Jul 2026 17:30:28 +0300
Subject: [PATCH v2 2/2] ARM: dts: mediatek: mt6572: add cache data
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-6572-phase1-v2-2-1fd4a69542ab@protonmail.com>
References: <20260709-6572-phase1-v2-0-1fd4a69542ab@protonmail.com>
In-Reply-To: <20260709-6572-phase1-v2-0-1fd4a69542ab@protonmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Roman Vivchar <rva333@protonmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783607435; l=1386;
 i=rva333@protonmail.com; s=20260510; h=from:subject:message-id;
 bh=yG+0dUgYSF3RJV8lkKqGeDWHiS5d4OCEqF8neCRE0Ic=;
 b=uJvq72ISmk7+HZwoFzlOX0oC9zEZkyJaY/VNERaq99Lj8xDakWjSGVO13sDJNpVhD6hPwJtD1
 I9dPTHZkiABAY0rBnXD3L9pdc0xFRox8VcmnpFqg3tTYug7J79J64Sl
X-Developer-Key: i=rva333@protonmail.com; a=ed25519;
 pk=zww/nWjBGoQ4POXCG0BV6fx2iuXK6jx77rsKPA5YK5Y=
X-Endpoint-Received: by B4 Relay for rva333@protonmail.com/20260510 with
 auth_id=777
X-Original-From: Roman Vivchar <rva333@protonmail.com>
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
Reply-To: rva333@protonmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Roman Vivchar <rva333@protonmail.com>

MediaTek mt6572 includes 32 KB I-cache and D-cache, and 256 KB L2 cache.

Add information about cache size, cache line size and cache sets to the
devicetree.

Signed-off-by: Roman Vivchar <rva333@protonmail.com>
---
 arch/arm/boot/dts/mediatek/mt6572.dtsi | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/arm/boot/dts/mediatek/mt6572.dtsi b/arch/arm/boot/dts/mediatek/mt6572.dtsi
index fa0e5df766c2..4d5d3b46bc18 100644
--- a/arch/arm/boot/dts/mediatek/mt6572.dtsi
+++ b/arch/arm/boot/dts/mediatek/mt6572.dtsi
@@ -20,11 +20,34 @@ cpu@0 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a7";
 			reg = <0x0>;
+			i-cache-size = <32768>;
+			i-cache-line-size = <32>;
+			i-cache-sets = <512>;
+			d-cache-size = <32768>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <128>;
+			next-level-cache = <&l2>;
 		};
 		cpu@1 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a7";
 			reg = <0x1>;
+			i-cache-size = <32768>;
+			i-cache-line-size = <32>;
+			i-cache-sets = <512>;
+			d-cache-size = <32768>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <128>;
+			next-level-cache = <&l2>;
+		};
+
+		l2: l2-cache {
+			compatible = "cache";
+			cache-level = <2>;
+			cache-size = <262144>;
+			cache-line-size = <64>;
+			cache-sets = <512>;
+			cache-unified;
 		};
 	};
 

-- 
2.54.0




Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 774A5C43458
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  4 Jul 2026 19:21:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JGgiWXJNS4hqvmIJPvOtAPs9Wwg2oZlyqbXWGMcSc4g=; b=dAKl+csvvSquLfiQBPaRGKS6MP
	l8qR4vD1xAV0kYNjaTUHccwirrctpnW7MpjnvON+KiG4nh0jNpUiYQF+tS7KO+Mv/SlBROYq7Ipr8
	olSvHAJiMjXK+CxaMOArxG5pIpEP/OMmjjV7WeLU65Eg69ZwoKwf5RCeiFMsw72lenQoydoqGYYTh
	IEkquejFoMNocsQtzVeiL7yOow2vYp7Po6qXNRpU4IWPUcChvxy0aeoRJrYRfUjk4QBJCtuEE1S4n
	qV05icqzHPpgjWryiy+dXHfJOugqw2wp1NdcvtroYiQqtmU5vJ+yO6HhQQaBlrOjIsHD6p1xasaI6
	zbl6Gj9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wg5vx-00000008hRM-0Gah;
	Sat, 04 Jul 2026 19:21:49 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wg5vv-00000008hQf-32Mz;
	Sat, 04 Jul 2026 19:21:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6A9B26136D;
	Sat,  4 Jul 2026 19:21:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 05023C2BCF5;
	Sat,  4 Jul 2026 19:21:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1783192906;
	bh=9DFNETMVj1y6LqC/8kUN3WRmPvqY/OPjVK2Q0keBtQY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=KTTKJ3Wo1+iTpUO6RLNmFPhaZcHopQhdx3qcxxzYSYkhEP1jZRDlR7sUJBD9jSmuU
	 6jFWG003Y9IJM4hqYWoBQY86wkKzNklI/tIvCbLDbmY8XhnCqkZFwXmEXemf7365a0
	 WMbe/P9DbaIubW13XVp9lEWXeP6rdDrX1awILgD1BotVEMuBgWMpoyfFs2xzl43/mp
	 NlOU2W3C85iamvyCMS9AtLlLpMbvFB7h0YhuHeQujWDThKtDRD3YQxJaPYUICYxPYs
	 L0OLZIP4EVPXdXlR9gU577rgPgLyl3wk0fScB7rUigtP/PfQZ6H+9YuayEa0fnaHKU
	 HXeLotrmYwQeQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB2AEC44501;
	Sat,  4 Jul 2026 19:21:45 +0000 (UTC)
From: Roman Vivchar via B4 Relay <devnull+rva333.protonmail.com@kernel.org>
Date: Sat, 04 Jul 2026 22:21:43 +0300
Subject: [PATCH 2/2] ARM: dts: mediatek: mt6572: add cache data
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260704-6572-phase1-v1-2-61c2fe6be19c@protonmail.com>
References: <20260704-6572-phase1-v1-0-61c2fe6be19c@protonmail.com>
In-Reply-To: <20260704-6572-phase1-v1-0-61c2fe6be19c@protonmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Roman Vivchar <rva333@protonmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783192904; l=1386;
 i=rva333@protonmail.com; s=20260510; h=from:subject:message-id;
 bh=SDakxdcc7QkbCtbafL/keArn3jI3hsMDqsWxhluf3lA=;
 b=D6OZSx1nW4RarZ2Josaqo2/lJX3OtNQVawPvXYZ6zqjyvMR9rd8EDHavRzVnU8ZJGSlS5jPk8
 qV0iizoUJQRDBHuwp3dg0lIrPrwJg3+6W0GS5SHerkv6m32DIAxNnSI
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
index fa0e5df766c2..5716505dc9e4 100644
--- a/arch/arm/boot/dts/mediatek/mt6572.dtsi
+++ b/arch/arm/boot/dts/mediatek/mt6572.dtsi
@@ -20,11 +20,34 @@ cpu@0 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a7";
 			reg = <0x0>;
+			i-cache-size = <32768>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <256>;
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
+			i-cache-line-size = <64>;
+			i-cache-sets = <256>;
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




Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67FE4C61DD9
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 30 Aug 2026 14:22:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mSUYoKET9ZpnCvSP4jO/UsK2H+X54S3etdTbIc3/t4g=; b=Qtuy+ELrthzkWu2eCubXLQYxCY
	kbibuyhpCuarMmnqMTtcvIsUtxzaznvIcYSG58uyEhicdPDBKCdF/OcibOU7cjo39KKXaQvDKmZUG
	K12+0pbICzxlmNzqV5eMX8BtgUmQfxiHKiHpmodxAhfZ5YI/H7T0SyEesVfyoj0x7o44mfBo+0Bao
	5Qap+1cQLR6sihPKuxFInyDyjL4P5hOSWKxWj6iOxVw/XF40wM1SAhyfSgTl7Eu05PCjUda9Tshn5
	xa1EthfcMbaB2Ggp/W/u5W67YPmLDIR5PurVGAqAx48P/AZeaZ9Ljcn3L76Jqgd1RbGCKw3DM5OCE
	DJHJnkAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0gQT-00000007n9S-2Yz4;
	Sun, 30 Aug 2026 14:22:25 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0gQT-00000007n8x-0vRy
	for linux-arm-kernel@lists.infradead.org;
	Sun, 30 Aug 2026 14:22:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E8DE043C9B;
	Sun, 30 Aug 2026 14:22:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C3924C2BCFB;
	Sun, 30 Aug 2026 14:22:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788099744;
	bh=XZr0dTCOqATFprJYOJpR1NmA5rDqYT2PR4Gt5cOZ5Qw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Ivy13M/qWsYgF5IE5uJy3xqW8lzedyJYUMPUQ4v+h2M8BLYa4KP1JaS8D9N1YVpug
	 8iqR/k7ss+Mtg/9eddKMnMKPZb6y2EddU+FPyhuQsmKDkmFilRRYbFmj98b3Fmredw
	 D4deM8YXIAn96ZQh3huhE52C4u8GHcnmxdyfZ1HH2W68nJmSmGPb8Y+cF6bfiqOMQ8
	 2R5dBrd1HSl8tTmMkyXrUSfkmxZBQZaXx3aOq8ETEPE2aVHsYJPJOMVteKPWwmINU1
	 svNx2Z44567TlagbvYinPXlaX3zdtFJyHo4DOmx0DR9lm6gMrARtOa1BsnYO8zJogq
	 rR+csyOZrZXpA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4151C61DE1;
	Sun, 30 Aug 2026 14:22:24 +0000 (UTC)
From: Sven Peter <sven@kernel.org>
Date: Sun, 30 Aug 2026 16:22:07 +0200
Subject: [PATCH 1/3] arm64: dts: apple: t602x: Fix cpus node indentation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260830-b4-apple-dts-fixes-v1-1-cc20f8445754@kernel.org>
References: <20260830-b4-apple-dts-fixes-v1-0-cc20f8445754@kernel.org>
In-Reply-To: <20260830-b4-apple-dts-fixes-v1-0-cc20f8445754@kernel.org>
To: Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, asahi@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Sven Peter <sven@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=756; i=sven@kernel.org;
 h=from:subject:message-id;
 bh=XZr0dTCOqATFprJYOJpR1NmA5rDqYT2PR4Gt5cOZ5Qw=;
 b=owGbwMvMwCXmIlirolUq95LxtFoSQ9YUm7kmNy8dzdjSoX58y4TUN1HtkV++B7ua55Q8OKSjG
 KzNyqbYUcrCIMbFICumyLJ9v73pk4dvBJduuvQeZg4rE8gQBi5OAZjI6xJGhhezXC/K8afdsWvi
 OeZz/Hc+s3finpPHnm1YK/ouktWg8hrD/9Ifmww4VJ7cOnPqtJnOdQe9iW1rP/985nz1zN2XPYr
 ScWwA
X-Developer-Key: i=sven@kernel.org; a=openpgp;
 fpr=A1E3E34A2B3C820DBC4955E5993B08092F131F93
X-Endpoint-Received: by B4 Relay for sven@kernel.org/default with
 auth_id=407
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

Drop the extra space indentation of the closing brace of the cpus node.

Fixes: e1514f9b3755 ("arm64: dts: apple: Add initial t602x device trees")
Signed-off-by: Sven Peter <sven@kernel.org>
---
 arch/arm64/boot/dts/apple/t602x-common.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/apple/t602x-common.dtsi b/arch/arm64/boot/dts/apple/t602x-common.dtsi
index 9c800a391e7e..66b6f8347d19 100644
--- a/arch/arm64/boot/dts/apple/t602x-common.dtsi
+++ b/arch/arm64/boot/dts/apple/t602x-common.dtsi
@@ -254,7 +254,7 @@ l2_cache_2: l2-cache-2 {
 			cache-unified;
 			cache-size = <0x1000000>;
 		};
-	 };
+	};
 
 	blizzard_opp: opp-table-0 {
 		compatible = "operating-points-v2";

-- 
2.55.0




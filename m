Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43580C61DD9
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 30 Aug 2026 14:22:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kbo3h8xAlcRyBb7mEMMzHyTwF+ls5fc85yEI3FQrVaI=; b=CRCaF9d1rixesxoAPqszAHxPSv
	AA+vA+cLiFstGX9hna6zln3frpW5bn5oeHIAve+680/7HD8ZTK/SDmD6qtbLRa61PxFwxmimcGMTa
	fdKQkui8EobpFMSxNgQyy+2Gb2w979Hm5IEYs1//8Ye7rWQngGUIpNSigWsn+gBN7kk2541fpJ8HF
	k899ETXqIeZcWacGAFglYDIfW63ZHLF0YI2MHYLCeTf6xRRZ7WSrJ5rUfO/s/ptnucSpE/58hdjge
	UpeWoL4sNhgTm4hE20r3GSrBeFxPxLhEHnlOch31DBaATFIOgOifdjI7aUaQxL2jjuJTZ34PddWz8
	6GpzC+Ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0gQT-00000007n9a-34GU;
	Sun, 30 Aug 2026 14:22:25 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0gQT-00000007n8y-1Mii
	for linux-arm-kernel@lists.infradead.org;
	Sun, 30 Aug 2026 14:22:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id F045D43CBD;
	Sun, 30 Aug 2026 14:22:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D492EC2BD00;
	Sun, 30 Aug 2026 14:22:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788099744;
	bh=DzWRAVjSbOt2fmkIlgKACC5xJIcKFQRvLBJixPdk5hA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=nUbyPs9x+IH5ZG8ZYGCcgMBtQLqLS83gp1J7TIqi0XV2+/WvWBl+qF7x8yFw4qlwH
	 SSL9k8IUFkRLDpD9NWp8bezU1WhKHBtuQns4mxFI0KxrxREtVsjB+ohDp0KQxovWPJ
	 0ZrRYIkSAn5KhsScqFJ/gkj0oaBMw9yDVKfEHeKnzLkUr0Bll0p31LUDtEq03HsWzf
	 N2oadCLwTScAznLvho4jWm4usHd9EH8Ar+N903DApEofqAp9SO3qUCxV3zbzsFkxq+
	 lmUeAu1sH2ktnwTXvNa3amue7YU0im4rpGbNzKWGncm1eLyMlW+vK2QLXXxTnm4rm3
	 xR1lcyoWDUWAg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3459C61DD9;
	Sun, 30 Aug 2026 14:22:24 +0000 (UTC)
From: Sven Peter <sven@kernel.org>
Date: Sun, 30 Aug 2026 16:22:08 +0200
Subject: [PATCH 2/3] arm64: dts: apple: t6030: Fix cpus node indentation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260830-b4-apple-dts-fixes-v1-2-cc20f8445754@kernel.org>
References: <20260830-b4-apple-dts-fixes-v1-0-cc20f8445754@kernel.org>
In-Reply-To: <20260830-b4-apple-dts-fixes-v1-0-cc20f8445754@kernel.org>
To: Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, asahi@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Sven Peter <sven@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=702; i=sven@kernel.org;
 h=from:subject:message-id;
 bh=DzWRAVjSbOt2fmkIlgKACC5xJIcKFQRvLBJixPdk5hA=;
 b=owGbwMvMwCXmIlirolUq95LxtFoSQ9YUm3mTvpemPl/lYX/B4sD0ctmWj1UnfNU/z3FjDrUyk
 PNaXlXYUcrCIMbFICumyLJ9v73pk4dvBJduuvQeZg4rE8gQBi5OAZjIL1eGf+bdlj3PejY7LXt9
 atFhZUbblW+Wygpe+OAuobx/w+e5C5oZfjJemva5XKrzybOHq8o2TCg7XvvvXoWGwpRpbo3+281
 P7uMAAA==
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

Fixes: e81af013dbdd ("arm64: dts: apple: Initial T6030 (M3 Pro) device trees")
Signed-off-by: Sven Peter <sven@kernel.org>
---
 arch/arm64/boot/dts/apple/t6030.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/apple/t6030.dtsi b/arch/arm64/boot/dts/apple/t6030.dtsi
index dda9568af11f..5ff12edfc553 100644
--- a/arch/arm64/boot/dts/apple/t6030.dtsi
+++ b/arch/arm64/boot/dts/apple/t6030.dtsi
@@ -208,7 +208,7 @@ l2_cache_1: l2-cache-1 {
 			cache-unified;
 			cache-size = <0x1000000>;
 		};
-	 };
+	};
 
 	timer {
 		compatible = "arm,armv8-timer";

-- 
2.55.0




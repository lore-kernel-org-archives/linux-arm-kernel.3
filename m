Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82986C982D7
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 19 Sep 2026 10:28:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bKvunK026vxRkZOCURit8xyfDjxu2pYPqtre3/yOGa4=; b=uzP95SBi0ID9GUjw+/ewRcrOQF
	mCQe5541xFAEg5ThOz4VLAw6Z1+HgwxcYT1085A8LFXyyJ4RiiZWEeSmAp2YPjqqcUsWnc5jAZrqM
	i7eaK21kLPFYOIQxz86FMohbGm3UCy03XhW4RTBP/glFQ+t67IIeCuVykBKSmRcl0azygtOYRBIdG
	sX2f8v3w5yO3YQrQDIehD5gNe0nwrHFfgxH7O9OsRRjP0mccbLYWw8pG6msZbxBIGtjV2MP0POkLm
	VSRjkpNSRevENbPq5DrImj4CkdG8JJ0OiwGbtCS/KB3T/9EOMQY+c6Gf39d33/0IeeWWhhfrMiZhk
	UOxxojhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7sJ2-0000000GAeS-1ViV;
	Sat, 19 Sep 2026 10:28:28 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7sJ1-0000000GAdj-2liu;
	Sat, 19 Sep 2026 10:28:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9B2C7447A5;
	Sat, 19 Sep 2026 10:28:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5951DC2BCF7;
	Sat, 19 Sep 2026 10:28:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1789813705;
	bh=tuo9FTC9trpH9PTGtyXsmxAlQQNcjXaX7nP/LygpwVE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=jwFvZTGRmUC+k+oN6aF/64mcm5/dTwrKKBO4BmG2zNjSHm1VvKoi2Vd2yB2wwvhWJ
	 fBAA6YDspa84ZI8iy7uM9uwtxcLziZh21sK7o6+eNm8l5MLRPnUiuehzwnJdP1JNyz
	 cyEl+CSxfrCLYARIJUeFExL9HZpSIR+oZ7EVOdNQ7ttEjQQrrGME86neXXaKd1VFZ5
	 N+lZNfKNlyryi8LIo6uesEQeRI3pIyKs9pX+gnGPqJ8eywT/hEp/1IGTxef/MSDtNI
	 ui+LOUSdfy66yhx15sA9dJ0Kw+NOURIrOpA46LY7/LRzsBJDFsPtkbcxxMwysTDIw/
	 U8ylbA4LqWHnQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36CCEC982CC;
	Sat, 19 Sep 2026 10:28:25 +0000 (UTC)
From: =?utf-8?q?=E5=AE=89=E5=AE=B9_via_B4_Relay?= <devnull+HystericalDragons.proton.me@kernel.org>
Date: Sat, 19 Sep 2026 18:28:17 +0800
Subject: [PATCH v7 1/3] dt-bindings: arm: rockchip: Add FriendlyElec NanoPi
 R28S
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260919-r28s-upstream-v7-1-e80a6f8ef521@proton.me>
References: <20260919-r28s-upstream-v7-0-e80a6f8ef521@proton.me>
In-Reply-To: <20260919-r28s-upstream-v7-0-e80a6f8ef521@proton.me>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Chukun Pan <amadeus@jmu.edu.cn>, Jonas Karlman <jonas@kwiboo.se>, 
 jensen <jensenhuang@friendlyarm.com>, 
 Andrey Korshunov <razor1702@gmail.com>, 
 Diederik de Haas <diederik@cknow-tech.com>, 
 Conor Dooley <conor.dooley@microchip.com>, 
 =?utf-8?q?=E5=AE=89=E5=AE=B9?= <HystericalDragons@proton.me>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1622;
 i=HystericalDragons@proton.me; h=from:subject:message-id;
 bh=GjgiG/CwrGYA6nG9hPXid2MYCUCClI7qpstAQn8fUNs=;
 b=owGbwMvMwCUmepz3XUtTHjvjabUkhqx1ycdlp/poMgdu33paPfj0iRvdTS61+64sX2JaLHfRf
 7qgVW9rRykLgxgXg6yYIovspupIoVXRM4tYpI7DzGFlAhnCwMUpABM5Uc/wT/lQ1nMphfCFHz/z
 G5yNNl24NULE+t3uKE+JlFqpjthpfxgZfl6zswvNaqm3W872/J/n4y2q7z8Kb4l453N7C6fu/+Y
 adgA=
X-Developer-Key: i=HystericalDragons@proton.me; a=openpgp;
 fpr=1DB27B5912AA5B9972041AC715C70DEE84826E07
X-Endpoint-Received: by B4 Relay for HystericalDragons@proton.me/default
 with auth_id=1004
X-Original-From: =?utf-8?q?=E5=AE=89=E5=AE=B9?= <HystericalDragons@proton.me>
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
Reply-To: HystericalDragons@proton.me
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: 安容 <HystericalDragons@proton.me>

The NanoPi R28S is a dual gigabit Ethernet router board based on the
Rockchip RK3528 SoC. It shares its base devicetree with the NanoPi
Zero2, so fold both boards into a single RK3528 series entry, which
further RK3528 based NanoPi boards can join without renaming it.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: 安容 <HystericalDragons@proton.me>
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index 81744fbee9..dc69999862 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -347,6 +347,13 @@ properties:
               - friendlyarm,nanopi-r2s-plus
           - const: rockchip,rk3328
 
+      - description: FriendlyElec NanoPi RK3528 series boards
+        items:
+          - enum:
+              - friendlyarm,nanopi-r28s
+              - friendlyarm,nanopi-zero2
+          - const: rockchip,rk3528
+
       - description: FriendlyElec NanoPi R3S
         items:
           - const: friendlyarm,nanopi-r3s
@@ -388,11 +395,6 @@ properties:
           - const: friendlyarm,nanopi-r76s
           - const: rockchip,rk3576
 
-      - description: FriendlyElec NanoPi Zero2
-        items:
-          - const: friendlyarm,nanopi-zero2
-          - const: rockchip,rk3528
-
       - description: FriendlyElec NanoPC T6 series boards
         items:
           - enum:

-- 
2.55.0




Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA1B7C88E76
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 13:35:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uYPlcwymRS3ojaNDulwE4BlQzU075ap0p79R5VcdKVc=; b=S/hqUE13INdQ3UXBReP1dshOja
	4Nz3ULsd96xArGKPSEofSx9mGvmUXNiMng3kB1dD63DOUZ3ARw69t3s5ObeQHbpMukOaFSZEOYaDG
	TaS0nSDqgNQQPZLUIFmnqnNxv1AkGJF9qrSkty7T1Q66sORWatrsyb0ksz7tCu4cYlpBWHna9JlAx
	WCvwLcuF/ZsHvw1KACdXL1N5humXIMknBvI5upe1aafqFtwaYfcDbGgzgw1X2lTNACo5JytP6UM++
	uJtkr6EtmIZ0U+EDfi7EslKVGzXriH6XXp1Stetg30lObAbIiaAh1ltnsuOieZ/PYGJzqVIFwF5yi
	8xCgsbXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x66q0-00000003n3e-00ts;
	Mon, 14 Sep 2026 13:35:12 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x66py-00000003n2N-3jpe;
	Mon, 14 Sep 2026 13:35:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4F39D43903;
	Mon, 14 Sep 2026 13:35:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 23F4EC2BCFA;
	Mon, 14 Sep 2026 13:35:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1789392910;
	bh=SkfaGXmQEY5xHBDu4QnDfNDV0wqVF01smR5fjT/K4uc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=LLqDDLlrULmcvs6aYTI19vZaNm15qYtWstADfX02PkphnDL8W2nTDX3C3LRH9xUH3
	 LlM/Q7rXou9aqPMmcoW6s1B3dpfb7qriwXWxvDk91R03fjbD9hTEJHmYebivb6eaRs
	 g69GW+DuM6XL4/m1W+y+fruAGbs9ON163U+ZoGWIetqUXIJhFS1ay9c1LxwXqtUuFq
	 ChJFphmUMix4xrnLQp+aWm+Mq4cNnqcyJkoR8rZBmu4uVfdA+dWnpY0K1VRKFhj50n
	 O9mOXpj1VOgKFZs7OG+Q5qxW22RGF/BOQ3EBtvn3EWUgq6/KZl/71iBpT0WLIbMt31
	 y9r3dSdGOcyzg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2A7CC88E70;
	Mon, 14 Sep 2026 13:35:09 +0000 (UTC)
From: =?utf-8?q?=E5=AE=89=E5=AE=B9_via_B4_Relay?= <devnull+HystericalDragons.proton.me@kernel.org>
Date: Mon, 14 Sep 2026 21:35:01 +0800
Subject: [PATCH v6 1/3] dt-bindings: arm: rockchip: Add FriendlyElec NanoPi
 R28S
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260914-r28s-upstream-v6-1-ea9edd75c126@proton.me>
References: <20260914-r28s-upstream-v6-0-ea9edd75c126@proton.me>
In-Reply-To: <20260914-r28s-upstream-v6-0-ea9edd75c126@proton.me>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1524;
 i=HystericalDragons@proton.me; h=from:subject:message-id;
 bh=ukrn4M7rYY+NNZWj9jv6eu5CXunQ4mtIC9zTzcL2LVQ=;
 b=owGbwMvMwCUmepz3XUtTHjvjabUkhqzlP3ikwhaf+PBurlFc2vzoaGZHoR0X+JzOfzVMiy80t
 7qSFLKto5SFQYyLQVZMkUV2U3Wk0KromUUsUsdh5rAygQxh4OIUgIncOsjwP3o7+90Irp9fmBwr
 rpdKWN55uTlaxqxFYKLZq+lTrx5vNmb4n8DkmH93sv6WTDEuj6u6lX3luz/9Ytu0zmXCjpP/dB0
 O8AIA
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
Zero2, so list both boards in a single entry.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: 安容 <HystericalDragons@proton.me>
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index 81744fbee9..dc04946db0 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -347,6 +347,13 @@ properties:
               - friendlyarm,nanopi-r2s-plus
           - const: rockchip,rk3328
 
+      - description: FriendlyElec NanoPi R28S/Zero2
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




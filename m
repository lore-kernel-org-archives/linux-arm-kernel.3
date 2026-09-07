Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E45C9C79F89
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 14:14:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CUQrPzdg9Fwku+8OCzMzZH8Wv2NynzdwJhyMvSnn2PQ=; b=hPUVb3n7PHrYyc4RSoC51+LsO1
	SmyFtNph4m4Zt9VoFVZk2x177CdtILx/r6pU0k3bcpPTxCjxfdW94WR9FhUmaDe/Ln4zhwnU9UcLK
	mu0B+84FBjaDpU5j0ExWmb4PX9w/LXwdEoYkb0NbWOMcC/RUQ2czogQRgjLl4A1xi3Mcsomt7RTSF
	m4dJwxgvWVTsbiOKi0CvNLHYkSJxGWgqXEwEXbnlkuXxOtfoTDVHYMnaLcgMVNC2aqpGPClvrBDPN
	hGvS4GvokDW2dUPN0fc4cDe4R7wmfyank9jNVhRjJ2W88d4VApJZuOwfczwyPy0rhexXLVgD4SDCI
	W3MT6Edg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3a7D-000000071De-2l5G;
	Mon, 07 Sep 2026 14:14:31 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3a6z-0000000715G-1kpU;
	Mon, 07 Sep 2026 14:14:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 61E7260D87;
	Mon,  7 Sep 2026 14:14:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0AF2AC2BCC7;
	Mon,  7 Sep 2026 14:14:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788790456;
	bh=8Gwxp5aoWJUfNbbLdYN5LWeAcCfH1LcXcRH62cWgIps=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=jubPEiGNjDDwgik7Tz0Ccvj2+ItCjZZflXnctzuyJsu3YrJTg8LwjGbiVqaHEmsAS
	 zmu2zIvlrtJS99qPnYP1fx43eRLxi09BEQNuh6r2PDnoHg08HxxAX52BI58FkYr0WJ
	 oz+PZ00T2XDi41GRTGCD0l/0YNib+snzJ9ukxS2/AfJ0BAtxBGjVCnBOL7Z7yOmW8N
	 XHTfb/o68Wp3ZLsSD0e7b2jiOUS66u5XNvSCoViSJ36kuQNZFa+fuX+rwBq5s+N2K9
	 4F6VrVPUKD3FKKuYxigN3IGU6K47ZLUg/LyOvcf6cpS8eqOkrWJIVmi39TkpRJ218m
	 j5N9UWUzcr9kQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D93E5C79F9E;
	Mon,  7 Sep 2026 14:14:15 +0000 (UTC)
From: =?utf-8?q?=E5=AE=89=E5=AE=B9_via_B4_Relay?= <devnull+HystericalDragons.proton.me@kernel.org>
Date: Mon, 07 Sep 2026 22:13:55 +0800
Subject: [PATCH v2 1/3] dt-bindings: arm: rockchip: Add FriendlyElec NanoPi
 R28S
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260907-r28s-upstream-v2-1-21ab570fc91c@proton.me>
References: <20260907-r28s-upstream-v2-0-21ab570fc91c@proton.me>
In-Reply-To: <20260907-r28s-upstream-v2-0-21ab570fc91c@proton.me>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Chukun Pan <amadeus@jmu.edu.cn>, jensen <jensenhuang@friendlyarm.com>, 
 =?utf-8?q?=E5=AE=89=E5=AE=B9?= <HystericalDragons@proton.me>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=920;
 i=HystericalDragons@proton.me; h=from:subject:message-id;
 bh=LDAlcJQezbRbao3W92BQlWiQhp4bd/SQs/nEjmwyH1U=;
 b=kA0DAAoWFccN7oSCbgcByyZiAGqexraiZ5L7ToCkfpy8sawe5RyogUK47lmrosMUIKy1kgRej
 oh1BAAWCgAdFiEEHbJ7WRKqW5lyBBrHFccN7oSCbgcFAmqexrYACgkQFccN7oSCbgfRLAD/Q2T9
 KMFxgUqquC0UmhkV5yeXcW1ukQADSOjNBK+CCTEA/0EWfKl2yhK4z1JbJMWilZTOEPRJht2guaJ
 XNL4U0dwM
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
Rockchip RK3528 SoC.

Signed-off-by: 安容 <HystericalDragons@proton.me>
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index 81744fbee9..709e2cc44d 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -347,6 +347,11 @@ properties:
               - friendlyarm,nanopi-r2s-plus
           - const: rockchip,rk3328
 
+      - description: FriendlyElec NanoPi R28S
+        items:
+          - const: friendlyarm,nanopi-r28s
+          - const: rockchip,rk3528
+
       - description: FriendlyElec NanoPi R3S
         items:
           - const: friendlyarm,nanopi-r3s

-- 
2.55.0




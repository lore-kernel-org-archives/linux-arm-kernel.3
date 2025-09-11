Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A55F9CAC587
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Sep 2025 23:52:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kVVenQEf29ssjo3GFsfx4gsNc3Px1XG2phmosIfgBfs=; b=AxBMbpb6lzUnF9gb7kjiMiea3E
	PxG28jlY4JDM6p5Sh+nQDOCq9ZFlebD+XUAti9D1yJZX4NPbWv+tfaBwL3HsBwqq4RIdml88iqI2E
	/nrPD0u+GzY7NSwO14khdsB4HoB2A0NXWTgwyMNObB+sGiplGm2O5yhiNWRfrreOY8wkKyxDdDtrI
	2N6hz5KvGQNIU6Fhssm7En1jZmTltwaGj4hGJAUlxVZ1LgP8MvfrkHtkjjfkUoVYP8kDFOOKPM3OV
	EckeN13bOhpozGBgG8bhqjXmTibUbNzhOesUIA8HjbENKJJdOJMec2zN7Omfd/gzyNXm3JWE6Y63L
	8uXH9qSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwr5N-00000005xfl-3lXC;
	Thu, 11 Sep 2025 23:52:17 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwr5J-00000005xdO-1j5P
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Sep 2025 23:52:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9A41445049;
	Thu, 11 Sep 2025 23:52:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6C675C4CEF0;
	Thu, 11 Sep 2025 23:52:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757634732;
	bh=4LFV1aHLarA4np76ZFMKJQ2eFSAdju8E2jQoi5tSsOM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=rl/zhTvOOB/4ps9TniOup8Gsd0MohfhWY281Tg98+TXikzsMDvjfzU00KnnDPK+br
	 uioT+n4Ztk+cQ2TaB6td62jWd+e29tYiaS1GZluCF+abarEdH0xp1/PeWdyLrs9whD
	 JvR2lDIWqWfKcmpuuguuGty/KmZm9FBgDl5s4nmJQkjqBSQ0tX8NFmKAux60T79g67
	 7dpzPgLWNvCUdU7d6bUzmpFC2T81kubFJ2oDR50YF5HB4cTOLAKJIsQ/et/OOj0s8H
	 hiawAZSPa97+zq71b3eycj4/gP1l29uMLJuX+EidUt0A6HVhNZ2WoUJDFrInufszaV
	 Jh42PTNpBtLzw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C931CAC58E;
	Thu, 11 Sep 2025 23:52:12 +0000 (UTC)
From: =?utf-8?q?J=2E_Neusch=C3=A4fer_via_B4_Relay?= <devnull+j.ne.posteo.net@kernel.org>
Date: Fri, 12 Sep 2025 01:52:09 +0200
Subject: [PATCH 1/2] dt-bindings: arm: sunxi: Add Amediatech X96Q
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250912-x96q-v1-1-8471daaf39db@posteo.net>
References: <20250912-x96q-v1-0-8471daaf39db@posteo.net>
In-Reply-To: <20250912-x96q-v1-0-8471daaf39db@posteo.net>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757634731; l=1100;
 i=j.ne@posteo.net; s=20240329; h=from:subject:message-id;
 bh=4vwduiIPx4gIZNv7o5hxBa5Uq0ID3f0a+4J6CQ7VeRs=;
 b=u4hR9YAItZhZw9wjTyrYUtnXOHA5ksrnXQXlt/qdfsKd6Q58sNeQQfGFd8zR+5MJLO2FunhNn
 5dxn69HNd10CN720fFMNoytLp+8zyr0dhTndceuRPrFAzulIRKeB2aV
X-Developer-Key: i=j.ne@posteo.net; a=ed25519;
 pk=NIe0bK42wNaX/C4bi6ezm7NJK0IQE+8MKBm7igFMIS4=
X-Endpoint-Received: by B4 Relay for j.ne@posteo.net/20240329 with
 auth_id=156
X-Original-From: =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250911_165213_467817_740CECA6 
X-CRM114-Status: UNSURE (   8.28  )
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
Reply-To: j.ne@posteo.net
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: "J. Neuschäfer" <j.ne@posteo.net>

The X96Q is a set-top box with an H313 SoC, AXP305 PMIC, 1 or 2 GiB RAM,
8 or 16 GiB eMMC flash, 2x USB A, Micro-SD, HDMI, Ethernet, audio/video
output, and infrared input.

  https://x96mini.com/products/x96q-tv-box-android-10-set-top-box

Signed-off-by: J. Neuschäfer <j.ne@posteo.net>
---
 Documentation/devicetree/bindings/arm/sunxi.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/sunxi.yaml b/Documentation/devicetree/bindings/arm/sunxi.yaml
index c25a22fe4d25cbd8a8132689f1326548f7f43f2c..c9940b44bc888f7ab81ace671040bd663556c113 100644
--- a/Documentation/devicetree/bindings/arm/sunxi.yaml
+++ b/Documentation/devicetree/bindings/arm/sunxi.yaml
@@ -963,6 +963,11 @@ properties:
           - const: hechuang,x96-mate
           - const: allwinner,sun50i-h616
 
+      - description: X96Q
+        items:
+          - const: amediatech,x96q
+          - const: allwinner,sun50i-h616
+
       - description: X96Q Pro+
         items:
           - const: amediatech,x96q-pro-plus

-- 
2.48.0.rc1.219.gb6b6757d772




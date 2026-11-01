Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0321C606A324
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Nov 2026 22:01:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=K1zlxe8w;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PHl5hpS6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=HACswfW0Z9/TjG+zGW7wcxyXlL/3YQoIO6MSbN1Js8E=; b=K1zlxe8wqT9VhovGyLGK71YsRm
	aZV/0sEZhJiuHoEXamDqu+ahVYwhaWfgAk83FIHeKFNNEO4+L4LUy7NIkiXGwdzeqsnV8vrjR5+3a
	8INq1td21UYQuPY4hAukhaDlaOsUuySxd3+3gTLsvT/M55ARKyG3OAHywYIgZSjet4l8fFRy33Ytw
	pV0YmkjMF57w1NO2khlpSTgfBYs6ocOZZp1tMrSEBgvL86EyK7+9UKBF0jF8i9nHedApQ+W0LWtMl
	JD9jSm10vczXvWYdN4ufz1RV1o79pjZO5lDL9enbo20ru2XHfwYtMccBLk/dk4xTIXnwdQ2gtBh16
	FqGVjv8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNdc7-0000000ExOC-2PZa;
	Sun, 01 Nov 2026 22:01:19 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNdc7-0000000ExNu-04PK;
	Sun, 01 Nov 2026 22:01:19 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B112643940;
	Sun,  1 Nov 2026 22:01:18 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793570478;
	b=T+Zg0fZgKhAD0YNzvDB+FuV/sORhHGs7bPX56PADysXkbi1FekVgFkqr8z2DL/G1MUnc
	 k+ktiKFIfG/xaOgOSBYVAm3vOKEZoqV41zjeUF5bnx2yGJSYlgn5/ih2IJMpweFiT7/f2
	 WupsSXkkxUPxlwOtU83i1WqiRvXxHG/UL/KiZfwoO3fMNL70mrh6PBw6uSYDoJRTsoHew
	 ttZabkRyPm6pWuWZJPQXalAtXTEyK6JN7PVgZb7KZ8gSj6E0k2FFQKvLHpkzERhYJEUiQ
	 ds26rI4lW0IxUBImcJAe2EldOsxl/nA1732BZehjRwk7qmfrAppxO8BqV4x31kOB5Iw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793570478;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=HACswfW0Z9/TjG+zGW7wcxyXlL/3YQoIO6MSbN1Js8E=;
	b=j7nzdDrVzPJUzozFjdsvG4BGKwHDjjCIn4tel6uIhQlGHq+v1kewQ07KOyD8ZfaQTAdP
	 Qkkv448jhq1ETEH2RVEdAh2zM+7TJiPlZItxcM6YG9qqArZQcULiQFSUEjJ6Z+lL6Rb0K
	 zaSoaowzxaT/zo8kAIYlJPw2yiW/2G4YMzVcJqEFZNcpESGQ8ugC6b+I7/vcLUMvyGQMv
	 j0g6IzaoeB95gZkBmDxJ1WnedoGTGlzUV+2EoYKUW/PPMsAT9g4I5IthpDkBrT8fNPiUU
	 0HZcS3UH2siroJgK+F5MEoxmeyRs5o0HYBkd+sdecr2MqNIALwr0eAnJ3GtDnoUsQGQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 9393C1F000C1;
	Sun,  1 Nov 2026 22:01:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793570478;
	bh=HACswfW0Z9/TjG+zGW7wcxyXlL/3YQoIO6MSbN1Js8E=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=PHl5hpS6MvkEQIRh9DqqKe070Tr6z2uGvg4oKOSTZs4JfSSD4XiTCB9DUlFYWh9D7
	 GspZiULhBCklSGLbSXdN/ZzAYAGPnglC/Q+r5vfqWUKd7aJp5mTHDoCCKUYWHisTyJ
	 MyRbTKqt6i95KbHS7GcoENLZXeI7Fj8eYGf88BXA2OM/YzsMmDxSPQdQdekuOMm8g+
	 XvoXYx8nOrW39WklMmKEStUvDh3LTtj4zIknGOp98QJmVhursPiIzBKDiwR/1UOe5U
	 +RPMtxjsXYoSlHROU2n3vNbRLefGykaPcDwpgZM+GKZC3VVvLhuRTzxpzJNcksvgAu
	 z0pwfsQT9WOhQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 01EC3462A4;
	Sun,  1 Nov 2026 22:01:17 +0000 (UTC)
From: Joachim Eastwood via B4 Relay <devnull+joachim.eastwood.gmail.com@kernel.org>
Date: Sun, 01 Nov 2026 23:00:52 +0100
Subject: [PATCH 1/3] dt-bindings: arm: rockchip: add FriendlyElec NanoPi
 M6V2
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261101-nanopi-m6v2-v1-1-e401ea64b394@gmail.com>
References: <20261101-nanopi-m6v2-v1-0-e401ea64b394@gmail.com>
In-Reply-To: <20261101-nanopi-m6v2-v1-0-e401ea64b394@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: Shawn Lin <Shawn.lin@rock-chips.com>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 Joachim Eastwood <joachim.eastwood@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793570476; l=940;
 i=joachim.eastwood@gmail.com; s=20260701; h=from:subject:message-id;
 bh=xVk4B1jOv3LSCGkGw0hfHKz0UpvYSO+VAerlPGw1LtQ=;
 b=1mnT3U+SfryHw8PD6flAr0YpAYDOqd7y4ItNbI9+cvvhiUyPQZK96kHFiqFMeoXVdQK9JEEpV
 O6aDLzIO3pJAyoBzN5N41PkbDHBONZZomYLUf1G1aZVzNLZtb3pDxWJ
X-Developer-Key: i=joachim.eastwood@gmail.com; a=ed25519;
 pk=ZN/8xWtdYaSd5oEfloYSZ1a+/ri0n0VZqjlEeHlbXFU=
X-Endpoint-Received: by B4 Relay for joachim.eastwood@gmail.com/20260701
 with auth_id=846
X-Original-From: Joachim Eastwood <joachim.eastwood@gmail.com>
Content-Transfer-Encoding: 7bit
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Reply-To: joachim.eastwood@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Joachim Eastwood <joachim.eastwood@gmail.com>

Add device tree binding documentation for FriendlyElec NanoPi M6V2,
a single-board computer based on the Rockchip RK3588S SoC. This board
is an updated version of the original M6 board with a few changes.

Signed-off-by: Joachim Eastwood <joachim.eastwood@gmail.com>
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index a24949b163cff..70d78f7f8c559 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -392,6 +392,7 @@ properties:
         items:
           - enum:
               - friendlyarm,nanopi-m6
+              - friendlyarm,nanopi-m6v2
               - friendlyarm,nanopi-r6c
               - friendlyarm,nanopi-r6s
           - const: rockchip,rk3588s

-- 
2.56.0




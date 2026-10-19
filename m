Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D904DCCA490
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 00:40:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1ubToMYPgeXzwND+WEjLZ6Js1QGhXnSe+FQb+2FPXbE=; b=JX/IZsnAxGm9ALKEJrMj8QB7lp
	qZGLPbDykWlhKARB8aIzcY9XJJG98HBcnqFJm8baFw82eb1dv9YCHEPHv4j9YXbfayqN0E4krH/rE
	+hFeS0KjQCIVSQQf6LpParAxpHlPi0/arWt97ddE/6vpfhh+fg2csj+bAhvwTWMpYkDQf7GhNHBGm
	d/5L+aaFM6HmNGKu3QR814fTKKUxhBFqH4vQT12HiP3u50BSAjXWDGt/pw7++u6ljjvO4KMpi2JTc
	PAtMksRUpCZ5GRWVRUQVSfW3MHLqwKdXQZEjsiBGn53rvaN1AV6eXzC3HrljRrDDXIS+mydgoKpfH
	4C0LT9XQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIbQj-00000006LFE-2ZCJ;
	Mon, 19 Oct 2026 00:40:45 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIbQi-00000006LDV-26nw;
	Mon, 19 Oct 2026 00:40:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8B0C5447F7;
	Mon, 19 Oct 2026 00:40:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5B909C2BD05;
	Mon, 19 Oct 2026 00:40:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1792370443;
	bh=xFq2x/aqRztmAOrFFHAVPQmHYPuRBQTar4Aj32EZfGw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=QYIH1b6/lIFsj6LEoOhqJF8IfxaM6E14NztS70ZmBgSuj/2pVtUY0mO656IUAHUvl
	 8iP8cB1lGFkVL66/wu+KI7MTkfdK+ogCrtqj/ZwnfvT4rP0o2MempiOLMPrxcMAGdu
	 /ZAIKkdFcEyaDXbLx6fZT3awv5m/ykooTjOgknK0htM4XFHIdsriuvuFIHLX8bE1sp
	 ZjgdjT0IaHPCEwX97K7VuR5lHDHzLpNNER/akfJQjCs/EzBEAQBmIopqMlD1qT+K++
	 Kd2yRixYdT7+qVmDhUoybOcC0UXYEgrDKJuS8xA6Fp8haz1MBPpaV2PDopHzkaOb6z
	 sWbug3TCSOBPg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4268CCCF2DA;
	Mon, 19 Oct 2026 00:40:43 +0000 (UTC)
From: Ben Grisdale via B4 Relay <devnull+bengris32.protonmail.ch@kernel.org>
Date: Mon, 19 Oct 2026 01:40:00 +0100
Subject: [PATCH 4/8] dt-bindings: serial: mediatek,uart: Add MT8163
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261019-arm64-initial-support-for-mediatek-mt8163-soc-v1-4-f2462b2d2437@protonmail.ch>
References: <20261019-arm64-initial-support-for-mediatek-mt8163-soc-v1-0-f2462b2d2437@protonmail.ch>
In-Reply-To: <20261019-arm64-initial-support-for-mediatek-mt8163-soc-v1-0-f2462b2d2437@protonmail.ch>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sean Wang <sean.wang@mediatek.com>, Thomas Gleixner <tglx@kernel.org>, 
 Radu Rendec <radu@rendec.net>, Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-serial@vger.kernel.org, linux-watchdog@vger.kernel.org, 
 Ben Grisdale <bengris32@protonmail.ch>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792370441; l=917;
 i=bengris32@protonmail.ch; s=20261018; h=from:subject:message-id;
 bh=bqpoWOz5GryrI2HN8kHkj5zmoQrbZs18JhW/gGNozgE=;
 b=pY5JB788jlgfUUPbGOrgKX3YZvvIGTDJ3RA+0cCdLeSM0vOOD6IRRKZ7ZMWU1ekwIniBZqGUR
 68JwQqqUL4DBzLi3I+JzVJMDoFKp35H0ZERWDxmEnKGxMoG/zGXs6Wy
X-Developer-Key: i=bengris32@protonmail.ch; a=ed25519;
 pk=4ewFRC2yNph/tXokHVzIDlgOA9Hxecf1AlBuD4eOnaU=
X-Endpoint-Received: by B4 Relay for bengris32@protonmail.ch/20261018 with
 auth_id=1233
X-Original-From: Ben Grisdale <bengris32@protonmail.ch>
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
Reply-To: bengris32@protonmail.ch
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Ben Grisdale <bengris32@protonmail.ch>

Add a compatible string for the UART controllers on the MediaTek MT8163
SoC, which are compatible with the MT6577 UART.

Signed-off-by: Ben Grisdale <bengris32@protonmail.ch>
---
 Documentation/devicetree/bindings/serial/mediatek,uart.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/serial/mediatek,uart.yaml b/Documentation/devicetree/bindings/serial/mediatek,uart.yaml
index 5bd8a8853ae0..11801b58f637 100644
--- a/Documentation/devicetree/bindings/serial/mediatek,uart.yaml
+++ b/Documentation/devicetree/bindings/serial/mediatek,uart.yaml
@@ -43,6 +43,7 @@ properties:
               - mediatek,mt7988-uart
               - mediatek,mt8127-uart
               - mediatek,mt8135-uart
+              - mediatek,mt8163-uart
               - mediatek,mt8173-uart
               - mediatek,mt8183-uart
               - mediatek,mt8186-uart

-- 
2.56.0




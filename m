Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED10CCCF2DD
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 00:40:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Nn+V9t1PELaizRF/AoG9gO3G2xspyApIsm6lYreLqh0=; b=1LV8N3pVFVANB4hbAbWJ8ix7AS
	YEDQ0hHvPKocUQb21JEJMP0x6AFSRlmWBr7uId+QAw0FZ+IwANQLdfoY70se4tmJzaYa3f59eLZzq
	DqNH3XXp0H2Jf05uOxPqvDV2gHryXMMXJmTGYr/5X4RkCWQOEOeiOiJA33VEEd0Rx/BZmfktDxzJn
	73V9NDNyXJEmKpT0rUwvpLVIRxZwEmuoQoUz0RpL/4+1yp98Uvy53lMSiVsyNtrfa67+XzuaI7FbW
	xEu+RUSHCfUY/OuHB+gtwaiBLP9XAmbQk33OJylfje/6rMR6qf64X17ZKSjUTNCB9j7HALtIW83iT
	BargVQaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIbQj-00000006LEp-1FrY;
	Mon, 19 Oct 2026 00:40:45 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIbQi-00000006LDT-0RNy;
	Mon, 19 Oct 2026 00:40:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7AA00447BB;
	Mon, 19 Oct 2026 00:40:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 449F8C2BCFD;
	Mon, 19 Oct 2026 00:40:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1792370443;
	bh=jznJ0Z7RYsRj9sXHfcC1phHU7GFTQm+3wdEjEdHvxUk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=NQd+uDF97j4rrMsbJpW7xxI88ff8Okb8JuHDG0H9RfGlyqhkJI4eNrFYXTkd/2iXe
	 k7nKMXFkiBFQQmPHKAyH2rSICjTTb2co+2mmZxCuPITCaPEpES8HiKuCNyCENoGYqz
	 xHN1qh+7UtFp2+LddMJ/OQJCrqVDJzE1TD+peZJ0ILUdkZOR716C0g7mg36B6Hl2D3
	 MDRc2Qwbr6fOllH3CvUL2VO0XmD8CyFwkRV8T71LWlQWJnw4gHHO03OZ7GLHNeUARS
	 lfNENZi9ki36n9Kg/HJEMQQaWLkuTlj1YXIjCwFPTAhfDzQ47irngiFvqmg1q56166
	 6W6ziEGkQYDpQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F698CCF2D8;
	Mon, 19 Oct 2026 00:40:43 +0000 (UTC)
From: Ben Grisdale via B4 Relay <devnull+bengris32.protonmail.ch@kernel.org>
Date: Mon, 19 Oct 2026 01:39:59 +0100
Subject: [PATCH 3/8] dt-bindings: timer: mediatek,timer: Add MT8163
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261019-arm64-initial-support-for-mediatek-mt8163-soc-v1-3-f2462b2d2437@protonmail.ch>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792370441; l=938;
 i=bengris32@protonmail.ch; s=20261018; h=from:subject:message-id;
 bh=3xuTm8KVqqOy+c6wEveW1qrzh5JMWbSUP68J1edcFPE=;
 b=5xxeKM3jCTOI/3iVDXFYvJrKS+VRr9DQVdy5HzvvIIUdOf8zZbPJoalhzEb8LxpZBVaw8gLSe
 VnqCvW4kL+GAsCr+0wnFHM4Lp4LWHUWe4f6fFjCvvUctZsyKsvd/EIQ
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

Add a compatible string for the general purpose timer (GPT) on the
MediaTek MT8163 SoC, which is compatible with the MT6577 timer.

Signed-off-by: Ben Grisdale <bengris32@protonmail.ch>
---
 Documentation/devicetree/bindings/timer/mediatek,timer.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/timer/mediatek,timer.yaml b/Documentation/devicetree/bindings/timer/mediatek,timer.yaml
index 337580dc77d8..fcf4303e1426 100644
--- a/Documentation/devicetree/bindings/timer/mediatek,timer.yaml
+++ b/Documentation/devicetree/bindings/timer/mediatek,timer.yaml
@@ -34,6 +34,7 @@ properties:
               - mediatek,mt7623-timer
               - mediatek,mt8127-timer
               - mediatek,mt8135-timer
+              - mediatek,mt8163-timer
               - mediatek,mt8173-timer
               - mediatek,mt8516-timer
           - const: mediatek,mt6577-timer

-- 
2.56.0




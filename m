Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 946D6C7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jul 2025 06:10:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WoVGFtSX0aw4O03mb0XIG7BE8H47lJYeCCa9lQZ4dcY=; b=vGIbJsoAcvSduHyq4tUI3xQo65
	uYWmXRSalfzvK29+1wwpkLLDT4kb9PWCkH/QhyR+FHsDxooLaRQr6nIqOKb7ZJgRA+Mh5EwxonOC4
	trsTTAc8tXT4XrEJVgNIhU5QkvMwG3ua3oaEqkcEpoRcOn1lP1wqxz1nS2rd7BqFTGqVDyz1yAnoa
	FIZktiwrNwl2SB/fWXFOds/Pb2G1qVOXlFiVZ9c9shqBmHYzz7u8/FM3CITioGAFgpaiSqCXOVK9i
	tLypcqeplpaPKEgTE9wGvHFRwMLouQgMRcqmWopguPP8GirO59din5N3IFFLLVnKY7a/nS3hHF3Pl
	oFTFvsUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWUCQ-0000000473i-19tD;
	Tue, 01 Jul 2025 06:10:34 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWU8x-000000046Kn-2mNk;
	Tue, 01 Jul 2025 06:06:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1DDB56114D;
	Tue,  1 Jul 2025 06:06:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B9C21C4CEFA;
	Tue,  1 Jul 2025 06:06:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751350018;
	bh=DxOrqNd9oLxm5FY8Ovl6KbdgdkoW49USz3S5Sld0MXQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=KoIoAACEUXdwHKdrGfMsfgDhsxk87V+G9Gp1Sw7U6SBEa9Qujq/sI0YJ3+AOfXz9H
	 DLFGNw9p5V99YZj1gJUM2NUl4qHrnTZ4g4arZP0GD+7lvetf+R6su8JsGJwgljGhR5
	 7ckT0lbZrJuTxyH2QbHyQ5T1anm5PdqBLG4j59eL0F7dudNxp/e+y82/DOWBUaeJjz
	 mh6w/AiC6766gyFRv3XwnVcO+/AqcmNuIjXKfqyTSE+0o7nM68YIOpdrOe43d9s59R
	 e4xpBw3RUmOU7DlfhSIuEr0uEToQqJkIR+3GBiT40KR20qq0jUHgFjVXGgDsv2ZY/n
	 MpArcaT/dYcZQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE534C83039;
	Tue,  1 Jul 2025 06:06:58 +0000 (UTC)
From: Max Shevchenko via B4 Relay <devnull+wctrl.proton.me@kernel.org>
Date: Tue, 01 Jul 2025 09:06:58 +0300
Subject: [PATCH v3 04/11] dt-bindings: watchdog: mediatek,mtk-wdt: add
 MT6572
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250701-mt6572-v3-4-8937cfa33f95@proton.me>
References: <20250701-mt6572-v3-0-8937cfa33f95@proton.me>
In-Reply-To: <20250701-mt6572-v3-0-8937cfa33f95@proton.me>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Thomas Gleixner <tglx@linutronix.de>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, Sean Wang <sean.wang@mediatek.com>, 
 Russell King <linux@armlinux.org.uk>
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-watchdog@vger.kernel.org, 
 Max Shevchenko <wctrl@proton.me>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751350015; l=1060;
 i=wctrl@proton.me; s=20250603; h=from:subject:message-id;
 bh=Kx6Ejx/Cft8/1a8kT4GCe+0clOZmBvvSMcY6Pz+w9ns=;
 b=w/ZSBp4OkkN0nA2Q0i61ITfsGFxbNPPxmrLjw5wEKf3qNaoCx+rLVOLcwmNSb1iBJIjfQMX/O
 5pCk6TOcU2QB8JWmWdQ5LPXXnvNAZb5nnEGmOkkjd3vjk6Kr3UzRS3A
X-Developer-Key: i=wctrl@proton.me; a=ed25519;
 pk=JXUx3mL/OrnRvbK57HXgugBjEBKq4QgDKJqp7BALm74=
X-Endpoint-Received: by B4 Relay for wctrl@proton.me/20250603 with
 auth_id=421
X-Original-From: Max Shevchenko <wctrl@proton.me>
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
Reply-To: wctrl@proton.me
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Max Shevchenko <wctrl@proton.me>

Add a compatible string for watchdog on the MT6572 SoC.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Max Shevchenko <wctrl@proton.me>
---
 Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml b/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
index 8d2520241e37f0e8a7526cbc99d5aa0d4edc9a55..ba0bfd73ab62a86befead007d4b7d2a870b81a0c 100644
--- a/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
@@ -34,6 +34,7 @@ properties:
       - items:
           - enum:
               - mediatek,mt2701-wdt
+              - mediatek,mt6572-wdt
               - mediatek,mt6582-wdt
               - mediatek,mt6797-wdt
               - mediatek,mt7622-wdt

-- 
2.50.0




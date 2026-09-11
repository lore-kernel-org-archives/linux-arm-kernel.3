Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B23F2C88E58
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 16:59:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=03++u1hMJUN4CZOnETD7tedBCxAbjIXy0LEGbGeWhRE=; b=GOUGqnqjjSnN0JOamsL3LHtsjh
	3Z2OwEoobDFzvCgCYTNu2wYF37D/pe9uw2Ph1R4hW2TtAjwapqOfcaiZ6gKGiK7qshFwFab5othIm
	2N4RrRsj3IBFUuj642OYVJhkNJVSNshPjFIzF789PXgl2RQhYGRzfo3B0EV8oC70KzEvmSLf8zV2d
	tLnQelDvdjX0mxt1eTKW/yJ7uBJutT5GgPTi0I13TrQTDxL+VWhrOOorrlvbttsRSwiMKQAfRms4K
	9qrdw9zO4ORO9SKB5OCkqrHuGGy7028Ko4IdIfT2VWSHS/OEC+ByRmUSVl7ZySse3fcWsAPhYatzx
	3IdVnjoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x54b8-0000000HHMJ-3aQl;
	Fri, 11 Sep 2026 16:59:34 +0000
Received: from mail.cyberchaos.dev ([195.39.247.168])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x54au-0000000HHBI-3mBT
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 16:59:22 +0000
From: Yureka Lilian <yureka@cyberchaos.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cyberchaos.dev;
	s=mail; t=1789145944;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=03++u1hMJUN4CZOnETD7tedBCxAbjIXy0LEGbGeWhRE=;
	b=2ow8XYnlexIJTa++XuE6SrigvBbIqOQNk/EaVKNguwGKckb1wqBunE+9Qu9U/VqIUE8MY5
	vl1AyOhE40hmaFQjEMshux7J76r3mAs6rN5uCTvI+ehsChbGpG+NvcmcwCxhSPjsGNFDZF
	KywPxcUCYNzr2I41U9zlyaRLa0F1M+Q=
Date: Fri, 11 Sep 2026 18:58:42 +0200
Subject: [PATCH v2 5/7] dt-bindings: watchdog: apple,wdt: Add t8140
 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260911-apple-a18-pro-initial-devicetrees-v2-5-08d06cf011d4@cyberchaos.dev>
References: <20260911-apple-a18-pro-initial-devicetrees-v2-0-08d06cf011d4@cyberchaos.dev>
In-Reply-To: <20260911-apple-a18-pro-initial-devicetrees-v2-0-08d06cf011d4@cyberchaos.dev>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Sven Peter <sven@kernel.org>, 
 Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, 
 Hector Martin <marcan@marcan.st>, Thomas Gleixner <tglx@kernel.org>, 
 Radu Rendec <radu@rendec.net>, Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-watchdog@vger.kernel.org, Yureka Lilian <yureka@cyberchaos.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_095921_139076_675637B9 
X-CRM114-Status: UNSURE (   7.93  )
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
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

The watchdog on the Apple t8140 (A18 Pro) SoC is compatible with the
M1-M4 SoCs. Add "apple,t8140-wdt" as SoC specific compatible.

Signed-off-by: Yureka Lilian <yureka@cyberchaos.dev>
---
 Documentation/devicetree/bindings/watchdog/apple,wdt.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/watchdog/apple,wdt.yaml b/Documentation/devicetree/bindings/watchdog/apple,wdt.yaml
index ca4cf01db59f..1af924157f7c 100644
--- a/Documentation/devicetree/bindings/watchdog/apple,wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/apple,wdt.yaml
@@ -22,6 +22,7 @@ properties:
               - apple,t6031-wdt
               - apple,t8122-wdt
               - apple,t8132-wdt
+              - apple,t8140-wdt
           - const: apple,t8103-wdt
       - items:
           - enum:

-- 
2.55.0



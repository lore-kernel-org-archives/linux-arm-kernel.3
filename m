Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22581C3ABBE
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 May 2025 16:09:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sPGF4iJ89vQnNQWZ/GKp9JU0vVYLz0bowVMRVSbbC0A=; b=gXfoNsl4DkbXVgM69ncRYbzp6w
	hWvzFFTC0seNmWeyVQfH1YxzXD19ZmNpHGA6jgJlEXcKlCL5m4Fwd0svv/NCBvvFctrksnCm+5xBL
	9FJL/AWIyepQeQtvwS6xBmpDLjWcA77l68HQ4ZetAv76E2BAssHQwT2pqn7WKrhHVZI6doqhsbiAQ
	DfGEdPf9pypuA8U1uFKtzO4s7v466wSu3r+KuNI1ZCLwgzumOt8P4MURoYYVsq4MsgUrHdRW4vsEV
	POavtvs9ufedAXZ9kF2FCBh1tpBFkWgN1UoPgrZxP2FmQkGxy0GQEGulVqOd0shX7l2nfhgcRx2jy
	iReKH9kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD3nv-00000001F4Q-12mT;
	Thu, 08 May 2025 16:08:59 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD2tH-000000014eH-1Ify;
	Thu, 08 May 2025 15:10:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=sPGF4iJ89vQnNQWZ/GKp9JU0vVYLz0bowVMRVSbbC0A=; b=fzw9/zCMm7BFFW6M+Rin+6LZcN
	W9QO9NwoAAuF5xa5SROEeKGf8Kc4Xg88X599tnWsVzmcTqGCXoiwA67DMwjaJDXLlHqpBCVNSuqXQ
	uSzbQrxCEANmDQKqGAteGkJdV31qENaK6iPLnpOd5TeL9shIdboQ1dU0j2CVgLUBnc/csM2L39dcN
	7PqqCEvTfyRj54XzohpPJV//aHVnQe+xQbmXh/wDTfhpZuowTE3U7LoYt0pA//LLPk19sGQVv0RxN
	J2vB0psKHm2pdOgktQFzQbr8O6aesQUCmXRwQpHFA2m4jKhtPtvoqPrfCxtQWGQ5laKIBsxKu71YY
	v2nhCt+Q==;
Received: from i53875a1d.versanet.de ([83.135.90.29] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uD2tG-0005fP-0y; Thu, 08 May 2025 17:10:26 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: heiko@sntech.de
Cc: quentin.schulz@cherry.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Heiko Stuebner <heiko.stuebner@cherry.de>
Subject: [PATCH 5/6] dt-bindings: arm: rockchip: add PX30-PP1516 boards from Theobroma Systems
Date: Thu,  8 May 2025 17:09:54 +0200
Message-ID: <20250508150955.1897702-6-heiko@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250508150955.1897702-1-heiko@sntech.de>
References: <20250508150955.1897702-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_081027_347783_06DDC4A4 
X-CRM114-Status: GOOD (  10.09  )
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

From: Heiko Stuebner <heiko.stuebner@cherry.de>

PP1516 are Touchscreen devices built around the PX30 SoC and companion
devices to PX30-Cobra, again with multiple display options.

The devices feature an EMMC, OTG port and a 720x1280 display with a
touchscreen and camera

Signed-off-by: Heiko Stuebner <heiko.stuebner@cherry.de>
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index 6435c724e682..58af37b4d6b8 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -1119,6 +1119,14 @@ properties:
           - const: tsd,px30-cobra
           - const: rockchip,px30
 
+      - description: Theobroma Systems PX30-PP1516
+        items:
+          - enum:
+              - tsd,px30-pp1516-ltk050h3146w-a2
+              - tsd,px30-pp1516-ltk050h3148w
+          - const: tsd,px30-pp1516
+          - const: rockchip,px30
+
       - description: Theobroma Systems PX30-uQ7 with Haikou baseboard
         items:
           - const: tsd,px30-ringneck-haikou
-- 
2.47.2



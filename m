Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18388C0218A
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  1 Feb 2025 19:34:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GezYrVzu+YD7bTihqKHBeWrBY4Y7kTGdsfDTKSVrcYw=; b=Yb01ogV5FSg+QQ3fHSEUhHg4qC
	+USjIf+M1YMgbun28FWJt0DLxHWNAF/S2xfiK1usBCC8VyXrN23X32wJ5tm321J0gxuHHaiOTXAj5
	yWd3GFCewuWOak+lZ7KzoKCu8r0H4RO1mJ3MjpX1vF/OCzpeATpgXpOUksbIlvqAWy7Mz5DtQsEzX
	jn+TdrEbgvuHCKw/ggwPHZwkZGZiUbcp8PFieZDP4Jcusgym0VQsBICpoGYG+6to/zktoJSjjjUie
	cx0yXxfrDuWHkzJ6MTZ4cSNvScnTQVs83sY1i2pprunYzSSMk24I3n+qhYJzIby1DT6dMVPbiiYc1
	RxgCJWgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1teJG9-0000000D3lm-0Msd;
	Sat, 01 Feb 2025 19:34:29 +0000
Received: from out-172.mta0.migadu.com ([2001:41d0:1004:224b::ac])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1teJDX-0000000D3WT-2d5T
	for linux-arm-kernel@lists.infradead.org;
	Sat, 01 Feb 2025 19:31:49 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1738438304;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GezYrVzu+YD7bTihqKHBeWrBY4Y7kTGdsfDTKSVrcYw=;
	b=QsQ+wdcQIP4WYeJg2m4RJE1msXtINK9SDawNFkugGg5x7nY5AAH2vOzB/fFV/jX0GkHNP4
	xeZ09ZiJupGf6XYLiBra6ydyUtRjqj5t9wr9S1pbo2WcIJy3CpolAmQYS6hLQPREImQfaO
	k5EakChRlKVmilag9erNiBwLtAUOnZTcv+5tfzU2yEsikCerhjlpYA/5L7owizQs11KWyI
	mn/2GwU6rDV4wQIoF8p5gMtPteu2fmI5PgPEGglI3oVZo9cIBGE/WDP/5mDWoAengOU6pK
	YoKFZCMNTdbczwdzs0mmZ89ofmSjWMmx/btqFlOQdSPsf2MQZkieWkxlCSn5Bw==
From: Ferass El Hafidi <funderscore@postmarketos.org>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-amlogic@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	funderscore@postmarketos.org,
	~postmarketos/upstreaming@lists.sr.ht,
	Artur Weber <aweber.kernel@gmail.com>,
	Karl Chan <exxxxkc@getgoogleoff.me>,
	Christian Hewitt <christianshewitt@gmail.com>
Subject: [PATCH v2 1/2] dt-bindings: arm: amlogic: add S805Y and Mi TV Stick
Date: Sat,  1 Feb 2025 19:30:43 +0000
Message-ID: <20250201193044.28856-2-funderscore@postmarketos.org>
In-Reply-To: <20250201193044.28856-1-funderscore@postmarketos.org>
References: <20250201193044.28856-1-funderscore@postmarketos.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250201_113147_796050_0249878D 
X-CRM114-Status: UNSURE (   7.35  )
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

From: Ferass El Hafidi <funderscore@postmarketos.org>

Add support for the Amlogic S805Y SoC and the Xiaomi Mi TV Stick (aka.
xiaomi-aquaman).  The S805Y is very similar to the S805X, with just a
few minor differences.

Signed-off-by: Ferass El Hafidi <funderscore@postmarketos.org>
---
 Documentation/devicetree/bindings/arm/amlogic.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/amlogic.yaml b/Documentation/devicetree/bindings/arm/amlogic.yaml
index 0647851ae..3403362e0 100644
--- a/Documentation/devicetree/bindings/arm/amlogic.yaml
+++ b/Documentation/devicetree/bindings/arm/amlogic.yaml
@@ -73,6 +73,13 @@ properties:
           - const: amlogic,s805x
           - const: amlogic,meson-gxl
 
+      - description: Boards with the Amlogic Meson GXL S805Y SoC
+        items:
+          - enum:
+              - xiaomi,aquaman
+          - const: amlogic,s805y
+          - const: amlogic,meson-gxl
+
       - description: Boards with the Amlogic Meson GXL S905W SoC
         items:
           - enum:
-- 
2.47.1



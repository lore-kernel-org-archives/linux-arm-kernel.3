Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E643DCD98E4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Jun 2026 13:37:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HLgUtJ9cV5LA+4aYjxgHqNy3yXpYbDbtaV7A2tRHyWc=; b=RWJsyOKJrn7cv47Ve8noBn5sPJ
	BXAVUzAwiBGh+v6IhJ6YScXFCIm4GiCISr+aX4Nrx3xz5RgdjZNE/xf/f5EMgiM2rZlkLeBcIrhKj
	F83iHnfYNOLXy5HcbLfbUvVfI9oa+HH5bZOF3ktGjLh7gF++w1Q7EXuxYq/jZyxhDTTuQFuGA4DXU
	Uo7EuSeH7m4c71WvztMWuFXEu5EO+aH+1qwLeSNmr2tX78U8JwbeuypICw7aJCeN9KrfoVO33g9D8
	wAN85VYKacF4bsg6nsIbdZ9leuF3AxnV/My+/jAqOsbPOMIhFt5zg5+mTSW+L6nQUpbsukXXG/cLX
	Xq6gYKwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZqSH-0000000HQMC-1yWk;
	Wed, 17 Jun 2026 13:37:21 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZqSG-0000000HQLE-1DfH;
	Wed, 17 Jun 2026 13:37:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C8C0E445BD;
	Wed, 17 Jun 2026 13:37:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id AC122C2BCC7;
	Wed, 17 Jun 2026 13:37:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1781703439;
	bh=YzthG8T7DZ1GuXwGfr6wQ95GjczcSmwJxvu5eL0Ej04=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=PQmQFMJ5qE4phg8+H571bqSzrT9aBpSz7CmVLH7G9VqZudE71XnBFfNpYjS5imdU8
	 9tiJRlZt77QeMibJyiGelfUdSMpWlWPD8XwOFi5PHeTn0ptvPdgg7hPoFKC4mbuvHa
	 cocSCQfTqAX7kgOSwA0Ku8jUUJ+NZHjghgyem23UBj622QXC3IIunRaFo2KdCYX4al
	 iAEj46e9kxsaw6x3SFnheZvNuetLkXdOHljLoAN7BehQRIOgzfTUnd2tPvJ3csYVal
	 oeQTm8x1cxd9Rk+5kpap36jF8trcVIwYTDi3uREv2dGucvxCOKyhLhnFBie0RRX2Xs
	 nzAcfBlOW8l0A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4BC7CD98E4;
	Wed, 17 Jun 2026 13:37:19 +0000 (UTC)
From: Zakariya Hadrami via B4 Relay <devnull+zkh1.proton.me@kernel.org>
Date: Wed, 17 Jun 2026 22:37:02 +0900
Subject: [PATCH v2 4/5] ARM: dts: mediatek: mt8127: Add watchdog support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260617-mt8127-amazon-ford-basic-v2-4-6859e29e72a8@proton.me>
References: <20260617-mt8127-amazon-ford-basic-v2-0-6859e29e72a8@proton.me>
In-Reply-To: <20260617-mt8127-amazon-ford-basic-v2-0-6859e29e72a8@proton.me>
To: Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sean Wang <sean.wang@mediatek.com>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-watchdog@vger.kernel.org, Zakariya Hadrami <zkh1@proton.me>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781703437; l=861;
 i=zkh1@proton.me; s=20260616; h=from:subject:message-id;
 bh=ck6RUwGt3onyIKpysTjlnK4pbinSKUlxnk21K9K4+jE=;
 b=yBuV/4Rj9N6eyoFk0usQ08cuR8RzxTGBlaF5MDRxOLMu1onoXtXAQRZ7nvhqrS78XWqjF7Sdf
 MToxUjq0gBpCEQSMYTtZmlP47sCSY1HJru9MaQ9CtIEQ90wvXSr42sX
X-Developer-Key: i=zkh1@proton.me; a=ed25519;
 pk=9DiJwhINAERP95fbFofXSP77GEnvfO/rMIRRRFDhaoc=
X-Endpoint-Received: by B4 Relay for zkh1@proton.me/20260616 with
 auth_id=824
X-Original-From: Zakariya Hadrami <zkh1@proton.me>
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
Reply-To: zkh1@proton.me
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Zakariya Hadrami <zkh1@proton.me>

Add watchdog node and disable it by default as it was not present
initially.

Signed-off-by: Zakariya Hadrami <zkh1@proton.me>
---
 arch/arm/boot/dts/mediatek/mt8127.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm/boot/dts/mediatek/mt8127.dtsi b/arch/arm/boot/dts/mediatek/mt8127.dtsi
index bd61ec7e70c0..3e23673e7a9e 100644
--- a/arch/arm/boot/dts/mediatek/mt8127.dtsi
+++ b/arch/arm/boot/dts/mediatek/mt8127.dtsi
@@ -99,6 +99,13 @@ soc {
 		compatible = "simple-bus";
 		ranges;
 
+		watchdog: watchdog@10007000 {
+			compatible = "mediatek,mt8127-wdt","mediatek,mt6589-wdt";
+			reg = <0 0x10007000 0 0x100>;
+			interrupts = <GIC_SPI 88 IRQ_TYPE_LEVEL_LOW>;
+			status = "disabled";
+		};
+
 		timer: timer@10008000 {
 			compatible = "mediatek,mt8127-timer",
 					"mediatek,mt6577-timer";

-- 
2.54.0




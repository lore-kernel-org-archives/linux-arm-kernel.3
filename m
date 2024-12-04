Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD965E7716D
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Dec 2024 19:13:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=42ELpOH5Qo1NSXKOzoDjJnFG2AmNC61cPGL5UWKFmqU=; b=vEBhtOLWD3d0AAqHiArEyT0Y30
	GyzQQMNKkJS1uU/f636cx8ibeTf0oxMBwQg+GjU+QjloTiM/SHYvpEUbMrmrm+OyMbQ9mG9Ve6X1i
	h+420mUFdCWiq58iLHCa6DF7bOeHvqw0iyVVl9NXMIYF7fDIHGIW+oOocNGVEvQVr5qu8/Faf0qqZ
	h7nf6EqnfHEfq0peoqiDbpsp7MdbhbjUz+eanLaBa97UySC5rmlWLQ4ZGiJpqfmJvKJzncvsgi0yy
	JkSWWjHuA2yPN6D0t5u5EsskW8NeRJ+TD7c138uz8ccMxjuBdbidY5lLor5FJrRLOLOcaicRIh2CH
	xW+p6kjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIuoK-0000000DdU8-0SGD;
	Wed, 04 Dec 2024 19:13:20 +0000
Received: from out-170.mta1.migadu.com ([95.215.58.170])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIuil-0000000DcNM-1SEE
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Dec 2024 19:07:37 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1733339253;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=42ELpOH5Qo1NSXKOzoDjJnFG2AmNC61cPGL5UWKFmqU=;
	b=agI3ERp/r5e409B96kRDTranILhj9qOcVh/fpjlqRK7ao6K4JxofakzHN3JPthCW1CHzLQ
	zI1ofe+UcBUB8A0XyazJFcWahUXmejP1ZqmX1psLHGNoNUqY6haYJJX9AIpkw+NNJ6SKgS
	ELeQC0BKsYz3rxXwMiUcLW6OlVGn7KIF3dJawAX7CKr5X3Ed11MkSyimcmZcWgT0+0VtlZ
	qm1DR06IaPyGQdnlr47E6rgIUPvQYxPmR2ksHEiA8ph0+c3He7YjAGBEvaFCizL3kQPq5k
	VFCarITlR4BqJubPjjQDwkY9C+00WiPLgEm0Df9o18o2ZMiZQHP8WD8MCIsA+w==
From: Val Packett <val@packett.cool>
To: 
Cc: Val Packett <val@packett.cool>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Fabien Parent <fparent@baylibre.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 5/5] arm64: dts: mediatek: mt8516: add keypad node
Date: Wed,  4 Dec 2024 16:05:08 -0300
Message-ID: <20241204190524.21862-6-val@packett.cool>
In-Reply-To: <20241204190524.21862-1-val@packett.cool>
References: <20241204190524.21862-1-val@packett.cool>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_110735_530033_4319C45E 
X-CRM114-Status: UNSURE (   8.60  )
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

Add a keypad matrix node for the MT8516/MT8167 SoC.

Signed-off-by: Val Packett <val@packett.cool>
---
 arch/arm64/boot/dts/mediatek/mt8516.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8516.dtsi b/arch/arm64/boot/dts/mediatek/mt8516.dtsi
index e30623ebac0e..3beb9f74ec79 100644
--- a/arch/arm64/boot/dts/mediatek/mt8516.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8516.dtsi
@@ -220,6 +220,16 @@ timer: timer@10008000 {
 			clock-names = "clk13m", "bus";
 		};
 
+		keypad: keypad@10002000 {
+			compatible = "mediatek,mt6779-keypad";
+			reg = <0 0x10002000 0 0x1000>;
+			wakeup-source;
+			interrupts = <GIC_SPI 149 IRQ_TYPE_EDGE_FALLING>;
+			clocks = <&clk26m>;
+			clock-names = "kpd";
+			status = "disabled";
+		};
+
 		syscfg_pctl: syscfg-pctl@10005000 {
 			compatible = "syscon";
 			reg = <0 0x10005000 0 0x1000>;
-- 
2.47.1



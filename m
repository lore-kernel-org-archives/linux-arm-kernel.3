Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BB22FA0C38
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Apr 2026 08:34:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=om+hHHdljzsF5Cf7gFHYpPcoED6vHfQJ2/tCZOgANJ0=; b=FYhl/jtflLEhtPtKIifhNnKtUa
	YPKr9YB0yDrM1YrQPxF2UiCbqQJAqiByKBKne2lFk5NMCUaSc2Tchfe0M239wIwunK4pX0kzL5oqc
	egF29uJUXxV4N843MrbkI/fkNDBEXCbVXxecBgSoVcKOUNPehr+PJBIMGGg2Q5NAnn6keFEEHVBKo
	0xHOVruNgPpYtbpuSZJAs2+4ahdKg4LfPaDcpNNm6tR9f6xhnjutCw75SDtwk/pdRCiCCczZ4p95u
	xJmVNKbNWj20E7NJHVirEcG6qHlZ6YynFr5TDUfAB+4e2mvKET4S/8SJyIR8kuQo8DqA14/45fN4I
	uFKjRPPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCvhP-00000000p4n-1LJx;
	Wed, 15 Apr 2026 08:34:15 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCvhN-00000000p2t-20R4;
	Wed, 15 Apr 2026 08:34:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 38C1E600AE;
	Wed, 15 Apr 2026 08:34:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D682AC2BCB4;
	Wed, 15 Apr 2026 08:34:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776242051;
	bh=gGJkbjQ1NGX6fgwdB9YUsJ0pPiyL6JdM59/u6GrsAC8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=DHsDKVAlRdMTwqDHEgZvhEt1FgyxR3QIY0FR2sVtVRaJWqc901JwpKuNON+Q9hcgr
	 TnON9sjJLHf9H1hc4EMRp03VP0pWpOwwqAbMRkn7H5997xwNQlcTvsIf3oCmnaj/f2
	 J+bj/AFq6bgXgsr+KX+Qku9AepMDMTKVuKKu1v+de938cMPTJnYy44MgIEvLghGg85
	 ljlShhYxSMZlLMbrzxRgopHFBf3Gr7DFpTmNbi8k5WcojYrG0yIwSjY63LWJVaxAUu
	 7Jdkcv7Uf3J12tkqBjMn/XADVtZQqkMh4LuZpCICAJ3dn4/mkA5SMH7mcDvQiTrP7j
	 8+GZnpEch2ohw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0239FA0C4C;
	Wed, 15 Apr 2026 08:34:11 +0000 (UTC)
From: Jian Hu via B4 Relay <devnull+jian.hu.amlogic.com@kernel.org>
Date: Wed, 15 Apr 2026 16:33:41 +0800
Subject: [PATCH v2 1/4] dt-bindings: soc: amlogic: clk-measure: Add A1 and
 T7 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260415-clkmsr_a1_t7-v2-1-02b6314427e6@amlogic.com>
References: <20260415-clkmsr_a1_t7-v2-0-02b6314427e6@amlogic.com>
In-Reply-To: <20260415-clkmsr_a1_t7-v2-0-02b6314427e6@amlogic.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Jian Hu <jian.hu@amlogic.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776242050; l=872;
 i=jian.hu@amlogic.com; s=20260415; h=from:subject:message-id;
 bh=IimYeGQJ3sTp582FUYGP7eCFxCNOvcMVP+spCKBvEZI=;
 b=FTtwbJROifIZYLVA99AKO3wSGTKbZHs98icsYsqYtO8Mg4ZRTH1mFCDUFtUYCdfYrMNBcBx9g
 rFXH34gR4B7DiKr25FVbcU/cYUJM3rIkkFv+1vTLJf5QJdu6By1eyXO
X-Developer-Key: i=jian.hu@amlogic.com; a=ed25519;
 pk=zHUE+rNtH9z+Sb8au1/elWknjFQmy5QDVkBoxleuOIA=
X-Endpoint-Received: by B4 Relay for jian.hu@amlogic.com/20260415 with
 auth_id=735
X-Original-From: Jian Hu <jian.hu@amlogic.com>
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
Reply-To: jian.hu@amlogic.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Jian Hu <jian.hu@amlogic.com>

Add the Amlogic A1 and T7 compatible for the clk-measurer IP.

Signed-off-by: Jian Hu <jian.hu@amlogic.com>
---
 .../devicetree/bindings/soc/amlogic/amlogic,meson-gx-clk-measure.yaml   | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/amlogic/amlogic,meson-gx-clk-measure.yaml b/Documentation/devicetree/bindings/soc/amlogic/amlogic,meson-gx-clk-measure.yaml
index 39d4637c2d08..b1200e6940ac 100644
--- a/Documentation/devicetree/bindings/soc/amlogic/amlogic,meson-gx-clk-measure.yaml
+++ b/Documentation/devicetree/bindings/soc/amlogic/amlogic,meson-gx-clk-measure.yaml
@@ -24,6 +24,8 @@ properties:
       - amlogic,meson-sm1-clk-measure
       - amlogic,c3-clk-measure
       - amlogic,s4-clk-measure
+      - amlogic,a1-clk-measure
+      - amlogic,t7-clk-measure
 
   reg:
     maxItems: 1

-- 
2.47.1




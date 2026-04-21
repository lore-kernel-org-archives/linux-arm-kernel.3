Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FC0DF327C2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Apr 2026 08:18:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bOSIfMJGT8aYQSIn/eq3bZjzjtDIPrtmNklaZ4rcFKs=; b=AN8uk6HHHAFo4kS5+c/sicwjtR
	rQOXEQGm5kFt7ZytXVkvR1R6XTpDTV2pUhC9iwdYOOWFFzh3nEbnzRlSbyUyKbUxlDTxkPeZ+uOaF
	Y1YWMO7G2x3M//8C3b676BtcO9nB2B8n6Rq+aVwhK9HdlWOR3yN1Gmn0enWbRzoE2G9XE4MnEGVrv
	hQV9BWPWADf5pGhUtbCBCJiV7V+vLVr8SNRzlACa3qho76Czuk5iryro4BPBLkekhal7fIRVKkmEH
	CuBWsavIegiOjBVspMly2w+1p+shD90MbCWRFv/V/xsChRLcvELwbLtHmSyO3lvofUwSIs0/bCNvF
	zpeXu1Lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wF6Jf-00000008F9g-0yr0;
	Tue, 21 Apr 2026 08:18:43 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wF6Jd-00000008F8I-13oU;
	Tue, 21 Apr 2026 08:18:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 695FE6001A;
	Tue, 21 Apr 2026 08:18:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 16AE9C2BCB5;
	Tue, 21 Apr 2026 08:18:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776759520;
	bh=7pJbh/uj8XfFDrgStpBaGjvS/bBJlfmlOagSr2mFtPQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=W2jD8vZh5T2oEI8hMBBE68lk/WCB9G5Zl9mehC+4mAvLF2ft3wRQjWSJlIAYOUEx6
	 eJUenzjwKBl+0uS+v9Lig4Z7JI2vNbiNi0GFbQE7x1qjE9gkjFbXpT1ox4xjSSUUkr
	 ZzFnxhKcMP4hiZRgfUrEE7hLv/GtiTJxELZJaJGjWQdTXAse4il/Zek629zQJ5p5Wr
	 k0V40LPXjRxBfWSMGtdtdm0pP/0eSvuaHtRxVMaoEDpkDPCWbSuqi4GrE833xPl3cy
	 xwU8UIR4V6H2unJ/iYcu0b5RtbQ+LiiKKrg8txA+uSqcxUoGXd1r7FzjnLIfpJYt85
	 ByKRcxYtFcUgA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07D3BF327BD;
	Tue, 21 Apr 2026 08:18:40 +0000 (UTC)
From: Jian Hu via B4 Relay <devnull+jian.hu.amlogic.com@kernel.org>
Date: Tue, 21 Apr 2026 16:17:41 +0800
Subject: [PATCH v3 1/4] dt-bindings: soc: amlogic: clk-measure: Add A1 and
 T7 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260421-clkmsr_a1_t7-v3-1-efc00b0f9e6b@amlogic.com>
References: <20260421-clkmsr_a1_t7-v3-0-efc00b0f9e6b@amlogic.com>
In-Reply-To: <20260421-clkmsr_a1_t7-v3-0-efc00b0f9e6b@amlogic.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Jian Hu <jian.hu@amlogic.com>, Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776759517; l=925;
 i=jian.hu@amlogic.com; s=20260415; h=from:subject:message-id;
 bh=CgTT3MEiWBM2xyukC2as1xW5lCFjTJ74JkjsBhvGt3g=;
 b=feaATb50ETYIaEoFr1FWFcpa+a9f5SmprtuXNV8oZFl6Ut6k8o5at2vR/q0GwP7GGPOJcrzyD
 W5w//PdCZQYBdTUkMEGzPoBI2YD8xNshIcpKbmLmPlRbX7+2G+xWeH6
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

Acked-by: Conor Dooley <conor.dooley@microchip.com>
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




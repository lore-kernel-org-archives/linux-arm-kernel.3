Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E05ACCF2D4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 00:40:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pVlYHqb7y9q0zT/BuMfeM7ah4viIJaQgIHxAEZZw7fQ=; b=UGZEwkMxzGjJuEr8r8NcNtZ9eY
	sZ2KwvMZkVi1yX8lo2rW9tyR+EzGW05da4rdple+teeTs8Pps3zfwUlQpAroN0Njt2cS231209mMh
	o8p+pXahE8qMBtFothubEvnjYsPkqk2p9g0T6iYnFF1XoP/+2GSXP7W0EUPz0L1UtYPoRlFpcpiZL
	nmuF8O63GBCCVsYP5k3/mpWnFFWwYoRmbVmSBe+pLfdAIgRngt/pwAOect4NPUnsJqj8zAsU1ZO5u
	YUWz0Pjd50dUJWjWWi0Pbw5TSDnq1pDPUr+1SIvf2lv9EOYPWAwY0aJNs01RnZzFtSoN5hjxBhyqh
	3ctiwADQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIbQj-00000006LEk-0pxZ;
	Mon, 19 Oct 2026 00:40:45 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIbQi-00000006LDR-0RME;
	Mon, 19 Oct 2026 00:40:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6A6884477F;
	Mon, 19 Oct 2026 00:40:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3CD80C2BD00;
	Mon, 19 Oct 2026 00:40:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1792370443;
	bh=Ul8j6b/OMgDbNJmDs3HrzxJ8CN+a8ZabmqPVjjzsVr8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=alMLu22LKFZ7YkTXPG7zwtua6wuvDBTNgra11qMpwXe+QW0+/x32hU0FoqWptPRCH
	 Lbxm+uFnOn2oZokv9CXVa31OlD57sFRC3eT4ONDPSs734sb80eywyNk3rwHmlJul2v
	 XI+Mla3zJChs5Gfji5YP7BaYTrq3eczlBauwiNcaS/61DDuoqnXQJOYcp33LIYP1YJ
	 GOSZPm3LIcEPFPkzXfNwz4ggox/eJ6dnaXlm9BPaLkoM8OLY2AZ5tjCWommMsBIOxT
	 3g7n5pDbPbrwcBCH2SpnNPWo7DHqHjU8vW+6DML0eEakL+HN5VUlwTCVVxzJZ+u9x2
	 u9tDtjTssy3Rg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D8ABCCF2D5;
	Mon, 19 Oct 2026 00:40:43 +0000 (UTC)
From: Ben Grisdale via B4 Relay <devnull+bengris32.protonmail.ch@kernel.org>
Date: Mon, 19 Oct 2026 01:39:58 +0100
Subject: [PATCH 2/8] dt-bindings: interrupt-controller:
 mediatek,mt6577-sysirq: Add MT8163
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261019-arm64-initial-support-for-mediatek-mt8163-soc-v1-2-f2462b2d2437@protonmail.ch>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792370441; l=1057;
 i=bengris32@protonmail.ch; s=20261018; h=from:subject:message-id;
 bh=HZvnmqsfzINWEfrRhIepftjE6COAYK/b8YuTyS5bQgM=;
 b=698Q+CEQDCJ3A6XknWlGTDX7ayPZNsO1KMPbAIxSubRinrTQ0EQaaqli2OXhKRvU6rXAPmmso
 1Nc/WpE3cMmDvpAyWejudA1XtX9HcPbCDNk8M3oW9KI3KTfX3pjkzNl
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

Add a compatible string for the SYSIRQ interrupt polarity controller on
the MediaTek MT8163 SoC, which is compatible with the MT6577 SYSIRQ.

Signed-off-by: Ben Grisdale <bengris32@protonmail.ch>
---
 .../devicetree/bindings/interrupt-controller/mediatek,mt6577-sysirq.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/mediatek,mt6577-sysirq.yaml b/Documentation/devicetree/bindings/interrupt-controller/mediatek,mt6577-sysirq.yaml
index b94fc3cec175..9d2fc15fc81d 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/mediatek,mt6577-sysirq.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/mediatek,mt6577-sysirq.yaml
@@ -36,6 +36,7 @@ properties:
               - mediatek,mt7629-sysirq
               - mediatek,mt8127-sysirq
               - mediatek,mt8135-sysirq
+              - mediatek,mt8163-sysirq
               - mediatek,mt8173-sysirq
               - mediatek,mt8183-sysirq
               - mediatek,mt8365-sysirq

-- 
2.56.0




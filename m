Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BB89C88E58
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 16:59:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MnQifhsyepgUfl4SRUFqkKt3aBBkCt2ItCLaLcqAOuc=; b=DUP5Gtf6rQgar94nmig93lhrjU
	SnDzusHXFbT9pYunUS6485hkCV1jafagpJOgEEXIs5tJVkWpuk2Oqj7wxnQBmWMrId1dKSVzziYE8
	8u4JU+Dn6WrMiLjnlABM25awh7ZaslxznrzQz8Mho2TgwHJjWLLTaV69spOzZLxcT+221WlBrq+WT
	NDfm81V17dMgsVNXoEaX0NN5wogmTs0Xr7d95cCQs2EYyz3M0xrTo2m2ThBa0s10EcaVTHDgyG3lo
	OJ2qBKBPd3GBN3V/keXwgDrb8aEpraJZwYXmKVOepAKA/jmruAz5DOKkLIvK9NXrrgTJW/lC57Jod
	Pgouvryg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x54au-0000000HHBe-0uqG;
	Fri, 11 Sep 2026 16:59:20 +0000
Received: from [2a0f:4ac0::3a11] (helo=mail.cyberchaos.dev)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x54ar-0000000HH6Z-3Tzn
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 16:59:19 +0000
From: Yureka Lilian <yureka@cyberchaos.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cyberchaos.dev;
	s=mail; t=1789145942;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MnQifhsyepgUfl4SRUFqkKt3aBBkCt2ItCLaLcqAOuc=;
	b=IT0nrZF7k0tEGme7tgwWM2SCxTJGZyHK5qH6adO8N1YSNJ/tpM16ssbJahST+5DJo9EicZ
	1muwf9ZIS5iTOUflgiXFyphPAVwnKEmd74dDo7vQLRrO4L4BqVjfSoMVuMn8YVXVTqd3Gh
	85zYOHu2sT0+yXZtGb5recRzU3jg9XY=
Date: Fri, 11 Sep 2026 18:58:40 +0200
Subject: [PATCH v2 3/7] dt-bindings: arm: power: apple,pmgr-pwrstate: Add
 t8140 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260911-apple-a18-pro-initial-devicetrees-v2-3-08d06cf011d4@cyberchaos.dev>
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
X-CRM114-CacheID: sfid-20260911_095918_142205_23789DC4 
X-CRM114-Status: UNSURE (   7.85  )
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

The device power state management of the PMGR blocks on the Apple
silicon A18 Pro SoC (t8140) is compatible with the M1-M4 SoCs.
Add "apple,t8140-pmgr-pwrstate" as A18 Pro specific compatible.

Signed-off-by: Yureka Lilian <yureka@cyberchaos.dev>
---
 Documentation/devicetree/bindings/power/apple,pmgr-pwrstate.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/power/apple,pmgr-pwrstate.yaml b/Documentation/devicetree/bindings/power/apple,pmgr-pwrstate.yaml
index b24ea8e54e11..dcffdd12c8c7 100644
--- a/Documentation/devicetree/bindings/power/apple,pmgr-pwrstate.yaml
+++ b/Documentation/devicetree/bindings/power/apple,pmgr-pwrstate.yaml
@@ -49,6 +49,7 @@ properties:
               - apple,t6031-pmgr-pwrstate
               - apple,t8122-pmgr-pwrstate
               - apple,t8132-pmgr-pwrstate
+              - apple,t8140-pmgr-pwrstate
           - const: apple,t8103-pmgr-pwrstate
 
   reg:

-- 
2.55.0



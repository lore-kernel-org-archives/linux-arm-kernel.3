Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAD44C55172
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  1 Aug 2026 21:41:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3qOaSj38gbQXIBnLLo6XU1JtH18hHfOPNkOOi36DWfE=; b=k3MB9fI3yXu+KHoZboDPNouffk
	bHfLJvvXsDEt4nvaJqjhZTBL+iN+DqsMeUGnZm1yiJQfc/KgWcwtxYTMrKrCKMva6t5a5xKlGDrr1
	d48vfpNUGZmDqKMcA5M3nU0WTUdJdJuSQ2+FLo0yKkZ8CUvIiW4Qgs8ndM5wik3ZxVdHbLBWDDTzw
	zvmv9wuU8mgN3va4Nv0u92mKO9LmxcVQCsJxwIlMvaEuHChW+S95FpuSpYVmgt3g0W2w/kn46Vev5
	SQn/7nn4muvB0RH4D8XJZ4rvakLHLK34qwSqNSufS0G/00v/pAc7Pq41BRPFNaI//WhhrC7Xq+Q6N
	cAlbitxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqHSD-0000000F7sF-3jQL;
	Sat, 01 Aug 2026 21:41:13 +0000
Received: from mail.cyberchaos.dev ([195.39.247.168])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqHS8-0000000F7rA-1ynA
	for linux-arm-kernel@lists.infradead.org;
	Sat, 01 Aug 2026 21:41:12 +0000
From: Yureka Lilian <yureka@cyberchaos.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cyberchaos.dev;
	s=mail; t=1785620461;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3qOaSj38gbQXIBnLLo6XU1JtH18hHfOPNkOOi36DWfE=;
	b=yCEcH+lNPtyZgCU+MmDMr3nDcfRlZTG1g+R3sHYWcJeVVj2sae4YbZXW2CEPTU6Qp+TkRL
	7II6UTWvXxsASEFFEqUn/HnDFbq/+naporHJ6ox2sZe2zSN0lEpm1oKSxFibrXgeSuMPsI
	v3uOgIDtTV83/VLzDNgDn7X7x5OPXSc=
Date: Sat, 01 Aug 2026 23:40:31 +0200
Subject: [PATCH v2 1/9] dt-bindings: arm: cpus: Add Apple M4 CPU core
 compatibles
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260801-apple-m4-initial-devicetrees-v2-1-5cb07cc275da@cyberchaos.dev>
References: <20260801-apple-m4-initial-devicetrees-v2-0-5cb07cc275da@cyberchaos.dev>
In-Reply-To: <20260801-apple-m4-initial-devicetrees-v2-0-5cb07cc275da@cyberchaos.dev>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Sven Peter <sven@kernel.org>, 
 Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, 
 Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, 
 Hector Martin <marcan@marcan.st>, Linus Walleij <linusw@kernel.org>, 
 Mark Kettenis <kettenis@openbsd.org>, Andi Shyti <andi.shyti@kernel.org>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Sasha Finkelstein <k@chaosmail.tech>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org, 
 linux-pwm@vger.kernel.org, Yureka Lilian <yureka@cyberchaos.dev>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260801_144108_748924_0B599722 
X-CRM114-Status: UNSURE (   9.24  )
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

The core types of the M4 SoC no longer carry individual codenames.
Apple's device trees re-use the 'everest' and 'sawtooth' codenames from
the M3 generation for all later cores.

Instead, we use a combination of the SoC's codename ('Donan') and the
type of core ('e' and 'p' for the efficiency and performance cores
respectively) as compatible for these cores.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Yureka Lilian <yureka@cyberchaos.dev>
---
 Documentation/devicetree/bindings/arm/cpus.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/cpus.yaml b/Documentation/devicetree/bindings/arm/cpus.yaml
index 5be89c584026..c328e9fb9843 100644
--- a/Documentation/devicetree/bindings/arm/cpus.yaml
+++ b/Documentation/devicetree/bindings/arm/cpus.yaml
@@ -86,6 +86,8 @@ properties:
           - apple,avalanche
           - apple,blizzard
           - apple,cyclone
+          - apple,donan-e
+          - apple,donan-p
           - apple,everest
           - apple,firestorm
           - apple,hurricane-zephyr

-- 
2.55.0



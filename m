Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24CEFC5516F
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  1 Aug 2026 21:41:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+tOmBwltvbaApS+3tNMuJI15d9yWVj352U6mU7Zkwaw=; b=Nleceux2mTJbX9x4vLw8+bD2a9
	LJamk2tzwQ2Yxfab8Tgd/EPMbKVqCe7sgPt4q7ei7qmc9h5YF+S3rOGpvhRr82K9OlJjPq+vYf8mx
	t/AvfWpARKG5uGJTW+OW+BGhggWad7jDAkeqB+iJoVoSoKi6R3jX76CA5bqGWkcSFNZ9vIFXLMDf/
	wJG1tZLa0ChD4ZmIO7zfW1jxTNdSdNUCy2+dbswJ7Zl3L5KnhqpbTjBOKRZCMhI+eyXcCj7JwsRgd
	nz+5u3Fn1bEtoh1rarsew/RJSeMXqro/NeAQMFfElH1neuZC/fnOHPeSYWjRDuaH87Hxda8pI56BX
	RM3JkFew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqHSd-0000000F87S-2hUO;
	Sat, 01 Aug 2026 21:41:39 +0000
Received: from mail.cyberchaos.dev ([2a0f:4ac0::3a11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqHSY-0000000F81v-3qaF
	for linux-arm-kernel@lists.infradead.org;
	Sat, 01 Aug 2026 21:41:38 +0000
From: Yureka Lilian <yureka@cyberchaos.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cyberchaos.dev;
	s=mail; t=1785620492;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+tOmBwltvbaApS+3tNMuJI15d9yWVj352U6mU7Zkwaw=;
	b=DgKZMBJWCkMGV1PdjXqMLYQl6z11iJgZOihjCqksc+UMRx3fdRgxXSF2WiUwsuW9ZCxXEO
	8wh01hfNuuU4PRNr0v23c/A7565jl4kPjshtaviQso74c33Nz8z1UEaoonGvSyjH0BWTFN
	HBjls6d9xLDiHjnLYIkTM88Ks/BSvqs=
Date: Sat, 01 Aug 2026 23:40:37 +0200
Subject: [PATCH v2 7/9] dt-bindings: pwm: apple,s5l-fpwm: Add t8132
 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260801-apple-m4-initial-devicetrees-v2-7-5cb07cc275da@cyberchaos.dev>
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
 linux-pwm@vger.kernel.org, Yureka Lilian <yureka@cyberchaos.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260801_144135_113924_8F44B3EA 
X-CRM114-Status: UNSURE (   7.95  )
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

The PWM controller on the Apple silicon t8132 (M4) SoC is compatible
with t8103. Add "apple,t8132-fpwm" as SoC specific compatible under
"apple,s5l-fpwm".

Acked-by: Uwe Kleine-König <ukleinek@kernel.org>
Signed-off-by: Yureka Lilian <yureka@cyberchaos.dev>
---
 Documentation/devicetree/bindings/pwm/apple,s5l-fpwm.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/pwm/apple,s5l-fpwm.yaml b/Documentation/devicetree/bindings/pwm/apple,s5l-fpwm.yaml
index dd95037ea5ee..ae8baa5f7bcd 100644
--- a/Documentation/devicetree/bindings/pwm/apple,s5l-fpwm.yaml
+++ b/Documentation/devicetree/bindings/pwm/apple,s5l-fpwm.yaml
@@ -19,6 +19,7 @@ properties:
           - apple,t8103-fpwm
           - apple,t8112-fpwm
           - apple,t8122-fpwm
+          - apple,t8132-fpwm
           - apple,t6000-fpwm
           - apple,t6020-fpwm
           - apple,t6030-fpwm

-- 
2.55.0



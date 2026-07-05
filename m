Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A3B0C43602
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  5 Jul 2026 13:17:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=afujMTjkfrhrqR4IW5B2/0jxn/KKnGOyRGVGs6O2+64=; b=Tdtt/Nhk9f3+CAUGT93kX7WHCb
	9+7m0EJz3muhlFETMbEzw2vqPbsKdFSnLvER49HslrYIJz+Z0cfBuUug297rEp1tvLysFRa+2XBUG
	6FmW0QMNj3yrYytsqh9he5MUYmm3vB2UfeUJZfj0NqPNrrlVr9cEiGA1AcbFdA7sobfjznbUGdFVh
	/qnjBUhWdZ45aRM3kwXQPO+neJvztth50qWJS6Bhr92HJex1uaXd1b1FqgUc9BOt6euB4Yaa1pp6J
	Mgq/MB+EznCZoYzvf525yf5/54SPc4xqAbi9QWUQpz+dRl4Ah+fSCEHEPK/ySJFS127orXtZInpju
	L/MpNLCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgMjG-00000009KGw-37p7;
	Sun, 05 Jul 2026 13:17:50 +0000
Received: from [2a0f:4ac0::3a11] (helo=mail.cyberchaos.dev)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgMjB-00000009KB1-1nmw
	for linux-arm-kernel@lists.infradead.org;
	Sun, 05 Jul 2026 13:17:47 +0000
From: Yureka Lilian <yureka@cyberchaos.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cyberchaos.dev;
	s=mail; t=1783257452;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=afujMTjkfrhrqR4IW5B2/0jxn/KKnGOyRGVGs6O2+64=;
	b=PZEQH3Cal76bdn7R/jQ0IWk4GC+zjq/qDVpzX2XlsXZES3c8PcgQOi2U0g2sTzF3OuAuxA
	tB+VWJWcO90+2NEpdstTQWch0f/H4ZQsdrX4bUjSg1r6K+iHuGzYuW0Yas8B+kKI0t5ga2
	nJuvjfJ1iw6ig7RlT3LUQPLqXWvQx94=
Date: Sun, 05 Jul 2026 15:17:20 +0200
Subject: [PATCH 01/10] dt-bindings: arm: cpus: Add Apple M4 CPU core
 compatibles
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260705-apple-m4-initial-devicetrees-v1-1-e5655ee56523@cyberchaos.dev>
References: <20260705-apple-m4-initial-devicetrees-v1-0-e5655ee56523@cyberchaos.dev>
In-Reply-To: <20260705-apple-m4-initial-devicetrees-v1-0-e5655ee56523@cyberchaos.dev>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Sven Peter <sven@kernel.org>, 
 Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, 
 Thomas Gleixner <tglx@kernel.org>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, Hector Martin <marcan@marcan.st>, 
 Linus Walleij <linusw@kernel.org>, Mark Kettenis <kettenis@openbsd.org>, 
 Andi Shyti <andi.shyti@kernel.org>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Sasha Finkelstein <k@chaosmail.tech>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-watchdog@vger.kernel.org, linux-gpio@vger.kernel.org, 
 linux-i2c@vger.kernel.org, linux-pwm@vger.kernel.org, 
 Yureka Lilian <yureka@cyberchaos.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260705_061745_640956_5F74B2D5 
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
2.54.0



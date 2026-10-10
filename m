Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC5F9CA9EC7
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 Oct 2026 17:00:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l0e2xAGWSt5cTDmnhY/Kf0rqC98uB8drPok4JKg9Zrg=; b=LA8rX04B52YlQu5AA3exBCRyYP
	/TmV4pXrGS4psNA1M7glSlLBSLCbRwr74cHh0EXUCca6+DY1XZy3ERq9sAdYDVNytOF3kyOMS2dkf
	zQJRe7df31vi8zhKaQWjgLiabmdXr+KJHJ3sLgypJ+eB1LLPWFQmucuPlNZRY8fun4hAVnKqYuKPt
	rj/WrioLWzrOFCUGNI60f+YMzQH4Fq7xNLtM9T4q8jYOePWzKloE1DqHuPvj1d8aJHMALusqoM/yl
	2UktgB/0zmjkbcO70wcFmSMUQxqeCLxpycEulQAEoGFNupzN10qZeD6TZR2QH4JLSy//3Ww19aOog
	dZk5N/Ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFaR1-00000008IKi-2hWQ;
	Sat, 10 Oct 2026 17:00:35 +0000
Received: from [195.39.247.168] (helo=mail.cyberchaos.dev)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFaQc-00000008ICa-4APp
	for linux-arm-kernel@lists.infradead.org;
	Sat, 10 Oct 2026 17:00:13 +0000
From: Yureka Lilian <yureka@cyberchaos.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cyberchaos.dev;
	s=mail; t=1791651590;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=l0e2xAGWSt5cTDmnhY/Kf0rqC98uB8drPok4JKg9Zrg=;
	b=OVClCkpmIy+dAT6t/siNfdGwoFHRjdt2prDg3YsAzD8m+4x3a5bYZJ0ifCbH/au+B7jsWj
	mUTraVuKSaY2evErcun5wXcRWF8lY7EckwesVBPa4SHjBfnb28dDvNYbvt8nvjgtj+DaA5
	XhZADQWbu0D+NkQAw0FW2x3o/hJvXDU=
Date: Sat, 10 Oct 2026 18:59:24 +0200
Subject: [PATCH 03/10] dt-bindings: arm: cpus: Add Apple M4 Pro/Max CPU
 core compatibles
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261010-apple-m4-pro-max-initial-devicetrees-v1-3-781fb3f2d9f6@cyberchaos.dev>
References: <20261010-apple-m4-pro-max-initial-devicetrees-v1-0-781fb3f2d9f6@cyberchaos.dev>
In-Reply-To: <20261010-apple-m4-pro-max-initial-devicetrees-v1-0-781fb3f2d9f6@cyberchaos.dev>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
 Radu Rendec <radu@rendec.net>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 Hector Martin <marcan@marcan.st>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Sasha Finkelstein <k@chaosmail.tech>, Linus Walleij <linusw@kernel.org>, 
 Mark Kettenis <kettenis@openbsd.org>, Andi Shyti <andi.shyti@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org, 
 Yureka Lilian <yureka@cyberchaos.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261010_100011_241530_486DBACB 
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

Add "apple,brava-e" and "apple,brava-p" compatibles for the M4 Pro/Max
efficiency and performance CPU cores respectively. As with the base M4
cores, there is no longer a generational codename, so we assign the core
compatible based on SoC codename ("Brava") plus core type (E-Core /
P-Core).

Signed-off-by: Yureka Lilian <yureka@cyberchaos.dev>
---
 Documentation/devicetree/bindings/arm/cpus.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/cpus.yaml b/Documentation/devicetree/bindings/arm/cpus.yaml
index 5d79da63301b..aff78fc331c1 100644
--- a/Documentation/devicetree/bindings/arm/cpus.yaml
+++ b/Documentation/devicetree/bindings/arm/cpus.yaml
@@ -85,6 +85,8 @@ properties:
           - apm,strega
           - apple,avalanche
           - apple,blizzard
+          - apple,brava-e
+          - apple,brava-p
           - apple,cyclone
           - apple,donan-e
           - apple,donan-p

-- 
2.55.0



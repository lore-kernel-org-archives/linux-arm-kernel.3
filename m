Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BC26CA9EBE
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 Oct 2026 17:00:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PS4CNPU3vl3W6seO4KsepsAZ2+gyTA5uwKGG2SD19s8=; b=qXI42dnL+nnF18EzBuKezeeb1i
	eWngZhCvIADwJusWDfriy/+r5Qfy0ERwrwWgw4g0nT7+Ay7XB7nlMYomXGC9YpMyVye9KVN/yvoop
	StqPqPuGWPJIv1GuQtgO/9eo1xeQtqEqUf0YoYyo7TgPFT3dL6/Jt8+J0cBBvdGUgovjIhEQb1JUX
	l9EQd7FLDjCUQvqdfMlPUqgSlBcs6PXc5BP7FfboK4G7wsTQPFqPmnnZGFs80aOwg7qrOAkm4drpP
	g97k67TyTU5vUWwJPXLU4HmESnkMwEfj8Ecf+pSVmIQdCy/74mtFu5nJYqqBvnvv9He+hkPbB+Yv/
	KyCS64DQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFaQi-00000008IIe-2v2t;
	Sat, 10 Oct 2026 17:00:35 +0000
Received: from [195.39.247.168] (helo=mail.cyberchaos.dev)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFaQc-00000008ICb-3vtu
	for linux-arm-kernel@lists.infradead.org;
	Sat, 10 Oct 2026 17:00:13 +0000
From: Yureka Lilian <yureka@cyberchaos.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cyberchaos.dev;
	s=mail; t=1791651590;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PS4CNPU3vl3W6seO4KsepsAZ2+gyTA5uwKGG2SD19s8=;
	b=kSzB8RPhQo0hFr/MyIB7r46nfiVU0YBOwaALyZRUWlBecZ0T2IfvB4Wjw4Vhfj6yjWS3sA
	H5KpBv+e07eDS2LGmgCFUCUOwet6iBtGGEA45um6cCRaTWskK931XsvDjttreLAJWBuLRv
	s5GC7vWkqo7P0tkdhrgf42gMhCTn1+U=
Date: Sat, 10 Oct 2026 18:59:25 +0200
Subject: [PATCH 04/10] dt-bindings: arm: power: apple,pmgr-pwrstate: Add
 t6041 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261010-apple-m4-pro-max-initial-devicetrees-v1-4-781fb3f2d9f6@cyberchaos.dev>
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
X-CRM114-CacheID: sfid-20261010_100011_178869_CB709D74 
X-CRM114-Status: UNSURE (   7.88  )
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
silicon M4 Pro/Max SoCs (t604x) is compatible with the M1-M4 SoCs.
Add "apple,t6041-pmgr-pwrstate" as M4 Pro/Max specific compatible.

Signed-off-by: Yureka Lilian <yureka@cyberchaos.dev>
---
 Documentation/devicetree/bindings/power/apple,pmgr-pwrstate.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/power/apple,pmgr-pwrstate.yaml b/Documentation/devicetree/bindings/power/apple,pmgr-pwrstate.yaml
index dcffdd12c8c7..a37a837a4eac 100644
--- a/Documentation/devicetree/bindings/power/apple,pmgr-pwrstate.yaml
+++ b/Documentation/devicetree/bindings/power/apple,pmgr-pwrstate.yaml
@@ -47,6 +47,7 @@ properties:
               - apple,t6020-pmgr-pwrstate
               - apple,t6030-pmgr-pwrstate
               - apple,t6031-pmgr-pwrstate
+              - apple,t6041-pmgr-pwrstate
               - apple,t8122-pmgr-pwrstate
               - apple,t8132-pmgr-pwrstate
               - apple,t8140-pmgr-pwrstate

-- 
2.55.0



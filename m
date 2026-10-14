Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51AA7CC6B27
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Oct 2026 06:57:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nLkg6Pwn3WhT/dWoAcJ1zOs2xTxIH9f9ALSgQPh+B8E=; b=x/APRTGLRmTYCdeSnDuEXPEi+x
	+LHhDcE3MSdiz4dzplz8VhIWIGmSi104Fhzv7EMYkoCT55x+2V8/nbkLS2wKHBFUixwpwhG50XceQ
	iGnxHFvm9RfRUS4SbqoUjacUwwb+3a99TVsbpIzjoqcS+rex5G1JSmigQqH7aPlm3si3R5XbBt6ZC
	rNxKJFOOiD3funsd5pgZmgGnxHzwfSO9cOQBxwPXWp4NqiaReX2V6SmNQ2i/EoswOI3g/aRr86YHV
	kT9DTm7diJ2rCbxM1EfoiDCSLjZpfVphhmL4x1T2F0X2F4ztFSy5rTRFk32ZoM2YJ/HWLkU+gKDeB
	n3AKmJ8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGsv1-0000000EfOC-2ptS;
	Wed, 14 Oct 2026 06:56:55 +0000
Received: from mail.cyberchaos.dev ([195.39.247.168])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGsuh-0000000EfFs-0NZF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Oct 2026 06:56:40 +0000
From: Yureka Lilian <yureka@cyberchaos.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cyberchaos.dev;
	s=mail; t=1791960980;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nLkg6Pwn3WhT/dWoAcJ1zOs2xTxIH9f9ALSgQPh+B8E=;
	b=GPVFk91Ajqjpm67mr68js/zma6QkNi8hwLB4gWROKJ2HEZO4+uQ3kA+sOWFWxlvoaQ+NOM
	O8Utkt6rhTDiv7eBKyu72TbS63GkvZz1PnEpcnUFfmHh67rLS8h5AHmfzIZuPNf5waJ1eJ
	c2Gv/Nf97Nu16CmgZ/5nBBxYlKkEUxY=
Date: Wed, 14 Oct 2026 08:56:12 +0200
Subject: [PATCH v2 05/10] dt-bindings: arm: apple: apple,pmgr: Add t6041
 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-apple-m4-pro-max-initial-devicetrees-v2-5-961edd8d661b@cyberchaos.dev>
References: <20261014-apple-m4-pro-max-initial-devicetrees-v2-0-961edd8d661b@cyberchaos.dev>
In-Reply-To: <20261014-apple-m4-pro-max-initial-devicetrees-v2-0-961edd8d661b@cyberchaos.dev>
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
X-CRM114-CacheID: sfid-20261013_235637_109536_4E7A0C01 
X-CRM114-Status: UNSURE (   7.52  )
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

The PMGR blocks on the Apple Silicon M4 Pro/Max SoCs (t604x) are
compatible with the previous M1-M4 SoCs. Add "apple,t6041-pmgr" as M4
Pro/Max specific compatible.

Signed-off-by: Yureka Lilian <yureka@cyberchaos.dev>
---
 Documentation/devicetree/bindings/arm/apple/apple,pmgr.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/apple/apple,pmgr.yaml b/Documentation/devicetree/bindings/arm/apple/apple,pmgr.yaml
index bf21a5b3a4ac..3967fcfc1663 100644
--- a/Documentation/devicetree/bindings/arm/apple/apple,pmgr.yaml
+++ b/Documentation/devicetree/bindings/arm/apple/apple,pmgr.yaml
@@ -40,6 +40,7 @@ properties:
               - apple,t6020-pmgr
               - apple,t6030-pmgr
               - apple,t6031-pmgr
+              - apple,t6041-pmgr
               - apple,t8122-pmgr
               - apple,t8132-pmgr
               - apple,t8140-pmgr

-- 
2.55.0



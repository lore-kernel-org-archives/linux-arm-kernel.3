Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11650C624D3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 19:50:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t9kPiXnFYja0TaA3Fv1fam8HrPrCv5WaiJ5ki+auGng=; b=R+JCXq0kGs8ws2t81PgT+QVnUr
	bkNo7Ca2Z3W3CjXqvKvysv1sbL7JiY7FQH+w0a/sKjs6Srqq4OPVFkb5Rh2QsJoP0kppScyR1xquI
	Tirl2EsaumP92q8brFy77n5423AbRfeOx7cHZRWz2B66HeHgINIvasGQhzARA5sdnJm9/fY2c/KD4
	gc2prWycSu69ony0n+78AvO4aG+1B2V0wfd1mA5ITnF96OH7S8rCwApLpGrVe95VeqZk9IdbAkMJt
	TkvVo1fhpflhjqJ8rW3OoXQAN4Q4mgjPij2ID23zVO38ansKK8gFETDCqp7Z9Mt5Jf918eSgfqJ9u
	8gWhbcmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2ZvB-00000003CZv-2Gmw;
	Fri, 04 Sep 2026 19:49:57 +0000
Received: from mail.cyberchaos.dev ([2a0f:4ac0::3a11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Zv8-00000003CY9-41rc
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 19:49:56 +0000
From: Yureka Lilian <yureka@cyberchaos.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cyberchaos.dev;
	s=mail; t=1788551392;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=t9kPiXnFYja0TaA3Fv1fam8HrPrCv5WaiJ5ki+auGng=;
	b=tVWtVHW0ZeXN31E9KQgHkWz7KBNDJKy3pQ3XooH4GfStsHTHFsi8g0AR8q4zRzn3whVAoH
	EVG+zXPWYhyRU7Yktd+LEC/4FG6CzJcOCQXO6zXTYcAdhZxxZwjZxaEovzcbkyU/L8q3X/
	fx3kHwcNZIKTXc9SuVHqtOO0TeVnh7g=
Date: Fri, 04 Sep 2026 21:49:34 +0200
Subject: [PATCH 1/6] dt-bindings: arm: cpus: Add Apple A18 Pro CPU core
 compatibles
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-apple-a18-pro-initial-devicetrees-v1-1-0c25401d165d@cyberchaos.dev>
References: <20260904-apple-a18-pro-initial-devicetrees-v1-0-0c25401d165d@cyberchaos.dev>
In-Reply-To: <20260904-apple-a18-pro-initial-devicetrees-v1-0-0c25401d165d@cyberchaos.dev>
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
X-CRM114-CacheID: sfid-20260904_124955_239410_2D7F2B51 
X-CRM114-Status: UNSURE (   8.66  )
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

Add "apple,tahiti-e" and "apple,tahiti-p" compatibles for the A18 Pro
efficiency and performance CPU cores respectively. As with the M4 cores,
there is no longer a generational codename, so we assign the core
compatible based on SoC codename ("Tahiti") plus core type (E-Core /
P-Core).

Signed-off-by: Yureka Lilian <yureka@cyberchaos.dev>
---
 Documentation/devicetree/bindings/arm/cpus.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/cpus.yaml b/Documentation/devicetree/bindings/arm/cpus.yaml
index c3facc98bf83..9c02cc7e4b37 100644
--- a/Documentation/devicetree/bindings/arm/cpus.yaml
+++ b/Documentation/devicetree/bindings/arm/cpus.yaml
@@ -95,6 +95,8 @@ properties:
           - apple,mistral
           - apple,monsoon
           - apple,sawtooth
+          - apple,tahiti-e
+          - apple,tahiti-p
           - apple,twister
           - apple,typhoon
           - arm,arm710t

-- 
2.55.0



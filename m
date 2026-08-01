Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EADEAC55172
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  1 Aug 2026 21:41:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FVJSRmVkxCrG8V5mDry6u5L6zCqB/MC8kvPzNOG+CjU=; b=ypsoaUZskotsDVX5fQtWcIYNu7
	ggCGz67M2oXf0Jqm7vGwjTMLbuOfJfXi/MvtOVHRhWvKZEX2FvgXAAoqcerh/pbf7dEbPhQiWOmzo
	PChUbtOxaeh/oCuvCoeG5SlSPUAuwtYgeqjITtiRfCGjlJLc9fYnL5Vr4dZ350hqsq3q99AEvzJwW
	Sm5/mFC2koi+cI2bTmzhP9bBLdeqVeC8qG1YIiyrIG/SpHfaIq4HyIXkKBmuVmve1d5HzqHnsJ7lE
	NJJ8vSlZhhydccsRXvp5IUrwf9F2qzHUChzkhz9k3UC358qPLQ78JneB2RS2T1Ci2xLw0zSRJ0JiH
	PkMXMSKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqHSQ-0000000F7xM-13E3;
	Sat, 01 Aug 2026 21:41:26 +0000
Received: from mail.cyberchaos.dev ([195.39.247.168])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqHSO-0000000F7vf-1lb0
	for linux-arm-kernel@lists.infradead.org;
	Sat, 01 Aug 2026 21:41:25 +0000
From: Yureka Lilian <yureka@cyberchaos.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cyberchaos.dev;
	s=mail; t=1785620482;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FVJSRmVkxCrG8V5mDry6u5L6zCqB/MC8kvPzNOG+CjU=;
	b=WIXEE4CoOIUAm+gzrjPBXCo5c2BzPW2wY2eaBUdzR6v6pkJNjj6l/uehlHasfdBGgpsQd5
	ycfYUxKsNTRMu3JoP+GF8sDn/dmyIV+FQkIbNjjGViC1Cg+JZ4j4VRSxv9eik9Yg0X97qN
	tAV1G73kx1tLAsva16vDd1jRTFKJxqo=
Date: Sat, 01 Aug 2026 23:40:34 +0200
Subject: [PATCH v2 4/9] dt-bindings: power: apple,pmgr-pwrstate: Add t8132
 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260801-apple-m4-initial-devicetrees-v2-4-5cb07cc275da@cyberchaos.dev>
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
X-CRM114-CacheID: sfid-20260801_144124_627088_D6FA1109 
X-CRM114-Status: UNSURE (   7.90  )
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

The device power state management of the PMGR blocks on Apple's t8132
SoC (M4) is compatible with t8103.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Yureka Lilian <yureka@cyberchaos.dev>
---
 Documentation/devicetree/bindings/power/apple,pmgr-pwrstate.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/power/apple,pmgr-pwrstate.yaml b/Documentation/devicetree/bindings/power/apple,pmgr-pwrstate.yaml
index e269f433524e..b24ea8e54e11 100644
--- a/Documentation/devicetree/bindings/power/apple,pmgr-pwrstate.yaml
+++ b/Documentation/devicetree/bindings/power/apple,pmgr-pwrstate.yaml
@@ -48,6 +48,7 @@ properties:
               - apple,t6030-pmgr-pwrstate
               - apple,t6031-pmgr-pwrstate
               - apple,t8122-pmgr-pwrstate
+              - apple,t8132-pmgr-pwrstate
           - const: apple,t8103-pmgr-pwrstate
 
   reg:

-- 
2.55.0



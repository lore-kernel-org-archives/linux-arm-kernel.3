Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 249ACC79F87
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 19:50:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=03++u1hMJUN4CZOnETD7tedBCxAbjIXy0LEGbGeWhRE=; b=0fTGLsyeAYUOh6WsBzGXSPsmTt
	rcDper6Ohv+8bSJACn6VcT6rW7Bx7s4h3GZTN/ShmiiUuUs0xFtXcqC85CgTHvHchCB+j8vkyQUVp
	AromNRjeWsgywv4P4knEyh+ZwVVDoaB5LIVFsqy4ZkYevpppEp+aSIkW62IzqVsMM8J9y83p0L2lu
	4lGKsSZTFSv/AGzRBl1S78YaSzNDskRYMViWvRB7Qtm+nBJZDJ9zRI9Zng8P8Mf+GRHszHCVD0EUH
	6y964gP9Xg1JqyrhfBZGSpFVMUdmojSX0G0jmpo3ZDp9oijlPLbTe9XW3oQTOrUwbGICsD0excIWP
	Iar4YhiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2ZvI-00000003Cec-0Qj9;
	Fri, 04 Sep 2026 19:50:04 +0000
Received: from mail.cyberchaos.dev ([195.39.247.168])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2ZvD-00000003CaU-3Vp0
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 19:50:01 +0000
From: Yureka Lilian <yureka@cyberchaos.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cyberchaos.dev;
	s=mail; t=1788551398;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=03++u1hMJUN4CZOnETD7tedBCxAbjIXy0LEGbGeWhRE=;
	b=nVRBG4E/PeFU3TVNNZq9jmhM9oC8orfOE0SM/nLoLI9Jb25QDoa6i/Z385rmKqw9oAn04E
	ZQb/PGvX0RxghI3/613mbbsW1lLzjYEZZUxzJaiQj7kBaR9CL8FM/DbiLcWh1/4PfRtRNs
	Abjw+at8jUcdu38LoKyZQkMtsosmC2o=
Date: Fri, 04 Sep 2026 21:49:38 +0200
Subject: [PATCH 5/6] dt-bindings: watchdog: apple,wdt: Add t8140 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-apple-a18-pro-initial-devicetrees-v1-5-0c25401d165d@cyberchaos.dev>
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
X-CRM114-CacheID: sfid-20260904_125000_068694_84E6927C 
X-CRM114-Status: UNSURE (   7.93  )
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

The watchdog on the Apple t8140 (A18 Pro) SoC is compatible with the
M1-M4 SoCs. Add "apple,t8140-wdt" as SoC specific compatible.

Signed-off-by: Yureka Lilian <yureka@cyberchaos.dev>
---
 Documentation/devicetree/bindings/watchdog/apple,wdt.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/watchdog/apple,wdt.yaml b/Documentation/devicetree/bindings/watchdog/apple,wdt.yaml
index ca4cf01db59f..1af924157f7c 100644
--- a/Documentation/devicetree/bindings/watchdog/apple,wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/apple,wdt.yaml
@@ -22,6 +22,7 @@ properties:
               - apple,t6031-wdt
               - apple,t8122-wdt
               - apple,t8132-wdt
+              - apple,t8140-wdt
           - const: apple,t8103-wdt
       - items:
           - enum:

-- 
2.55.0



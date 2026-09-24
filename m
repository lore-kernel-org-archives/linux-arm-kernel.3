Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 649EEC98315
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 14:17:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DPKwn+CHq5321wH/poteHbXrE1YPS9EjXQyhzbnXKzg=; b=fOZm/PkxDNhkl1nxMBgTc3rU6f
	0qAdnPKKAXCNBKmeHvankCrl8xSXk9TyEyoIVtMVzvJoMRYTCedyGKR2YAe4Sg6eQoEh1hnDpxW8i
	zbY+SFew2/02TE1Jc+Ja+jHl8QW9+D+byVBBz39t3wgle+KuZox/yt4Knoe1wV+2VGsy5zFEa1b5l
	XuJ0u3gtkzHkDCgeCXcf7wDpYZUDQV+Yx50wwhYapXstUoW2+6LnueJ2autJS7vLEjfXH394vdrls
	6/zzkIFVOwcTSm1wgQ5YktWICiPzNyGYLuhza1ehHlaCppyI3XEIu2L/eVSfkjHPdNkp6pd0wH2+K
	mziWUEag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9kGW-0000000BETU-0f8Z;
	Thu, 24 Sep 2026 14:17:36 +0000
Received: from mail.cyberchaos.dev ([2a0f:4ac0::3a11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9kGG-0000000BELf-1bON
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 14:17:21 +0000
From: Yureka Lilian <yureka@cyberchaos.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cyberchaos.dev;
	s=mail; t=1790259438;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DPKwn+CHq5321wH/poteHbXrE1YPS9EjXQyhzbnXKzg=;
	b=Z+mHx8zPTurc4a2hHEY0N7VVomaQA3sobCOUL4t03BTa8ngYY3NC7iuv6Iv1zE01kVVw3v
	sTU+cnyMCpmLZvLN8AbhjOCxwOwi6Kp/LbZ6RwqR0fiHmsMkytd80Y2noifh1edmdZY26x
	0mHw6pqfHBcuisDk4tsBu85qcwx3tEQ=
Date: Thu, 24 Sep 2026 16:17:08 +0200
Subject: [PATCH v3 4/7] dt-bindings: interrupt-controller: apple,aic2: Add
 t8140 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-apple-a18-pro-initial-devicetrees-v3-4-94f7ea52cc64@cyberchaos.dev>
References: <20260924-apple-a18-pro-initial-devicetrees-v3-0-94f7ea52cc64@cyberchaos.dev>
In-Reply-To: <20260924-apple-a18-pro-initial-devicetrees-v3-0-94f7ea52cc64@cyberchaos.dev>
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
X-CRM114-CacheID: sfid-20260924_071720_586035_EBED217E 
X-CRM114-Status: UNSURE (   7.66  )
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

The Apple t8140 (A18 Pro) SoC uses an AIC3 as interrupt controller, same as
the M3-M4 SoCs.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Yureka Lilian <yureka@cyberchaos.dev>
---
 Documentation/devicetree/bindings/interrupt-controller/apple,aic2.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/apple,aic2.yaml b/Documentation/devicetree/bindings/interrupt-controller/apple,aic2.yaml
index 1cb886785173..e3cadc5ad39d 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/apple,aic2.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/apple,aic2.yaml
@@ -46,6 +46,7 @@ properties:
               - apple,t6030-aic3
               - apple,t6031-aic3
               - apple,t8132-aic3
+              - apple,t8140-aic3
           - const: apple,t8122-aic3
       - const: apple,t8122-aic3
 

-- 
2.55.0



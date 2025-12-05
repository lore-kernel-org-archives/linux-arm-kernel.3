Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9961AD2F7C9
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Dec 2025 10:03:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lcJDgYt4uOmEYvg+2YJwYcGPnE9cLxBjU9f46SXWfsg=; b=33/jWd8w4htUj5/qq+9IXqdfuD
	NrPS/axvoM3emvYZCUB8KftkXYaCGbs8k8IMITZGOvF+COPKR/eoKnROW6CftvdzjOmxNkGZ8IxgO
	BG4e5PwtavYpUNDIkzdaFhnaC8xGcWSpZlJk6kdhQrd0YDmjQ3lxsAencpRThhseQEXAn3vDcrIvz
	Pk8RHL14J7eNn2zt1SOzKlwACkDzC4QIFa4jLQUGGFXuBhThvEDAYrlqItqoOdbiekescSDkRLRhi
	relAe/J+cAmTJ0lQ4yQM97vpEMxPSD+pn5KLb3EcjSL4ac5Z82Oz+9rmXIEBDYLnku2mgPpLX1FYg
	KzrJCSRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRSeW-00000009M2y-19xl;
	Fri, 05 Dec 2025 10:03:04 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRSeS-00000009M0W-107Q
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Dec 2025 10:03:01 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id D3EF51A1F87;
	Fri,  5 Dec 2025 10:02:58 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A04B960731;
	Fri,  5 Dec 2025 10:02:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 57C0B10B60769;
	Fri,  5 Dec 2025 11:02:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1764928977; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=lcJDgYt4uOmEYvg+2YJwYcGPnE9cLxBjU9f46SXWfsg=;
	b=QYH73ycqdkq9nIP4JkzGLReG3T2s82hM1YeCDTJ793yrPo/JT1ry06U+vbdF+Na1wJhdc8
	Y9dp/i4/OtUMuZ6Zlwhh8qDWBxGrf3PTFqbRqIRlv9Q3+LgTmW7Qyd+kLJBwqijd5gPrBw
	Rjit5qI4EgdGffp8AXFuhEy2AN8mhN9GBsEI/fLt9OmUNtGy9Deb6HkHSvfpBV2DkDsz9O
	7xCgbQ7WwKr03gasvqBZyqJ+0WTHV9zWfY7YxXGQRQyQyHcDMVD6xzYB2zHS4IKwS87TxG
	BlhVJIRXY1dZbAstlx88WfIrlCfcYmo+qraM+vB4nRhg2jM7sdzsyJA+zvu9Og==
From: Richard Genoud <richard.genoud@bootlin.com>
To: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Richard Genoud <richard.genoud@bootlin.com>
Subject: [PATCH 4/4] MAINTAINERS: Add entry on Allwinner H616 PWM driver
Date: Fri,  5 Dec 2025 11:02:39 +0100
Message-ID: <20251205100239.1563353-5-richard.genoud@bootlin.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251205100239.1563353-1-richard.genoud@bootlin.com>
References: <20251205100239.1563353-1-richard.genoud@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251205_020300_406745_CE0F2EC6 
X-CRM114-Status: UNSURE (   8.90  )
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

Add myself as maintainer of Allwinner H616 PWM driver and device-tree
bindings.

Signed-off-by: Richard Genoud <richard.genoud@bootlin.com>
---
 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 578c068b738b..b336c0fff4e4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -903,6 +903,12 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/sound/allwinner,sun50i-h6-dmic.yaml
 F:	sound/soc/sunxi/sun50i-dmic.c
 
+ALLWINNER H616 PWM DRIVER
+M:	Richard Genoud <richard.genoud@bootlin.com>
+S:	Maintained
+F:	Documentation/devicetree/bindings/pwm/allwinner,sun50i-h616-pwm.yaml
+F:	drivers/pwm/pwm-sun50i-h616.c
+
 ALLWINNER HARDWARE SPINLOCK SUPPORT
 M:	Wilken Gottwalt <wilken.gottwalt@posteo.net>
 S:	Maintained
-- 
2.47.3



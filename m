Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6E7AC98326
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Sep 2026 14:45:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KcIHskwrC2Qg1fZA3LDIcA/kogGfT36cU3FyQbNitOM=; b=uYZ2WTKqSe6FVuZtOp6bt56mpO
	8i2bTs7Ts6j6ZJq1mdZtY7WjIvJPa3hXQrJquZEecdA2Va3gmxnWzagZIhFgjzb5DeAKBXqD8L4EN
	Tdvv4YsW5MWqzieyWHvpdFOJ74Nr2DVc4ez95zwVJOnKgldIrlVdL+CuCZpeQVzcfaHS+E2mprJOA
	ax2Zkp6uTAPbj89MPpBNJpJ/t6HJegGjnyCI8wI6L5X/6bOpVhFn1jKUbcNwLcf13etzg8CBR+YdT
	rFB3pjl18TEOnbl6WiJ+BURdEEor88JE9tpmRPzdK4X7eS6TNmldR5uQshA8rhxkODgmQBLmvpG7P
	WGc9JmOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA7Ao-0000000DdMg-0ycX;
	Fri, 25 Sep 2026 14:45:14 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA7Ah-0000000DdJp-1Ppp
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Sep 2026 14:45:09 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id D1E9A4E41077;
	Fri, 25 Sep 2026 14:45:05 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A44DF6073B;
	Fri, 25 Sep 2026 14:45:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3B88B102F1E12;
	Fri, 25 Sep 2026 16:44:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790347503; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=KcIHskwrC2Qg1fZA3LDIcA/kogGfT36cU3FyQbNitOM=;
	b=QK+2l5x5e5Ce8jS7qijrknw/JWTIGgJMEQODH4AMv1B8HzJU4CE20W/1fSQ8iyBLV/oPGX
	KotLR0A1eobQlZPmGN8DQQvlnY4N7wjPPFV4Jv7T4qDwCGGFOvCGkRurRzFi9zMbJFCo3a
	CLrlT/oLROtFaTOtIyw9lbmI3B6cj/sZ8ulAeO3iCP/UjyRyEYteernlWE4QqQB5jn5UJG
	bBi7IZCbs++RrrhND9xRZHdZ2ERCsbIUHabXVPNmY4BI9W9+C5vPYdv+oOOq1QaZmTt8f5
	fTMQHAO/80H+Y5Pl0HIav7+oHnzPCOJNrrqMiVS5KcZVmAYVinNTWg+sjG5/4Q==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 25 Sep 2026 16:44:21 +0200
Subject: [PATCH v3 2/6] dt-bindings: clock: ma35d1: Drop CLK_MAX_IDX define
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260925-perso-ma35d1-upstream-clk-v3-2-ffbae7e020a8@bootlin.com>
References: <20260925-perso-ma35d1-upstream-clk-v3-0-ffbae7e020a8@bootlin.com>
In-Reply-To: <20260925-perso-ma35d1-upstream-clk-v3-0-ffbae7e020a8@bootlin.com>
To: Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Richard Cochran <richardcochran@gmail.com>, 
 Arnd Bergmann <arnd@arndb.de>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, linux-arm-kernel@lists.infradead.org, 
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, 
 Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_074508_888834_848CAE29 
X-CRM114-Status: UNSURE (   9.52  )
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

Drop CLK_MAX_IDX define of MA35D1 include. This is not a binding and
should not be placed here. Value is defined in the user driver.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 include/dt-bindings/clock/nuvoton,ma35d1-clk.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/include/dt-bindings/clock/nuvoton,ma35d1-clk.h b/include/dt-bindings/clock/nuvoton,ma35d1-clk.h
index ba2d70f776a6..2d6a44a7e55c 100644
--- a/include/dt-bindings/clock/nuvoton,ma35d1-clk.h
+++ b/include/dt-bindings/clock/nuvoton,ma35d1-clk.h
@@ -248,6 +248,5 @@
 #define ADC_GATE	233
 #define EADC_DIV	234
 #define EADC_GATE	235
-#define	CLK_MAX_IDX	236
 
 #endif /* __DT_BINDINGS_CLOCK_NUVOTON_MA35D1_CLK_H */

-- 
2.55.0



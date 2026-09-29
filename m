Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16698C9832A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 14:46:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QUVwPAQqcPJEXSHcvyrm5SHBCzZnkZ7JUl+/bI5Vt0A=; b=qxSZAztvLB07gUtUY3+68+uClZ
	CpA18eeswlHqA2WXADgiLLFrvGy9Ry2R21uQDw8SUHIc3JhJY+7P3ocyZv++BL14y8ROb3DG0+uLR
	BQSH9bKLrMukMtBMw+HVWrJL9teTvzUxhXnmWGqXhZzSnCJovgHl5TTwTg4oV+H/tp8ZcFPzuK8yC
	2sgewqbVud7nyndcll2n32rHb3uwW/OqADSUDXZF8JFiMAbik9/Gm6c/QOexPqPu4yhB7vnZGHcPl
	CtHohVP9fQ7v2BQ/GBdrOboq9JZ1vLhgDz1xk7lM6qaRzjuHl8RqVLB9YzOeeYyk5JiePhRsCTYYz
	ihrE0DBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBZ5d-00000003p9C-0duA;
	Tue, 29 Sep 2026 14:45:53 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBZ5R-00000003p4I-2ABU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 14:45:43 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 00DEB4E410C0;
	Tue, 29 Sep 2026 14:45:40 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id BBC34601BD;
	Tue, 29 Sep 2026 14:45:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 93CB3103282F2;
	Tue, 29 Sep 2026 16:45:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790693138; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=QUVwPAQqcPJEXSHcvyrm5SHBCzZnkZ7JUl+/bI5Vt0A=;
	b=aFkrNNlZnN7cPRkxEp+kaEKDWaLGwjdgCWVAI+r4bHBORC1yvYUJTBpRgqe2f6H6ADUHCU
	EnqmdI+qgM92OaGxLY0Hq/mlQLQQMqR7NehAufaHgZVghNSu7gmhO+dBJoAVf7rG5n9+k1
	bHa1eF7t13AvTCymK2x/hEWabP2s7/sDKav05yMOsG0e3BCIKVD19nBbQBETmtR0Q/pLzH
	O+Nzy7Hkp7Ptvymr49u2xccuFx7hoFH0MgbanX7stcJKq0axreIJt9KgQpXSH37vjpgkYi
	3KVSwTwJxhe+YMDJ6DvR7x/qISAhmdIEeNaaVWSe/yz5WdiOi4DY051uYQ091Q==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Tue, 29 Sep 2026 16:44:46 +0200
Subject: [PATCH v5 3/9] dt-bindings: clock: ma35d1: Drop CLK_MAX_IDX define
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260929-perso-ma35d1-upstream-clk-v5-3-68533e935ee4@bootlin.com>
References: <20260929-perso-ma35d1-upstream-clk-v5-0-68533e935ee4@bootlin.com>
In-Reply-To: <20260929-perso-ma35d1-upstream-clk-v5-0-68533e935ee4@bootlin.com>
To: Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chi-Fang Li <cfli0@nuvoton.com>, 
 Arnd Bergmann <arnd@arndb.de>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
 Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, 
 Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, linux-arm-kernel@lists.infradead.org, 
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, 
 openbmc@lists.ozlabs.org, Miquel Raynal <miquel.raynal@bootlin.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_074541_727351_24042939 
X-CRM114-Status: UNSURE (   9.86  )
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

Acked-by: Conor Dooley <conor.dooley@microchip.com>
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



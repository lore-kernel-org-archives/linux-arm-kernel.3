Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7954CA5FBD
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Jan 2026 17:48:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6cczDl0ufO9mJ/Siyzg20rZ/XUvl4siWVGvmBLx6NBY=; b=EfSCBUBqLDRilaktYgW86lYBaT
	QXpQKgw7Dybyad2tUgdGVLD+n3kH+uynlp4FSuaf41d7v6dilCLvX6LLyctgibiU3iICZ49gYu4HB
	5TNGOkwm6CcwhqS8aN1VxjvJXMwSkXs3YVqVfayObe5AYXCn74GqIc+vkCaxAiVWE/iRlDES418Kb
	8yDyA+CflsxVnU7Y1n20KOqVmVxSI2rFE4T8GAyWS71OtsNB0Mz4xJUyFi2+ZbL8z5n0xLtxEYqPL
	Wi6UaaICCqFW2eoA/dJdXNW48iArpTZk3tDuM+GjE943q3GTvEcH61UJacdy3n25Y8pHjHKVeJqDR
	IKbWNkrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viFqR-00000004G2I-2Pgq;
	Tue, 20 Jan 2026 17:48:47 +0000
Received: from mail.thorsis.com ([217.92.40.78])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viFqL-00000004FzK-2yXG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Jan 2026 17:48:43 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7572F148AD9A;
	Tue, 20 Jan 2026 18:48:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=thorsis.com; s=dkim;
	t=1768931319; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=6cczDl0ufO9mJ/Siyzg20rZ/XUvl4siWVGvmBLx6NBY=;
	b=D6fet0kbbNfXjut+g/Doqhm3/My1YMBeSaGdN8nbnojEwwvokLALeChgt1M46OXRrM3rfI
	buDIaEVh0EhbZqo142JbxbxAtCOYO8STPEOfFJXHJ1Ki3p8dMTtorwteWwKUP5k/AK9Y2V
	hdSnNApr3bQG/UlrZQBPUX96N8jB03RfB8SB8qbSeKN3H0jkJRpMdjxQc0X9vR5J/pVLUy
	CFDWFS9VR2RVfGhT0cZB6zMqY/8QeVvfgd3hRnS3L/jo9/fcEoUOslYDoEWfb2RmsXiqZv
	ELrVm3eXkBhSPlkDEnebLy/Pt5B7w5ICk7kUqpVgw3/BYGQgA6dottO2SlNE+w==
From: Alexander Dahl <ada@thorsis.com>
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Ryan Wanner <ryan.wanner@microchip.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v3 19/19] dt-bindings: clock: at91: Remove old PMC definitions
Date: Tue, 20 Jan 2026 16:44:53 +0100
Message-ID: <20260120154502.1280938-13-ada@thorsis.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260120154502.1280938-1-ada@thorsis.com>
References: <20260120143759.904013-1-ada@thorsis.com>
 <20260120154502.1280938-1-ada@thorsis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_094841_905127_D9647BA1 
X-CRM114-Status: UNSURE (   9.16  )
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

Those were split up per SoC and are not used anymore.

Signed-off-by: Alexander Dahl <ada@thorsis.com>
---

Notes:
    v3:
    - new patch, not present in v2

 include/dt-bindings/clock/at91.h | 32 --------------------------------
 1 file changed, 32 deletions(-)

diff --git a/include/dt-bindings/clock/at91.h b/include/dt-bindings/clock/at91.h
index f2a7b7d39c0d0..ebc41cb4edb92 100644
--- a/include/dt-bindings/clock/at91.h
+++ b/include/dt-bindings/clock/at91.h
@@ -14,38 +14,6 @@
 #define PMC_TYPE_GCK		3
 #define PMC_TYPE_PROGRAMMABLE	4
 
-#define PMC_SLOW		0
-#define PMC_MCK			1
-#define PMC_UTMI		2
-#define PMC_MAIN		3
-#define PMC_MCK2		4
-#define PMC_I2S0_MUX		5
-#define PMC_I2S1_MUX		6
-#define PMC_PLLACK		7
-#define PMC_PLLBCK		8
-#define PMC_AUDIOPLLCK		9
-#define PMC_AUDIOPINCK		10
-
-/* SAMA7G5 */
-#define PMC_CPUPLL		(PMC_MAIN + 1)
-#define PMC_SYSPLL		(PMC_MAIN + 2)
-#define PMC_DDRPLL		(PMC_MAIN + 3)
-#define PMC_IMGPLL		(PMC_MAIN + 4)
-#define PMC_BAUDPLL		(PMC_MAIN + 5)
-#define PMC_AUDIOPMCPLL		(PMC_MAIN + 6)
-#define PMC_AUDIOIOPLL		(PMC_MAIN + 7)
-#define PMC_ETHPLL		(PMC_MAIN + 8)
-#define PMC_CPU			(PMC_MAIN + 9)
-#define PMC_MCK1		(PMC_MAIN + 10)
-
-/* SAM9X7 */
-#define PMC_PLLADIV2		(PMC_MAIN + 11)
-#define PMC_LVDSPLL		(PMC_MAIN + 12)
-
-/* SAMA7D65 */
-#define PMC_MCK3		(PMC_MAIN + 13)
-#define PMC_MCK5		(PMC_MAIN + 14)
-
 #ifndef AT91_PMC_MOSCS
 #define AT91_PMC_MOSCS		0		/* MOSCS Flag */
 #define AT91_PMC_LOCKA		1		/* PLLA Lock */
-- 
2.47.3



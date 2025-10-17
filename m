Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF918CCD195
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Oct 2025 14:33:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=nH6boLOLKXD75LmjRYr7VCC0U8IIZDXzThHL0AVdIfQ=; b=iP1OFWiRVt6R8y5IOM+dyEpT9u
	fmiUHTEx3dGOpozMWD6CcRCv8bZT1wJBAJG2G6mmhJtOQP+Y4R0dFWdyQpeJy5i315AFoXmEPwjUb
	V5SKpxVNzBQwqZdt88MkJVifEEBEq1LvwqBaO4FY2ehGKlYKWYVkdDEL9gcafBaHBoe8SUpqZO2yu
	88qWcx4cv8fUhGsIw/yL8Jkeo84u5v5KGzUuvb4FhQMrwtDYq8N++P+cd+Xxx+v1KI2y2P17VMP+a
	FbZVc48JUGjV0JtVycS42LoedLY0scl+9lWYagswhMGVrlP6nlcyEVM0nr/s07/T0Xssqdk5bq5LW
	PUAtjnXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9lWK-000000085tK-2g9j;
	Fri, 17 Oct 2025 14:33:28 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9lWJ-000000085tE-2KBu
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Oct 2025 14:33:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 013706439E;
	Fri, 17 Oct 2025 14:33:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5603C4CEE7;
	Fri, 17 Oct 2025 14:33:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760711606;
	bh=Ayc4p7pF0DvSOAAckOeNJAfwpgI2Ts5uufW2MZg+2Gs=;
	h=From:To:Cc:Subject:Date:From;
	b=kgmx+YAvCj+hOHw4GLjUSUrXaM28LAE02r5oQltCqB7IFfoayNum8yDdFAt5OR3on
	 f1p28oHZS0OfRho8q1S2MG3J4x4cpOOh4eRyUkivVta+LjwWs41yd09WuQcgqXrDBq
	 bDqYoqns7pTy5GCo1CIJrJAEuCQmvU/VACV8i5CnjtSlqNXavgcNZHJwt2KJdN5cnS
	 q18lZ8ZP8ykuGz4hyX3cgjw8+c2QxRseaS3oTgQMjYuPjMxlQJ5wMaF1vXG//3LxFx
	 1btj2678rsf1ZNQPvPf9H4j4MNd3mBASPDXUaAkXTE8dL46lq0Z3t1JvktR1DwbD61
	 PGfMAf1Wig4jA==
From: Arnd Bergmann <arnd@kernel.org>
To: linux-arm-kernel@lists.infradead.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Drew Fustini <fustini@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] soc: officially expand maintainership team
Date: Fri, 17 Oct 2025 16:32:26 +0200
Message-Id: <20251017143302.1776953-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

From: Arnd Bergmann <arnd@arndb.de>

Since Olof moved on from the soc tree maintenance, Arnd has mainly taken
care of the day-to-day activities around the SoC tree by himself, which
is generally not a good setup.

Krzysztof, Linus and Alexandre have volunteered to become co-maintainers
of the SoC tree, with the plan of taking turns to do merges and reviews
to spread the workload. In addition, Drew joins as another reviewer.

Cc: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Drew Fustini <fustini@kernel.org>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---

Co-maintainers, please Ack, or let me know if you want any changes before
I send this to Linus in the next fixes pull request.

Sorry for taking my time again after we had decided on this at ELC-E.
---
 MAINTAINERS | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index e9b16f619373..74a3002bb44c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1997,6 +1997,10 @@ F:	include/uapi/linux/if_arcnet.h
 
 ARM AND ARM64 SoC SUB-ARCHITECTURES (COMMON PARTS)
 M:	Arnd Bergmann <arnd@arndb.de>
+M:	Krzysztof Kozlowski <krzk@kernel.org>
+M:	Alexandre Belloni <alexandre.belloni@bootlin.com>
+M:	Linus Walleij <linus.walleij@linaro.org>
+R:	Drew Fustini <fustini@kernel.org>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 L:	soc@lists.linux.dev
 S:	Maintained
-- 
2.39.5



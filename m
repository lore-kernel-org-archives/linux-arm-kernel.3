Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43AF8E677F5
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  2 Nov 2024 09:30:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rRLq5/V3PO4gXtH6o+mulzRrZWABZdF58Y31jxMMc3U=; b=Vr2P3KgPP49ApaTOmmj8QtMQBn
	983IuL7Lz8jP/SCU5pm7nHVNs8QxvaU1RhcPkE4/lb5cHYTfHYg0CLQKWbBtsK9z+AMev4we2LA+E
	aKNhchLjRlHm++RWvTFWWQMb3+mP0Q2c55/pmpBksiXQXRO9W4Qx7g25oAmKqm48yyRikl3DUBwZn
	EqBJwEl2biLLPVt4B8zKDjYIrEBZ8cxYFzgC22uapX1Lkz+ro2VVPU7B5dKuq49BMwOl1rekQ5p+E
	eA42iDuVjxB68l7H8uEnvtIU9tNmemtCk1Q88yB0UwQwOuw2yGK/PqZW/6XwsNv9oH0ZRSQDejpaA
	/GrTylDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7AS8-00000009Nrm-3kFc;
	Sat, 02 Nov 2024 09:29:52 +0000
Received: from smtp-81.smtpout.orange.fr ([80.12.242.81] helo=msa.smtpout.orange.fr)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7AQR-00000009Nmd-453A
	for linux-arm-kernel@lists.infradead.org;
	Sat, 02 Nov 2024 09:28:10 +0000
Received: from localhost.localdomain ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id 7AQMtOujKH3SU7AQMtmj7y; Sat, 02 Nov 2024 10:28:04 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1730539684;
	bh=rRLq5/V3PO4gXtH6o+mulzRrZWABZdF58Y31jxMMc3U=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=c8YjrpZmsvFwBnjpwxrFAdK7mea3CIj0+tWGaxX0Vg+oIh4RU5q7Cjn/7OuTP1MVy
	 3e4BJ4uuxxtV6pQgXorppHZ8imyXiQZRhgH8yFKH436BRBM5y4WrQkReeqGEOk6Aab
	 2g1hHEawaAZBWTuNmAy4Li+9Pe2KZsT/7gTXD2VtKllM6pxSIuocblVarY7BrRy4LQ
	 k453TwuhuiRZllLCXz80bZfXpwNU51OR+mIq7MwxHEA1P19Km2vPlUIxePV132FH6y
	 rgT+KJHkaLCazdwlPsizGrA8E8a9M9MzRD37Wm42oG/cEk+63ly8KIW71ZyRJYCMV7
	 4LD0iV2UEry+g==
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sat, 02 Nov 2024 10:28:04 +0100
X-ME-IP: 90.11.132.44
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>,
	Tony Lindgren <tony@atomide.com>,
	Russell King <linux@armlinux.org.uk>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	linux-arm-kernel@lists.infradead.org,
	linux-omap@vger.kernel.org
Subject: [PATCH] ARM: OMAP2+: Fix a typo
Date: Sat,  2 Nov 2024 10:27:51 +0100
Message-ID: <ec20fd5c347bf74963532e95282f850d209d84d5.1730539664.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241102_022808_190275_5C3D6D7C 
X-CRM114-Status: GOOD (  11.05  )
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

A 'a' is missing in "powerdomin".
Add it.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 arch/arm/mach-omap2/powerdomain.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mach-omap2/powerdomain.c b/arch/arm/mach-omap2/powerdomain.c
index 2441d96b7144..a4785302b7ae 100644
--- a/arch/arm/mach-omap2/powerdomain.c
+++ b/arch/arm/mach-omap2/powerdomain.c
@@ -523,7 +523,7 @@ int pwrdm_get_mem_bank_count(struct powerdomain *pwrdm)
  * Set the powerdomain @pwrdm's next power state to @pwrst.  The powerdomain
  * may not enter this state immediately if the preconditions for this state
  * have not been satisfied.  Returns -EINVAL if the powerdomain pointer is
- * null or if the power state is invalid for the powerdomin, or returns 0
+ * null or if the power state is invalid for the powerdomain, or returns 0
  * upon success.
  */
 int pwrdm_set_next_pwrst(struct powerdomain *pwrdm, u8 pwrst)
-- 
2.47.0



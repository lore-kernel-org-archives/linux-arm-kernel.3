Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E54CDCCA470
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Oct 2025 12:53:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ky/3jGoPyRGqAWfy0PuczzXuSbwCFljASnLopsY5zwU=; b=OsFDlrNWEsmLK+WobVNFRaMx/+
	9tGYJs/Dl2IeoZsqDLKXaJHXgNDI2DukcOKOSUXJikBpL6PI0/ekx+XXsjjtcaLq9xRj5viE6Pn1R
	MFObZV/pVJRF2Ov7uyOceNG6vZWLnBidsqORyaV+OY8isUkjmsZdvdN4PpB+qXAT5dcOOHqe2vQC9
	My4ZpJeF/W07SG3i11HlJLhKyHUjwML6eZyfqzlse/cvwEnp6nxVSRpNmg8XF5NItSpt+J5dQHhgv
	6QlS8rpEkBatgsRJGcNd7xRxuE2eyWodybJm1bwFB2y2yy1ZJNYr83CVIicYUhwvupn6qgiS3hTKy
	dMSTJ2uQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v67C7-000000020nK-0zp2;
	Tue, 07 Oct 2025 12:53:31 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v67C4-000000020mE-49is
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Oct 2025 12:53:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B77DD43C43;
	Tue,  7 Oct 2025 12:53:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 91EE0C4CEF1;
	Tue,  7 Oct 2025 12:53:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759841606;
	bh=JPWlmf592WX06I9M3tsj+KikVBlunSp1rDaNErH1gr4=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=Vrf2TL8Q2KuaAHshwfpUWdbwV47WoWHISDc8KkXtrC9WNfssYxk7UT62RxzxQCjU+
	 CcAUMpRfxu1N3zN1F8w6T5vz2vl5ng1ScjjnUZ6d++HvAQjYH64zmek3+EVk+Gq6Ws
	 Quua36M1nxiijEyUEYQsfai8kE2MtQjdUC17em6A0WuUR3mR2LgpmmzAEmDlNqLwYp
	 jBeLcVxv+AJ+jKoQO6IrHgXfySM1xfzbzYBj0m5PWNrm55g0L2mlBE0OBYb4q9ILZs
	 AMsfiTpwGls3nrSRObhf3txncAfk6J5Ezor6yvU4GCesCjlTR6jYcenorMT3VvXum4
	 nz49Tm+mFUZmg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8283FCCA476;
	Tue,  7 Oct 2025 12:53:26 +0000 (UTC)
From: Ali Khan via B4 Relay <devnull+abdulalikhan1337.gmail.com@kernel.org>
Date: Tue, 07 Oct 2025 12:53:09 +0000
Subject: [PATCH] ARM: OMAP2+: Fix falg->flag typo in omap_smc2()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251007-omap-falg-fix-v1-1-545a1de74a0a@gmail.com>
X-B4-Tracking: v=1; b=H4sIADQN5WgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDAwNz3fzcxALdtMScdN20zArd5ERD0zRDY7NkE0MzJaCegqJUoDDYvOj
 Y2loA1fbSbV8AAAA=
To: Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
 Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, 
 Russell King <linux@armlinux.org.uk>
Cc: linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Jens Schleusener <Jens.Schleusener@fossies.org>, 
 Ali Khan <abdulalikhan1337@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1759841606; l=1869;
 i=abdulalikhan1337@gmail.com; s=20251007; h=from:subject:message-id;
 bh=LO4l4xtXGeg/5kuikNmT+7wW9ZSxcTZ7VwPYOe2JJsc=;
 b=X2XrdnImlsmvmIP+rT9bIf5q8oh9/l/ssN5g7kMwZcb9W2GPAp/bQU6mmsmOCgNYJcnpOYrMR
 zpTqzrk9+cPCmAjP4dclW02HoeYB1Lx2r4qXbIEO9HAdqXxIGuMrSNd
X-Developer-Key: i=abdulalikhan1337@gmail.com; a=ed25519;
 pk=MGvpDjvgp0SIh0jkqpHnh8BE7tUnGwAv3jhzd3o/xS4=
X-Endpoint-Received: by B4 Relay for abdulalikhan1337@gmail.com/20251007
 with auth_id=538
X-Original-From: Ali Khan <abdulalikhan1337@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251007_055329_072228_26D3C5FF 
X-CRM114-Status: GOOD (  11.93  )
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
Reply-To: abdulalikhan1337@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Ali Khan <abdulalikhan1337@gmail.com>

Fix a spelling error in the omap_smc2() function declaration
and in a corresponding comment within the assembly source.
This was reported via bugzilla in 2019.

Reported-by: Jens Schleusener <Jens.Schleusener@fossies.org>
Link: https://bugzilla.kernel.org/show_bug.cgi?id=205891
Signed-off-by: Ali Khan <abdulalikhan1337@gmail.com>
---
 arch/arm/mach-omap2/omap-secure.h | 2 +-
 arch/arm/mach-omap2/omap-smc.S    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-omap2/omap-secure.h b/arch/arm/mach-omap2/omap-secure.h
index 2517c4a5a0e2..04b4ba0f59ab 100644
--- a/arch/arm/mach-omap2/omap-secure.h
+++ b/arch/arm/mach-omap2/omap-secure.h
@@ -68,7 +68,7 @@ extern u32 omap_secure_dispatcher(u32 idx, u32 flag, u32 nargs,
 				u32 arg1, u32 arg2, u32 arg3, u32 arg4);
 extern void omap_smccc_smc(u32 fn, u32 arg);
 extern void omap_smc1(u32 fn, u32 arg);
-extern u32 omap_smc2(u32 id, u32 falg, u32 pargs);
+extern u32 omap_smc2(u32 id, u32 flag, u32 pargs);
 extern u32 omap_smc3(u32 id, u32 process, u32 flag, u32 pargs);
 extern int omap_secure_ram_reserve_memblock(void);
 extern u32 save_secure_ram_context(u32 args_pa);
diff --git a/arch/arm/mach-omap2/omap-smc.S b/arch/arm/mach-omap2/omap-smc.S
index 7376f528034d..fe3b5478200a 100644
--- a/arch/arm/mach-omap2/omap-smc.S
+++ b/arch/arm/mach-omap2/omap-smc.S
@@ -32,7 +32,7 @@ ENTRY(_omap_smc1)
 ENDPROC(_omap_smc1)
 
 /**
- * u32 omap_smc2(u32 id, u32 falg, u32 pargs)
+ * u32 omap_smc2(u32 id, u32 flag, u32 pargs)
  * Low level common routine for secure HAL and PPA APIs.
  * @id: Application ID of HAL APIs
  * @flag: Flag to indicate the criticality of operation

---
base-commit: 07e27ad16399afcd693be20211b0dfae63e0615f
change-id: 20251007-omap-falg-fix-ca15f136c416

Best regards,
-- 
Ali Khan <abdulalikhan1337@gmail.com>




Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D4F6F4369C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Apr 2026 13:16:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=CKc3usujYeMuu0NSGxZWjY+cxk3QBhiT4E/fvjJLs4E=; b=bj1++jhYPghZf8nX4/IxvVB7E1
	9pZPMeBSWve1gd+57CixQiuPUGqEr3QmBLGXMTwO5lDWcwTUfBk3UoizaQmQwEiPjLB6pI5Oh6+D5
	k3EcgQWAVs9vzjLQJE/WH7I/7zvvszOR5BL1tLyeBxfD7roGNlOSh2JHLsGc6KKfh/xBrnBbvH5aH
	1N8pdEGsZ1mQA0Hdhgj4NbzbO5rZFTrLa/7xuej5+0on7dPHE02v+vGT27lJ7EOAeKOOaHrP6aZvG
	L/eldNBAFYqiYoIhk0rvqqcdF+4/1H2typBnl31ixHtAmFfqFzGHv8Zdaxq6NmjrzokwlXH/b9UF8
	1bznbiIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDj3A-000000044a8-2119;
	Fri, 17 Apr 2026 13:16:00 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDj37-000000044a0-3guV
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Apr 2026 13:15:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1529E60128;
	Fri, 17 Apr 2026 13:15:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43CB6C19425;
	Fri, 17 Apr 2026 13:15:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776431756;
	bh=CsBxhNpzoUuwJOaSktkuM40YkzYY3O1cx/QZRXjUfYg=;
	h=From:To:Cc:Subject:Date:From;
	b=aDPkPTvwZG04fqo4mIKgpkVPZbA68bs1sNugmqJla/lLngqRlab2hsE8cLO2NtNhz
	 qAwEx8uDqhlt+GuJqyAv+sJwUQ+FLDKcVor3el0rnxPTA/x29Je9LcBBJf0qeZ5hjA
	 uMCqPr47ZEYQ+Hit5XRg3ydS/Aq8W/h0kl/fwHNUvU1UJcLnyt/thctCtvEKGOjmUL
	 Vz1p38C43OeJKU2+4UyqkQ6ZLUF0eCwDtz1qrJ7X6zyDDiVS+1SAFVa0Bs93HpPZLT
	 Dirva2dVzmH6AUxZhh/emecHUCHIvQFLupvvJmky0nW4muLdTTottnd9JLJaB7rTJ1
	 HaIQcHqLStxXQ==
From: Thierry Reding <thierry.reding@kernel.org>
To: Thierry Reding <thierry.reding@kernel.org>
Cc: Aaro Koskinen <aaro.koskinen@iki.fi>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org,
	linux-omap@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Paul Walmsley <pjw@kernel.org>
Subject: [PATCH v2 1/3] MAINTAINERS: Move Peter De Schrijver to CREDITS
Date: Fri, 17 Apr 2026 15:15:46 +0200
Message-ID: <20260417131549.3154534-1-thierry.reding@kernel.org>
X-Mailer: git-send-email 2.52.0
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

From: Thierry Reding <treding@nvidia.com>

Peter sadly passed away a while back. Paul did a much better job at
finding the right words to mourn this loss than I ever could, so I will
leave this link here:

  https://lore.kernel.org/lkml/alpine.DEB.2.21.999.2407240345480.11116@utopia.booyaka.com/T/#u

Co-developed-by: Paul Walmsley <pjw@kernel.org>
Co-developed-by: Aaro Koskinen <aaro.koskinen@iki.fi>
Co-developed-by: Geert Uytterhoeven <geert@linux-m68k.org>
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
Changes in v2:
- add more missing entries

 CREDITS     | 10 ++++++++++
 MAINTAINERS |  1 -
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/CREDITS b/CREDITS
index 885fb05d8816..afd1f70b41cf 100644
--- a/CREDITS
+++ b/CREDITS
@@ -3645,7 +3645,17 @@ D: Macintosh IDE Driver
 
 N: Peter De Schrijver
 E: stud11@cc4.kuleuven.ac.be
+E: p2@mind.be
+E: peter.de-schrijver@nokia.com
+E: pdeschrijver@nvidia.com
+E: p2@psychaos.be
+D: Apollo Domain workstations
+D: Ariadne and Hydra Amiga Ethernet drivers
+D: IBM PS/2, Microchannel, and Token Ring support
 D: Mitsumi CD-ROM driver patches March version
+D: TWL4030 power management and audio codec driver
+D: OMAP power management
+D: NVIDIA Tegra clock and BPMP drivers, among many other things
 S: Molenbaan 29
 S: B2240 Zandhoven
 S: Belgium
diff --git a/MAINTAINERS b/MAINTAINERS
index ef978bfca514..ffe20d770249 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -26145,7 +26145,6 @@ T:	git git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git
 N:	[^a-z]tegra
 
 TEGRA CLOCK DRIVER
-M:	Peter De Schrijver <pdeschrijver@nvidia.com>
 M:	Prashant Gaikwad <pgaikwad@nvidia.com>
 S:	Supported
 F:	drivers/clk/tegra/
-- 
2.52.0



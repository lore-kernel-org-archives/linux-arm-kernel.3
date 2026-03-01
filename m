Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40276FD0048
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Mar 2026 01:24:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bR3jEQbRgzNe9RyK1DS7LjRqwRnue/xV0mWBVFLB6ok=; b=nm6agzSbCRKiNYKWG9SJ2uB/HY
	gnwKdv/BBn+lK1sJNPP+pgyde/EeHMZb72RsfQ92brIqNeeXn/GVDKc5YOn77dhBW5+ZMlbB7UQRw
	Ujela1wGhBBrDLht6IUExlsaYrEmfYnzmSAiM4PeHMzQGJbanGLIcBQD207rTAb9jaHlLIzGsGM3R
	ShwLIx3ET73c1Ojah1SCAAK/iG6c+wi4YcW5Ml74U6tUoc4sfocobgzms4EqmsIYdQzUVKtyEsD63
	45oT3cN4d+TPdCuiYpX6t5jvD23Xq1g2Ej7GyPaTyVBzTTQBnTB0BLFVDI8UF2gaiiaJ9eiqGvCcx
	kZSuS45w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwVXh-0000000AVms-0BMl;
	Sun, 01 Mar 2026 01:24:21 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwVXf-0000000AVmW-072i
	for linux-arm-kernel@lists.infradead.org;
	Sun, 01 Mar 2026 01:24:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B362E423DD;
	Sun,  1 Mar 2026 01:24:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D141FC19421;
	Sun,  1 Mar 2026 01:24:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772328258;
	bh=sSC7oe0HeCpeKh8oQAfJfXfKX/UoFXz5ALZDNb2y0x8=;
	h=From:To:Cc:Subject:Date:From;
	b=pGaZ8hVY5Cdw49b/i4m4G5xHU/5Dz5wW7nDZWlI0MJ5KPNLS6J4vI/hzJr0ItzXmx
	 DfaI4rwqoYOFNEgu3Z17Is5SLQynzK7cs79+pzUXr1Vl2PI9H2IjzigOLqvCqnuVKP
	 duqQ4unDAkF5zC1v2b9Uc3Zd2aDhbHaID/UTinxkd7TpeQvMcD3fVHmSXoJaSncD6r
	 mJinNha67HH3q2TZqwB6vRkDK+L9fvtj2wS5YbUEsGyz7v4l/M9DPFQU+pRX1mD+c1
	 eYw2KkS697UZcg2DyVIH8N3OBqAc520GsaaBCF+gjbqRRiby+f+70/v1UKqYWO5pBi
	 jB7NqtL+yvSHQ==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	joey.gouly@arm.com
Cc: David Spickett <david.spickett@arm.com>,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org
Subject: FAILED: Patch "arm64: poe: fix stale POR_EL0 values for ptrace" failed to apply to 6.12-stable tree
Date: Sat, 28 Feb 2026 20:24:16 -0500
Message-ID: <20260301012416.1681087-1-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Patchwork-Hint: ignore
X-stable: review
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260228_172419_084986_765691F3 
X-CRM114-Status: GOOD (  16.33  )
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

The patch below does not apply to the 6.12-stable tree.
If someone wants it applied there, or to any other stable or longterm
tree, then please email the backport, including the original git commit
id to <stable@vger.kernel.org>.

Thanks,
Sasha

------------------ original commit in Linus's tree ------------------

From 1f3b950492db411e6c30ee0076b61ef2694c100a Mon Sep 17 00:00:00 2001
From: Joey Gouly <joey.gouly@arm.com>
Date: Tue, 27 Jan 2026 13:39:26 +0000
Subject: [PATCH] arm64: poe: fix stale POR_EL0 values for ptrace

If a process wrote to POR_EL0 and then crashed before a context switch
happened, the coredump would contain an incorrect value for POR_EL0.

The value read in poe_get() would be a stale value left in thread.por_el0.  Fix
this by reading the value from the system register, if the target thread is the
current thread.

This matches what gcs/fpsimd do.

Fixes: 175198199262 ("arm64/ptrace: add support for FEAT_POE")
Reported-by: David Spickett <david.spickett@arm.com>
Cc: stable@vger.kernel.org
Signed-off-by: Joey Gouly <joey.gouly@arm.com>
Cc: Kevin Brodsky <kevin.brodsky@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>
Reviewed-by: Kevin Brodsky <kevin.brodsky@arm.com>
Acked-by: Mark Rutland <mark.rutland@arm.com>
Signed-off-by: Will Deacon <will@kernel.org>
---
 arch/arm64/kernel/ptrace.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/kernel/ptrace.c b/arch/arm64/kernel/ptrace.c
index b9bdd83fbbca0..8a14b86cd066c 100644
--- a/arch/arm64/kernel/ptrace.c
+++ b/arch/arm64/kernel/ptrace.c
@@ -1486,6 +1486,9 @@ static int poe_get(struct task_struct *target,
 	if (!system_supports_poe())
 		return -EINVAL;
 
+	if (target == current)
+		current->thread.por_el0 = read_sysreg_s(SYS_POR_EL0);
+
 	return membuf_write(&to, &target->thread.por_el0,
 			    sizeof(target->thread.por_el0));
 }
-- 
2.51.0






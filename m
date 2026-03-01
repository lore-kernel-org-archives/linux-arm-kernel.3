Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6DDBFD0049
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Mar 2026 01:29:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xsw+vdHG/CSuStkVdHi5SYTlicMlSySICyhyyphJu68=; b=J7Dv9rAdP8ugO8z/V3QgjGSNbN
	42rno4GA+Q6E8BSNzv05eAl6KEkjuPJjZ1rEQvf+dtuTl9BaSkn+XjYJD3e8lwiXELD8ZWWx2kzH+
	RvLbjzJ8fW5uqvdtMEVwB06I6DEYkJaSR8KUDGD4O3nSph152+jtBPmw45dSsyTRs/IjnKURxyueT
	XIb5ldc63QBxpKc2I3fcoI4Dn/f0duZ2i9TRE1lrFHtDVRCPNgA+dcOdaGIJzeQLqj27eInI+8rw0
	yX5aayy5Hq8wN3+uQp1tcGWy/h4mtl10VeowhkKdqXFg/CZA0wnpuExSByid8xpIU3phrZwYzPLa6
	CaVxBDwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwVcq-0000000AXCi-3kZA;
	Sun, 01 Mar 2026 01:29:40 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwVcn-0000000AXBm-3dy2
	for linux-arm-kernel@lists.infradead.org;
	Sun, 01 Mar 2026 01:29:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 63B224199C;
	Sun,  1 Mar 2026 01:29:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 997DBC19421;
	Sun,  1 Mar 2026 01:29:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772328577;
	bh=DsQ3K+tlIu9eWzhR1RyKkxyUD8zRG9UOdgZrUnWCylM=;
	h=From:To:Cc:Subject:Date:From;
	b=bE+TW6SuMj6M//r3RjTh0KIDhPfHiiLqJOyhSkLN0tJkrOOyGdg7PJTJTjTmqEQSF
	 6dfKY2pb6vrGMk7hQy7zARIokIkNeErF995xJYbuK/R71D4QH+UD7rLmRv+/AoFuJy
	 7+zg/apsYSNZJV7DmKera+y9njnriMcMMBi0KsctLU629VqBYEHuvf5V1DNvtLcoW6
	 L6vfMVuRyG2ceE6fmqUzblXLyRuwZqS4nXfqYGB4ZvZR5JuDKaV84r2a3TtcezpT6u
	 FroIAZFhRz+/SxY65sSZkPyLCCZ0HEMEqFNbkTUDGj2hj+BtEaZujvJ/M3JqgjTrO1
	 oUngC8/Pn3ocA==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	maz@kernel.org
Cc: Hyesoo Yu <hyesoo.yu@samsung.com>,
	Quentin Perret <qperret@google.com>,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org
Subject: FAILED: Patch "arm64: Force the use of CNTVCT_EL0 in __delay()" failed to apply to 6.12-stable tree
Date: Sat, 28 Feb 2026 20:29:35 -0500
Message-ID: <20260301012935.1687392-1-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Patchwork-Hint: ignore
X-stable: review
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260228_172937_951280_120FF951 
X-CRM114-Status: GOOD (  20.15  )
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

From 29cc0f3aa7c64d3b3cb9d94c0a0984ba6717bf72 Mon Sep 17 00:00:00 2001
From: Marc Zyngier <maz@kernel.org>
Date: Fri, 13 Feb 2026 14:16:19 +0000
Subject: [PATCH] arm64: Force the use of CNTVCT_EL0 in __delay()

Quentin forwards a report from Hyesoo Yu, describing an interesting
problem with the use of WFxT in __delay() when a vcpu is loaded and
that KVM is *not* in VHE mode (either nVHE or hVHE).

In this case, CNTVOFF_EL2 is set to a non-zero value to reflect the
state of the guest virtual counter. At the same time, __delay() is
using get_cycles() to read the counter value, which is indirected to
reading CNTPCT_EL0.

The core of the issue is that WFxT is using the *virtual* counter,
while the kernel is using the physical counter, and that the offset
introduces a really bad discrepancy between the two.

Fix this by forcing the use of CNTVCT_EL0, making __delay() consistent
irrespective of the value of CNTVOFF_EL2.

Reported-by: Hyesoo Yu <hyesoo.yu@samsung.com>
Reported-by: Quentin Perret <qperret@google.com>
Reviewed-by: Quentin Perret <qperret@google.com>
Fixes: 7d26b0516a0d ("arm64: Use WFxT for __delay() when possible")
Signed-off-by: Marc Zyngier <maz@kernel.org>
Link: https://lore.kernel.org/r/ktosachvft2cgqd5qkukn275ugmhy6xrhxur4zqpdxlfr3qh5h@o3zrfnsq63od
Cc: stable@vger.kernel.org
Signed-off-by: Will Deacon <will@kernel.org>
---
 arch/arm64/lib/delay.c | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/lib/delay.c b/arch/arm64/lib/delay.c
index cb2062e7e2340..d02341303899e 100644
--- a/arch/arm64/lib/delay.c
+++ b/arch/arm64/lib/delay.c
@@ -23,9 +23,20 @@ static inline unsigned long xloops_to_cycles(unsigned long xloops)
 	return (xloops * loops_per_jiffy * HZ) >> 32;
 }
 
+/*
+ * Force the use of CNTVCT_EL0 in order to have the same base as WFxT.
+ * This avoids some annoying issues when CNTVOFF_EL2 is not reset 0 on a
+ * KVM host running at EL1 until we do a vcpu_put() on the vcpu. When
+ * running at EL2, the effective offset is always 0.
+ *
+ * Note that userspace cannot change the offset behind our back either,
+ * as the vcpu mutex is held as long as KVM_RUN is in progress.
+ */
+#define __delay_cycles()	__arch_counter_get_cntvct_stable()
+
 void __delay(unsigned long cycles)
 {
-	cycles_t start = get_cycles();
+	cycles_t start = __delay_cycles();
 
 	if (alternative_has_cap_unlikely(ARM64_HAS_WFXT)) {
 		u64 end = start + cycles;
@@ -35,17 +46,17 @@ void __delay(unsigned long cycles)
 		 * early, use a WFET loop to complete the delay.
 		 */
 		wfit(end);
-		while ((get_cycles() - start) < cycles)
+		while ((__delay_cycles() - start) < cycles)
 			wfet(end);
 	} else 	if (arch_timer_evtstrm_available()) {
 		const cycles_t timer_evt_period =
 			USECS_TO_CYCLES(ARCH_TIMER_EVT_STREAM_PERIOD_US);
 
-		while ((get_cycles() - start + timer_evt_period) < cycles)
+		while ((__delay_cycles() - start + timer_evt_period) < cycles)
 			wfe();
 	}
 
-	while ((get_cycles() - start) < cycles)
+	while ((__delay_cycles() - start) < cycles)
 		cpu_relax();
 }
 EXPORT_SYMBOL(__delay);
-- 
2.51.0






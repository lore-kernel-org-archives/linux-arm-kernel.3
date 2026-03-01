Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35A9DFD0045
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Mar 2026 01:39:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Nze/PbkLQEGFC5wFx4YMnCqqZfsImh6X6BF/olNxeHs=; b=yOrCMELclp3PeeETljFN7X9Z4W
	OmWiwieZxgUa5SwRojDxlvFjFc+tFiJ34yd+j0XH3BRcVcewH1TlxOubwe4klQnFpftuhz3DZyYYO
	y80WBHMxfOsJkjq5jUtZuSGVk+22kZ1AfbNvOEbxOPoH7oIagt6oNK6d8qQhQU3MFYho40iglUSNU
	1n/T5FlgRv08oK/jxNFcawO3r5Q2+hazb8klZ5QjotBK9AaZxBbKPDMFv/+zUwukOyMDHdepoQJ6z
	5dQ4y9Sa0LL4lpAyyhNMaFHWdsmTex+L+Qhx7z8Z0StnxcJ1jMVl92MCIXvyVLbW3qCTrZHcFI8Aw
	+vtCa2pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwVmV-0000000AbF9-1IlX;
	Sun, 01 Mar 2026 01:39:39 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwVmU-0000000AbF0-3Qxy
	for linux-arm-kernel@lists.infradead.org;
	Sun, 01 Mar 2026 01:39:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 45C976012A;
	Sun,  1 Mar 2026 01:39:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4738EC19424;
	Sun,  1 Mar 2026 01:39:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772329178;
	bh=GzDfd01aK8P5swVuGIAGZhn3hhR2nehCFykj2Jutx8M=;
	h=From:To:Cc:Subject:Date:From;
	b=BgkmEovbedVlMtvmhX0G33U6BcF45cjrwkDBHyTF6QzpxKFVaSbtJGNoy3kXfXyWA
	 YPgu1Kcb5sQHatn3/zjs0PzscKwGZHq6bixCzQm9orC8hX2v/Y/8DPxVuclmQ/giuY
	 wsdbiDlyJVC393/xfvWk5A2jBlG8ivKnlh2HvzrUtkp0grsFcZqcwZXARo2LDtLc9C
	 Wparbpt6g7CF2SEwCXmt+Q919v1n5f9TqXRPKU/2rbaAB3SkgmMolleFsnZhhxy+mf
	 CagDmMa7UEvmbM095/xLg+oLQJYyH7lbCDZNgdD1wxkV3ostmF3AKEFEV0qg1+uwo/
	 dRJtkNNF5zwAA==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	maz@kernel.org
Cc: Hyesoo Yu <hyesoo.yu@samsung.com>,
	Quentin Perret <qperret@google.com>,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org
Subject: FAILED: Patch "arm64: Force the use of CNTVCT_EL0 in __delay()" failed to apply to 6.6-stable tree
Date: Sat, 28 Feb 2026 20:39:35 -0500
Message-ID: <20260301013936.1700644-1-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Patchwork-Hint: ignore
X-stable: review
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

The patch below does not apply to the 6.6-stable tree.
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






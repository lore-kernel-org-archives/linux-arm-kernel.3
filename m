Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C9BDCD37AA
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 May 2026 09:42:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Vsrl/Bkp06Fy7Npl8UJC5GdCSS/Cbymvr4nzR7m3JRo=; b=2YL7Et9loZXbcsqqslHPrafoTy
	9cadaI/s8scL1VoARkKnbNKnLniQIics+02XJ4KUEiYMCy6xwcL/Wek1kILMa1K+nboP+ppFwxEmP
	zIcskyC9oTdDTyXAeknD68+AQdthIUfu5FLC7EgF4mSt0ZtuTN9V9Uo0AsoP1CAvCv4t1/aoqPjCH
	jHan42VJI3Basphfw5Ivx4Svbl8/38lr5SSAgm/KXYecPMKx/ECl2QsMCW6WN6AHEFZbdgW1+myWS
	FRypCreANK/lEccco902pR/7lh0MvQDYHv0AmsC5AF6w4jA+I4pss2v7dLFNxdVedg+WfrLMrX3OY
	voabYq/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLHiw-000000068w1-1W5w;
	Fri, 08 May 2026 09:42:22 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLHiv-000000068uW-1aPl
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 08 May 2026 09:42:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=Vsrl/Bkp06Fy7Npl8UJC5GdCSS/Cbymvr4nzR7m3JRo=; b=R0Z56M/OKEN4UQF2kyN//hmWYV
	6MTrhB4LCCNv0pzsKQrIqExhIwr8Y1OIDbHELpSQeh7X2qcUshowRe5gonJ4NUbFxU0OdpJJV8S/U
	fdujgxUUfHngMeEMNMAgphTESLtXRCAS3GLs2hhnTqI6h7jnEd0IjYI4cRScUdxpCqhmla9KBHwfU
	HT6a4ujpj5aPsWavZRqYEvxTmst2fUMuwB+EP0F1hyXXyYPHLwnKFiKsocdYo4zEqM9Os3fUR2m5H
	j8xlsm+G0y9ad6Qu0xaXjSqzhPvbUlGqUDGs8q46PAWj+JAK9vnFz4iG5gJ275ut6SxFdZn2bXoqs
	Vd+7zqFg==;
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLHim-00000005qTE-2MHa
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 May 2026 09:42:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6B11D444E1;
	Fri,  8 May 2026 09:42:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B62DC2BCB8;
	Fri,  8 May 2026 09:42:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778233331;
	bh=gZfp7AFUDRuKyFzNq7gSRxIUj7Mf0Qt8SSGk362fa3U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pY9kvXnGRso1B/12FM9wMLIIKOCuq1HszrTPq8bf6Mhfbmv8FSqm5Z2susf9fDC5z
	 WDa8Og42BNii1l9w1zeF++GNWEg4BV/1UIoXC6Q6YTsVzE2nQEXlv1qvDO4EV4/Zww
	 xDWJdkD6pkv56mHOn79/Qw8mmUGgtTxGhzMPdu/8q67Qz/tCGZ0wGGvzDCiOY1gkzA
	 oDwTHvrAamg0zw150QYLRdJGgDO1AQsZB/XY3kcAvQVXE/0XhAHS3oQwcr1fHOSHkc
	 Sx/Ox6BW0Q5jkkjIegShPFWs0YXs7QEWU8Kk77S97wMACk+hFQ5XWE4sXHiQL8u423
	 lekvwz9rJkBdA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1wLHij-00000000HJz-29OQ;
	Fri, 08 May 2026 09:42:09 +0000
From: Marc Zyngier <maz@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Ben Horgan <ben.horgan@arm.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: [PATCH v2 5/5] arm64: Convert __delay_cycles() to arch_timer_read_vcounter()
Date: Fri,  8 May 2026 10:42:03 +0100
Message-ID: <20260508094203.2913880-6-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260508094203.2913880-1-maz@kernel.org>
References: <20260508094203.2913880-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, catalin.marinas@arm.com, will@kernel.org, mark.rutland@arm.com, tglx@kernel.org, ben.horgan@arm.com, daniel.lezcano@linaro.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260508_104216_729681_16D21B77 
X-CRM114-Status: GOOD (  12.10  )
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

Relax the need for disabling preemption in __delay_cycles() by
using arch_timer_read_vcounter(), which will disable preemption
only when this is actually required.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/lib/delay.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/lib/delay.c b/arch/arm64/lib/delay.c
index e278e060e78a9..a667df920697d 100644
--- a/arch/arm64/lib/delay.c
+++ b/arch/arm64/lib/delay.c
@@ -32,10 +32,9 @@ static inline unsigned long xloops_to_cycles(unsigned long xloops)
  * Note that userspace cannot change the offset behind our back either,
  * as the vcpu mutex is held as long as KVM_RUN is in progress.
  */
-static cycles_t notrace __delay_cycles(void)
+static cycles_t __delay_cycles(void)
 {
-	guard(preempt_notrace)();
-	return __arch_counter_get_cntvct_stable();
+	return arch_timer_read_vcounter();
 }
 
 void __delay(unsigned long cycles)
-- 
2.47.3



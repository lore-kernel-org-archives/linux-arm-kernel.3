Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C79A60A2618
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 05:17:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rajQkhB5;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=JD9prCgu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=H/SXDgdhEaQ9Leps7ngp4tdnFYLEJykx5g1h92ea+nY=; b=rajQkhB5MjICCTwHtHg//LTjg8
	4RKkcqdomQWzta2ALrpav5FtDwl+tjhn1CroC6rFlKwmEgq+NnpvUvkstQ5ZWAwf0xDGUio1oUlOD
	JKVAI/4Guh01tiSIwoEEG9d2ZRLNqIMy4r8oMLhem+wdi/gn0V64ZTl9OX60UC80h7jBubOWdK5ZI
	TY/+evqKZdRaKqnCqFxra1Qqlv1BP1Utq40SF2OWTcaHQhoDlkTk+3C6P9bmY8RA2tLjdThX9eltF
	QCR/4xhFC//jYC/CqAaIpRBO6yo7y/M7/9/eWvLUxNnQn9LQ9nep5w5S4NQPp6bmyhzsQ+BVEpAxu
	dw7Ee98A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJlB2-0000000DMCB-0H2v;
	Thu, 22 Oct 2026 05:17:20 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJlAy-0000000DMBa-35sX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 05:17:18 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4a16aaf2067so16288825e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 21 Oct 2026 22:17:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792646234; x=1793251034; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=H/SXDgdhEaQ9Leps7ngp4tdnFYLEJykx5g1h92ea+nY=;
        b=JD9prCgubpLjQMK8tPd0yazorBGbjv4B6y8baymxGOqpoVjoWAD0SE+wBWAzHkc474
         qKu4cXBW6Ow6obAQuiUBpaYqsFDXE7L9AgDq5R0gSYJWGfiyB8Hm4mRj6cX6oNYWQsTU
         pS1SeaGoxLKkhUaHtnMLY6VXZuT0POLkPNsAFRRr6CjuPGAzcf1wUYT6ICPMw3+HyC8D
         me0LvfjviqUPgjEanLI6Hh+uroQ52+2FvD5tKJhZTK1pfV4Zc5ltoU3aa+CfcFJ4L096
         vA8Rb18aA8wH5Vvar7h/jDqL4MFmvQ/kLOfT100BtIleYFhYdwetjHsOqvNLbKGqtQ7+
         oPXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792646234; x=1793251034;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H/SXDgdhEaQ9Leps7ngp4tdnFYLEJykx5g1h92ea+nY=;
        b=u+cn31JpDImT0LLDR5uYAyKD/+bOK3dQefZS/lHymjhRigwX6bQSSQhXX4KEdCnUEF
         z5oiBX+HA/idHmXD/aNbEjqToaF4ggkbJ7/9+igxY3Z040zpaFCrM40lOgSAPi5m/yyH
         SZZVtH0uChc18Nfp3ixh0FPZjsB6HiEF3oUp2Wba44DOIoUh2exVpYHs4HmnqC7VDwUQ
         sZt/opFsgpZB+LHjVytG5JAElDpXsR/6NPitFOunQhaAIiHiKluUkw8rEqbQ+CSXADgl
         jm8tfV43jYI87i7bB30+fexSkLhhLBqz5SAygxD08Dj88MlVLWkywuZjwwQKPdK80XSu
         avXA==
X-Forwarded-Encrypted: i=1; AKwUvBwsWa7n2eKn8r5CXdYVc08qlqnm9wxX7KvaxTV1EBzxLZyxyCSdpErmYmVZxt/W+Ibb7KRNjza2Be82tVVIAzGu@lists.infradead.org
X-Gm-Message-State: AFq9FYI37muITSJpHOuCXWOkd7I2kyhtJvepNZM7fbNfZA0GPnjdnIng
	fdav+wbwa8LnVWLyskp9yIonPtx64QyfhIv/JsO8UzcWY/t+Pjj/qgQQ
X-Gm-Gg: AYBFou0WdINsRpnfMGN8K3rX9Eqkcw82xY6Ig+JkHNjpAQHrgkniFlED1rcv87baRBU
	uzmvKJJJtN8KSytQmvv2+zhU8hlBvz0KbdTr9GQIyT337SWPDYtBmlemG0NiGLDHnSTigm5+tPg
	nz8vun7YqeM/EJi2fJ+4F64PGMIxGS9e9Cknl+I/3UfhoQLZqLO7N0c7uQ58o9SCbf7Q59dEeER
	KEP99CPWNeLC05Bv8iYG2X1dvGTpoLOSn6wZH4TTv7cEn6nlBohHEHeAoCKicknviJRtAyLTpSN
	nB0wdgeGs2eYLnC6rUPbvhoOZ10lUp9xSvlDyWbJJeJj2wIydpof5piSVacVOggVdPmdm1YVztF
	Djly/xpc2m1oItXI+nRGryuNdWVzvzbabvIG6py+J3fqw3QnLJso52AcuEkePnyqsnQY5UMsvnN
	Y6VBmGaWLl62YS13KmusRDVLPw4aSAKDuYYYosdKFjecC0g/bxpwIMpyxMEuNbeSR8Kb6tzmiGN
	bpf9/cbZL2aNIHUF/F7n4naQ3CnjxeEm2jhhZ1rGowF0oSSdXEQzgIuKnO76nDQueOkUVP2mkdA
	oKXKA1SXpJKyunSRG9JH8NIj6B7T/3wxkWOnSyk020H4YZHPlyoPdgLHmTcbMR08w11rhtGuwZX
	UfU6E8Dz60AuZTwmmaTAOygxS0JSWyWMH+qq53UIp/YY6vr1y8G5EU01CJLw=
X-Received: by 2002:a05:600c:3513:b0:4a1:cedc:ab49 with SMTP id 5b1f17b1804b1-4a1fdd1e97emr87433205e9.31.1792646233938;
        Wed, 21 Oct 2026 22:17:13 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-ad43-d501-2c28-bb72-120d-420e.310.pool.telefonica.de. [2a02:3100:ad43:d501:2c28:bb72:120d:420e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1fd0f4427sm90362275e9.3.2026.10.21.22.17.11
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 21 Oct 2026 22:17:12 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Steven Rostedt <rostedt@goodmis.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@kernel.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Ingo Molnar <mingo@redhat.com>,
	Andy Lutomirski <luto@kernel.org>,
	Frederic Weisbecker <frederic@kernel.org>,
	"Paul E . McKenney" <paulmck@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Boqun Feng <boqun@kernel.org>,
	Waiman Long <longman@redhat.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Hongyan Xia <hongyan.xia@transsion.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-trace-kernel@vger.kernel.org,
	linux-rt-devel@lists.linux.dev,
	linux-doc@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 00/12] entry, tracing: Classify early hardirq entry and return tails
Date: Thu, 22 Oct 2026 07:16:42 +0200
Message-Id: <20261022051654.79224-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_221716_807514_245CE867 
X-CRM114-Status: GOOD (  17.08  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Tracing's transition recursion slot exists because a callback can run after
architectural hardirq entry but before generic entry increments
preempt_count(). Steve asked whether the count could be updated soon enough
to remove that slot. This RFC establishes that entry contract on arm64 and
closes a separate recursion window exposed by the same tests.

This is a design RFC, not a merge-ready proposal. I am looking for
feedback on the entry contract before extending it to other architectures
or removing TRACE_CTX_TRANSITION.

Clang can outline raw preempt-count updates and
__kern_my_cpu_offset() from noinstr entry code. This series applies to a
tree with the following two patches added:

  - Hongyan Xia, "arm64: Always inline raw preempt count updates"
    https://lore.kernel.org/all/c3a90368dd6c096af9d918e036a27728696fb8a4.1786603168.git.hongyan.xia@transsion.com/
  - Will Deacon, "arm64: percpu: Annotate __kern_my_cpu_offset() as
    '__always_inline'"
    https://lore.kernel.org/r/20260918161407.2300-12-will@kernel.org

Those patches are external prerequisites and are not included in this
RFC.

Patches 1 through 11 split raw preempt-count updates from generic IRQ
bookkeeping. On arm64, ordinary interrupts add HARDIRQ_OFFSET after the
pseudo-NMI decision but before instrumentable generic entry work. The
remaining accounting still happens in irq_enter_rcu().

The exit side has a similar gap. Function-graph and MTE callbacks can run
after the real hardirq state has been removed, and kernel return may
schedule before them. The series records ordinary-hardirq provenance and
restores a synthetic hardirq classification after the preemption decision.
That tail changes only preempt-count and lockdep state. It does not repeat
interrupt accounting, RCU, or tick entry.

Patch 12 keeps tracing's recursion state inside one preemption-disabled
interval. It closes the transition collision reproduced at the IRQ-exit
reschedule boundary. TRACE_CTX_TRANSITION remains unchanged because
unconverted architecture entry intervals can still run before
preempt_count() reflects hardirq context. An x86-64 no-transition control
still recorded recursion at system-vector entry and exit and in the
deferred hrtimer return tail.

The base includes "entry: Account the deferred hrtimer rearm as hardirq
context for lockdep" and "softirq: Preserve interrupt context on return
from interrupt".

The main questions are:

  - Should generic entry expose separate raw-update and bookkeeping phases?
  - Are preempt count and lockdep state sufficient for the return tail?
  - Is arm64 a suitable first user of this contract?
  - Should the recursion-lifetime fix travel with the entry conversion?

Karl Mehltretter (12):
  sched: Split preempt-count bookkeeping from raw updates
  lockdep: Use raw access for pinned hardirq state
  entry: Add the pre-counted ordinary-hardirq entry/exit contract
  entry: Skip inactive IRQ-return reschedule calls
  context_tracking: Split IRQ-exit preparation from the EQS transition
  lockdep: Prepare IRQ-on state from a hardirq return tail
  entry: Carry ordinary-hardirq provenance through kernel return
  entry: Classify ordinary hardirq return-tail work as hardirq context
  arm64: Use the pre-counted hardirq lifecycle
  docs: entry: Describe the pre-counted hardirq lifecycle
  locking/selftest: Exercise hardirq return-tail preparation
  tracing: Pin recursion state for its complete lifetime

 Documentation/core-api/entry.rst     |  75 ++++++++++--
 arch/arm64/include/asm/preempt.h     |   2 +-
 arch/arm64/kernel/entry-common.c     |  25 ++--
 include/linux/context_tracking_irq.h |  32 +++++-
 include/linux/hardirq.h              |  29 +++++
 include/linux/interrupt.h            |   2 +-
 include/linux/irq-entry-common.h     |  96 ++++++++++++++--
 include/linux/irqflags.h             |  14 ++-
 include/linux/preempt.h              |   9 ++
 include/linux/trace_recursion.h      |  14 ++-
 kernel/context_tracking.c            |  78 ++++++++++---
 kernel/entry/common.c                |  38 +++++-
 kernel/locking/lockdep.c             |  48 +++++---
 kernel/sched/core.c                  |  68 +++++++++--
 kernel/softirq.c                     | 166 +++++++++++++++++++++++----
 lib/locking-selftest.c               |  53 +++++++++
 16 files changed, 648 insertions(+), 101 deletions(-)


base-commit: 779ab5d73a22c798d1273b4aaf50cf5b8d750be9
prerequisite-patch-id: 9c009809614854fbff979d65aad6732757d006d5
prerequisite-patch-id: 764fd197db36a3889548bbc41890dd5b3d902f99
-- 
2.39.5 (Apple Git-154)



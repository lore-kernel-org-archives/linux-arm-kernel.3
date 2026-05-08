Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 006D2CD342F
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 May 2026 23:03:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=u1gDxOANLTGn4BedpWzmZyF9gDbfXEA/MvdNcqiuYlY=; b=GtPAKtvzrRHEeJ/qr31NRHDx5o
	czsEr3GgwNPWTitq8vrnBcgL3TeXNr5+g3uTf7fcKuN8d/c/ZIlt/y5thG6s9AZkgcm/2ZSmVj96L
	YM0+hMm5XSz8cRia+gE2rYh7XDqCYzWKWi4YwtqwsppffUfZe4yaZLAIa8+ihe5RY0mXWuZoZTp7T
	EGPn4N7LAat43a4YLRW3MqwPA1MXBhT8+9JWrtXeFH/ornu9FXY1RlYxnl1FFY/TJrmYgF+Y4ZEln
	AlwmRmrw4cy6hQVIgYfedWt4Ez2mr22LYaqUrTavvLlVTYQ5iPb2+HI3R32ch6KIZgjj97jo+rezz
	ipLhxsZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLUDw-00000007h5C-35Cr;
	Fri, 08 May 2026 23:03:12 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLUDt-00000007h4Q-2eur
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 May 2026 23:03:11 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BAC591C0A;
	Fri,  8 May 2026 16:03:02 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CE1EB3F7B4;
	Fri,  8 May 2026 16:03:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778281388; bh=T6mrqFmyOE2qV0yz0/OW3Mys0sEgr97+gzVJbd8lSkI=;
	h=Date:From:To:Cc:Subject:From;
	b=RWwoG98Gt9HaOZ4EarqDWJKP5ICFUdWHnpNIBNSmeTRn5u6kCKPWmfZFR/yy+nzPS
	 gpiZ5dOcNj+/ywQMMkWYQ8VqSfYhsu9wP1EZZ8oaJr8SoNYDlee2K3qqYiq7W+L+S2
	 tl/izZldC4g5MRnbAKTZrnHR3gGky4EklMIP0/ok=
Date: Sat, 9 May 2026 00:03:04 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] arm64 fixes for 7.1-rc3
Message-ID: <af5rqOZ-l_Jj2EkQ@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260508_160310_017966_0967F33D 
X-CRM114-Status: UNSURE (   8.81  )
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

Hi Linus,

Please pull the arm64 fix below. Thanks.

The following changes since commit 030e8a40fff65ca6ac1c04a4d3c08afe72438922:

  arm64: signal: Preserve POR_EL0 if poe_context is missing (2026-05-01 17:44:25 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux tags/arm64-fixes

for you to fetch changes up to 5cbb61bf4168859d97c068d88d364f4f1f440325:

  arm64/fpsimd: ptrace: zero target's fpsimd_state, not the tracer's (2026-05-06 12:11:49 +0100)

----------------------------------------------------------------
arm64 ptrace(PTRACE_SETREGSET) fix to zero the target's fpsimd_state
rather than the tracer's.

----------------------------------------------------------------
Breno Leitao (1):
      arm64/fpsimd: ptrace: zero target's fpsimd_state, not the tracer's

 arch/arm64/kernel/ptrace.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

-- 
Catalin


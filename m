Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1967460A262C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 18:19:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=NrYOkj/0;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=S2X6qFq0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aAgJAbuVXKrl/2XmWKq188uudjDScblSy5jf6BBIQNg=; b=NrYOkj/04bIwpsoCUGbhGzVK5j
	RdPrYxaxvgAtCi7eBjxyi475rN725LAJ6qIkXPvyLQmZ3YbounWQ0sBwOCTX17csNq0+NMWG8+xFR
	JpN1x8jURuMFao8ay51WS6cWqCXJF5EX+uohpID8vTsu2KquchejTguVAozLoQRZ8RlJR8JWrr2CI
	mNlHIFxwagrE4d5jrr5Hzdy648UtJOvwlEIa31HWu/bZv+Jayi9P7/hfvgDPboW5kZL8uEDM/JLX3
	aXzA8oeEObCHPu9y44a90r5aUben5IRTdoXESXSkvSxkMeWL464wOPUgtYRb+tWVaAay5v5m4QVn4
	cOwAf9bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJER6-0000000AQGh-21aF;
	Tue, 20 Oct 2026 18:19:44 +0000
Received: from mail-dy1-x1336.google.com ([2607:f8b0:4864:20::1336])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJER4-0000000AQFa-1IfA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Oct 2026 18:19:43 +0000
Received: by mail-dy1-x1336.google.com with SMTP id 5a478bee46e88-3550c917fd3so4266424eec.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 20 Oct 2026 11:19:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792520381; x=1793125181; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aAgJAbuVXKrl/2XmWKq188uudjDScblSy5jf6BBIQNg=;
        b=S2X6qFq06noW+f4bw4ub5BHxiw39zRGOAYBaBRZrwyKtqllz9koEOZ2IZxzf9dXwz6
         QKMKWc4kE968wMwwIQGmiW2wsvDRDTYD+L8RJ+IcYwwL5o51YvK+JbWEPlm0dKw91iXY
         Ncx4itcYdLKyX6X8cr6kWy1xfH6n0oWkl94YGjVFRL+YD5W8PAEsetUvhyUpLeMoV5ti
         N+eAV8dwe+xiCHl7yt+EQWqF71+V6pz09KQRaibWa459tU3syziTyI1hRlnY02Sew/oR
         epr/iXRMNfPHiUZR/absNshcoBGw4vYICjhlDtkFjygyHpVxC36Uk/cFSAlvwaPcVHlV
         qVSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792520381; x=1793125181;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aAgJAbuVXKrl/2XmWKq188uudjDScblSy5jf6BBIQNg=;
        b=hQjFKmR7pGx7Jc98dM+j2g5ZWVALBPCRvjC3zJDTTJYr7MPjqEgnkHDqAY9ydJOnci
         +Q14A0ODJjlnb6k0JLKJ7U4bhaDd0wF1szZCBYLEiQSiAEFcuU2rHGAW1cbOgMh1KYql
         9vikQ6j0VN2WchODK3SvJRHxyLvB6UIeDt70ayNOdYR5p2GSppidJIcYLDe+mSQKQt04
         lDb09HTdtd7kUAx4Dn/mBsYZXU6eLzUZo4X7qyIEnA7lNKp/WBNHSE+svI4dR3hy7wlX
         jnayJUUB6IY3tRKkdpXGrg8AOEPfLc2ihr4U+dFmIH58K9boXKZPfODFNrVPEg5nXzoG
         auzg==
X-Forwarded-Encrypted: i=1; AKwUvBzxwNWU/6kdE+GR9P9QNfKCev/oFDZJfCnGfEy1Iu5pSoIuMpLlsOIQfREge+83iOgUwtxIQM8b/+tJN66i0viW@lists.infradead.org
X-Gm-Message-State: AFq9FYLmh+bCFeIAe6LyrMvk3et3X2Gp6CVhVu+JmT/T9HKqNBDijt27
	G1U+Nfogcf2LH3sus+cyo1MKyWHInoiA51wZBD5o7FvsZEY8yf+VsBeD
X-Gm-Gg: AYBFou3IhfyY0t6sBRT3+Zo9VojE4GhWex8HQxRY0AsU5t1lDA74ieeV+Dk9fn+5WyJ
	5p9XJMazzOByp6+mm7GAe6dv5Ybk7rtLOL+qVgDf69zKSZAfwfPYiN27gWEGKoiNrL0webyute8
	tyLEPRyobxrLUa3B8WzN5X52ZGQ4t9FyYpnUzSemF5ohKxQiC8hTkM0AtB4pHPhyUeHET4H22Ld
	nC1on/UkKTw9QbXc9jEu3q8grq4G1T+gKjuBC8fKEDEuRFhgrojWyih9gJrFIL2AhiJcKWOuN5k
	XkvDiJvBWgeesjcRIU75lKMlMxS+PTAYDuCPMXYQsCiXPeoHFQHCrmwDR1XqsG2k1J+ge1Dhk/j
	8cJy8AQ9aPPHNiKHnrRo6vi5TfJRgAo31+xNJMDBtWJedKKOIosk2Ilaw/nSg67Mbr6293QKkMj
	QKCzKyWZ8+oiUq78mJyEhEX5Zk3ZAVFx6RhzKh7Oxjr7+Svy2fmQc3kqKwY5cyB5pj
X-Received: by 2002:a05:693c:8399:10b0:35e:f1a5:9ba6 with SMTP id 5a478bee46e88-3674a40738emr116407eec.5.1792520380928;
        Tue, 20 Oct 2026 11:19:40 -0700 (PDT)
Received: from unix.. ([181.229.23.179])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3673e15353csm523728eec.2.2026.10.20.11.19.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 11:19:40 -0700 (PDT)
From: =?UTF-8?q?Iv=C3=A1n=20Ezequiel=20Rodriguez?= <ivanrwcm25@gmail.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Mark Rutland <mark.rutland@arm.com>,
	Mark Brown <broonie@kernel.org>,
	Deepak Gupta <debug@rivosinc.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Shuah Khan <shuah@kernel.org>,
	Christian Brauner <brauner@kernel.org>,
	James Morse <james.morse@arm.com>,
	Yury Khrustalev <yury.khrustalev@arm.com>,
	Thiago Jung Bauermann <thiago.bauermann@linaro.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Zong Li <zong.li@sifive.com>,
	Charlie Jenkins <thecharlesjenkins@gmail.com>,
	Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>,
	Zishun Yi <vulab@iscas.ac.cn>,
	"Peter Zijlstra (Intel)" <peterz@infradead.org>
Subject: [PATCH v2 0/4] arm64, riscv: release shadow stacks on failed fork
Date: Tue, 20 Oct 2026 15:19:29 -0300
Message-ID: <cover.1792519121.git.ivanrwcm25@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1792179433.git.ivanrwcm25@gmail.com>
References: <cover.1792179433.git.ivanrwcm25@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_111942_350821_8E7DDFA2 
X-CRM114-Status: GOOD (  14.83  )
X-Spam-Score: -0.1 (/)
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
X-Spam-Status: No, score=-14.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,HK_RANDOM_FROM,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This is not a port of the x86 TLS fix. That leak was inside
copy_thread() when set_new_tls() failed, so copy_process() skipped
exit_thread(). Here copy_thread() returns 0 and a later
copy_process() step fails. The concrete hole is clone3() with
CLONE_VM|CLONE_PIDFD and an unwritable pidfd pointer: put_user()
returns -EFAULT after the architecture has mapped a shadow stack.
exit_thread() does run, but arm64 and riscv did not implement it, so
that mapping stays in the parent's mm.

Normal exit already frees via deactivate_mm(). The failed-fork path
never reaches that. The free helpers already refuse a foreign mm
and a cleared base, so wiring them to exit_thread() does not unmap
the parent on !CLONE_VM or double-free on a normal exit. A
successful clone3() child with the same flags exits through
deactivate_mm() and then exit_thread(); that is the usual teardown
order this series also enables.

riscv's shstk_release() comment already described this
exit_thread() call. The architecture never selected
HAVE_EXIT_THREAD, so the documented path was not connected.

Do not add cleanup for a copy_thread() allocation error:
copy_process() skips exit_thread() when copy_thread() fails. arm64
clears inherited allocation tracking before attempting the
allocation; on riscv a failed allocation can still leave the
inherited parent base in place. Tasks created through the args->fn
path do not allocate a user shadow stack in copy_thread(); with
CLONE_VM a later failed copy_process() still shares the caller's
mm, so that path clears inherited tracking before return.

x86 does not need the same args->fn clear: copy_thread() runs
shstk_alloc_thread_stack() before both the PF_KTHREAD and later
args->fn return paths, so CLONE_VM replaces the inherited tracking
first.

The selftests assume /proc is mounted. They use kselftest.h / KTAP.
Feature and clone3 availability skips run before ksft_set_plan().
The plan is three tests: a valid clone3 writes a pidfd, sixteen
bad-pidfd clones return -EFAULT, and the shadow-stack VMA count is
unchanged.

Based on commit f47d223627f8 ("Merge tag 'vfs-7.4-rc1.sync_close' of
git://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs").

arm64: QEMU 11.1.2 -machine virt -cpu max, CONFIG_ARM64_GCS, one
vCPU. Unpatched VMA count 1->17. Patched 1->1, 3/3 KTAP pass.

riscv: QEMU 11.1.2 -machine virt
-cpu rv64,zimop=on,zcmop=on,zicfiss=on, CONFIG_RISCV_USER_CFI, one
vCPU. Unpatched VMA count 1->17. Patched 1->1, 3/3 KTAP pass.

Changes since v1:
- arm64: introduce gcs_reset_thread() (empty stub without
  CONFIG_ARM64_GCS). Document why x86 does not need the same
  args->fn clear. Comment the property of the args->fn path, not
  only kernel_thread().
- riscv: same args->fn wording; clarify that normal exit reaches
  shstk_release() through deactivate_mm() while failed-fork did not.
- selftests: rewrite on kselftest.h / KTAP. Drop open-coded
  [OK]/[FAIL], exclusive-end VMA matching, ss_kb, depth(16), and
  parent GCSPR/SSP ping checks. Count only VmFlags lines with " ss".
  Skip before ksft_set_plan(). Factor my_syscall2 into gcs-util.h.

Assisted-by: LLM

Iván Ezequiel Rodriguez (4):
  arm64/gcs: release GCS on failed fork
  riscv/shstk: release shadow stack on failed fork
  selftests/arm64: GCS must not leak on a failed clone3
  selftests/riscv: shadow stack must not leak on a failed clone3

 arch/arm64/Kconfig                            |   1 +
 arch/arm64/include/asm/gcs.h                  |   8 +
 arch/arm64/kernel/process.c                   |  19 ++
 arch/riscv/Kconfig                            |   1 +
 arch/riscv/kernel/process.c                   |  20 ++
 tools/testing/selftests/arm64/gcs/Makefile    |   3 +-
 .../selftests/arm64/gcs/gcs-clone-pidfd.c     | 168 +++++++++++++++++
 .../testing/selftests/arm64/gcs/gcs-locking.c |  20 --
 tools/testing/selftests/arm64/gcs/gcs-util.h  |  24 +++
 tools/testing/selftests/arm64/gcs/libc-gcs.c  |  20 --
 tools/testing/selftests/riscv/cfi/Makefile    |   5 +-
 .../selftests/riscv/cfi/shstk-clone-pidfd.c   | 173 ++++++++++++++++++
 12 files changed, 420 insertions(+), 42 deletions(-)
 create mode 100644 tools/testing/selftests/arm64/gcs/gcs-clone-pidfd.c
 create mode 100644 tools/testing/selftests/riscv/cfi/shstk-clone-pidfd.c


base-commit: f47d223627f80cb7a1eb14c585fe6cb35de5e984
-- 
2.43.0


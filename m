Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E4E5C282C6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 00:15:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Q3wqOikOcXwkFYQdHd+IOlFSNX40F3Q2Xvhkkctp+0E=; b=D3OhqsdEeCPuUUc4Rf1nomnUGr
	JC9+AFMFSD7/CH4XUkS9A7VSb2h9/sC0NiCQs+lx3UiscIxADuB8zfO1muHnyp4iGgcaYtuxSplUj
	2NWfwGaGLyQ91734KrMJqN0AtqUeKufAv94Uzmx614Wbkp6T/rHYKWteV0Ysw91J9NIcyfE+dkxh0
	rH77sWL2gYXPhYX/Ru59nY7qfKLtCwZsoLRtE5spvf65wDciJiEChFY+2+aZBXwe8yrLCMPZ0cgx2
	c2PzJY27ulVVwspB1yvEoZkHPhn+Fd58TZZj36e/4m6ZWIDDm6s5yvK0V6KIBnMiDnuvfgFWkTaTu
	5Z7IsiUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpFwH-00000002dJG-1j5U;
	Tue, 04 Mar 2025 00:15:13 +0000
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpFug-00000002cu5-2K7r
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 00:13:36 +0000
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-2236b6fb4a6so122389815ad.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Mar 2025 16:13:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1741047213; x=1741652013; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Q3wqOikOcXwkFYQdHd+IOlFSNX40F3Q2Xvhkkctp+0E=;
        b=k55C9em5gsQAzEatbrPEEbodbI7X0hYx01/OGQeozEo0bjPwEModNX69BWilmxI3G7
         HJt3zO2kbaosZ3W6yNQJe3Oz4XkoiB7qgBkaNNSJCztuBH0+yKJgGxDQpA9AVmLJYkAZ
         0dAXeE4sdgbOJi91AVcW9FRtnIw47kqSVmemwFI/NsNkrv5MGdtPt6t9btPFvplC9nE2
         kHWsJApxMqt4tZED+O+ezsR4DI3V888K+BB24b/YFJIUiFE8BTfzWQh6oI8b4TQivI7e
         eM5Ho0cNtzm5C0YJPzgaeAK7tWehrtvF9qCbd40Ac5SqHrP08jqtieLOE0FwhANAEzIQ
         wfSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741047213; x=1741652013;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Q3wqOikOcXwkFYQdHd+IOlFSNX40F3Q2Xvhkkctp+0E=;
        b=Y6oG0LujIoaJKlZ7Yd40ms+AYJAhsdMjGDwtymZOQUmMPith/Ou7Cs/kFaPLqakr24
         490zcvPL80QOgdMXrwI0Xil8jJ6/3tntRzxMLKy6GFog23Osiq9SZbjWef42q2Gnho9s
         CtiS/queSNjOmHTMvzLrtxF0QXlabdsiSCsG/vt3GOnqcZj2mvwZSE8vV3816/20vTQZ
         J4/e0ODxlBNBydIx0ABcKw40RScJqo8rR+v34Z5ayATnk2fumt35Fue7VMFSsk8KDJuW
         uhnD2XlB8T2KdbzSZ0VE6BizS8S4iBtbSKbT+TDWAwK7rr54zmUkdKGTOUzjK+L8UZ8S
         Omag==
X-Forwarded-Encrypted: i=1; AJvYcCWk7PHwtmhCieLp5nqIe/7CA2blP4RhCSHZ+ZA6s7XD7Pj8jAFPPRfFkp5AJ++zKF7HIreJvVzc3ENbZzk6JENq@lists.infradead.org
X-Gm-Message-State: AOJu0YxYy9H0QGKHR0do8TRxNlJzd2j+RbdPi+pmyzz/atUbHCI8YX0p
	y7w3unMyHbtfyjPQJ9mHGXRTEncvU9ZA31zcWF+voJMGwcaghAT2DTitkOALjw2D7yx6WsXrTy0
	jqDHDQAcElw==
X-Google-Smtp-Source: AGHT+IFmmwcjQ6DMOqtv0toPZx7xqVST7m9UxDsuCyxZVeBScrG92ahmY7O7H7tlXVdHzJYj2DAfC+7wUUyshA==
X-Received: from pjbkl3.prod.google.com ([2002:a17:90b:4983:b0:2fa:a101:743])
 (user=yepeilin job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:ecd0:b0:223:2aab:4626 with SMTP id d9443c01a7336-22368f60a3fmr247563795ad.11.1741047212605;
 Mon, 03 Mar 2025 16:13:32 -0800 (PST)
Date: Tue,  4 Mar 2025 00:13:19 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.48.1.711.g2feabab25a-goog
Message-ID: <cover.1741046028.git.yepeilin@google.com>
Subject: [PATCH bpf-next v5 0/6] Introduce load-acquire and store-release BPF instructions
From: Peilin Ye <yepeilin@google.com>
To: bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Peilin Ye <yepeilin@google.com>, bpf@ietf.org, Alexei Starovoitov <ast@kernel.org>, 
	Xu Kuohai <xukuohai@huaweicloud.com>, Eduard Zingerman <eddyz87@gmail.com>, 
	David Vernet <void@manifault.com>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, 
	Jiri Olsa <jolsa@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	"Paul E. McKenney" <paulmck@kernel.org>, Puranjay Mohan <puranjay@kernel.org>, 
	Ilya Leoshkevich <iii@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Quentin Monnet <qmo@kernel.org>, Mykola Lysenko <mykolal@fb.com>, Shuah Khan <shuah@kernel.org>, 
	Ihor Solodrai <ihor.solodrai@linux.dev>, Yingchi Long <longyingchi24s@ict.ac.cn>, 
	Josh Don <joshdon@google.com>, Barret Rhoden <brho@google.com>, Neel Natu <neelnatu@google.com>, 
	Benjamin Segall <bsegall@google.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_161334_601983_5414BBC8 
X-CRM114-Status: GOOD (  16.71  )
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

Hi all!

This patchset adds kernel support for BPF load-acquire and store-release
instructions (for background, please see [1]), including core/verifier
and arm64/x86-64 JIT compiler changes, as well as selftests.  riscv64 is
also planned to be supported.  The corresponding LLVM changes can be
found at:

  https://github.com/llvm/llvm-project/pull/108636

The first 3 patches from v4 have already been applied:

  - [bpf-next,v4,01/10] bpf/verifier: Factor out atomic_ptr_type_ok()
    https://git.kernel.org/bpf/bpf-next/c/b2d9ef71d4c9
  - [bpf-next,v4,02/10] bpf/verifier: Factor out check_atomic_rmw()
    https://git.kernel.org/bpf/bpf-next/c/d430c46c7580
  - [bpf-next,v4,03/10] bpf/verifier: Factor out check_load_mem() and check_store_reg()
    https://git.kernel.org/bpf/bpf-next/c/d38ad248fb7a

Please refer to the LLVM PR and individual kernel patches for details.
Thanks!

v4: https://lore.kernel.org/bpf/cover.1740978603.git.yepeilin@google.com/
v4..v5 notable changes:

  o (kernel test robot) for 32-bit arches: make the verifier reject
                        64-bit load-acquires/store-releases, and fix
                        build error in interpreter changes
    * tested ARCH=arc build following instructions from kernel test
      robot
  o (Alexei) drop Documentation/ patch (v4 10/10) for now

v3: https://lore.kernel.org/bpf/cover.1740009184.git.yepeilin@google.com/
v3..v4 notable changes:

  o (Alexei) add x86-64 JIT support (including arena)
  o add Acked-by: tags from Xu

v2: https://lore.kernel.org/bpf/cover.1738888641.git.yepeilin@google.com/
v2..v3 notable changes:

  o (Alexei) change encoding to BPF_LOAD_ACQ=0x100, BPF_STORE_REL=0x110
  o add Acked-by: tags from Ilya and Eduard
  o make new selftests depend on:
    * __clang_major__ >= 18, and
    * ENABLE_ATOMICS_TESTS is defined (currently this means -mcpu=v3 or
      v4), and
    * JIT supports load_acq/store_rel (currenty only arm64)
  o work around llvm-17 CI job failure by conditionally define
    __arena_global variables as 64-bit if __clang_major__ < 18, to make
    sure .addr_space.1 has no holes
  o add Google copyright notice in new files

v1: https://lore.kernel.org/all/cover.1737763916.git.yepeilin@google.com/
v1..v2 notable changes:

  o (Eduard) for x86 and s390, make
             bpf_jit_supports_insn(..., /*in_arena=*/true) return false
	     for load_acq/store_rel
  o add Eduard's Acked-by: tag
  o (Eduard) extract LDX and non-ATOMIC STX handling into helpers, see
             PATCH v2 3/9
  o allow unpriv programs to store-release pointers to stack
  o (Alexei) make it clearer in the interpreter code (PATCH v2 4/9) that
             only W and DW are supported for atomic RMW
  o test misaligned load_acq/store_rel
  o (Eduard) other selftests/ changes:
    * test load_acq/store_rel with !atomic_ptr_type_ok() pointers:
      - PTR_TO_CTX, for is_ctx_reg()
      - PTR_TO_PACKET, for is_pkt_reg()
      - PTR_TO_FLOW_KEYS, for is_flow_key_reg()
      - PTR_TO_SOCKET, for is_sk_reg()
    * drop atomics/ tests
    * delete unnecessary 'pid' checks from arena_atomics/ tests
    * avoid depending on __BPF_FEATURE_LOAD_ACQ_STORE_REL, use
      __imm_insn() and inline asm macros instead

RFC v1: https://lore.kernel.org/all/cover.1734742802.git.yepeilin@google.com
RFC v1..v1 notable changes:

  o 1-2/8: minor verifier.c refactoring patches
  o   3/8: core/verifier changes
         * (Eduard) handle load-acquire properly in backtrack_insn()
         * (Eduard) avoid skipping checks (e.g.,
                    bpf_jit_supports_insn()) for load-acquires
         * track the value stored by store-releases, just like how
           non-atomic STX instructions are handled
         * (Eduard) add missing link in commit message
         * (Eduard) always print 'r' for disasm.c changes
  o   4/8: arm64/insn: avoid treating load_acq/store_rel as
           load_ex/store_ex
  o   5/8: arm64/insn: add load_acq/store_rel
         * (Xu) include Should-Be-One (SBO) bits in "mask" and "value",
                to avoid setting fixed bits during runtime (JIT-compile
                time)
  o   6/8: arm64 JIT compiler changes
         * (Xu) use emit_a64_add_i() for "pointer + offset" to optimize
                code emission
  o   7/8: selftests
         * (Eduard) avoid adding new tests to the 'test_verifier' runner
         * add more tests, e.g., checking mark_precise logic
  o   8/8: instruction-set.rst changes

[1] https://lore.kernel.org/all/20240729183246.4110549-1-yepeilin@google.com/

Thanks,
Peilin Ye (6):
  bpf: Introduce load-acquire and store-release instructions
  arm64: insn: Add BIT(23) to {load,store}_ex's mask
  arm64: insn: Add load-acquire and store-release instructions
  bpf, arm64: Support load-acquire and store-release instructions
  bpf, x86: Support load-acquire and store-release instructions
  selftests/bpf: Add selftests for load-acquire and store-release
    instructions

 arch/arm64/include/asm/insn.h                 |  12 +-
 arch/arm64/lib/insn.c                         |  29 ++
 arch/arm64/net/bpf_jit.h                      |  20 ++
 arch/arm64/net/bpf_jit_comp.c                 |  86 +++++-
 arch/s390/net/bpf_jit_comp.c                  |  14 +-
 arch/x86/net/bpf_jit_comp.c                   |  95 ++++++-
 include/linux/bpf.h                           |  15 +
 include/linux/filter.h                        |   2 +
 include/uapi/linux/bpf.h                      |   3 +
 kernel/bpf/core.c                             |  67 ++++-
 kernel/bpf/disasm.c                           |  12 +
 kernel/bpf/verifier.c                         |  59 +++-
 tools/include/uapi/linux/bpf.h                |   3 +
 .../selftests/bpf/prog_tests/arena_atomics.c  |  66 ++++-
 .../selftests/bpf/prog_tests/verifier.c       |   4 +
 .../selftests/bpf/progs/arena_atomics.c       | 121 +++++++-
 .../bpf/progs/verifier_load_acquire.c         | 197 +++++++++++++
 .../selftests/bpf/progs/verifier_precision.c  |  49 ++++
 .../bpf/progs/verifier_store_release.c        | 264 ++++++++++++++++++
 19 files changed, 1085 insertions(+), 33 deletions(-)
 create mode 100644 tools/testing/selftests/bpf/progs/verifier_load_acquire.c
 create mode 100644 tools/testing/selftests/bpf/progs/verifier_store_release.c

-- 
2.48.1.711.g2feabab25a-goog



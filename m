Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4793ED637B1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Nov 2024 20:17:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=PXcTglpRYSGUG70owXD7nOF+NHWPUf0sMel4JnLxMI0=; b=CsYmREPJ7VOmzmtEQ4QVa0vQt1
	LvwzPKs1NE7rE8/LdDBLRmT/utE/CmdGJ31qLrExVyoLiBObBN6VejVCUctKPj3/d3f8ib8Cvjteh
	QL4tRDeXZt87F17Tx66AawluF9TRBECvIyDhZ6590e83CF1XhaUjbgW21EP1Z7FU/DLIMp7Gg+okJ
	pQRCjwHSpbrIxsNadPd3RDgJYd5ZxUzI9q0TX2UjUx0kJgRfG1bdQn7wk+zHLbc6JZsozgmkGjp/h
	T9Y1oohY6B+dgM8fnPP+3p1UyDJAw+cV5FCCwSq5AUocX5rGA8G6alRZZgHWdIgIANIQQUNqjF6mS
	I2mIZDuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBJnK-00000007w8v-0QMb;
	Wed, 13 Nov 2024 20:16:54 +0000
Received: from mail-io1-xd49.google.com ([2607:f8b0:4864:20::d49])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBIcq-00000007mxi-2x5e
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Nov 2024 19:02:02 +0000
Received: by mail-io1-xd49.google.com with SMTP id ca18e2360f4ac-83adc5130e3so768576539f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 Nov 2024 11:01:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1731524519; x=1732129319; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=PXcTglpRYSGUG70owXD7nOF+NHWPUf0sMel4JnLxMI0=;
        b=P2I2vDxqrhIMIN2VDnoYMMiha4EYpFl1GZxEifqGN0ME+TgdrNAz+vCrHfc5OeSrMr
         XH9AgVaf9dnF2o2UeYRLaSqsqDlh/lK2YO5W++3KV82M5CB11/BAyjuAtH+NJ3OF7Nhx
         6N7Z+SR5+3ql1Qmoa4QOanA/BU2LuvZLr94w5uZxjOGY5IW5WpGsCyyGeFnUPfjp4Orw
         wrpWNlfTrNqXINUi2CBfzC2tgSRzYtuaw6JVuyi5A2ryuJymavppzGxqHEzAGFN2lEa8
         jckuRVp95RIeUkiiBvj2nUx34dAa0E2SuC8+952EjGKbZgPrCN24smdJhHdP9pCl8OE0
         bZcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731524519; x=1732129319;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PXcTglpRYSGUG70owXD7nOF+NHWPUf0sMel4JnLxMI0=;
        b=OJMJTX/QqFPFH+88AO+VP65w4n6yX7y5DFdm/2WLpVMJj5K0IH70lAZAm64RfZkaje
         eSdrTm7etIqV5aIAAhnffncJ47CGdq6B/gtSYsC09vp2yLdmDPGmorTwdcwIleH/ZZ95
         u4bzMdvWGKz92nu3xZyQruEdh41WHynjuQ83ppHwwkrHpu4Mhp1y87nFdHC+Zf6l0rfd
         4nLUzTPU0g955TbPesHnqOiiZ9alOhty3W0i6t2Lqiza15uYdy75gf1f6jPoJKpx+U8/
         lWbEPmDvO0apnCo0C7M2zdMCYHKU9R/Q5qz6yo3L2wBlulHvtzeXxPdHkBOgFyOtygq3
         M+Tw==
X-Forwarded-Encrypted: i=1; AJvYcCXKzGzpVqHj9GufSpcJKWKJckeKoEvE2/vpf+STwcFUUk7H9gaNClSpWmFv7xyZ+Nl8kz8YcZep2JHPQzh9/bCl@lists.infradead.org
X-Gm-Message-State: AOJu0YwRhadzhLgG1hKFo624KZChkXi44Fda1qUkaLjXMpEP5NXaJ2mT
	NT3GGQmK+dohFL+0AQO4RKLCf4wp7gd0MnS7rDwZYAwKRU8hqnN501KJq3YNi0a9riUy3PkOVp6
	wsgF+HbDHGsfyavr8PS+HXA==
X-Google-Smtp-Source: AGHT+IFIUdSo/WNLK0PV98lBe9m4ohTkfvDAOqn44oZ30S/C6GtrbtwtcCTbX1AO1mQEzViQLH/wGxNpeNufHAxBww==
X-Received: from coltonlewis-kvm.c.googlers.com ([fda3:e722:ac3:cc00:11b:3898:ac11:fa18])
 (user=coltonlewis job=sendgmr) by 2002:a05:6602:255a:b0:83a:9936:d1a6 with
 SMTP id ca18e2360f4ac-83e4fb9178dmr1860539f.4.1731524519017; Wed, 13 Nov 2024
 11:01:59 -0800 (PST)
Date: Wed, 13 Nov 2024 19:01:50 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
Message-ID: <20241113190156.2145593-1-coltonlewis@google.com>
Subject: [PATCH v8 0/5] Correct perf sampling with Guest VMs
From: Colton Lewis <coltonlewis@google.com>
To: kvm@vger.kernel.org
Cc: Oliver Upton <oliver.upton@linux.dev>, Sean Christopherson <seanjc@google.com>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Kan Liang <kan.liang@linux.intel.com>, Will Deacon <will@kernel.org>, 
	Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Naveen N Rao <naveen@kernel.org>, 
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H . Peter Anvin" <hpa@zytor.com>, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org, 
	Colton Lewis <coltonlewis@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241113_110200_794755_BABFB845 
X-CRM114-Status: GOOD (  11.92  )
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

v8:
* Improve patch 4 perf flags refactor
* Rebase to v6.12-rc7

v7:
https://lore.kernel.org/all/20241107190336.2963882-1-coltonlewis@google.com/

v6:
https://lore.kernel.org/all/20241105195603.2317483-1-coltonlewis@google.com/

v5:
https://lore.kernel.org/all/20240920174740.781614-1-coltonlewis@google.com/

v4:
https://lore.kernel.org/kvm/20240919190750.4163977-1-coltonlewis@google.com/

v3:
https://lore.kernel.org/kvm/20240912205133.4171576-1-coltonlewis@google.com/

v2:
https://lore.kernel.org/kvm/20240911222433.3415301-1-coltonlewis@google.com/

v1:
https://lore.kernel.org/kvm/20240904204133.1442132-1-coltonlewis@google.com/

This series cleans up perf recording around guest events and improves
the accuracy of the resulting perf reports.

Perf was incorrectly counting any PMU overflow interrupt that occurred
while a VCPU was loaded as a guest event even when the events were not
truely guest events. This lead to much less accurate and useful perf
recordings.

See as an example the below reports of `perf record
dirty_log_perf_test -m 2 -v 4` before and after the series on ARM64.

Without series:

Samples: 15K of event 'instructions', Event count (approx.): 31830580924
Overhead  Command          Shared Object        Symbol
  54.54%  dirty_log_perf_  dirty_log_perf_test  [.] run_test
   5.39%  dirty_log_perf_  dirty_log_perf_test  [.] vcpu_worker
   0.89%  dirty_log_perf_  [kernel.vmlinux]     [k] release_pages
   0.70%  dirty_log_perf_  [kernel.vmlinux]     [k] free_pcppages_bulk
   0.62%  dirty_log_perf_  dirty_log_perf_test  [.] userspace_mem_region_find
   0.49%  dirty_log_perf_  dirty_log_perf_test  [.] sparsebit_is_set
   0.46%  dirty_log_perf_  dirty_log_perf_test  [.] _virt_pg_map
   0.46%  dirty_log_perf_  dirty_log_perf_test  [.] node_add
   0.37%  dirty_log_perf_  dirty_log_perf_test  [.] node_reduce
   0.35%  dirty_log_perf_  [kernel.vmlinux]     [k] free_unref_page_commit
   0.33%  dirty_log_perf_  [kernel.vmlinux]     [k] __kvm_pgtable_walk
   0.31%  dirty_log_perf_  [kernel.vmlinux]     [k] stage2_attr_walker
   0.29%  dirty_log_perf_  [kernel.vmlinux]     [k] unmap_page_range
   0.29%  dirty_log_perf_  dirty_log_perf_test  [.] test_assert
   0.26%  dirty_log_perf_  [kernel.vmlinux]     [k] __mod_memcg_lruvec_state
   0.24%  dirty_log_perf_  [kernel.vmlinux]     [k] kvm_s2_put_page

With series:

Samples: 15K of event 'instructions', Event count (approx.): 31830580924
Samples: 15K of event 'instructions', Event count (approx.): 30898031385
Overhead  Command          Shared Object        Symbol
  54.05%  dirty_log_perf_  dirty_log_perf_test  [.] run_test
   5.48%  dirty_log_perf_  [kernel.kallsyms]    [k] kvm_arch_vcpu_ioctl_run
   4.70%  dirty_log_perf_  dirty_log_perf_test  [.] vcpu_worker
   3.11%  dirty_log_perf_  [kernel.kallsyms]    [k] kvm_handle_guest_abort
   2.24%  dirty_log_perf_  [kernel.kallsyms]    [k] up_read
   1.98%  dirty_log_perf_  [kernel.kallsyms]    [k] __kvm_tlb_flush_vmid_ipa_nsh
   1.97%  dirty_log_perf_  [kernel.kallsyms]    [k] __pi_clear_page
   1.30%  dirty_log_perf_  [kernel.kallsyms]    [k] down_read
   1.13%  dirty_log_perf_  [kernel.kallsyms]    [k] release_pages
   1.12%  dirty_log_perf_  [kernel.kallsyms]    [k] __kvm_pgtable_walk
   1.08%  dirty_log_perf_  [kernel.kallsyms]    [k] folio_batch_move_lru
   1.06%  dirty_log_perf_  [kernel.kallsyms]    [k] __srcu_read_lock
   1.03%  dirty_log_perf_  [kernel.kallsyms]    [k] get_page_from_freelist
   1.01%  dirty_log_perf_  [kernel.kallsyms]    [k] __pte_offset_map_lock
   0.82%  dirty_log_perf_  [kernel.kallsyms]    [k] handle_mm_fault
   0.74%  dirty_log_perf_  [kernel.kallsyms]    [k] mas_state_walk

Colton Lewis (5):
  arm: perf: Drop unused functions
  perf: Hoist perf_instruction_pointer() and perf_misc_flags()
  powerpc: perf: Use perf_arch_instruction_pointer()
  x86: perf: Refactor misc flag assignments
  perf: Correct perf sampling with guest VMs

 arch/arm/include/asm/perf_event.h            |  7 ---
 arch/arm/kernel/perf_callchain.c             | 17 ------
 arch/arm64/include/asm/perf_event.h          |  4 --
 arch/arm64/kernel/perf_callchain.c           | 28 ---------
 arch/powerpc/include/asm/perf_event_server.h |  6 +-
 arch/powerpc/perf/callchain.c                |  2 +-
 arch/powerpc/perf/callchain_32.c             |  2 +-
 arch/powerpc/perf/callchain_64.c             |  2 +-
 arch/powerpc/perf/core-book3s.c              |  4 +-
 arch/s390/include/asm/perf_event.h           |  6 +-
 arch/s390/kernel/perf_event.c                |  4 +-
 arch/x86/events/core.c                       | 64 +++++++++++++-------
 arch/x86/include/asm/perf_event.h            | 12 ++--
 include/linux/perf_event.h                   | 26 +++++++-
 kernel/events/core.c                         | 27 ++++++++-
 15 files changed, 111 insertions(+), 100 deletions(-)


base-commit: 2d5404caa8c7bb5c4e0435f94b28834ae5456623
--
2.47.0.338.g60cca15819-goog


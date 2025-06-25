Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DAE4C77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Jun 2025 21:47:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u0JwJfoOYV21U0MdnVL2U+gY07VBg3P0ZmX9zrOoRbY=; b=kD+Z830I8KM7fkDZ4PuVhH2w09
	vaS3PNDlU0bWaUVncoqf9jujrZ60c1pFtj5doBgUBhVt0D4Uso1OVBqCGPe8gn60QKhQmU477CVJ4
	LBiZxRxxdYdWIyTtO6TUQnuEWZLcJ6wFghA3a9CEp86tJ152/e900rYU2oWtllkNZIxwlwtVSgM5U
	XGTLHGiej/hfzWY8ueLpXwtM+lKwiKb3yPYlzdOPTNzzlImp0XxhMxg+Fkd+jD1RdEAUAG/HPNYZL
	ZMgZG7MKT4+03kATu7mKabAvY8BN1alniYdxYeTnK6b9HukjybC07lE/PXqi6jhcPXf72lHN0lAbd
	8VoYScTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUXxv-00000009zwH-0Hbw;
	Wed, 25 Jun 2025 21:47:35 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUVnM-00000009kbn-1AQD
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 25 Jun 2025 19:28:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=u0JwJfoOYV21U0MdnVL2U+gY07VBg3P0ZmX9zrOoRbY=; b=gAzS+0XHRrPJpu7TeT2Wp8N9rA
	sg0owRIII1nKQj6/AiGkcckukz+5HWz2eU+Ms3VjtP0LMoyTpr3d7Jb4aV8WLvfjuluwKQaLd86Eo
	UAi4xKKBGsvMYmd74tO2dADZcuR85D1+nNfi1hV7yUgrllNdJ0aq409GKfSyxP23EAioATE1TGRdE
	I9i25JQeO0ENZMrD1TElwPPkXvKBL5hCTHfQQEfP1Mht2kZdECwmoq+B5KGqXbJegQR4EMcbs7RGw
	E5U6LahVc7P1zW1LLSyVJcWLvmnMFX+sfxfLzw/3kI5iqreNoqdxswfPnCLjmm9rXvFF4tDh4gQ7I
	S8XejpWQ==;
Received: from nyc.source.kernel.org ([147.75.193.91])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUVn5-00000005xfG-3xVE
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Jun 2025 19:28:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 69585A52E34;
	Wed, 25 Jun 2025 19:28:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A7EAC4CEEA;
	Wed, 25 Jun 2025 19:28:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750879691;
	bh=wRuV8u4487v8pd6cIb11D4QOkkKgieStdC4qajmZOwA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=F65Rg3/3Kmack2u+Vxnr7TZpy8d+uuu7JIPCphjO4srYS7ct4zwBMxLAPXthT20sw
	 XcaKIzqBgJnTdEq1Bx2v7b/vS6gdoVKyhykjGk/iiOKIKcl4JpkizRLSyxdCkoEOSa
	 grepEB3j+PWraoJncOKnFh3ogIEVslq9kXsrxh5r2kdhBUKBHHzf5yOkg/zHpgFbzF
	 /tPJVPAoVDTeQpr64hjz67gu/Qtes93sDdubn39CHBbUdN7eD617VjmUQB9+zIA7d0
	 ZbovYpRuHCc+zCao8dMSN5RQSIFE8vRyVCeRDt0uBLBDE7RQetKXkJmOTGx0jAWlFb
	 mjKuS677iz7Sg==
Date: Wed, 25 Jun 2025 16:28:07 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: James Clark <james.clark@linaro.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
	Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>, Nick Terrell <terrelln@fb.com>,
	David Sterba <dsterba@suse.com>,
	Collin Funk <collin.funk1@gmail.com>,
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	bpf@vger.kernel.org
Subject: Re: [PATCH] perf test: Change all remaining #!/bin/sh to #!/bin/bash
Message-ID: <aFxNx8250L1bBaC9@x1>
References: <20250623-james-perf-bash-tests-v1-1-f572f54d4559@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250623-james-perf-bash-tests-v1-1-f572f54d4559@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_202827_900665_9C46B5A7 
X-CRM114-Status: GOOD (  28.20  )
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

On Mon, Jun 23, 2025 at 10:00:12AM +0100, James Clark wrote:
> There are 43 instances of posix shell tests and 35 instances of bash. To
> give us a single consistent language for testing in, replace
> all #!/bin/sh to #!/bin/bash. Common sources that are included in both
> different shells will now work as expected. And we no longer have to fix
> up bashisms that appear to work when someone's system has sh symlinked
> to bash, but don't work on other systems that have both shells
> installed.
> 
> Although we could have chosen sh, it's not backwards compatible so it
> wouldn't be possible to bulk convert without re-writing the existing
> bash tests.
> 
> Choosing bash also gives us some nicer features including 'local'
> variable definitions and regexes in if statements that are already
> widely used in the tests.
> 
> It's not expected that there are any users with only sh available due to
> the large number of bash tests that exist.
> 
> Discussed in relation to running shellcheck here:
> https://lore.kernel.org/linux-perf-users/e3751a74be34bbf3781c4644f518702a7270220b.1749785642.git.collin.funk1@gmail.com/

The reasoning is sound, agreed:

Acked-by: Arnaldo Carvalho de Melo <acme@redhat.com>

- Arnaldo
 
> Signed-off-by: James Clark <james.clark@linaro.org>
> ---
>  tools/perf/tests/perf-targz-src-pkg                          | 2 +-
>  tools/perf/tests/shell/amd-ibs-swfilt.sh                     | 2 +-
>  tools/perf/tests/shell/buildid.sh                            | 2 +-
>  tools/perf/tests/shell/coresight/asm_pure_loop.sh            | 2 +-
>  tools/perf/tests/shell/coresight/memcpy_thread_16k_10.sh     | 2 +-
>  tools/perf/tests/shell/coresight/thread_loop_check_tid_10.sh | 2 +-
>  tools/perf/tests/shell/coresight/thread_loop_check_tid_2.sh  | 2 +-
>  tools/perf/tests/shell/coresight/unroll_loop_thread_10.sh    | 2 +-
>  tools/perf/tests/shell/diff.sh                               | 2 +-
>  tools/perf/tests/shell/ftrace.sh                             | 2 +-
>  tools/perf/tests/shell/lib/perf_has_symbol.sh                | 2 +-
>  tools/perf/tests/shell/lib/probe_vfs_getname.sh              | 2 +-
>  tools/perf/tests/shell/lib/setup_python.sh                   | 2 +-
>  tools/perf/tests/shell/lib/waiting.sh                        | 2 +-
>  tools/perf/tests/shell/list.sh                               | 2 +-
>  tools/perf/tests/shell/lock_contention.sh                    | 2 +-
>  tools/perf/tests/shell/perf-report-hierarchy.sh              | 2 +-
>  tools/perf/tests/shell/probe_vfs_getname.sh                  | 2 +-
>  tools/perf/tests/shell/record+probe_libc_inet_pton.sh        | 2 +-
>  tools/perf/tests/shell/record+script_probe_vfs_getname.sh    | 2 +-
>  tools/perf/tests/shell/record+zstd_comp_decomp.sh            | 2 +-
>  tools/perf/tests/shell/record_bpf_filter.sh                  | 2 +-
>  tools/perf/tests/shell/record_offcpu.sh                      | 2 +-
>  tools/perf/tests/shell/record_sideband.sh                    | 2 +-
>  tools/perf/tests/shell/script.sh                             | 2 +-
>  tools/perf/tests/shell/stat+csv_summary.sh                   | 2 +-
>  tools/perf/tests/shell/stat+shadow_stat.sh                   | 2 +-
>  tools/perf/tests/shell/stat_all_pfm.sh                       | 2 +-
>  tools/perf/tests/shell/stat_bpf_counters.sh                  | 2 +-
>  tools/perf/tests/shell/stat_bpf_counters_cgrp.sh             | 2 +-
>  tools/perf/tests/shell/test_arm_callgraph_fp.sh              | 2 +-
>  tools/perf/tests/shell/test_arm_coresight.sh                 | 2 +-
>  tools/perf/tests/shell/test_arm_coresight_disasm.sh          | 2 +-
>  tools/perf/tests/shell/test_arm_spe.sh                       | 2 +-
>  tools/perf/tests/shell/test_arm_spe_fork.sh                  | 2 +-
>  tools/perf/tests/shell/test_bpf_metadata.sh                  | 2 +-
>  tools/perf/tests/shell/test_intel_pt.sh                      | 2 +-
>  tools/perf/tests/shell/trace+probe_vfs_getname.sh            | 2 +-
>  tools/perf/tests/shell/trace_btf_enum.sh                     | 2 +-
>  tools/perf/tests/shell/trace_exit_race.sh                    | 2 +-
>  tools/perf/tests/shell/trace_record_replay.sh                | 2 +-
>  tools/perf/tests/shell/trace_summary.sh                      | 2 +-
>  tools/perf/tests/tests-scripts.c                             | 2 +-
>  43 files changed, 43 insertions(+), 43 deletions(-)
> 
> diff --git a/tools/perf/tests/perf-targz-src-pkg b/tools/perf/tests/perf-targz-src-pkg
> index b3075c168cb2..52a90e6bd8af 100755
> --- a/tools/perf/tests/perf-targz-src-pkg
> +++ b/tools/perf/tests/perf-targz-src-pkg
> @@ -1,4 +1,4 @@
> -#!/bin/sh
> +#!/bin/bash
>  # SPDX-License-Identifier: GPL-2.0
>  # Test one of the main kernel Makefile targets to generate a perf sources tarball
>  # suitable for build outside the full kernel sources.
> diff --git a/tools/perf/tests/shell/amd-ibs-swfilt.sh b/tools/perf/tests/shell/amd-ibs-swfilt.sh
> index 83937aa687cc..7045ec72ba4c 100755
> --- a/tools/perf/tests/shell/amd-ibs-swfilt.sh
> +++ b/tools/perf/tests/shell/amd-ibs-swfilt.sh
> @@ -1,4 +1,4 @@
> -#!/bin/sh
> +#!/bin/bash
>  # AMD IBS software filtering
>  
>  echo "check availability of IBS swfilt"
> diff --git a/tools/perf/tests/shell/buildid.sh b/tools/perf/tests/shell/buildid.sh
> index 3383ca3399d4..d2eb213da01d 100755
> --- a/tools/perf/tests/shell/buildid.sh
> +++ b/tools/perf/tests/shell/buildid.sh
> @@ -1,4 +1,4 @@
> -#!/bin/sh
> +#!/bin/bash
>  # build id cache operations
>  # SPDX-License-Identifier: GPL-2.0
>  
> diff --git a/tools/perf/tests/shell/coresight/asm_pure_loop.sh b/tools/perf/tests/shell/coresight/asm_pure_loop.sh
> index c63bc8c73e26..0301904b9637 100755
> --- a/tools/perf/tests/shell/coresight/asm_pure_loop.sh
> +++ b/tools/perf/tests/shell/coresight/asm_pure_loop.sh
> @@ -1,4 +1,4 @@
> -#!/bin/sh -e
> +#!/bin/bash -e
>  # CoreSight / ASM Pure Loop (exclusive)
>  
>  # SPDX-License-Identifier: GPL-2.0
> diff --git a/tools/perf/tests/shell/coresight/memcpy_thread_16k_10.sh b/tools/perf/tests/shell/coresight/memcpy_thread_16k_10.sh
> index 8e29630957c8..1f765d69acc3 100755
> --- a/tools/perf/tests/shell/coresight/memcpy_thread_16k_10.sh
> +++ b/tools/perf/tests/shell/coresight/memcpy_thread_16k_10.sh
> @@ -1,4 +1,4 @@
> -#!/bin/sh -e
> +#!/bin/bash -e
>  # CoreSight / Memcpy 16k 10 Threads (exclusive)
>  
>  # SPDX-License-Identifier: GPL-2.0
> diff --git a/tools/perf/tests/shell/coresight/thread_loop_check_tid_10.sh b/tools/perf/tests/shell/coresight/thread_loop_check_tid_10.sh
> index 0c4c82a1c8e1..7f43a93a2ac2 100755
> --- a/tools/perf/tests/shell/coresight/thread_loop_check_tid_10.sh
> +++ b/tools/perf/tests/shell/coresight/thread_loop_check_tid_10.sh
> @@ -1,4 +1,4 @@
> -#!/bin/sh -e
> +#!/bin/bash -e
>  # CoreSight / Thread Loop 10 Threads - Check TID (exclusive)
>  
>  # SPDX-License-Identifier: GPL-2.0
> diff --git a/tools/perf/tests/shell/coresight/thread_loop_check_tid_2.sh b/tools/perf/tests/shell/coresight/thread_loop_check_tid_2.sh
> index d3aea9fc6ced..a94d2079ed06 100755
> --- a/tools/perf/tests/shell/coresight/thread_loop_check_tid_2.sh
> +++ b/tools/perf/tests/shell/coresight/thread_loop_check_tid_2.sh
> @@ -1,4 +1,4 @@
> -#!/bin/sh -e
> +#!/bin/bash -e
>  # CoreSight / Thread Loop 2 Threads - Check TID (exclusive)
>  
>  # SPDX-License-Identifier: GPL-2.0
> diff --git a/tools/perf/tests/shell/coresight/unroll_loop_thread_10.sh b/tools/perf/tests/shell/coresight/unroll_loop_thread_10.sh
> index 7429d3a2ae43..cb3e97a0a89f 100755
> --- a/tools/perf/tests/shell/coresight/unroll_loop_thread_10.sh
> +++ b/tools/perf/tests/shell/coresight/unroll_loop_thread_10.sh
> @@ -1,4 +1,4 @@
> -#!/bin/sh -e
> +#!/bin/bash -e
>  # CoreSight / Unroll Loop Thread 10 (exclusive)
>  
>  # SPDX-License-Identifier: GPL-2.0
> diff --git a/tools/perf/tests/shell/diff.sh b/tools/perf/tests/shell/diff.sh
> index e05a5dc49479..fe05fdebcab5 100755
> --- a/tools/perf/tests/shell/diff.sh
> +++ b/tools/perf/tests/shell/diff.sh
> @@ -1,4 +1,4 @@
> -#!/bin/sh
> +#!/bin/bash
>  # perf diff tests
>  # SPDX-License-Identifier: GPL-2.0
>  
> diff --git a/tools/perf/tests/shell/ftrace.sh b/tools/perf/tests/shell/ftrace.sh
> index c243731d2fbf..7f8aafcbb761 100755
> --- a/tools/perf/tests/shell/ftrace.sh
> +++ b/tools/perf/tests/shell/ftrace.sh
> @@ -1,4 +1,4 @@
> -#!/bin/sh
> +#!/bin/bash
>  # perf ftrace tests
>  # SPDX-License-Identifier: GPL-2.0
>  
> diff --git a/tools/perf/tests/shell/lib/perf_has_symbol.sh b/tools/perf/tests/shell/lib/perf_has_symbol.sh
> index 561c93b75d77..0b35cce0b13d 100644
> --- a/tools/perf/tests/shell/lib/perf_has_symbol.sh
> +++ b/tools/perf/tests/shell/lib/perf_has_symbol.sh
> @@ -1,4 +1,4 @@
> -#!/bin/sh
> +#!/bin/bash
>  # SPDX-License-Identifier: GPL-2.0
>  
>  perf_has_symbol()
> diff --git a/tools/perf/tests/shell/lib/probe_vfs_getname.sh b/tools/perf/tests/shell/lib/probe_vfs_getname.sh
> index 58debce9ab42..88cd0e26d5f6 100644
> --- a/tools/perf/tests/shell/lib/probe_vfs_getname.sh
> +++ b/tools/perf/tests/shell/lib/probe_vfs_getname.sh
> @@ -1,4 +1,4 @@
> -#!/bin/sh
> +#!/bin/bash
>  # Arnaldo Carvalho de Melo <acme@kernel.org>, 2017
>  
>  perf probe -l 2>&1 | grep -q probe:vfs_getname
> diff --git a/tools/perf/tests/shell/lib/setup_python.sh b/tools/perf/tests/shell/lib/setup_python.sh
> index c2fce1793538..a58e5536f2ed 100644
> --- a/tools/perf/tests/shell/lib/setup_python.sh
> +++ b/tools/perf/tests/shell/lib/setup_python.sh
> @@ -1,4 +1,4 @@
> -#!/bin/sh
> +#!/bin/bash
>  # SPDX-License-Identifier: GPL-2.0
>  
>  if [ "x$PYTHON" = "x" ]
> diff --git a/tools/perf/tests/shell/lib/waiting.sh b/tools/perf/tests/shell/lib/waiting.sh
> index bdd5a7c71591..3a152892e077 100644
> --- a/tools/perf/tests/shell/lib/waiting.sh
> +++ b/tools/perf/tests/shell/lib/waiting.sh
> @@ -1,4 +1,4 @@
> -#!/bin/sh
> +#!/bin/bash
>  # SPDX-License-Identifier: GPL-2.0
>  
>  tenths=date\ +%s%1N
> diff --git a/tools/perf/tests/shell/list.sh b/tools/perf/tests/shell/list.sh
> index 76a9846cff22..0c04b3159cef 100755
> --- a/tools/perf/tests/shell/list.sh
> +++ b/tools/perf/tests/shell/list.sh
> @@ -1,4 +1,4 @@
> -#!/bin/sh
> +#!/bin/bash
>  # perf list tests
>  # SPDX-License-Identifier: GPL-2.0
>  
> diff --git a/tools/perf/tests/shell/lock_contention.sh b/tools/perf/tests/shell/lock_contention.sh
> index 30d195d4c62f..dde5bc737eb2 100755
> --- a/tools/perf/tests/shell/lock_contention.sh
> +++ b/tools/perf/tests/shell/lock_contention.sh
> @@ -1,4 +1,4 @@
> -#!/bin/sh
> +#!/bin/bash
>  # kernel lock contention analysis test
>  # SPDX-License-Identifier: GPL-2.0
>  
> diff --git a/tools/perf/tests/shell/perf-report-hierarchy.sh b/tools/perf/tests/shell/perf-report-hierarchy.sh
> index 02e3b6aee4ed..e3c6f9a24f33 100755
> --- a/tools/perf/tests/shell/perf-report-hierarchy.sh
> +++ b/tools/perf/tests/shell/perf-report-hierarchy.sh
> @@ -1,4 +1,4 @@
> -#!/bin/sh
> +#!/bin/bash
>  # perf report --hierarchy
>  # SPDX-License-Identifier: GPL-2.0
>  # Arnaldo Carvalho de Melo <acme@redhat.com> 
> diff --git a/tools/perf/tests/shell/probe_vfs_getname.sh b/tools/perf/tests/shell/probe_vfs_getname.sh
> index 0f52654c914a..5fe5682c28ce 100755
> --- a/tools/perf/tests/shell/probe_vfs_getname.sh
> +++ b/tools/perf/tests/shell/probe_vfs_getname.sh
> @@ -1,4 +1,4 @@
> -#!/bin/sh
> +#!/bin/bash
>  # Add vfs_getname probe to get syscall args filenames (exclusive)
>  
>  # SPDX-License-Identifier: GPL-2.0
> diff --git a/tools/perf/tests/shell/record+probe_libc_inet_pton.sh b/tools/perf/tests/shell/record+probe_libc_inet_pton.sh
> index c4bab5b5cc59..cfad1bd7b780 100755
> --- a/tools/perf/tests/shell/record+probe_libc_inet_pton.sh
> +++ b/tools/perf/tests/shell/record+probe_libc_inet_pton.sh
> @@ -1,4 +1,4 @@
> -#!/bin/sh
> +#!/bin/bash
>  # probe libc's inet_pton & backtrace it with ping (exclusive)
>  
>  # Installs a probe on libc's inet_pton function, that will use uprobes,
> diff --git a/tools/perf/tests/shell/record+script_probe_vfs_getname.sh b/tools/perf/tests/shell/record+script_probe_vfs_getname.sh
> index 1ad252f0d36e..002f7037f182 100755
> --- a/tools/perf/tests/shell/record+script_probe_vfs_getname.sh
> +++ b/tools/perf/tests/shell/record+script_probe_vfs_getname.sh
> @@ -1,4 +1,4 @@
> -#!/bin/sh
> +#!/bin/bash
>  # Use vfs_getname probe to get syscall args filenames (exclusive)
>  
>  # Uses the 'perf test shell' library to add probe:vfs_getname to the system
> diff --git a/tools/perf/tests/shell/record+zstd_comp_decomp.sh b/tools/perf/tests/shell/record+zstd_comp_decomp.sh
> index 8929046e9057..f6b82223834e 100755
> --- a/tools/perf/tests/shell/record+zstd_comp_decomp.sh
> +++ b/tools/perf/tests/shell/record+zstd_comp_decomp.sh
> @@ -1,4 +1,4 @@
> -#!/bin/sh
> +#!/bin/bash
>  # Zstd perf.data compression/decompression
>  
>  # SPDX-License-Identifier: GPL-2.0
> diff --git a/tools/perf/tests/shell/record_bpf_filter.sh b/tools/perf/tests/shell/record_bpf_filter.sh
> index 4d6c3c1b7fb9..383574cb3bd3 100755
> --- a/tools/perf/tests/shell/record_bpf_filter.sh
> +++ b/tools/perf/tests/shell/record_bpf_filter.sh
> @@ -1,4 +1,4 @@
> -#!/bin/sh
> +#!/bin/bash
>  # perf record sample filtering (by BPF) tests
>  # SPDX-License-Identifier: GPL-2.0
>  
> diff --git a/tools/perf/tests/shell/record_offcpu.sh b/tools/perf/tests/shell/record_offcpu.sh
> index 21a22efe08f5..860a2d6f4b75 100755
> --- a/tools/perf/tests/shell/record_offcpu.sh
> +++ b/tools/perf/tests/shell/record_offcpu.sh
> @@ -1,4 +1,4 @@
> -#!/bin/sh
> +#!/bin/bash
>  # perf record offcpu profiling tests (exclusive)
>  # SPDX-License-Identifier: GPL-2.0
>  
> diff --git a/tools/perf/tests/shell/record_sideband.sh b/tools/perf/tests/shell/record_sideband.sh
> index ac70ac27d590..2182551873be 100755
> --- a/tools/perf/tests/shell/record_sideband.sh
> +++ b/tools/perf/tests/shell/record_sideband.sh
> @@ -1,4 +1,4 @@
> -#!/bin/sh
> +#!/bin/bash
>  # perf record sideband tests
>  # SPDX-License-Identifier: GPL-2.0
>  
> diff --git a/tools/perf/tests/shell/script.sh b/tools/perf/tests/shell/script.sh
> index d3e2958d2242..7007f1cdf761 100755
> --- a/tools/perf/tests/shell/script.sh
> +++ b/tools/perf/tests/shell/script.sh
> @@ -1,4 +1,4 @@
> -#!/bin/sh
> +#!/bin/bash
>  # perf script tests
>  # SPDX-License-Identifier: GPL-2.0
>  
> diff --git a/tools/perf/tests/shell/stat+csv_summary.sh b/tools/perf/tests/shell/stat+csv_summary.sh
> index 323123ff4d19..9a4353db3825 100755
> --- a/tools/perf/tests/shell/stat+csv_summary.sh
> +++ b/tools/perf/tests/shell/stat+csv_summary.sh
> @@ -1,4 +1,4 @@
> -#!/bin/sh
> +#!/bin/bash
>  # perf stat csv summary test
>  # SPDX-License-Identifier: GPL-2.0
>  
> diff --git a/tools/perf/tests/shell/stat+shadow_stat.sh b/tools/perf/tests/shell/stat+shadow_stat.sh
> index 0c7d79a230ea..8824f445d343 100755
> --- a/tools/perf/tests/shell/stat+shadow_stat.sh
> +++ b/tools/perf/tests/shell/stat+shadow_stat.sh
> @@ -1,4 +1,4 @@
> -#!/bin/sh
> +#!/bin/bash
>  # perf stat metrics (shadow stat) test
>  # SPDX-License-Identifier: GPL-2.0
>  
> diff --git a/tools/perf/tests/shell/stat_all_pfm.sh b/tools/perf/tests/shell/stat_all_pfm.sh
> index 4d004f777a6e..c08c186af2c4 100755
> --- a/tools/perf/tests/shell/stat_all_pfm.sh
> +++ b/tools/perf/tests/shell/stat_all_pfm.sh
> @@ -1,4 +1,4 @@
> -#!/bin/sh
> +#!/bin/bash
>  # perf all libpfm4 events test
>  # SPDX-License-Identifier: GPL-2.0
>  
> diff --git a/tools/perf/tests/shell/stat_bpf_counters.sh b/tools/perf/tests/shell/stat_bpf_counters.sh
> index 95d2ad5d17c6..f43e28a136d3 100755
> --- a/tools/perf/tests/shell/stat_bpf_counters.sh
> +++ b/tools/perf/tests/shell/stat_bpf_counters.sh
> @@ -1,4 +1,4 @@
> -#!/bin/sh
> +#!/bin/bash
>  # perf stat --bpf-counters test (exclusive)
>  # SPDX-License-Identifier: GPL-2.0
>  
> diff --git a/tools/perf/tests/shell/stat_bpf_counters_cgrp.sh b/tools/perf/tests/shell/stat_bpf_counters_cgrp.sh
> index 2ec69060c42f..ff2e06c408bc 100755
> --- a/tools/perf/tests/shell/stat_bpf_counters_cgrp.sh
> +++ b/tools/perf/tests/shell/stat_bpf_counters_cgrp.sh
> @@ -1,4 +1,4 @@
> -#!/bin/sh
> +#!/bin/bash
>  # perf stat --bpf-counters --for-each-cgroup test
>  # SPDX-License-Identifier: GPL-2.0
>  
> diff --git a/tools/perf/tests/shell/test_arm_callgraph_fp.sh b/tools/perf/tests/shell/test_arm_callgraph_fp.sh
> index 9caa36130175..9172dd68a81d 100755
> --- a/tools/perf/tests/shell/test_arm_callgraph_fp.sh
> +++ b/tools/perf/tests/shell/test_arm_callgraph_fp.sh
> @@ -1,4 +1,4 @@
> -#!/bin/sh
> +#!/bin/bash
>  # Check Arm64 callgraphs are complete in fp mode
>  # SPDX-License-Identifier: GPL-2.0
>  
> diff --git a/tools/perf/tests/shell/test_arm_coresight.sh b/tools/perf/tests/shell/test_arm_coresight.sh
> index 573af9235b72..1c750b67d141 100755
> --- a/tools/perf/tests/shell/test_arm_coresight.sh
> +++ b/tools/perf/tests/shell/test_arm_coresight.sh
> @@ -1,4 +1,4 @@
> -#!/bin/sh
> +#!/bin/bash
>  # Check Arm CoreSight trace data recording and synthesized samples (exclusive)
>  
>  # Uses the 'perf record' to record trace data with Arm CoreSight sinks;
> diff --git a/tools/perf/tests/shell/test_arm_coresight_disasm.sh b/tools/perf/tests/shell/test_arm_coresight_disasm.sh
> index be2d26303f94..0dfb4fadf531 100755
> --- a/tools/perf/tests/shell/test_arm_coresight_disasm.sh
> +++ b/tools/perf/tests/shell/test_arm_coresight_disasm.sh
> @@ -1,4 +1,4 @@
> -#!/bin/sh
> +#!/bin/bash
>  # Check Arm CoreSight disassembly script completes without errors (exclusive)
>  # SPDX-License-Identifier: GPL-2.0
>  
> diff --git a/tools/perf/tests/shell/test_arm_spe.sh b/tools/perf/tests/shell/test_arm_spe.sh
> index a69aab70dd8a..bb76ea88aa14 100755
> --- a/tools/perf/tests/shell/test_arm_spe.sh
> +++ b/tools/perf/tests/shell/test_arm_spe.sh
> @@ -1,4 +1,4 @@
> -#!/bin/sh
> +#!/bin/bash
>  # Check Arm SPE trace data recording and synthesized samples (exclusive)
>  
>  # Uses the 'perf record' to record trace data of Arm SPE events;
> diff --git a/tools/perf/tests/shell/test_arm_spe_fork.sh b/tools/perf/tests/shell/test_arm_spe_fork.sh
> index 8efeef9fb956..5bcca51c03ac 100755
> --- a/tools/perf/tests/shell/test_arm_spe_fork.sh
> +++ b/tools/perf/tests/shell/test_arm_spe_fork.sh
> @@ -1,4 +1,4 @@
> -#!/bin/sh
> +#!/bin/bash
>  # Check Arm SPE doesn't hang when there are forks
>  
>  # SPDX-License-Identifier: GPL-2.0
> diff --git a/tools/perf/tests/shell/test_bpf_metadata.sh b/tools/perf/tests/shell/test_bpf_metadata.sh
> index 11df592fb661..bc9aef161664 100755
> --- a/tools/perf/tests/shell/test_bpf_metadata.sh
> +++ b/tools/perf/tests/shell/test_bpf_metadata.sh
> @@ -1,4 +1,4 @@
> -#!/bin/sh
> +#!/bin/bash
>  # SPDX-License-Identifier: GPL-2.0
>  #
>  # BPF metadata collection test.
> diff --git a/tools/perf/tests/shell/test_intel_pt.sh b/tools/perf/tests/shell/test_intel_pt.sh
> index 32a9b8dcb200..8ee761f03c38 100755
> --- a/tools/perf/tests/shell/test_intel_pt.sh
> +++ b/tools/perf/tests/shell/test_intel_pt.sh
> @@ -1,4 +1,4 @@
> -#!/bin/sh
> +#!/bin/bash
>  # Miscellaneous Intel PT testing (exclusive)
>  # SPDX-License-Identifier: GPL-2.0
>  
> diff --git a/tools/perf/tests/shell/trace+probe_vfs_getname.sh b/tools/perf/tests/shell/trace+probe_vfs_getname.sh
> index 5d5019988d61..7a0b1145d0cd 100755
> --- a/tools/perf/tests/shell/trace+probe_vfs_getname.sh
> +++ b/tools/perf/tests/shell/trace+probe_vfs_getname.sh
> @@ -1,4 +1,4 @@
> -#!/bin/sh
> +#!/bin/bash
>  # Check open filename arg using perf trace + vfs_getname (exclusive)
>  
>  # Uses the 'perf test shell' library to add probe:vfs_getname to the system
> diff --git a/tools/perf/tests/shell/trace_btf_enum.sh b/tools/perf/tests/shell/trace_btf_enum.sh
> index c37017bfeb5e..572001d75d78 100755
> --- a/tools/perf/tests/shell/trace_btf_enum.sh
> +++ b/tools/perf/tests/shell/trace_btf_enum.sh
> @@ -1,4 +1,4 @@
> -#!/bin/sh
> +#!/bin/bash
>  # perf trace enum augmentation tests
>  # SPDX-License-Identifier: GPL-2.0
>  
> diff --git a/tools/perf/tests/shell/trace_exit_race.sh b/tools/perf/tests/shell/trace_exit_race.sh
> index 1e247693e756..db300cde94fb 100755
> --- a/tools/perf/tests/shell/trace_exit_race.sh
> +++ b/tools/perf/tests/shell/trace_exit_race.sh
> @@ -1,4 +1,4 @@
> -#!/bin/sh
> +#!/bin/bash
>  # perf trace exit race
>  # SPDX-License-Identifier: GPL-2.0
>  
> diff --git a/tools/perf/tests/shell/trace_record_replay.sh b/tools/perf/tests/shell/trace_record_replay.sh
> index 6b4ed863c1ef..88d30a03dcec 100755
> --- a/tools/perf/tests/shell/trace_record_replay.sh
> +++ b/tools/perf/tests/shell/trace_record_replay.sh
> @@ -1,4 +1,4 @@
> -#!/bin/sh
> +#!/bin/bash
>  # perf trace record and replay
>  # SPDX-License-Identifier: GPL-2.0
>  
> diff --git a/tools/perf/tests/shell/trace_summary.sh b/tools/perf/tests/shell/trace_summary.sh
> index f9bb7f9388be..22e2651d5919 100755
> --- a/tools/perf/tests/shell/trace_summary.sh
> +++ b/tools/perf/tests/shell/trace_summary.sh
> @@ -1,4 +1,4 @@
> -#!/bin/sh
> +#!/bin/bash
>  # perf trace summary (exclusive)
>  # SPDX-License-Identifier: GPL-2.0
>  
> diff --git a/tools/perf/tests/tests-scripts.c b/tools/perf/tests/tests-scripts.c
> index 1d5759d08141..684feed58254 100644
> --- a/tools/perf/tests/tests-scripts.c
> +++ b/tools/perf/tests/tests-scripts.c
> @@ -85,7 +85,7 @@ static char *shell_test__description(int dir_fd, const char *name)
>  	if (io.fd < 0)
>  		return NULL;
>  
> -	/* Skip first line - should be #!/bin/sh Shebang */
> +	/* Skip first line - should be #!/bin/bash Shebang */
>  	if (io__get_char(&io) != '#')
>  		goto err_out;
>  	if (io__get_char(&io) != '!')
> 
> ---
> base-commit: edf2cadf01e8f2620af25b337d15ebc584911b46
> change-id: 20250623-james-perf-bash-tests-88261a847552
> 
> Best regards,
> -- 
> James Clark <james.clark@linaro.org>


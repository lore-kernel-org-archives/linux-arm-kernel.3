Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03B21D262B2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Jan 2026 06:58:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oGCaNWOrziYJiY8UN1dexl0iYLA/uCJ+jgLUzqoYAwc=; b=fxdFPawlyrxP3px7OP3csWSjv9
	OZBU5CXVCxfetuT76cfAG9YCZRLIG7HroaiB5ybj9JuAiYSIqCmNorn7KCXhV225pxhpM1dxSxJux
	uOENZT1RrzDg0LDmugFqO/etMHkYms6NveuRprVh4181oLbdEBPhw4od1G+ialNTkB65UJFqqLZ2g
	cL01sz4gYsBOEZ/kvONCrqoZU0ZYPJPftnLMWax0nJsYB87GAryu4Sz7OnVE54oRr890IFtEKycr/
	IaHkP/0uiVT6hSJaFffiZzA2YccolvxU0F4flySuXEXqba31KCjRoN3dFfsfrRaeU6jMhrDLGHCXZ
	hAX4qjHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viSAm-00000004yaK-1NBv;
	Wed, 21 Jan 2026 06:58:36 +0000
Received: from mgamail.intel.com ([198.175.65.10])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viSAj-00000004yZn-377j;
	Wed, 21 Jan 2026 06:58:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768978714; x=1800514714;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=gQ2iJQpnPdN/VjaVdp15xX/jvrsDqvjipQxnEurzx0o=;
  b=keTalmMkRLRdF4G6aEANlcgH2YcAAGb4SVDcRaRS+h5vzxCMVjNkPPqy
   MCkloiY8SDu+LXLY0Ui5TnPgEiqrFRAhZ2B7LbOLe1Wy192Qw7+vKha+R
   zm8uODdm1H4yCmVnt9PQUPJISHRAwcROCP8kBCprdkJQQl9r8UhlAmMnD
   ca9h7nT745A9WlcfR0DIeDe+T6KJnTFKVYYVdBjGNBGdvxmaA/ijPo3MY
   PSDL26OaWUxfFsS2NHMslBu8f40kga8A6Et3wwuhfbpQZIiv8F4MyPoDY
   bMPrjfWEprPrPCR+GWSdWzEH/5syxm2a8JsdG526ZxQ/GDZiZj6GeMpnD
   Q==;
X-CSE-ConnectionGUID: PvZ3oc2fRhW1f3rajkSMXA==
X-CSE-MsgGUID: GMHDkOewQXSka+5BLxRcXg==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="87613439"
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; 
   d="scan'208";a="87613439"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2026 22:58:32 -0800
X-CSE-ConnectionGUID: RTr0u7XLSeaTx5XBU3ytxg==
X-CSE-MsgGUID: XiL39KX7SleqSNkWfdr/mQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; 
   d="scan'208";a="206775947"
Received: from unknown (HELO [10.238.3.254]) ([10.238.3.254])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2026 22:58:25 -0800
Message-ID: <8c1fefd6-4f4c-42a7-9007-5c9df3975080@linux.intel.com>
Date: Wed, 21 Jan 2026 14:58:23 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 08/23] perf perf_regs: Switch from arch string to int
 e_machine
To: Arnaldo Carvalho de Melo <acme@kernel.org>,
 Ian Rogers <irogers@google.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>,
 Adrian Hunter <adrian.hunter@intel.com>, James Clark
 <james.clark@linaro.org>, John Garry <john.g.garry@oracle.com>,
 Will Deacon <will@kernel.org>, Leo Yan <leo.yan@linux.dev>,
 Guo Ren <guoren@kernel.org>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Shimin Guo <shimin.guo@skydio.com>,
 Athira Rajeev <atrajeev@linux.ibm.com>,
 Stephen Brennan <stephen.s.brennan@oracle.com>,
 Howard Chu <howardchu95@gmail.com>, Thomas Falcon <thomas.falcon@intel.com>,
 Andi Kleen <ak@linux.intel.com>, "Dr. David Alan Gilbert"
 <linux@treblig.org>, Dmitry Vyukov <dvyukov@google.com>,
 =?UTF-8?Q?Krzysztof_=C5=81opatowski?= <krzysztof.m.lopatowski@gmail.com>,
 Chun-Tse Shao <ctshao@google.com>, Aditya Bodkhe <aditya.b1@linux.ibm.com>,
 Haibo Xu <haibo1.xu@intel.com>, Sergei Trofimovich <slyich@gmail.com>,
 linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
 linux-riscv@lists.infradead.org, Mark Wielaard <mark@klomp.org>
References: <20260117052849.2205545-1-irogers@google.com>
 <20260117052849.2205545-9-irogers@google.com> <aW_OV72q5rAVrgRE@x1>
Content-Language: en-US
From: "Mi, Dapeng" <dapeng1.mi@linux.intel.com>
In-Reply-To: <aW_OV72q5rAVrgRE@x1>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_225833_816600_96688E8A 
X-CRM114-Status: GOOD (  16.82  )
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


On 1/21/2026 2:49 AM, Arnaldo Carvalho de Melo wrote:
> On Fri, Jan 16, 2026 at 09:28:34PM -0800, Ian Rogers wrote:
>> The arch string requires multiple strcmp to identify things like the
>> IP and SP. Switch to passing in an e_machine that in the bulk of cases
>> is computed using a current thread load. The e_machine also allows
>> identification of 32-bit vs 64-bit processes.
>>
>> Signed-off-by: Ian Rogers <irogers@google.com>
>> ---
>>  tools/perf/builtin-script.c                   |  17 ++-
>>  tools/perf/util/evsel.c                       |  14 ++-
>>  tools/perf/util/perf_regs.c                   | 105 +++++++++++-------
> [ Include dwarf-regs.h to get conditional defines for EM_CSKY and EM_LOONGARCH, not available in old distros ]
>
> - Arnaldo

Seems the change would introduce the below building error.

util/perf_regs.c: In function ‘perf_reg_name’:
util/perf_regs.c:48:14: error: ‘EM_LOONGARCH’ undeclared (first use in this
function)
   48 |         case EM_LOONGARCH:
      |              ^~~~~~~~~~~~
util/perf_regs.c:48:14: note: each undeclared identifier is reported only
once for each function it appears in
util/perf_regs.c: In function ‘perf_arch_reg_ip’:
util/perf_regs.c:114:14: error: ‘EM_LOONGARCH’ undeclared (first use in
this function)
  114 |         case EM_LOONGARCH:
      |              ^~~~~~~~~~~~
util/perf_regs.c: In function ‘perf_arch_reg_sp’:
util/perf_regs.c:143:14: error: ‘EM_LOONGARCH’ undeclared (first use in
this function)
  143 |         case EM_LOONGARCH:
      |              ^~~~~~~~~~~~

It looks EM_LOONGARCH is not defined in the <elf.h> header file, not sure
which one is better, include  dwarf-regs.h suggested by Arnaldo or direct
add the define,

diff --git a/tools/perf/util/perf_regs.c b/tools/perf/util/perf_regs.c
index b58d59b84fb1..ce839df19fa3 100644
--- a/tools/perf/util/perf_regs.c
+++ b/tools/perf/util/perf_regs.c
@@ -6,6 +6,10 @@
 #include "util/sample.h"
 #include "debug.h"

+#ifndef EM_LOONGARCH
+#define EM_LOONGARCH           258
+#endif
+
 int __weak arch_sdt_arg_parse_op(char *old_op __maybe_unused,
                                 char **new_op __maybe_unused)
 {


>


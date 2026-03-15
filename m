Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC0C5F30262
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Mar 2026 13:43:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=h78qbJaz5oga+YwC+YzNKry47vMBTJ2oXVz7fIfq/j8=; b=2IolCnz9m5NRiW1/EnMGyYW6/S
	7CvCMVrHGfznNo/booyebIvLy0qAhBmEatJAZf7a3H761qkgpItR1KoasWicp5WAeLHlv8YKB4QDe
	v0YKtRPTC2QH6ugAuMxEIWDYU8Kfz9G3/KmJY1JfkwP6zQrPnDMZrJwfINbx54cY02gLqxz05nsWi
	XrfcLMblWML7+iih/6DSJ7q78kZZRWPZNiQOCfL03EFYVl94uwVt6TeXXXrHYjiO4immyynT5SBgX
	8sTg5Fdo9lutxJcPhtzIhdXoFyQUE6O7ooA50lq0SBmxSOUpVlJ6ciFk3iPcnz/RNggBjKJh3cqDm
	FrGYnuHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1lkO-00000002dQx-0Eh6;
	Sun, 15 Mar 2026 13:43:12 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1lkM-00000002dQd-0gXF
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Mar 2026 13:43:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5561040967;
	Sun, 15 Mar 2026 13:43:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98F6BC2BCAF;
	Sun, 15 Mar 2026 13:43:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773582187;
	bh=MnxeFpI98TXDQt+pgyaIGEv+yj87AclQnx6O0KZL2eg=;
	h=Date:From:To:Cc:Subject:From;
	b=bbbwHiQTwHWjcTd4C5PaUeApjhs8A7nWeMmHCeA8buKh9gCNZKSfSKGKvim0f7dXP
	 OxFDRMObKmQLPIc0QkICf7uw7sB9n+4aPwYsnjyRx5DORHeD8p/Fw3SlAS3alHc7QS
	 +c1eOTAiiANT1R+ovC1++KlQQP1LC6NdZhIJN6FBzGYbCkSsK4G0Iv2n0iF20sIgLq
	 RGphZsFyv6qmbihFhbGeylT136HwAPMY0WMyrTMGGJG8+hSnv6MgLcVWALuxBfu5CY
	 Q16MG0jFiEtaZ+X8YO1oUyttooWGShh9St6hFN5jJ5w92NOqFWbgmz4eVGQhidel/h
	 DZYnzXJtfoMJw==
Date: Sun, 15 Mar 2026 10:43:03 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: Leo Yan <leo.yan@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, Oliver Upton <oupton@kernel.org>,
	Shameer Kolothum <skolothumtho@nvidia.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Ian Rogers <irogers@google.com>,
	James Clark <james.clark@linaro.org>, Jiri Olsa <jolsa@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	linux-perf-users@vger.kernel.org
Subject: REQUEST: Syncing tools/arch/arm64/include/asm/cputype.h with the
 kernel sources
Message-ID: <aba3Z0aelph_gQ6c@x1>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260315_064310_254835_080DFFEC 
X-CRM114-Status: GOOD (  15.83  )
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

Hi,

	Can someone please address this perf build warning:

  make: Entering directory '/home/acme/git/perf-tools/tools/perf'
  BUILD:   Doing 'make -j32' parallel build
Warning: Kernel ABI header differences:
  diff -u tools/arch/arm64/include/asm/cputype.h arch/arm64/include/asm/cputype.h

I tried updating that header and got the problems below.

I just merged perf-tools with upstream, will push to tmp.perf-tools at:

https://git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools.git tmp.perf-tools

Thanks in advance,

- Arnaldo

⬢ [acme@toolbx perf-tools]$ git diff
diff --git a/tools/arch/arm64/include/asm/cputype.h b/tools/arch/arm64/include/asm/cputype.h
index 9b73c1aa3ad747ec..08860d482e60009f 100644
--- a/tools/arch/arm64/include/asm/cputype.h
+++ b/tools/arch/arm64/include/asm/cputype.h
@@ -255,6 +255,16 @@

 #define read_cpuid(reg)                        read_sysreg_s(SYS_ ## reg)

+/*
+ * The CPU ID never changes at run time, so we might as well tell the
+ * compiler that it's constant.  Use this function to read the CPU ID
+ * rather than directly reading processor_id or read_cpuid() directly.
+ */
+static inline u32 __attribute_const__ read_cpuid_id(void)
+{
+       return read_cpuid(MIDR_EL1);
+}
+
 /*
  * Represent a range of MIDR values for a given CPU model and a
  * range of variant/revision values.
@@ -290,31 +300,6 @@ static inline bool midr_is_cpu_model_range(u32 midr, u32 model, u32 rv_min,
        return _model == model && rv >= rv_min && rv <= rv_max;
 }

-static inline bool is_midr_in_range(u32 midr, struct midr_range const *range)
-{
-       return midr_is_cpu_model_range(midr, range->model,
-                                      range->rv_min, range->rv_max);
-}
-
-static inline bool
-is_midr_in_range_list(u32 midr, struct midr_range const *ranges)
-{
-       while (ranges->model)
-               if (is_midr_in_range(midr, ranges++))
-                       return true;
-       return false;
⬢ [acme@toolbx perf-tools]$ m
make: Entering directory '/home/acme/git/perf-tools/tools/perf'
  BUILD:   Doing 'make -j32' parallel build
Warning: Kernel ABI header differences:
  diff -u tools/arch/x86/include/asm/msr-index.h arch/x86/include/asm/msr-index.h
  diff -u tools/arch/x86/include/uapi/asm/svm.h arch/x86/include/uapi/asm/svm.h

Auto-detecting system features:
...                                   libdw: [ on  ]
...                                   glibc: [ on  ]
...                                  libelf: [ on  ]
...                                 libnuma: [ on  ]
...                  numa_num_possible_cpus: [ on  ]
...                               libpython: [ on  ]
...                             libcapstone: [ on  ]
...                               llvm-perf: [ on  ]
...                                    zlib: [ on  ]
...                                    lzma: [ on  ]
...                                     bpf: [ on  ]
...                                  libaio: [ on  ]
...                                 libzstd: [ on  ]
...                              libopenssl: [ on  ]
...                                    rust: [ on  ]

  INSTALL libsubcmd_headers
  INSTALL libapi_headers
  INSTALL libperf_headers
  INSTALL libsymbol_headers
  INSTALL libbpf_headers
  CC      /tmp/build/perf-tools/util/arm-spe.o
util/arm-spe.c: In function ‘arm_spe__synth_ds’:
util/arm-spe.c:986:43: error: passing argument 1 of ‘is_midr_in_range_list’ makes pointer from integer without a cast [-Wint-conversion]
  986 |                 if (is_midr_in_range_list(midr, data_source_handles[i].midr_ranges)) {
      |                                           ^~~~
      |                                           |
      |                                           u64 {aka long unsigned int}
In file included from util/arm-spe.c:37:
util/../../arch/arm64/include/asm/cputype.h:310:53: note: expected ‘const struct midr_range *’ but argument is of type ‘u64’ {aka ‘long unsigned int’}
  310 | bool is_midr_in_range_list(struct midr_range const *ranges);
      |                            ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~
util/arm-spe.c:986:21: error: too many arguments to function ‘is_midr_in_range_list’; expected 1, have 2
  986 |                 if (is_midr_in_range_list(midr, data_source_handles[i].midr_ranges)) {
      |                     ^~~~~~~~~~~~~~~~~~~~~       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
util/../../arch/arm64/include/asm/cputype.h:310:6: note: declared here
  310 | bool is_midr_in_range_list(struct midr_range const *ranges);
      |      ^~~~~~~~~~~~~~~~~~~~~
make[4]: *** [/home/acme/git/perf-tools/tools/build/Makefile.build:95: /tmp/build/perf-tools/util/arm-spe.o] Error 1
make[3]: *** [/home/acme/git/perf-tools/tools/build/Makefile.build:158: util] Error 2
make[2]: *** [Makefile.perf:797: /tmp/build/perf-tools/perf-util-in.o] Error 2
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [Makefile.perf:289: sub-make] Error 2
make: *** [Makefile:119: install-bin] Error 2
make: Leaving directory '/home/acme/git/perf-tools/tools/perf'
⬢ [acme@toolbx perf-tools]$


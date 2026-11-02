Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03DEF60A3836
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 12:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=SgLAQc5B;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=inoh3UF6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=mCLnsLSirANrZFkZpSvJ6WBM/VWZNAB053qbWLRSeJQ=; b=SgLAQc5BENqC8pdDfqSIKuNwhG
	DLMtVvjaYsko7BCWdgvQIwkNkefj8fPYKzu4VKXdwejsMqnP9S63EYYDr2/uqo7jhFHz3Z01reSNI
	HCC8buUsvhF78oBiHKfP7ZZbVJvYTnN7xDY0/10eRx6VXxO3mtLNPr8HXLMopQ3gZ/yuSKuHR+RtZ
	AlvPyMjkwX4XiocPnk2h/0UGkaGSIhDW/1+8tGJFxXnpNhK20cdy1SF5bOA2ty7z9XxfPWYFWUC7t
	17kyNakbttaipmnocihGHaOWE6Nx7tyK/aJLogQ8vadaDBLc0L4EecB5TGn4Mi3SVB2yOu7k5Jfnk
	oQOEwlLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNqx1-0000000GQQA-1APB;
	Mon, 02 Nov 2026 12:15:47 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNqwy-0000000GQOo-0IBJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 12:15:46 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4a2000d5fb1so19071405e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 04:15:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793621742; x=1794226542; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=mCLnsLSirANrZFkZpSvJ6WBM/VWZNAB053qbWLRSeJQ=;
        b=inoh3UF6fjwQcnyjcAvoKWJZp+tvxg/xTmFMq1PASFIFxyumdvM39ijEHMyETz+0ou
         /4qPcb+i8FDqy0elVlAEDBXgwXMnJOj5PwQv7rRUAJnEGFmsLJA7h2aHnEqbG1YqSw4W
         jC5u3408uYMDwI/GxBRRv3jRRB1Yeo8lXEBVUi/K9/0S40qCkLyvde5Pu+nolHUyzLqg
         h+I/qBk9L3JqElzLMWF5FcukyDqAP6eTdB453SlEf19hz06y2G3xrTZz3yccgn46NZcs
         LoLUH5uSpwBAdOFPNXP0HJNrBA+levHTEQQB5AOdFz2zQEy07tMO9K/d5c6zh/CvywcX
         FuXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793621742; x=1794226542;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=mCLnsLSirANrZFkZpSvJ6WBM/VWZNAB053qbWLRSeJQ=;
        b=WhoUTcUKNfpVcOKbmqUYQE2mC7no+qCVRBN1uYLnG8NYOybT5aWPc8z173mTpUNG0/
         aTN9LImzrUwBim4MheOnI9Pkja6n1rPHcI/GOUqLeOopxAaws/hJbI5Uf5mr/eKZCClv
         Fo8f/1UdVfJrWJ24V472Gl64pb6O5oXVC3Q/XLcZAmy1OWEyxchvUbbW/6M3YrlbsKon
         kFb8b4NWYC2tOMOQN8KmDr5RAyEEi789TILpYt+eB0jLzVsSef7Z77qy+3ehkj54OX+U
         ITblz6gEZDIWdigCfxlb/Y2VVGMPJcPwsbE5RGWcrM/WAt++Ju6vahujydGhnlNF3J3m
         ZDtw==
X-Forwarded-Encrypted: i=1; AKwUvBy7mdx639ioBMby2mjrAqyEbYoZ1TFxNIlokZNMWrRZLYBdEy0g6/y3CB+FjKDnVTjCJcBlCrUM8lP7MhJjFRIs@lists.infradead.org
X-Gm-Message-State: AFq9FYIj5zLAIhvxmnmSVWe43SN4OfHJdCAhnNoXdx1aMavKnssvtJ1k
	8yBu4A/JAJPWUJJT4oQ7M7wTzcA0XJz6V+kX/eM0tBmBmW+nAZqi31WvIEa+YJYr9Gg=
X-Gm-Gg: AYBFou0w8U4pxv0TC4eWMOqpl0N5i2Yy+Ip2jZSTBd1IOfxqN5QNj0/f+bRGw5T4R+t
	vUjIBWKWAsK4Tuk8uDhJvhO81d4XZtGEqhT6HJtJgK2IuwyXpNVAIlB5ADaFmBtFS5szj2xiXsd
	M2QHDgnKF8sgbfTk9k1RhlOadcj5ImvlF0cPhpQyuaKi9dXoFkBZe3ThtQ0DrhJfFmJjfxRavAn
	4IJE6Y6buRi+ujdhM1VcruCxXYJNbXzEESl06IxX7/Gu+3C+pWLkGqyxCjN+DpKi9zxans2wLOc
	D1yJ68oWR3NAOMVQUcL3Evdtl+4/k3Zn/sP2lWBMlFxXD6XmqYfBletsruuB6oUNbGK+fr/tUf1
	2oZ94JzqQog99GlITu3Nn9IAq7kITiMNuVYGgap8VsoFu83k+uKpy0ZScADXcwpBB/4RiI9lPpa
	zotcXqBrHUcApAJk8/WGbM4y03CChrquZW+p2S+iNtxu09Gw/cnHUH/O0K7UTMl/bR9V4XtW9oA
	h6q6WEwgWVhah9qXCNU7QVy0oeP5aZtbQwjrDnlR7haNGQ3X9dLoUQsUJz/VDOgXte2+d4fMEAf
	t/6hQQEmLhTNnEVuWXAPK1yO9dn1dQWP
X-Received: by 2002:a05:600c:3554:b0:4a1:e7ce:107b with SMTP id 5b1f17b1804b1-4ac150b20eamr237179415e9.2.1793621742230;
        Mon, 02 Nov 2026 04:15:42 -0800 (PST)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abf5b27e46sm434974855e9.3.2026.11.02.04.15.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 04:15:41 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Subject: [PATCH v3 00/18] perf cs-etm: Per-thread mode fixes and snapshot
 wrap support
Date: Mon, 02 Nov 2026 12:15:14 +0000
Message-Id: <20261102-james-cs-unformatted-per-thread-fix-v3-0-dbcb0c281b9b@linaro.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANN+6GoC/43QwW6DMAyA4VdBOc+VEwjQapr6HtOEAjhttpF0S
 Yo2VX33Gbhstx7tw/fLvolE0VESh+ImIs0uueB5KJ8KMZyNPxG4kWehUNVYo4Z3M1GCIcHV2xA
 nkzONcKEI+RzJjGDdN2ikRpXGNBZJsHSJxOu18vrG89mlHOLPGp3lst38VsqH/FkCwh51rUvZW
 m3b46fzJoZdiCexBGb1B1UPoopRxKGyIzYo++ofet/OiPR15R/l7RbBajLrjw7F81KTWOIC225
 IHeWpY7nzwXfZfJCHueRGU6t9r5XpsWqOJk67IUwvXLj/AoXO2TWNAQAA
X-Change-ID: 20260605-james-cs-unformatted-per-thread-fix-50e723aa7f0e
To: Leo Yan <leo.yan@linux.dev>, Adrian Hunter <adrian.hunter@intel.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@arm.com>, Leo Yan <leo.yan@arm.com>, 
 Will Deacon <will@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>, 
 linux-arm-kernel@lists.infradead.org, coresight@lists.linaro.org, 
 linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Arnaldo Carvalho de Melo <acme@redhat.com>, linux-doc@vger.kernel.org, 
 James Clark <james.clark@linaro.org>, John Garry <john.garry@linux.dev>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_041544_537292_71E93BC0 
X-CRM114-Status: GOOD (  19.23  )
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Fix a few issues with per-thread mode:
  - On nVHE, everything looks like guest trace instead of host
  - Tracing multiple threads didn't really work

After adding a tests for those, it turns out there were some snapshot
bugs not picked up by the other snapshot tests. That showed that the
different snapshot searches for Intel BTS and Arm SPE were inconsistent
and I think all tracers can benefit from using the same pointer fixup
logic, so that gets refactored into the common auxtrace.c. Then SPE can
just share the Intel BTS search as it was obviously copied from it
originally. IntelPT keeps the more advanced duplicate data search, but
in the future that could probably be made the common one and all tracers
would benefit from using it (except maybe BTS if it always has a very
small buffer, but I doubt the overhead of the duplicate search would be
an issue). For now this is more of a refactor rather than behavioral
change so don't do that yet.

Signed-off-by: James Clark <james.clark@linaro.org>
---
Changes in v3:
- Keep the find_snapshot() callback instead of adding
  snapshot_has_wrapped() and monotonic_snapshot_head boolean (Adrian)
- Add auxtrace_record__default_find_snapshot() for the simple search for
  BTS and SPE (Adrian)
- Add auxtrace_record__snapshot_fixup() for any snapshot search
  implementation to use to update the pointers (Adrian)
- Reword UINT64_MAX timestamp comment (Leo)
- Fix disassembly test after rebasing onto exception sample fixes
- Only take 'perf_guest' into account if there is no PIDFMT_CTXTID2
- Improve decoding of old files by hard coding queue 0 for per-thread
- Link to v2: https://patch.msgid.link/20260821-james-cs-unformatted-per-thread-fix-v2-0-00c4fd0701b4@linaro.org

Changes in v2:
- Remove stale "may be reset to -1 in per-thread mode" comment
- Set CPU when queueing auxtrace fragments otherwise
  auxtrace_queues__add_event() overwrites the queue's CPU
- Link to v1: https://patch.msgid.link/20260811-james-cs-unformatted-per-thread-fix-v1-0-90565318f5f8@linaro.org

---
James Clark (18):
      perf cs-etm: Fix nVHE per-thread decoding
      perf cs-etm: Warn for invalid timestamp option
      perf cs-etm: Turn on context packet timestamps in per-thread mode
      perf cs-etm: Use per-CPU queues for per-thread mode
      perf test: cs-etm: Increase window size in disassembly test
      perf cs-etm: Don't drop previous target for kernel samples
      perf python: Expose sample instruction length
      perf cs-etm: Use instruction length in disassembly script
      perf cs-etm: Increase default timestamp generation period
      perf auxtrace: Turn Intel BTS snapshot search into a generic one
      perf arm-spe: Use generic snapshot search
      perf auxtrace: intel-pt: Use common snapshot pointer fixup
      perf cs-etm: Queue partial AUX records
      perf cs-etm: Don't print missing buffers in snapshot mode
      perf auxtrace: cs-etm: Capture wrapped snapshots
      perf test: Allow infinite named_thread loops
      perf test: cs-etm: Add test for per-thread mode
      perf test: cs-etm: Test multiple per-thread threads

 tools/perf/Documentation/perf-test.txt             |   2 +-
 tools/perf/arch/arm/util/cs-etm.c                  |  34 ++++-
 tools/perf/arch/arm64/util/arm-spe.c               | 147 +--------------------
 tools/perf/arch/x86/util/intel-bts.c               | 115 +---------------
 tools/perf/arch/x86/util/intel-pt.c                |  21 +--
 tools/perf/python/arm-cs-trace-disasm.py           |  22 +--
 tools/perf/python/perf.pyi                         |   1 +
 .../perf/tests/shell/coresight/per-thread-multi.sh |  76 +++++++++++
 tools/perf/tests/shell/coresight/per-thread.sh     |  48 +++++++
 .../perf/tests/shell/coresight/raw_dump_stress.sh  |   5 -
 .../shell/coresight/test_arm_coresight_disasm.sh   |   4 +-
 tools/perf/tests/workloads/named_threads.c         |   7 +-
 tools/perf/util/auxtrace.c                         | 145 +++++++++++++++++++-
 tools/perf/util/auxtrace.h                         |  18 +++
 tools/perf/util/cs-etm.c                           | 113 +++++++++++-----
 tools/perf/util/python.c                           |   1 +
 16 files changed, 418 insertions(+), 341 deletions(-)
---
base-commit: 790454475c15508d68ccfc4b023642305100f18f
change-id: 20260605-james-cs-unformatted-per-thread-fix-50e723aa7f0e
prerequisite-message-id: <20261030-perf_cs_etm_fix_non_taken-v3-0-7629b52ab047@arm.com>
prerequisite-patch-id: 4ef889ad751e344ae47c1d75a2a2e6cb2eadf6e1
prerequisite-patch-id: 636b39730334cbc5a76642c070e704ffe178e7be
prerequisite-patch-id: fb58f6daebdf5a194f8aa56ccc4022f932a5a6e5
prerequisite-patch-id: d240c10c6824f8ae6c3f10a1da01226a957f05fb
prerequisite-patch-id: 17b291db261e32dcb0d6f1ab2ed0adb7e0411813
prerequisite-patch-id: 45ae1d523c9e5c8c573309f1dab107a598f3d4f8
prerequisite-patch-id: 39a3eb25b3a45f4481760c25fa270773bcfd94f5
prerequisite-patch-id: 5723a15636c2a28ec40eb6b5c9836d162e971786
prerequisite-patch-id: d18054b586fc38bc832ead185e8c1fbb0ce46f39
prerequisite-patch-id: 6735b192189d7945613458abce3da871cb79b35d
prerequisite-patch-id: 387cb2c6181bef8f45a8fb167e8ef86e4a54ff69
prerequisite-patch-id: 50243a8d1739141aa24aa371a8452d4d2d078a99
prerequisite-patch-id: 2ae6f1e7707ba0c71a0678331b02d738fb25cb3c
prerequisite-patch-id: 1fa0a90cfbc904c4429c1427409125ac44b27aed

Best regards,
--  
James Clark <james.clark@linaro.org>



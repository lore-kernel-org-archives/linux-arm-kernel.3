Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EC236073A93
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 11:45:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=UEOZDaZU;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=wFA9U9Zr
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=wkXcoerwl72ld/nPiXesFgETWpZwTzTrpPsVrFQKphs=; b=UEOZDaZUAkfcsyJ+FwKh1g1V2o
	cVGQrciirY+w5GU99z/IoUM1KfZevtnd9afx1sAeybBW+7XYf5AbkSZkYw/f4x3DGDKhvax67HE4V
	LwLXdlpGnsK4hgKD6a1VntIham7kqmMBmq7MKcdOBzDLt0MX+xP4lE1BemafvNC+UBpN9nfdTzmNL
	DZdIfxUdGPg3hg6pc+la6L0xMkQtJffxppw5RP/JcMgJUo+9gCsLqlYgjTVs3x6czx4Lr/vsVGKYl
	wekdyn7ZS74XEZDVz/ms1Jiq5Oy+PvJ8kqwyvnWHeO7STWGNzCIUa9ig7TJ9HvQREACCfzmXVbaPk
	wsgkbe7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOvuK-00000008ik6-1dMU;
	Thu, 05 Nov 2026 11:45:28 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOvuC-00000008if6-42ym
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 11:45:25 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-48e4831c028so1602724f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Nov 2026 03:45:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793879119; x=1794483919; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=wkXcoerwl72ld/nPiXesFgETWpZwTzTrpPsVrFQKphs=;
        b=wFA9U9ZrWQGTMFFRrpyVNzIDJSEzSMvjdPViZtCwhMCR3tNQVV6hUV+1nToTJ7yp9a
         UAebehAizNCzAxR4IL3akefpdUtpesEIksZJXGZLMy67zJX9QF5Y4cfONg3IEh0OSGlj
         3mjCO2pkEij98r6lBqLqDfnPyndUjEMluL1AN0PcX6M5+e1gDcetKOK5IrN7vmuraOal
         l01wqw/YfWBX2lhTtk+KkUSI8bP9+ypPRY+feHzdvQ/L6dvglCHuQqsLllLhtsbJpuhZ
         pt5sHyOnoyc4pmWCVaZFxKeC8Zo0CG2CCLyNd/9nJoUmmrfl3+J+BtB0lnrWXsd9N0ZH
         z42A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793879119; x=1794483919;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=wkXcoerwl72ld/nPiXesFgETWpZwTzTrpPsVrFQKphs=;
        b=fXmnvtHm/MW0/GXl/dipsSTLuJQlQ7Rglo7/t2IDGesvGUO+3tcn4cEiFYNAdsYS2z
         vXkNbPXtyESdt+J/2WROM6SrxhBlsxNNQS5ZO1fK42v9t0pZNNsdgMG4F0UjJJWOl6qe
         W11hcAzKOLQyL549rXXE7zHbAqJjqUz7ShnUOlvL1a49lzkRhG7AYj5n4190D2yvWutQ
         WHBjr8eLNyNMQ6dAZJ9Fzy4pCjxTEw2v3+PCSAriwGhh9w2rfSxnHQCy5Acf4hjW+iDS
         EjRNBW9dS/6LPiAYPWMfpesiOraql1ZSuTy9qbcXkD9lToFg/W8Ht8YfbJ+1oxJHLrzH
         Vj2A==
X-Forwarded-Encrypted: i=1; AKwUvBwkmq8pNm+gynhhoiu1XiUpfhGIYgIpdjxNMd3SuuNrEK0Znu/fRTiXUJb9BYhoRaX264BwrYuLF/wg6pCQCaVS@lists.infradead.org
X-Gm-Message-State: APuU4Z/NY2Ei0zTHB+5wdd08iQ3fuVAEdvmWELaaU1U3AtfPUFY2PVkL
	6ikmM9bMBiEjUF+zdmE4TqddNkgZ0IZQOO4MbDrNRNRyLgp2Gq1D85dUpQu2e/flgYI=
X-Gm-Gg: AYBFou1SxAqKqinzWWnuCaUxmoV/Mf59pKMgU6MbCgzEvXXGom7x2O90jA7ouxh8mpp
	JjmBZGjxKcDOqW+9xK+K+YNZ9S8YhtuNKjTkE0+THresaq9HD+Kq7NYJKmKEc0sWzDq4GR1bMy8
	iyiSJ2WgjpfsGF2YLt46z/YIB4rareS9IXGnKpNpmFf7R/kcUxjtPT6JUiAlx/Ag293L+azg1jn
	1f36hSL2UCD6dLKnLPOjTeKO/kpyBLGTDFigTLWYgRGUIKdi+AiumUAMJnd/zPvCzIlEN6KnHaF
	sTfofxwtMnt2guxfySn/m9NPpGYtpKMYC7pAmtmwMawdOJQyCBGchrUDUK4Bh2G7O+YJlYB57WS
	BLngqZXm1BX5X7smIHrRkFLyzyHGhz1JxZLJMkBY4m/m1TGa4+9cA78+Q72yuyLQEsLiqe4BBl2
	34aDBO5hDEoFobLncmNUu6+QP7pbfdiDGmz/KqlM78JnadeFrLqgV2/YxIdPaD/B9+W4/nzMAwm
	4piW8lcUc4HRiyfrp4A9k/l2sxcL0W0Qztc2imFSjubBicY8XDGiI7YAU1bUi0/yjL8bPBRjGuY
	82JVefxF1E3TtpcZXVccFQSTPg/bLw/H
X-Received: by 2002:a05:600c:19d2:b0:4a4:4d57:8487 with SMTP id 5b1f17b1804b1-4ac1737c51dmr404872225e9.5.1793879118947;
        Thu, 05 Nov 2026 03:45:18 -0800 (PST)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b571f46538sm56679525e9.5.2026.11.05.03.45.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 03:45:18 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Subject: [PATCH v4 00/19] perf cs-etm: Per-thread mode fixes and snapshot
 wrap support
Date: Thu, 05 Nov 2026 11:44:48 +0000
Message-Id: <20261105-james-cs-unformatted-per-thread-fix-v4-0-7759e0ce2449@linaro.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADFs7GoC/43QzUrEMBSG4VspWZvhJG36M4jMfYiUJD2ZRm0yJ
 pmiDHPvpi2I4qbLcxbPC9+NRAwWIzkWNxJwttF6l4/qoSB6lO6M1A75Jhx4DTUI+ionjFRHenX
 Gh0mmhAO9YKBpDCgHauwnFYANL6VsDCDJ0iVgfq+V55d8jzYmH77W6MyW7+a3jO3yZ0aBdiBqU
 bLWCNOe3q2TwR98OJMlMPNfKN+J8owC6MoM0ABT1T+0/EEZA74PLTM6KK1A85apTv1B79s2AT+
 uefi0DUSyGuU6/LF4XGtQwgKbXsce09RnuXfe9Um+odsaTc07JbhUUDUnGaaD9tNTLty/AUgmt
 L7iAQAA
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
X-CRM114-CacheID: sfid-20261105_034521_091766_42546F36 
X-CRM114-Status: GOOD (  19.16  )
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

This series depends on:
https://lore.kernel.org/linux-perf-users/20261030-perf_cs_etm_fix_non_taken-v3-0-7629b52ab047@arm.com/

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
Changes in v4:
- Change test snapshot size to 128K for 64K machines
- Put patchset depencency in cover letter text
- Link to v3: https://patch.msgid.link/20261102-james-cs-unformatted-per-thread-fix-v3-0-dbcb0c281b9b@linaro.org

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
James Clark (19):
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
      perf test: cs-etm: Increase snapshot size

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
 .../shell/coresight/test_arm_coresight_disasm.sh   |   8 +-
 tools/perf/tests/workloads/named_threads.c         |   7 +-
 tools/perf/util/auxtrace.c                         | 145 +++++++++++++++++++-
 tools/perf/util/auxtrace.h                         |  18 +++
 tools/perf/util/cs-etm.c                           | 113 +++++++++++-----
 tools/perf/util/python.c                           |   1 +
 16 files changed, 420 insertions(+), 343 deletions(-)
---
base-commit: 28ef93607ad52acc8f8be25199711153ba11a0c2
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



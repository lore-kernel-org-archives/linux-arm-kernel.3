Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 596B0606A332
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Oct 2026 05:49:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=K/w7CR6L;
	dkim=pass (2048-bit key, unprotected) header.d=fb.com header.i=@fb.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=NK8WaQdR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=av06AcF1Tr2PwUb/RvCzEkpgnOdouTnt1W45a5B/3JI=; b=K/w7CR6LcUVjQJRciS1gEC+58L
	r/zH47xR+77yAe16JW1f768c0d50gdR/Ratz665V0xUe/ZS+irw5A1nhwq/2QYZPOcfjLSF7TagtS
	bOkOXyNIKd6Q1ZjdynCFKtYBs8Fr5whzx53m6cmpPK/VTGy/DHIAyfFAxxOcMwXHhKyfC7kbbs7l/
	aE/dN/XbB0wNsexS3kZOVGfPKjfz4X0zukcLcS2JaUzIrM16rVPB7XQll5wTLJSxqDf/DvhyAMXIK
	stI1YvErudxOVU/iXWqnx5yVFMt5bRx6nRdPu7urlCz0KGz/3BiuHOqTI00wPeHTZcSLeM0NKeprs
	/Bw86W3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLDa6-00000001l1S-0j4K;
	Mon, 26 Oct 2026 05:49:14 +0000
Received: from mx0b-00082601.pphosted.com ([67.231.153.30])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLDZo-00000001kv8-3vPu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Oct 2026 05:48:58 +0000
Received: from pps.filterd (m0528006.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69Q38XNq2106021;
	Sun, 25 Oct 2026 22:48:31 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	pps82601-s2048-2026-q3; bh=av06AcF1Tr2PwUb/RvCzEkpgnOdouTnt1W45a
	5B/3JI=; b=NK8WaQdRlyXz3/AATa2BLNtuDKV1UzhNmW/mc3jCTuRveoPz+2+pr
	W0JO++baSX4+37Tctvjnlhk205awgnVPjNu/v4rxWkIIdwhsur1/eE0R+y72G1UP
	dmEM6PahOqu2gBbG7XCANUhpCmBN5eR18N0872UKJ/PlmmWHmQuH5SB0MT3WdrcT
	xxqj8bJnf8dAlzs0pOGxeG7TXKP6KW9ceX5MTvGIg78hYIzuyRLIhistLyVSnWDG
	TCOD7XoV7rDZcIQzey2H5BBN/2MQ2NTXPfREKhuXdYQPXQ01kxpa68pBFOhZXUtS
	m0cBWOS+SeGtVwDAUF60hQ1zRXDZZd08A==
Received: from mail.thefacebook.com ([163.114.134.16])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4hhdahbhf1-4
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Sun, 25 Oct 2026 22:48:30 -0700 (PDT)
Received: from localhost (2620:10d:c085:208::f) by mail.thefacebook.com
 (2620:10d:c08b:78::2ac9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.56; Mon, 26 Oct
 2026 05:48:30 +0000
From: Amir Ayupov <aaupov@fb.com>
To: James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>,
        Suzuki K
 Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@arm.com>,
        Alexander
 Shishkin <alexander.shishkin@linux.intel.com>
CC: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
        Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Randy Dunlap
	<rdunlap@infradead.org>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Daniel
 Pereira <danielmaraboo@gmail.com>,
        <coresight@lists.linaro.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-perf-users@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH v4 0/7] coresight: Pulse an ETM external output for a PMU event
Date: Sun, 25 Oct 2026 22:48:20 -0700
Message-ID: <cover.1792989860.git.aaupov@fb.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1792907332.git.aaupov@fb.com>
References: <cover.1792907332.git.aaupov@fb.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDAyMiBTYWx0ZWRfX71AZXx627C61
 v/5RXHhR+OFJfdd8NU+uOPE1EC9uS0tYgoLKwD63VKh3uLculQL+udZHxSogugkfQvGm9zh6HSp
 9dAPr5UYxxnGsV9u3uLHkZyOf9OnD4I=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDAyMiBTYWx0ZWRfX3nEGu23ik5EE
 pkaSMAlQ0mkq3Lp16ZID2TL8wFtYqwl20qa3H9TPbCV5grY2BIb1AIQJgiAC4dN5FZVHBClBBrY
 kVHSoXU1RX97vfjjuAkI0m7Hx93lXZXTCVj3RRufflJ6iE3h93arhruPStw4y+PRuPvn3DPJJ0z
 k6BfSzMYE6WtRZa1Ile4ceG/dG+8nerWf2QfarA2vGNrPnLnQPytlJz1b4tm2z2ZAmTUdxkYA2d
 8+qFptG5oPYkhAUxOfP00FToYrLWkM6EuV5IiTk3m4CgLq3NJQyH3CtB1FP+HNu4GWVmCqK802P
 H/6oU6Qgnb8M0Tt6MkJyzS+E9zIa6qXOrmzm66p/CMOhmwHyRKFu3ZGWZnoUjDisNvTP5K25ZlX
 45uZtPe2HhgDqlQU7T5aRpMnoCnQ/tMXrgpdGQQ+WWI13YMj7Nyiz4cKqqF8V60N4a4Y2roN6tT
 vfmaaEgX/um+9muQ4gA==
X-Authority-Analysis: v=2.4 cv=CcWdd7rl c=1 sm=1 tr=0 ts=6adee9ae cx=c_pps
 a=CB4LiSf2rd0gKozIdrpkBw==:117 a=CB4LiSf2rd0gKozIdrpkBw==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22
 a=kkcUborcUVj0H7zxAXTl:22 a=VwQbUJbxAAAA:8 a=FOH2dFAWAAAA:8
 a=kbJkffxul9eUBz7T3f8A:9
X-Proofpoint-GUID: mRBOM1ZD71sonDUrnjYR8dqdMEb_Zxp_
X-Proofpoint-ORIG-GUID: mRBOM1ZD71sonDUrnjYR8dqdMEb_Zxp_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_01,2026-10-21_02,2025-10-01_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261025_224857_093343_3D03A069 
X-CRM114-Status: GOOD (  17.33  )
X-Spam-Score: -2.8 (--)
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
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add an ETMv4 configuration, pmu_pulse, that drives trace unit external
output 1 on every traced cycle, so a PMU event counting it (TRCEXTOUT1)
can end a fixed-length ETM window, for example with aux-action=pause.
The feature only loads on an ETE whose PMU counts its external outputs.

Patch 1 is Leo's fix for TRCIDR0.NUMEVENT decoding, which patch 6 relies
on for the number of external outputs.

Changes in v4:
- Fix the arm64 build: v3 defined pmuv3_event_implemented() in
  linux/perf/arm_pmuv3.h after including asm/arm_pmuv3.h, which broke
  files that include asm/arm_pmuv3.h directly, such as
  arch/arm64/kernel/cpufeature.c. Move it to the arm64 asm/arm_pmuv3.h,
  after the helpers it uses.
  Breakage reported by kernel test robot.
- Link to v3: https://lore.kernel.org/r/cover.1792907332.git.aaupov@fb.com

Changes in v3:
- Rebase onto coresight next, which moves the capability fields into
  drvdata->caps (Leo).
- Carry Leo's "coresight: etm4x: Fix event count decoding" (Leo).
- Add Leo's Reviewed-by to "Fail to enable a configuration not loaded on
  the device".
- Define CS_CFG_MATCH_CLASS_MASK and CS_CFG_MATCH_CAP_MASK with
  GENMASK_U32() and split the match check into early returns (Leo). The
  class check stays an intersection, as ETMv4 devices register with
  SRC_ALL | SRC_ETM4 while the built-in features only set SRC_ETM4.
- Remove the unused CS_CFG_MATCH_INST_ANY in a separate patch (Leo).
- Replace the per-output CS_CFG_MATCH_CAP_PMU_EXTOUT(n) bits with a single
  CS_CFG_MATCH_CAP_TRCEXTOUT, set on ETE only (Leo, James).
- Check the PMU events through a new pmuv3_event_implemented() helper
  instead of open-coding PMCEID0_EL0 in etm4x (James).
- Use PMU-agnostic event names in the documentation example (Daniel).
- Add Daniel's Reviewed-by to "Add pmu_pulse/extout_pulse".
- Link to v2: https://lore.kernel.org/r/20261012230527.750567-1-aaupov@fb.com

Amir Ayupov (6):
  coresight: syscfg: Fail to enable a configuration not loaded on the
    device
  coresight: syscfg: Match feature capabilities separately from device
    class
  coresight: syscfg: Remove unused CS_CFG_MATCH_INST_ANY
  perf: arm_pmuv3: Add pmuv3_event_implemented()
  coresight: etm4x: Report whether the PMU counts the external outputs
  coresight: Add pmu_pulse/extout_pulse

Leo Yan (1):
  coresight: etm4x: Fix event count decoding

 .../trace/coresight/coresight-config.rst      |  5 ++
 .../trace/coresight/coresight-perf.rst        | 15 ++++
 arch/arm64/include/asm/arm_pmuv3.h            | 19 ++++
 drivers/hwtracing/coresight/Makefile          |  1 +
 .../coresight/coresight-cfg-pmu-pulse.c       | 55 ++++++++++++
 .../coresight/coresight-cfg-preload.c         |  2 +
 .../coresight/coresight-cfg-preload.h         |  2 +
 .../hwtracing/coresight/coresight-config.h    | 11 ++-
 .../hwtracing/coresight/coresight-etm4x-cfg.c |  6 +-
 .../coresight/coresight-etm4x-core.c          | 39 +++++++-
 .../coresight/coresight-etm4x-sysfs.c         | 29 +++---
 drivers/hwtracing/coresight/coresight-etm4x.h |  3 +
 .../coresight/coresight-syscfg-configfs.c     |  3 +
 .../hwtracing/coresight/coresight-syscfg.c    | 90 +++++++++++--------
 include/linux/perf/arm_pmu.h                  |  1 -
 include/linux/perf/arm_pmuv3.h                |  3 +
 16 files changed, 229 insertions(+), 55 deletions(-)
 create mode 100644 drivers/hwtracing/coresight/coresight-cfg-pmu-pulse.c


base-commit: 343cfcbb3ecfdb80aa576a428cfa3b65ad783842
-- 
2.52.0



Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98F9D60A2600
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 25 Oct 2026 06:39:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wAWUCYNv;
	dkim=pass (2048-bit key, unprotected) header.d=fb.com header.i=@fb.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=XGXaBKsh
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=bJkqxGMn2HKTDsRTSDFn3PkvPWb4MSF/bbB9Hhk886Q=; b=wAWUCYNvLcG3FsBPA6V2F227g/
	dBAze+YwI+2ddgMTD6MDPSndmetsfy7JlcspZAlfoc5cW8mc57QiEBdMJCx+BiLDFGYAeQe06oO2a
	2XT58WzmXKhulhL7QKc8FvtHlZfy/dzf60GVoMUsK62YZF0lKNzNs8yZ4vhzbnY9bZ5MC01DXZqCI
	2HxsHU74RSxYg3uH0oAa2HeCZ9mROBNlbz0vd1oVy7lgLJTapCvN0o6+3sAiR3UM872fLzbh9kMeN
	SOFjL3dfM54+VQmbBy7ylOhT/uZATI9Vs+c6389IE4RhebRhVLMjNE+rb2fR1dBzrVXBunkA2AG3m
	3gtU+X1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKrtD-00000000ni5-2lJ3;
	Sun, 25 Oct 2026 06:39:31 +0000
Received: from mx0a-00082601.pphosted.com ([67.231.145.42])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKrtB-00000000ngZ-0HSu
	for linux-arm-kernel@lists.infradead.org;
	Sun, 25 Oct 2026 06:39:30 +0000
Received: from pps.filterd (m0528009.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69P4tB1o462968;
	Sat, 24 Oct 2026 23:39:15 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	pps82601-s2048-2026-q3; bh=bJkqxGMn2HKTDsRTSDFn3PkvPWb4MSF/bbB9H
	hk886Q=; b=XGXaBKshdT5R5LnHya5fuElcOxRvGUg3eg/Zj4ew2MNGMBNCeHBIZ
	z791xw78FXKdUB4EDehSSOVx3UIACxtZjY2kIq0oE+jPhJ11OMPYtfZtVBG+cCfW
	GaKttRocNMEX9KvaH4TepXeIEC8+RZcs1n3MQjhR80O/1xgr28xd9q2C7xiSHxJQ
	ygqPtJDesPDvhwrT/0ZNTaLiu6bpZe6tIodLVbjLaH63U9a9iOBAoiVmQjmuonB+
	Kavj5DDGZ3MsqNaeS3KQMv92u8QGAUEP6WeiAnq8oaCmZrk15Euu/miZ0titofSM
	n9N0CGZfI9TlKAY8PtAFwPS1jStaQwjMw==
Received: from mail.thefacebook.com ([163.114.134.16])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4hh8a48qt9-7
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Sat, 24 Oct 2026 23:39:15 -0700 (PDT)
Received: from localhost (2620:10d:c085:208::7cb7) by mail.thefacebook.com
 (2620:10d:c08b:78::c78f) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.56; Sun, 25 Oct
 2026 06:39:14 +0000
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
Subject: [PATCH v3 0/7] coresight: Pulse an ETM external output for a PMU event
Date: Sat, 24 Oct 2026 23:39:00 -0700
Message-ID: <cover.1792907332.git.aaupov@fb.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20261012230527.750567-1-aaupov@fb.com>
References: <20261012230527.750567-1-aaupov@fb.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=J9A/fwnS c=1 sm=1 tr=0 ts=6adda413 cx=c_pps
 a=CB4LiSf2rd0gKozIdrpkBw==:117 a=CB4LiSf2rd0gKozIdrpkBw==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22
 a=U_y8lYiYyhHBU5rMqhb2:22 a=VwQbUJbxAAAA:8 a=FOH2dFAWAAAA:8
 a=2BKsp6tG2N7TT4Ysv7IA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI1MDAyNiBTYWx0ZWRfX/AzDZ/QiaVKc
 VO3pGemvyji10oYQWDmX3gDqdXZjtwEoIPmFtLy9Z2PzPjNA31sNQ9Vnhk+MkF02U6VAJg1hGDb
 BKye4LxODL+BsDibcfq+hp1G1vkNpPO2a5OLRgLK3XmVrsCXx4pUDoxGrU4sAMOb739z/ZtKNhr
 O3ZOls5MgTi1omo9EUBtWzqOH0471Fp4FeD/eu1i+m8GmTpKRiGbIy+DHl51v5QQ8h1rSBIx6Sd
 017fP8AYorPeOOcfwsc4rZIaHH7vpkUGIbLgcxvz6Llp0DgzsegVf0r+p/1GzlSc8Qf1Gpt4AgN
 RbuayxEIJm0mnwcv6PKAq5bl4cYlKB0+nGNdrJGNqYfS58BMKnwW/EQvYHKWOqGQBulUllztOoa
 qfGmwXi/PsNgN+hXfG5v+isUOmS+hZ4OVG1FjFWhST35lH1m3sYozxt39TVDQdB8nqlQ5k3p4s3
 jF9nVimk3kn28uMOLHg==
X-Proofpoint-ORIG-GUID: -qSfoMRiDxQ3P1X1N5amvT2Um8AiVFa-
X-Proofpoint-GUID: -qSfoMRiDxQ3P1X1N5amvT2Um8AiVFa-
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI1MDAyNiBTYWx0ZWRfX9XDNDKo6kPTP
 gCXUYho6+s3yBsXnB8iSv+UC2jE+xNMu43uLWN/kZecVIMaI73Md9nOPnfTRrPoU4SNBcMnCYBp
 7+WKA+dQzTeX/ghMdksWF7gC+TKHp84=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-25_02,2026-10-21_02,2025-10-01_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261024_233929_112594_E1669CEB 
X-CRM114-Status: GOOD (  15.99  )
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
  coresight: syscfg: Fail to enable a configuration not loaded on the device
  coresight: syscfg: Match feature capabilities separately from device class
  coresight: syscfg: Remove unused CS_CFG_MATCH_INST_ANY
  perf: arm_pmuv3: Add pmuv3_event_implemented()
  coresight: etm4x: Report whether the PMU counts the external outputs
  coresight: Add pmu_pulse/extout_pulse

Leo Yan (1):
  coresight: etm4x: Fix event count decoding

 .../trace/coresight/coresight-config.rst      |  5 ++
 .../trace/coresight/coresight-perf.rst        | 15 ++++
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
 include/linux/perf/arm_pmuv3.h                | 22 +++++
 15 files changed, 229 insertions(+), 55 deletions(-)
 create mode 100644 drivers/hwtracing/coresight/coresight-cfg-pmu-pulse.c


base-commit: 343cfcbb3ecfdb80aa576a428cfa3b65ad783842
-- 
2.52.0



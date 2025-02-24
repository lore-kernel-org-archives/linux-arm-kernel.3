Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87FAEC021A4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Feb 2025 15:33:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=iODuqd/f9BFkU4ViTlsuH7Iqb6+MXNBtbvs5shCQdSM=; b=2QXqCd/LJ7M3Lkje5Z9eU2ey2I
	28H+xp5Rz3nVXbbfG7kFOOGxGhqxcSeHIpBBCKBtWEn82kYU9vpWm3aA2ANBCE1yjUE0skKCxQ/JQ
	ooraju4TORn9Nl1fyUXEk0qZGh9d06ioVDmb8wxfJkwjDpNnKptek6c9JxZUGZVv/oWYRBKPYx5yf
	Ji9RIUhW1AK0Mm7VLTgWLbj2f94iGPgRn1ZTDh/SkzrGsydXEhuvAkCfr1te4nGyf9l7qRfifx8gb
	sLR1T9hyu+YPliWLrxSAHNK1FR7qIOS6vsKu9L/RhYU1e9ts9SrXB8+UJbQ3zD5s9msfkaJGaK+Rn
	HFk+qD1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmaRt-0000000EIB0-0yNQ;
	Mon, 24 Feb 2025 15:32:49 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmaAe-0000000EFHV-0GVJ
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 24 Feb 2025 15:15:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=iODuqd/f9BFkU4ViTlsuH7Iqb6+MXNBtbvs5shCQdSM=; b=gvewFHePqXSEVrQDEPoRfWF6IH
	y0XsKdzsezzHtditnCSLLJayTHfHn7ucRTe2BoILJvQzMQQuRu8EAeSxlbEnBu9Q0yTtEWQEyhepj
	AQQLazKHkUEpe9/9L9nMMR6uuxVash6nFjnGFZO6WEH4r/CkM1SUTwkU7BwJxLHkdfTJ5U6miCBc4
	dcRhUhmCCN1m/EnCRMtEqF3/K/mjGUBcdglb9jVjaTzLZXn9rIiEeqH+fpVmnhZvfCkAbbvqJauN5
	vQZKL4/0eAj5G4WtUbgORZNFNFofUv1BXO6P4MDhz0ZTxIAUtl0ozuX5N2/R6BdpAH0wDha8Olfja
	14ILo9Kg==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmaAa-00000003DYK-3xZy
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Feb 2025 15:14:58 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F1906152B;
	Mon, 24 Feb 2025 07:14:59 -0800 (PST)
Received: from e132581.cambridge.arm.com (e132581.arm.com [10.2.76.71])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 857503F6A8;
	Mon, 24 Feb 2025 07:14:41 -0800 (PST)
From: Leo Yan <leo.yan@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Namhyung Kim <namhyung@kernel.org>,
	Arnaldo Carvalho de Melo <acme@redhat.com>,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Leo Yan <leo.yan@arm.com>
Subject: [PATCH v1 0/8] Arm CoreSight: Support AUX pause and resume
Date: Mon, 24 Feb 2025 15:14:15 +0000
Message-Id: <20250224151423.1630639-1-leo.yan@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_151457_269329_AF6EF93F 
X-CRM114-Status: GOOD (  11.39  )
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

This series is to enable AUX pause and resume on Arm CoreSight.

The first patch extracts the trace unit controlling operations to two
functions.  These two functions will be used by AUX pause and resume.

Patches 02 and 03 change the ETMv4 driver to prepare callback functions
for AUX pause and resume.

Patch 04 changes the ETM perf layer to support AUX pause and resume in a
perf session.  The patches 05 and 06 offers an extra feature for
updating buffer on AUX pause occasion, which can mitigate the trace data
lose issue.

Patch 07 documents the AUX pause usages with Arm CoreSight.  The last
patch syncs headers between user space and the kernel.

This patch set has been verified on the Hikey960 board and TC platform.
The previous one uses ETR and the later uses TRBE as sink.

It is suggested to disable CPUIdle (add `nohlt` option in Linux command
line) when verifying this series.  ETM and funnel drivers are found
issues during CPU suspend and resume which will be addressed separately.


Leo Yan (8):
  coresight: etm4x: Extract the trace unit controlling
  coresight: Introduce pause and resume APIs for source
  coresight: etm4x: Hook pause and resume callbacks
  coresight: perf: Support AUX trace pause and resume
  coresight: etm: Add an attribute for updating buffer
  coresight: perf: Update buffer on AUX pause
  Documentation: coresight: Document AUX pause and resume
  perf cs-etm: Sync kernel coresight-pmu.h header

 .../trace/coresight/coresight-perf.rst        |  50 ++++++
 drivers/hwtracing/coresight/coresight-core.c  |  12 ++
 .../hwtracing/coresight/coresight-etm-perf.c  |  94 +++++++++-
 .../hwtracing/coresight/coresight-etm-perf.h  |   2 +
 .../coresight/coresight-etm4x-core.c          | 166 ++++++++++++------
 drivers/hwtracing/coresight/coresight-etm4x.h |   2 +
 drivers/hwtracing/coresight/coresight-priv.h  |   2 +
 include/linux/coresight-pmu.h                 |   1 +
 include/linux/coresight.h                     |   4 +
 tools/include/linux/coresight-pmu.h           |   1 +
 10 files changed, 281 insertions(+), 53 deletions(-)

-- 
2.34.1



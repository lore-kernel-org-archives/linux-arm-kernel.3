Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9D74C021A4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 16:41:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Date:Subject:Cc:To:From:Message-ID:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4elqHb9iSCoJx1TP7SHQuAGSp14JnKwx+dF2NU3w8co=; b=HfpqeY7LDHbbojT+z4XKxNgUpC
	xzFpFbZ/Ac4rFti2Tdh0owQVpcKXGcX4o6F7CkbqzLJeHs7tK4vBoIBZ0dLemTBYOOOh/5P0OfsQG
	wVYLf2JB+L6LYj11Hgvw2gLsAl4OACBzW3ZWTddZzBPBtgvvuA8keJHGY6P4bQqNLOzjOxMhOnppg
	p4kCMTlPKCSD3ox3RT7mkTI3BQ62CYrtXrcpudTY673Lt/+w9VJo41/0gGWBPEpdWRhLMGogdPFPy
	NAXqKK5gIYItvidYfGzSi8poJWX6VkA8O4owMRFS3RKQrYCqnv2lIXGcTstavnWX8ofon0MVQwSDo
	7azws/yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ticGr-0000000BoTH-0HsW;
	Thu, 13 Feb 2025 16:41:01 +0000
Received: from out162-62-57-210.mail.qq.com ([162.62.57.210])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiasQ-0000000BU90-3MDn
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Feb 2025 15:11:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1739459497; bh=4elqHb9iSCoJx1TP7SHQuAGSp14JnKwx+dF2NU3w8co=;
	h=From:To:Cc:Subject:Date;
	b=wbqWAY1sFmhcdJtWYf2htssSE/N46E8XqWGPIAZ7AmmwIfM977uPWabAdo+js1dbj
	 RVBYPdxWgrn6B4Tmvn4/08wPTrvPoORDiDaAJzGfnjMKve201Rt4WW76f4Xl89hTQz
	 BPnPEl3GKiw2H7xSQ4HhQoMT0bXWZAPty37z+qQs=
Received: from cyy-pc.lan ([240e:379:2251:3600:f57b:26f9:9718:486c])
	by newxmesmtplogicsvrszc11-0.qq.com (NewEsmtp) with SMTP
	id 2CB36647; Thu, 13 Feb 2025 23:11:11 +0800
X-QQ-mid: xmsmtpt1739459471t74z68yp3
Message-ID: <tencent_5360DA048EE5B8CF3104213F8D037C698208@qq.com>
X-QQ-XMAILINFO: NssJ/YX50roa03kn8l6aANiOT4FVy7HIrcyHzV6EHxPrV4028EaBSbBdbE9v/S
	 uswOi6tq88MyI7hKp5xp89/LJoa29iBHePzM5FdE9193G1OyTMeAQoIGhXMN4HA4mkqTWWyjnP+F
	 4kCnnar5CZBfHNBy4po90hUxq7bmChnUshK4J9kNbr/FEllC7hkSWGUo+GXwLpmKT9CGYIOt2MZK
	 2uOdmd1BdEBdT8EVPyk3D1YH33tlyo054vKn0LhvLkuEGgUYOw89sqQze7mwkmBcw6Zstpdgf2tW
	 7Avnvoc++vMRNe9iBye4x36Oyh2JoDzWtVXBYLSyp5kbVmrR6TBDII2DNqfclAIkLYx20hkmPCNq
	 LBhIHF3D9CL7vifdmuehd6WvZsOaikR47Z/ChtbO9H/ZVp4LPkzt4WZpgCYl7UhmxWSjFbl3JtWP
	 7emjDsSzS5MzW63C2Jfjwz2v/VJkag88U6hwx5ZUcNhqjfHniyv0Y8NGPfmWfN1nsZ6FNLVWmt1R
	 TSWAvW71E/zvqtQ0XpkcJVgFQNSe0os1XKG0tUdqAfGfJcdRqCRgufBmbUvE4oqYjy2B6tJDG6zW
	 8w+q54MKoNQB2SvMb9w/q3dVlDVvUROmxYIBvCFzEqB4gM7NE5AgVyBeRV1CaXSvpeOAs8GaSHIq
	 LcVurJU8g/NPJawA4+C0eUksMIX8RoyG8cWJ1YusOioEnHogBcPXo8sP3q7VxfBCx2vwTftRSrGU
	 iKq/tnHdpvNveKEVvbF/lwISJT7NK67Qcq8j7ungG+ejV6eFg2qQylhqEuQZd8zJ3n0CvlnkC0Lk
	 G1qrH4B8m42VyEhLgD3DQGutZqWIbIKpMLy44whsDkPrORX2oU7AczhIQy4iXNJoDH/fK0RTbTGn
	 Q1brjCAnnChSTmWiRrHVYyl1ensnArbkdy6JZwNl5HL9er8IeFZHz+k9jfPibOPoYtiDrfvuIVHN
	 gA0Hink6KsPjC91jHszc5iiFt1IBLynm3g3u+p8gtshVLc+q7UIifDReSUwpC1SnpkZ0+dtubSs9
	 EWoFPUjA==
X-QQ-XMRINFO: NyFYKkN4Ny6FSmKK/uo/jdU=
From: Yangyu Chen <cyy@cyyself.name>
To: linux-perf-users@vger.kernel.org
Cc: John Garry <john.g.garry@oracle.com>,
	Will Deacon <will@kernel.org>,
	James Clark <james.clark@linaro.org>,
	Mike Leach <mike.leach@linaro.org>,
	Leo Yan <leo.yan@linux.dev>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Liang Kan <kan.liang@linux.intel.com>,
	Yoshihiro Furudera <fj5100bi@fujitsu.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Yangyu Chen <cyy@cyyself.name>
Subject: [PATCH 0/2] perf vendor events arm64: Add A720/A520 events/metrics
Date: Thu, 13 Feb 2025 23:11:01 +0800
X-OQ-MSGID: <20250213151101.186593-1-cyy@cyyself.name>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_071143_420026_3990D4FB 
X-CRM114-Status: UNSURE (   9.93  )
X-CRM114-Notice: Please train this message.
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

This patchset adds the perf JSON files for the Cortex-A720 and Cortex-A520
processors. Some events have been tested on Raxda Orion 6 with Cix P1 SoC
(8xA720 + 4xA520) running mainline Kernel with ACPI mode.

Yangyu Chen (2):
  perf vendor events arm64: Add Cortex-A720 events/metrics
  perf vendor events arm64: Add Cortex-A520 events/metrics

 .../arch/arm64/arm/cortex-a520/bus.json       |  26 ++
 .../arch/arm64/arm/cortex-a520/exception.json |  18 +
 .../arm64/arm/cortex-a520/fp_operation.json   |  14 +
 .../arch/arm64/arm/cortex-a520/general.json   |   6 +
 .../arch/arm64/arm/cortex-a520/l1d_cache.json |  50 ++
 .../arch/arm64/arm/cortex-a520/l1i_cache.json |  14 +
 .../arch/arm64/arm/cortex-a520/l2_cache.json  |  46 ++
 .../arch/arm64/arm/cortex-a520/l3_cache.json  |  21 +
 .../arch/arm64/arm/cortex-a520/ll_cache.json  |  10 +
 .../arch/arm64/arm/cortex-a520/memory.json    |  58 +++
 .../arch/arm64/arm/cortex-a520/metrics.json   | 373 +++++++++++++++
 .../arch/arm64/arm/cortex-a520/pmu.json       |   8 +
 .../arch/arm64/arm/cortex-a520/retired.json   |  90 ++++
 .../arm64/arm/cortex-a520/spec_operation.json |  70 +++
 .../arch/arm64/arm/cortex-a520/stall.json     |  82 ++++
 .../arch/arm64/arm/cortex-a520/sve.json       |  22 +
 .../arch/arm64/arm/cortex-a520/tlb.json       |  78 ++++
 .../arch/arm64/arm/cortex-a520/trace.json     |  32 ++
 .../arch/arm64/arm/cortex-a720/bus.json       |  18 +
 .../arch/arm64/arm/cortex-a720/exception.json |  62 +++
 .../arm64/arm/cortex-a720/fp_operation.json   |  22 +
 .../arch/arm64/arm/cortex-a720/general.json   |  10 +
 .../arch/arm64/arm/cortex-a720/l1d_cache.json |  50 ++
 .../arch/arm64/arm/cortex-a720/l1i_cache.json |  14 +
 .../arch/arm64/arm/cortex-a720/l2_cache.json  |  62 +++
 .../arch/arm64/arm/cortex-a720/l3_cache.json  |  22 +
 .../arch/arm64/arm/cortex-a720/ll_cache.json  |  10 +
 .../arch/arm64/arm/cortex-a720/memory.json    |  54 +++
 .../arch/arm64/arm/cortex-a720/metrics.json   | 436 ++++++++++++++++++
 .../arch/arm64/arm/cortex-a720/pmu.json       |   8 +
 .../arch/arm64/arm/cortex-a720/retired.json   |  90 ++++
 .../arch/arm64/arm/cortex-a720/spe.json       |  42 ++
 .../arm64/arm/cortex-a720/spec_operation.json |  90 ++++
 .../arch/arm64/arm/cortex-a720/stall.json     |  82 ++++
 .../arch/arm64/arm/cortex-a720/sve.json       |  50 ++
 .../arch/arm64/arm/cortex-a720/tlb.json       |  74 +++
 .../arch/arm64/arm/cortex-a720/trace.json     |  32 ++
 .../arch/arm64/common-and-microarch.json      |  15 +
 tools/perf/pmu-events/arch/arm64/mapfile.csv  |   2 +
 39 files changed, 2263 insertions(+)
 create mode 100644 tools/perf/pmu-events/arch/arm64/arm/cortex-a520/bus.json
 create mode 100644 tools/perf/pmu-events/arch/arm64/arm/cortex-a520/exception.json
 create mode 100644 tools/perf/pmu-events/arch/arm64/arm/cortex-a520/fp_operation.json
 create mode 100644 tools/perf/pmu-events/arch/arm64/arm/cortex-a520/general.json
 create mode 100644 tools/perf/pmu-events/arch/arm64/arm/cortex-a520/l1d_cache.json
 create mode 100644 tools/perf/pmu-events/arch/arm64/arm/cortex-a520/l1i_cache.json
 create mode 100644 tools/perf/pmu-events/arch/arm64/arm/cortex-a520/l2_cache.json
 create mode 100644 tools/perf/pmu-events/arch/arm64/arm/cortex-a520/l3_cache.json
 create mode 100644 tools/perf/pmu-events/arch/arm64/arm/cortex-a520/ll_cache.json
 create mode 100644 tools/perf/pmu-events/arch/arm64/arm/cortex-a520/memory.json
 create mode 100644 tools/perf/pmu-events/arch/arm64/arm/cortex-a520/metrics.json
 create mode 100644 tools/perf/pmu-events/arch/arm64/arm/cortex-a520/pmu.json
 create mode 100644 tools/perf/pmu-events/arch/arm64/arm/cortex-a520/retired.json
 create mode 100644 tools/perf/pmu-events/arch/arm64/arm/cortex-a520/spec_operation.json
 create mode 100644 tools/perf/pmu-events/arch/arm64/arm/cortex-a520/stall.json
 create mode 100644 tools/perf/pmu-events/arch/arm64/arm/cortex-a520/sve.json
 create mode 100644 tools/perf/pmu-events/arch/arm64/arm/cortex-a520/tlb.json
 create mode 100644 tools/perf/pmu-events/arch/arm64/arm/cortex-a520/trace.json
 create mode 100644 tools/perf/pmu-events/arch/arm64/arm/cortex-a720/bus.json
 create mode 100644 tools/perf/pmu-events/arch/arm64/arm/cortex-a720/exception.json
 create mode 100644 tools/perf/pmu-events/arch/arm64/arm/cortex-a720/fp_operation.json
 create mode 100644 tools/perf/pmu-events/arch/arm64/arm/cortex-a720/general.json
 create mode 100644 tools/perf/pmu-events/arch/arm64/arm/cortex-a720/l1d_cache.json
 create mode 100644 tools/perf/pmu-events/arch/arm64/arm/cortex-a720/l1i_cache.json
 create mode 100644 tools/perf/pmu-events/arch/arm64/arm/cortex-a720/l2_cache.json
 create mode 100644 tools/perf/pmu-events/arch/arm64/arm/cortex-a720/l3_cache.json
 create mode 100644 tools/perf/pmu-events/arch/arm64/arm/cortex-a720/ll_cache.json
 create mode 100644 tools/perf/pmu-events/arch/arm64/arm/cortex-a720/memory.json
 create mode 100644 tools/perf/pmu-events/arch/arm64/arm/cortex-a720/metrics.json
 create mode 100644 tools/perf/pmu-events/arch/arm64/arm/cortex-a720/pmu.json
 create mode 100644 tools/perf/pmu-events/arch/arm64/arm/cortex-a720/retired.json
 create mode 100644 tools/perf/pmu-events/arch/arm64/arm/cortex-a720/spe.json
 create mode 100644 tools/perf/pmu-events/arch/arm64/arm/cortex-a720/spec_operation.json
 create mode 100644 tools/perf/pmu-events/arch/arm64/arm/cortex-a720/stall.json
 create mode 100644 tools/perf/pmu-events/arch/arm64/arm/cortex-a720/sve.json
 create mode 100644 tools/perf/pmu-events/arch/arm64/arm/cortex-a720/tlb.json
 create mode 100644 tools/perf/pmu-events/arch/arm64/arm/cortex-a720/trace.json

-- 
2.47.2



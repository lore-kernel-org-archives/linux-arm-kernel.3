Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E080CD8CA8
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Jun 2026 01:34:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Kz05lYEyjFjnktT+6S1us+ltCO2TiGsdkOtvqOdZl1g=; b=LOShSaRaBXYrvL5mGNcQxdiuwv
	808FgCs7i9vhUzySp3luGmvvUNyLB942/p872nbvXpDG+wvOm512Pp6AzC4VE8pVqxNSb71kTPFKW
	eQep2YxmMAnOsCyQ8Q64iMtFyqUyYmzt6oBoSnikW93RwzC1uRdDtwVwlUBm2TdHFLqOzUUxPU67t
	Q+F/DPes0KIW6TVpb5JX7ahluH2xIXK5DhZQDVRlzfKWhtwoQx70HUL28qZI83aaNqpWkro5hSFyx
	1BUBGqOxkNf26ccaDZ+UWmUGmTRARoamC9wuy7FJjQWInOe/K46kvDZCQY0JePrSTPojHg8PzrwbN
	cjXq27Zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYwDv-0000000DRc2-3iiA;
	Mon, 15 Jun 2026 01:34:47 +0000
Received: from mgamail.intel.com ([198.175.65.15])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYwDs-0000000DRYl-22vm;
	Mon, 15 Jun 2026 01:34:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781487284; x=1813023284;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=MpYEDOHdbTAI71oTaLKeSfNxXMHemeREX88StmVjphs=;
  b=Cg70LO2Fv/tNvS77fQxaoH1qr9yqcsu+L0ynSnnJ3JVwD8AZvsutU15M
   7jy5BPSsE96TAN5Gk/pydb7ZYBWv+G8nhjloDR6CbKIdRAIEoGjyGn1+o
   5LCzXaccG1bXxoUVYAxGy4XyOsL4/4MVkBcSyhPJQ5gTFB7u2pkyz06X6
   A3ZJpNP4jbQq7NACHEprVMF8uSozBGxvfydkJ7gjr8xZXj4UfRz5JoBLO
   mQgtERNg+71FVpjISfgWywV+9/mncglfRhdaFegB3dedaqcXNo7QFG0Vd
   b+BN+sKgMQjpNObRqeZ+h9vci/N+m1f4vVbB2y55E0IwIMKGy+jA7l0Y2
   g==;
X-CSE-ConnectionGUID: TWxxtG5rRIGWNgsZwKgYnA==
X-CSE-MsgGUID: 0YWaGX2wTGi4R8hMdVFyOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11817"; a="85856949"
X-IronPort-AV: E=Sophos;i="6.24,205,1774335600"; 
   d="scan'208";a="85856949"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2026 18:32:43 -0700
X-CSE-ConnectionGUID: Unr3KdDWQH+p0wyNepRQzw==
X-CSE-MsgGUID: xGxiuwS+QnWQXTNPauITRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,205,1774335600"; 
   d="scan'208";a="271411996"
Received: from dapengmi-mobl1.ccr.corp.intel.com (HELO [10.124.241.147]) ([10.124.241.147])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2026 18:32:39 -0700
Message-ID: <0b6d58d5-f802-47dc-ae71-31c45184b738@linux.intel.com>
Date: Mon, 15 Jun 2026 09:32:36 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 0/6] perf vendor events intel: update
To: Chun-Tse Shao <ctshao@google.com>, peterz@infradead.org,
 mingo@redhat.com, acme@kernel.org, namhyung@kernel.org
Cc: alexander.shishkin@linux.intel.com, jolsa@kernel.org, irogers@google.com,
 adrian.hunter@intel.com, james.clark@linaro.org, afaerber@suse.de,
 mani@kernel.org, linux-perf-users@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-actions@lists.infradead.org
References: <20260609215046.2391903-1-ctshao@google.com>
Content-Language: en-US
From: "Mi, Dapeng" <dapeng1.mi@linux.intel.com>
In-Reply-To: <20260609215046.2391903-1-ctshao@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260614_183444_570066_EC8C1440 
X-CRM114-Status: UNSURE (   8.58  )
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

LGTM. Thanks.

Reviewed-by: Dapeng Mi <dapeng1.mi@linux.intel.com>

On 6/10/2026 5:50 AM, Chun-Tse Shao wrote:
> Sync with the latest perfmon events from:
> https://github.com/intel/perfmon
> by running the script:
> https://github.com/intel/perfmon/blob/main/scripts/create_perf_json.py
> and copying the resulting json and mapfile.csv changes into the perf
> tree.
>
> Chun-Tse Shao (6):
>   perf vendor events intel: Update arrowlake events from 1.17 to 1.19
>   perf vendor events intel: Update emeraldrapids events from 1.23 to
>     1.24
>   perf vendor events intel: Update graniterapids events from 1.18 to
>     1.19
>   perf vendor events intel: Update lunarlake events from 1.22 to 1.25
>   perf vendor events intel: Update pantherlake events from 1.05 to 1.06
>   perf vendor events intel: Update tigerlake events from 1.18 to 1.19
>
>  .../pmu-events/arch/x86/arrowlake/cache.json  |  30 ++-
>  .../arch/x86/arrowlake/floating-point.json    |  45 ++++
>  .../pmu-events/arch/x86/arrowlake/memory.json |  18 ++
>  .../arch/x86/arrowlake/pipeline.json          | 129 +++++++++-
>  .../arch/x86/emeraldrapids/cache.json         |   9 +
>  .../graniterapids/uncore-interconnect.json    |  10 +
>  .../arch/x86/graniterapids/uncore-memory.json |   2 +-
>  .../pmu-events/arch/x86/lunarlake/cache.json  |   2 +-
>  .../arch/x86/lunarlake/pipeline.json          |  27 ++-
>  .../arch/x86/lunarlake/uncore-memory.json     | 208 ++++++++++++++++-
>  tools/perf/pmu-events/arch/x86/mapfile.csv    |  12 +-
>  .../arch/x86/pantherlake/counter.json         |   5 +
>  .../arch/x86/pantherlake/pipeline.json        |  29 ++-
>  .../x86/pantherlake/uncore-interconnect.json  |  10 +
>  .../arch/x86/pantherlake/uncore-memory.json   | 221 +++++++++++++++++-
>  15 files changed, 728 insertions(+), 29 deletions(-)
>  create mode 100644 tools/perf/pmu-events/arch/x86/pantherlake/uncore-interconnect.json
>


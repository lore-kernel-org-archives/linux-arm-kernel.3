Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 756DDCCD195
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Oct 2025 08:13:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U5zi6XGTiyzWx/yIbRbfvsWsk1IHESApi+OEtvsXKQU=; b=PpY/JY+rRTHNyz0zZIs5JopQon
	6PeR/97Rb7a+8Fqx+i2E1s0JebIQYkp+tGpci50HZpN3utCL6mPoksCYn8XdEcxaUrWraEDRspNBW
	YDhvxJPHUBIyFC9Vvn5woJMWRCCFukLBH/n2OFqWdYRJn6Wj7Gy/Bnmwwo+wB3uuorcJFkkZGT1W4
	S7q9dZBAncShs5xi4pcaGuZejFRQ1TrvTYuIAA8EXDA/hGjVpCR1oJo94Kif/zzYE8iHr2O+PPiBM
	Z3VMuFXamGM8MGMIoeULztsvqVHCJwE4/eM0Ftl9aIxaQaSL9WuHxUSuhctHfUeec/I4aXLuwNlmK
	3P7fnbSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBTxo-000000022Ac-19yL;
	Wed, 22 Oct 2025 08:12:56 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBTxk-00000002299-1vYw
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Oct 2025 08:12:54 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 296FE1063;
	Wed, 22 Oct 2025 01:12:42 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 91F4F3F63F;
	Wed, 22 Oct 2025 01:12:49 -0700 (PDT)
Date: Wed, 22 Oct 2025 09:12:47 +0100
From: Leo Yan <leo.yan@arm.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Adrian Hunter <adrian.hunter@intel.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Ian Rogers <irogers@google.com>, Ingo Molnar <mingo@redhat.com>,
	James Clark <james.clark@linaro.org>, Jiri Olsa <jolsa@kernel.org>,
	John Garry <john.g.garry@oracle.com>, Leo Yan <leo.yan@linux.dev>,
	Mark Rutland <mark.rutland@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org
Subject: Re: [resend][PATCH] tools: arm64: Add Cortex-A720AE definitions
Message-ID: <20251022081247.GP281971@e132581.arm.com>
References: <877bwnyh6f.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <877bwnyh6f.wl-kuninori.morimoto.gx@renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_011252_700269_EC7A8309 
X-CRM114-Status: GOOD (  10.62  )
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

On Tue, Oct 21, 2025 at 11:21:48PM +0000, Kuninori Morimoto wrote:
> Add cputype definitions for Cortex-A720AE. These will be used for errata
> detection in subsequent patches.
> 
> These values can be found in the Cortex-A720AE TRM:
> 
> https://developer.arm.com/documentation/102828/0001/
> 
> ... in Table A-187
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> Acked-by: Will Deacon <will@kernel.org>

Reviewed-by: Leo Yan <leo.yan@arm.com>


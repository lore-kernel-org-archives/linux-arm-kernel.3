Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E0EFCA0FFB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Aug 2025 08:36:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rp5IIDunp5jowS6H1DRoYFOpFuu3PLQvXyNRGZpnkIs=; b=HuuTbW9Oqp8ztZ/z0uoLAlYgfI
	Vjl801pWUG9TMNXqq7/Kabh12mnaQNuZY/6x7ATjTMwnop3GPB0wLLxtsKdVCcHCb7r2TqyVdEknK
	niOU0xmLEVluWHC2HQbVYQSPHZ0NkVl0pD50WpG/UnFBfHRvtSiPvC4nVm2rF6wGj1M4dwMh+5ALw
	cKuhiLFH21Vhmg85QNOKlgmwgPT2GuHoJkbW69J7cOucyKpCRjJEPlO8xfA+evw3FAAfrgB8MlTa/
	fO2Mr0Z7/7bixgIyoV5ukLw3Ub3GvKXxbnhlvCO3xySO01pWy8T7RKLlyFEFBYo9i9VQuODtgN06C
	CTSU4Utw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urBdP-0000000Egpc-0XMg;
	Wed, 27 Aug 2025 08:35:59 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urBH5-0000000EcCd-2NgV
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Aug 2025 08:12:56 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9D7381691;
	Wed, 27 Aug 2025 01:12:46 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8316E3F694;
	Wed, 27 Aug 2025 01:12:54 -0700 (PDT)
Date: Wed, 27 Aug 2025 09:12:52 +0100
From: Leo Yan <leo.yan@arm.com>
To: Namhyung Kim <namhyung@kernel.org>
Cc: Arnaldo Carvalho de Melo <acme@kernel.org>,
	Ian Rogers <irogers@google.com>, Jiri Olsa <jolsa@kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@kernel.org>, LKML <linux-kernel@vger.kernel.org>,
	linux-perf-users@vger.kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 05/11] tools headers: Sync arm64 headers with the kernel
 source
Message-ID: <20250827081252.GD745921@e132581.arm.com>
References: <20250825215904.2594216-1-namhyung@kernel.org>
 <20250825215904.2594216-6-namhyung@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250825215904.2594216-6-namhyung@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250827_011255_649671_D85346AF 
X-CRM114-Status: GOOD (  14.19  )
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

On Mon, Aug 25, 2025 at 02:58:57PM -0700, Namhyung Kim wrote:

[...]

> But the following two changes cannot be applied since they introduced
> new build errors in util/arm-spe.c.  So it still has the warning after
> this change.
> 
>   c8c2647e69bedf80 arm64: Make  _midr_in_range_list() an exported function
>   e3121298c7fcaf48 arm64: Modify _midr_range() functions to read MIDR/REVIDR internally

Hi Namhyung,

Thanks for working on this. It is on our todo list for automatic
generating MIDR. Sorry for any troubling during the syncing.

Just a minor comment below.

[...]

> +struct target_impl_cpu {
> +	u64 midr;
> +	u64 revidr;
> +	u64 aidr;
> +};
> +
> +bool cpu_errata_set_target_impl(u64 num, void *impl_cpus);
> +

Currently, no one uses this API. It seems to me that we don't need to
sync this code chunk.

Otherwise, other changes LGTM.

Thanks,
Leo


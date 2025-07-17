Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEEF9C83F34
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Jul 2025 16:06:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I4T2ihdXgHR6g6u1BX7sOJqglqe4PqM2KMli6OwkVns=; b=xMd2362UvqEZ/hdmdvZcb3mXds
	BF1MmTwksC19uIjVhd5/x32aG4t+QHKXuxq4g5IXijs9hx/pgbwyBW070UZ/6dQsJkXXO8UQqYsKS
	EXYJf2Cg7aFaIuOzteMYEC196NCINwbQIJW4gjaY6O9eggLIBLNsIAaB1+aoekD0evPkInQtqoqNH
	fhQvr30kHQyD7vPlQzAExyvcv1gI6dkLpDhtb3HMSQ3TKqVykN3zZhQTe94SdzxzZOJXS786ubpOA
	nEDe6gqzfuJDPzmV+MvK5OoenQNWSRCchT++2F+Bl0vCmmm16E/eACnYUebWJgy9fv4oUWbJqRaOY
	lQYPrsqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucR7y-0000000AaCe-1tPZ;
	Thu, 17 Jul 2025 16:06:34 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucQW3-0000000AVIU-39Qt
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 17 Jul 2025 15:27:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=I4T2ihdXgHR6g6u1BX7sOJqglqe4PqM2KMli6OwkVns=; b=c9Nqap6e/CCxpBtMDsLlF7su4c
	dvJP8qvRNKmGuhCvhWoo9jciC9aUucQYLRByBAkXk7ZmclzFIOKsORhdPgye7BUSSpzIeo7m0DS3s
	Xa0hh2WwPNF8nYGbVR6/UHT5UhYW4Y1QsgRwLWWdbSYQ7FnkvFXmu9s6fDx8p3mpi7QClRcbc1/q8
	DM/ZytEq3BSgd6JgnKMHB97YeRDk33NgY9iEsjg8u6xWF20ufnaUThiiJcBDYtIlA6bbd4SG5DQ6N
	YYGOJARMZCm1QkxHjzeJAWyoAp/S9zfCM2lFTMxYDnwuWVHwUUeAb7c/w3NnjrxaDwfN4BwjRJ6G1
	VlxCsLuQ==;
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucQW0-0000000AIuh-158R
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Jul 2025 15:27:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8C3B846199;
	Thu, 17 Jul 2025 15:27:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B64C4C4CEE3;
	Thu, 17 Jul 2025 15:27:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752766037;
	bh=4yydri2iXJ+vkt3rGzpbKbnKbfLngsgnmN/hlvqV+sM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Jkc2HIzlh/f85sSERCDk6FnHc0o7b/fmOkjr6/ic6/EdFaEA6woHqSEIO4UapszO3
	 e44POPFs96UF2owJnF1avPhvQuRZb5ouwef1zHHAjIy52Oz0BirO81qvr+Eh2YT8b6
	 8B8xIrTOYVNMboxBpbEH4wB1OHUbsvjAVNYlwhxBEM/r8CJNP34/vxr9JgvjPrkoca
	 9gDVTA8RV8ohYM5nBBQ4rKUGFvm1jVOwuhO4KfdUicfQSuM29KK4mSro9vBNXeCaXu
	 5/ZyE4QwYAq1ZyS+4u2iCDD0/ofDKmH9rlEu+Yb7H+ZnnDzW+otjrPKMmLW+4mE4YC
	 FCYvQo3eJAbIA==
Date: Thu, 17 Jul 2025 16:27:10 +0100
From: Will Deacon <will@kernel.org>
To: James Clark <james.clark@linaro.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>, leo.yan@arm.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org, linux-doc@vger.kernel.org,
	kvmarm@lists.linux.dev
Subject: Re: [PATCH v3 07/10] perf: arm_spe: Add support for filtering on
 data source
Message-ID: <aHkWTlaRKdXbnA0r@willie-the-truck>
References: <20250605-james-perf-feat_spe_eft-v3-0-71b0c9f98093@linaro.org>
 <20250605-james-perf-feat_spe_eft-v3-7-71b0c9f98093@linaro.org>
 <aHUOig-kaRo15ZH5@willie-the-truck>
 <7f51d4f9-7e08-49b5-ab43-8bc765bb2ca8@linaro.org>
 <aHkI5_IOV35L4YJa@willie-the-truck>
 <ca99af3b-e358-4c2b-8d62-0b6c29984391@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ca99af3b-e358-4c2b-8d62-0b6c29984391@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_162720_713908_209A72F7 
X-CRM114-Status: GOOD (  41.47  )
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

On Thu, Jul 17, 2025 at 04:16:32PM +0100, James Clark wrote:
> 
> 
> On 17/07/2025 3:29 pm, Will Deacon wrote:
> > On Tue, Jul 15, 2025 at 02:04:18PM +0100, James Clark wrote:
> > > On 14/07/2025 3:04 pm, Will Deacon wrote:
> > > > On Thu, Jun 05, 2025 at 11:49:05AM +0100, James Clark wrote:
> > > > > @@ -406,6 +416,9 @@ static u64 arm_spe_event_to_pmsfcr(struct perf_event *event)
> > > > >    	if (ATTR_CFG_GET_FLD(attr, inv_event_filter))
> > > > >    		reg |= PMSFCR_EL1_FnE;
> > > > > +	if (ATTR_CFG_GET_FLD(attr, data_src_filter))
> > > > > +		reg |= PMSFCR_EL1_FDS;
> > > > 
> > > > Is the polarity correct here? The description of PMSDSFR_EL1.S<m> suggests
> > > > that setting bits to 1 _excludes_ the FDS filtering.
> > > > 
> > > 
> > > Setting filter bits to 1 means that samples matching are included. Setting
> > > bits to 0 means that they are excluded. And PMSFCR_EL1.FDS enables filtering
> > > as a whole, so if the user sets any filter bit to 1 we want to enable
> > > filtering:
> > > 
> > >    PMSDSFR_EL1.S<m>
> > > 
> > >    0b0  If PMSFCR_EL1.FDS is 1, do not record load operations that have
> > >         bits [5:0] of the Data Source packet set to <m>.
> > > 
> > >    0b1  Load operations with Data Source <m> are unaffected by
> > >         PMSFCR_EL1.FDS.
> > > 
> > > I think it's all the right way around and it ends up being the same as the
> > > other filters in SPE. Because we're using any bit being set to enable the
> > > filtering, the only thing you can't do is enable filtering with a 0 filter,
> > > but I didn't think that was useful. See the previous discussion on this
> > > here:
> > > https://lore.kernel.org/all/5752f039-51c1-4452-b5df-03ff06da7be3@linaro.org/
> > > 
> > > Reading the "Data source filtering" section in the docs change at the end
> > > might help too.
> > 
> > Sorry, but I still don't get it :/
> > 
> > afaict, if any of the bits in 'data_src_filter' are _zero_ then we
> > should set PMSFCR_EL1.FDS. That also means that a mask of zero means all
> > loads are filtered, which is what the architecture says and is what we
> > should provide to userspace.
> > 
> > Will
> 
> We'd have to add another format flag to enable data source filtering then,
> because otherwise the default would be zero and people's samples would
> disappear.
> 
> But the only use cases I could think of were more like "I want to see
> samples from data source 1":
> 
>   -e arm_spe/data_src_filter=0x1/
> 
> Or "I want to see all data sources except 1":
> 
>   -e arm_spe/data_src_filter=0xfffffffe/
> 
> Filtering out all samples with any data source didn't seem to make sense to
> me, and I think you can already do that with the other filters (remove loads
> etc).
> 
> It would be a shame to be inconsistent and to add an enable flag just for
> that one case because the other filters in SPE are auto enabled for non-zero
> values. Although to be fair for PMSFCR.FT and others, zero filters are
> explicitly not allowed:
> 
>   If this field is set to 1 and the PMSFCR_EL1.{ST, LD, B} bits are all
>   set to zero, it is CONSTRAINED UNPREDICTABLE whether no samples are
>   recorded or the PE behaves as if PMSFCR_EL1.FT is set to 0
> 
> Seems like FDS doesn't end up as neat as the others, but IMO I can't see
> anyone needing a zero filter. I did discuss it with Leo and we decided that
> we could always add the enable flag at a later date if a use case turned up
> and it wouldn't be a breaking change.
> 
> But if you think it's there so it should be exposed I can add it.

What about if we expose the inverse of PMSDSFR_EL1 to userspace instead?

Will


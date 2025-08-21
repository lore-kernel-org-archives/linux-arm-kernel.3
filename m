Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF1DFCA0EEB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Aug 2025 16:08:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dPzxzV+vkQPkwLKmwxrvaBEndCZjLJ4Zs2qDFjSq5Fg=; b=quke8PfXai9144vlcPcF54fCfA
	pNQFbh7DCBLz9jHSbZJVkEYqa9smZZN4+ThAOCR6/OPPz0Juy86D/9GN9guGfLsSmSphG+YuxvfWm
	FQoTHcGnFQi9ca9uAoGbYajyNXZVESQn8t7NcUfX3kR70ciOx/zPnL/1KIchkAW2wUABgqwApvdqj
	2dqTlqojBG3sCStlzr0VBEAyGxxg9LDAWNo60HFlaUwgIcAeJp7FHwJFX5g1o9DpirrCT1JhB7BGL
	8yxsVXkVKYHHFK7u8O2J3s0QoH4ub9a29slKFrfvAEsWtF2OaY6basBkwOVL81S0f1j/vip9jF7XO
	mz+9Qs0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up7pT-0000000HVhW-0pVe;
	Thu, 21 Aug 2025 16:07:55 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up493-0000000Grbr-1neP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Aug 2025 12:11:54 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 31820152B;
	Thu, 21 Aug 2025 05:11:44 -0700 (PDT)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7C4E53F63F;
	Thu, 21 Aug 2025 05:11:49 -0700 (PDT)
Date: Thu, 21 Aug 2025 13:11:46 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: "Christoph Lameter (Ampere)" <cl@gentwo.org>
Cc: Jeremy Linton <jeremy.linton@arm.com>,
	Huang Shijie <shijie@os.amperecomputing.com>,
	Sudeep Holla <sudeep.holla@arm.com>, catalin.marinas@arm.com,
	will@kernel.org, patches@amperecomputing.com,
	Shubhang@os.amperecomputing.com, krzysztof.kozlowski@linaro.org,
	bjorn.andersson@oss.qualcomm.com, geert+renesas@glider.be,
	arnd@arndb.de, nm@ti.com, ebiggers@kernel.org,
	nfraprado@collabora.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: defconfig: enable CONFIG_SCHED_CLUSTER
Message-ID: <20250821-sloppy-urchin-of-fantasy-ecc4ce@sudeepholla>
References: <2d9259e4-1b58-435d-bf02-9c4badd52fd9@arm.com>
 <20250813-gifted-nimble-wildcat-6cdf65@sudeepholla>
 <d172f30d-28ad-dd46-1385-f010107bc789@gentwo.org>
 <c45b13b9-52ae-a52b-ce39-77f7ebe09507@gentwo.org>
 <aJ20imoeRL_tifky@bogus>
 <97278200-b877-47a6-84d4-34ea9dda4e6b@gentwo.org>
 <20250815-pheasant-of-eternal-tact-6f9bbc@sudeepholla>
 <1097a1d1-483d-44b3-b473-4350b5a4b04d@arm.com>
 <20250818-mysterious-aromatic-wasp-cdbaae@sudeepholla>
 <1e3ae52a-0aea-3146-429b-6a0035181b26@gentwo.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1e3ae52a-0aea-3146-429b-6a0035181b26@gentwo.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_051153_544442_5233239D 
X-CRM114-Status: GOOD (  31.91  )
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

On Wed, Aug 20, 2025 at 04:44:29PM -0700, Christoph Lameter (Ampere) wrote:
> On Mon, 18 Aug 2025, Sudeep Holla wrote:
> 
> > > But returning to the original point, its not clear to me that the HW
> > > 'cluster' information is really causing the performance boost vs, just
> > > having a medium size scheduling domain (aka just picking an arbitrary size
> > > 4-16 cores) under MC, or simply 'slicing' a L3 in the PPTT such that the MC
> > > domains are smaller, yields the same effect. I've seen a number of cases
> > > where 'lying' about the topology yields a better result in a benchmark. This
> > > is largely what is happening with these Firmware toggles that move/remove
> > > the NUMA domains too. Being able to manually reconfigure some of these
> > > scheduling levels at runtime might be useful...
> > >
> >
> > I share your concern and hence completely again representation of any fake
> > data in the ACPI topology just to get improved performance. Yes we have seen
> > that in the past.
> 
> Depends on what you call fake. There are microarchitectural issues
> regarding the proximity of the processors that the customer may not know
> about and therefore the data provides by the vendor may be considered
> "fake". Certainly that is not the case for our processors.
> 

Fair enough. We have seen systems with fake data as those data seem to
accidentally improve performance.

> This is a common feature and widely available on other platforms.
> There is no need to do anything but enable the functionality. Having a
> special version of ACPI for arm64 or a special handling for arm64 does not
> make sense.
> 

I am not suggesting to make it any special on Arm64, we would never want
that unless absolutely needed and this is not one such thing.

> The ACPI subsystem provides the ability to add blacklists. If a vendor has
> problems with their firmward providing data that reduces the performance
> and is unable to fix it othereise then the vendor can use that feature to
> disable these ACPI features for their platform by submitting a patch.
> 

I don't have a strong opinion on that approach. IIUC, maintaining list
needs change in the kernel which Jeremy mentioned is not what distro
prefer over command line parameter. We can always have a parameter to
disable the feature and keep the build config enabled as in this patch.
So only platforms that have performance issue by enabling this will have
to add the command line parameter(hopefully that works for all)

> Please make arm64 work like the other Linux platforms and do not introduce
> special handling for ARM64.

Again I am not suggesting that and we never want that.

-- 
Regards,
Sudeep


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 402D0CA0EF1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Aug 2025 14:48:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7UsecXMCJq5MpW5Qu2CCJpMmHFdxnV6whzIrqzE0KhY=; b=unClUiiJqUvO72usr9MZlw2Rnb
	BLgjpIuG6fSJLaoNxw9YZMBQvTvG3KPVYWN4FB05xGGjD3SQpBS6e4vz1i2bnBbMF3pUFEbRmi7gU
	XOla6WgIFS6RJUsSdxlOhN3HZF7utB7uEDKVD1QkDgV3hm3W0uUMKpC9KYBbvb28dmOBCKvSIwGs7
	BF68BXH4y9oME/TTNlz7CXf7we1UK4pilgPUvfA6oAKhHTwzkcju44kJl1MSxolvol94lFnW+2nWw
	VVYgHuGL7U3YQnBp09HMFrs3Q/fTMynJm8NEQaBxKPOr9bnoKsC0BGXH6umX4GKmuO2NEIaPaqyWt
	CrsudsvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo1A9-00000007oOs-3CeC;
	Mon, 18 Aug 2025 14:48:41 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unwFU-000000074Ih-3LJS
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 Aug 2025 09:33:53 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 868F01595;
	Mon, 18 Aug 2025 02:33:43 -0700 (PDT)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CC6923F58B;
	Mon, 18 Aug 2025 02:33:48 -0700 (PDT)
Date: Mon, 18 Aug 2025 10:33:45 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Jeremy Linton <jeremy.linton@arm.com>
Cc: "Christoph Lameter (Ampere)" <cl@gentwo.org>,
	Huang Shijie <shijie@os.amperecomputing.com>,
	Sudeep Holla <sudeep.holla@arm.com>, <catalin.marinas@arm.com>,
	<will@kernel.org>, <patches@amperecomputing.com>,
	<Shubhang@os.amperecomputing.com>, <krzysztof.kozlowski@linaro.org>,
	<bjorn.andersson@oss.qualcomm.com>, <geert+renesas@glider.be>,
	<arnd@arndb.de>, <nm@ti.com>, <ebiggers@kernel.org>,
	<nfraprado@collabora.com>,
	<prabhakar.mahadev-lad.rj@bp.renesas.com>,
	<linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] arm64: defconfig: enable CONFIG_SCHED_CLUSTER
Message-ID: <20250818-mysterious-aromatic-wasp-cdbaae@sudeepholla>
References: <e47757c3-6091-43b5-ba28-52e11de7d86a@arm.com>
 <cb383a76-8848-44cd-6f32-fd30478d9ebd@gentwo.org>
 <2d9259e4-1b58-435d-bf02-9c4badd52fd9@arm.com>
 <20250813-gifted-nimble-wildcat-6cdf65@sudeepholla>
 <d172f30d-28ad-dd46-1385-f010107bc789@gentwo.org>
 <c45b13b9-52ae-a52b-ce39-77f7ebe09507@gentwo.org>
 <aJ20imoeRL_tifky@bogus>
 <97278200-b877-47a6-84d4-34ea9dda4e6b@gentwo.org>
 <20250815-pheasant-of-eternal-tact-6f9bbc@sudeepholla>
 <1097a1d1-483d-44b3-b473-4350b5a4b04d@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1097a1d1-483d-44b3-b473-4350b5a4b04d@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_023352_911289_9F9E0432 
X-CRM114-Status: GOOD (  52.44  )
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

On Fri, Aug 15, 2025 at 11:46:35AM -0500, Jeremy Linton wrote:
> Hi,
> 
> 
> On 8/15/25 5:48 AM, Sudeep Holla wrote:
> > On Thu, Aug 14, 2025 at 09:30:06AM -0700, Christoph Lameter (Ampere) wrote:
> > > On Thu, 14 Aug 2025, Sudeep Holla wrote:
> > > 
> > > >    |  Different architectures use different terminology to denominate logically
> > > >    |  associated processors, but terms such as package, cluster, module, and
> > > >    |  socket are typical examples.
> > > > 
> > > > So how can one use these across architectures ? Package/Socket is quite
> > > > standard. Cluster can be group of processors or it can also be group of
> > > > processor clusters. One of the Arm vendors call it super cluster or something.
> > > > All these makes it super hard for a generic OS to interpret that information.
> > > > Just CONFIG_SCHED_CLUSTER was added with one notion of cluster which was soon
> > > > realised doesn't match with some other notion of it.
> > > 
> > > What the cluster actually is used for is up to the hardware. The linux
> > > scheduler provides this functionality. How and when this feature is used
> > > by firmware is a vendor issue. There was never a clear definition.
> > > 
> > 
> > Sure, since it is left to architecture to define what it means, it could
> > work. But what happens if we have multiple chiplet inside a socket and
> > each chiplet has multiple cluster. Do you envision using this SCHED_CLUSTER
> > at chiplet level if that works best on the platform ?
> > 
> > That could work, but we need to document all these with the best of our
> > knowledge now so that it is easy to revisit in the future.
> > 
> > > > We can enable it and I am sure someone will report a regression on their
> > > > platform and we need to disable it again. The benchmark doesn't purely
> > > > depend on just the "notion" of cluster but it is often related to the
> > > > private resource and how they are shared in the system. So even if you
> > > > strictly follow the notion of cluster as supported by CONFIG_SCHED_CLUSTER
> > > > it will fail on systems where the private resources are shared across the
> > > > "cluster" boundaries or some variant configuration.
> > > 
> > > That is not our problem. If the vendor provides clustering information and
> > > the scheduler uses that then the vendor can modify the firmware to not
> > > enable clustering.
> > > 
> > 
> > That is pure wrong. ACPI is describing the hardware. Deciding to put
> > clustering information in these tables only if it provides performance or
> > not hinder performance seem complete non-sense to me. That covering policy
> > in ACPI hardware description. Does ACPI spec mention anything about it ?
> > I mean remove some hardware description even if it is 100% accurate if it
> > hinders performance on one of the OSPM ? Doesn't sound correct at all.
> > 
> > > As mentioned before: We could create a blacklist to override the ACPI info
> > > from the vendor to ensure that clustering is off.
> > > 
> > 
> > Not a bad idea. We can see if allow or blocklist works as we start with one.
> 
> From a distro perspective it makes more sense to me to change it from a
> compile time option to a runtime kernel command line option with the default
> on/off set by this SCHED_CLUSTER flag rather than try to maintain a
> blocklist.
>

Right, that makes complete sense to me.

> 
> I agree the firmware needs a much clearer way to signal that these nodes
> represent something other than just side effects of the way the table is
> built. If the working group is hesitant to declare additional topological
> flags, maybe this idea of deriving additional topological information from
> nodes without caches is a reasonable spec clarification. That way some
> future NODE_IS_A_CLUSTER/DSU/CHIPLET/SUPERCLUSTER/RING/SLICE/WHATEVER
> doesn't turn the existing code into technical debt.
> 

100% agreed.

> But returning to the original point, its not clear to me that the HW
> 'cluster' information is really causing the performance boost vs, just
> having a medium size scheduling domain (aka just picking an arbitrary size
> 4-16 cores) under MC, or simply 'slicing' a L3 in the PPTT such that the MC
> domains are smaller, yields the same effect. I've seen a number of cases
> where 'lying' about the topology yields a better result in a benchmark. This
> is largely what is happening with these Firmware toggles that move/remove
> the NUMA domains too. Being able to manually reconfigure some of these
> scheduling levels at runtime might be useful...
> 

I share your concern and hence completely again representation of any fake
data in the ACPI topology just to get improved performance. Yes we have seen
that in the past.

-- 
Regards,
Sudeep


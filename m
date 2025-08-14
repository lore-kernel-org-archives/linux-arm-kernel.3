Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08374CA0EDC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Aug 2025 13:15:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Be042icPJNE1p/HC4tn0aBYSIuoqTJamKOu1zQZvVC8=; b=BDU5eYCgNzsyYAJu7Qi81R7JWu
	znJoZFaSpl9puZ9I5sEmir2zs4wsX4H3lF3WkFrK4Ax6SQXjmmno1JkuYuVV1VC58t4lUqScm85xZ
	uTxG7O77DCmFkW4qn2eR96AZnpEqrP4IXyiSr1hMP5wpklIFnyKSeTq3i8a5g0hrRmeJIX5xNs8fj
	YxcWXiHlYDnf/ZhxD6G6gqbcUbFoAwmBroMCst+mhHdRZahpMIHPrexAJ/jl7nRAa5yHIIgbVRXlh
	465iC/DZxTYpHhDlal05REqbwQYsWKGpGDhwP64sU17JQRcHJ0AOfAYQyz7wRmsEo1kf+kgj0WZQB
	xT5lPkEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umXnQ-0000000GyFv-0wJ9;
	Thu, 14 Aug 2025 13:15:08 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umUoV-0000000GW8N-2kwc
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Aug 2025 10:04:05 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 79C011691;
	Thu, 14 Aug 2025 03:03:52 -0700 (PDT)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BD3243F738;
	Thu, 14 Aug 2025 03:03:57 -0700 (PDT)
Date: Thu, 14 Aug 2025 11:03:54 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: "Christoph Lameter (Ampere)" <cl@gentwo.org>
Cc: Jeremy Linton <jeremy.linton@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Huang Shijie <shijie@os.amperecomputing.com>,
	catalin.marinas@arm.com, will@kernel.org,
	patches@amperecomputing.com, Shubhang@os.amperecomputing.com,
	krzysztof.kozlowski@linaro.org, bjorn.andersson@oss.qualcomm.com,
	geert+renesas@glider.be, arnd@arndb.de, nm@ti.com,
	ebiggers@kernel.org, nfraprado@collabora.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: defconfig: enable CONFIG_SCHED_CLUSTER
Message-ID: <aJ20imoeRL_tifky@bogus>
References: <20250808025533.6422-1-shijie@os.amperecomputing.com>
 <e47757c3-6091-43b5-ba28-52e11de7d86a@arm.com>
 <cb383a76-8848-44cd-6f32-fd30478d9ebd@gentwo.org>
 <2d9259e4-1b58-435d-bf02-9c4badd52fd9@arm.com>
 <20250813-gifted-nimble-wildcat-6cdf65@sudeepholla>
 <d172f30d-28ad-dd46-1385-f010107bc789@gentwo.org>
 <c45b13b9-52ae-a52b-ce39-77f7ebe09507@gentwo.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c45b13b9-52ae-a52b-ce39-77f7ebe09507@gentwo.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250814_030403_783227_928F0626 
X-CRM114-Status: GOOD (  27.31  )
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

On Wed, Aug 13, 2025 at 03:56:47PM -0700, Christoph Lameter (Ampere) wrote:
> On Wed, 13 Aug 2025, Christoph Lameter (Ampere) wrote:
> 
> > Can we figure out which platforms benchmarks were affected and why?
> >
> > It seems the notion of a "cluster" on ARM64 is derived (I guess a better
> > word than "invented" hehe)  from sibling information instead of PPTT. But
> > using that information should work fine right?
> 
> Sorry no that is not correct. The cluster information is correctly read
> from the ACPI tables and the cluster ids are avaialble in
> 
> 	/sys/devices/system/cpu/cpuXX/topology/cluster_id
> 

Agreed, the parts of ACPI specification has added notion of cluster sprinkle
across various chapters(mostly added by Arm in the earlier days though the
Arm architecture specification itself doesn't have any standard definition
for the cluster). Also note it nicely adds a disclaimer:

  |  Different architectures use different terminology to denominate logically
  |  associated processors, but terms such as package, cluster, module, and
  |  socket are typical examples.

So how can one use these across architectures ? Package/Socket is quite
standard. Cluster can be group of processors or it can also be group of
processor clusters. One of the Arm vendors call it super cluster or something.
All these makes it super hard for a generic OS to interpret that information.
Just CONFIG_SCHED_CLUSTER was added with one notion of cluster which was soon
realised doesn't match with some other notion of it.

We can enable it and I am sure someone will report a regression on their
platform and we need to disable it again. The benchmark doesn't purely
depend on just the "notion" of cluster but it is often related to the
private resource and how they are shared in the system. So even if you
strictly follow the notion of cluster as supported by CONFIG_SCHED_CLUSTER
it will fail on systems where the private resources are shared across the
"cluster" boundaries or some variant configuration.

> if CONFIG_SCHED_CLUSTER is enabled.
> 
> If there is an issue then it is a problem with the vendor firmware
> providing cluster id configurations via ACPI that cause regressions.
> 

As mentioned, it is not strictly just the cluster id but other shared
resources that contribute to the issues/regressions.

> We could add a blacklist for those platforms to avoid regressions but we
> should not allow that to hinder us to enable full support for clustering
> on ARM64.
> 

Sure, but we need to improve the "cluster" definition in the ACPI and Arm
specification, get an agreement on what it means for other architecture
first IMO. We don't want to revisit the same topic again without these as
IIRC this is the second time we are discussion around this topic.

-- 
Regards,
Sudeep


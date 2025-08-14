Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 798DFCA0EDC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Aug 2025 18:01:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JF2zWpBtAnSAAfOhvKFct6wKQPCmRTPbqhmbOV+gZsM=; b=XgqwEuaRza4UHaKSllTUmCrLOe
	0kb5H2Y47lv63zg1bQI6pbZNGyymx0p1V9D5KKe1fdTBaI37OqAEiHYIRPLGEKw+zpvJ/tEECzHYG
	1XvNfElwaXgTVq5p4iGjqJboKBPuGdtKPvs0KpLZ32siwAVM1zIgJ5EVg+lOu7jBtU+BlmuYtyOIb
	WxJIM8xx3AZRqGCrVwSqCqJ49j5FAkZXUw3VEHR8Hol4e3HeEEMgq/sC+PraaJyXawg+FQ5AspK0Z
	5/hWB9B84jfjGnfCidxhLG24sEAdVBM1LlXQvWmJeWOikjXRVLqKV/9fwYCnXA1PR3vgf6Z13zSoA
	D7Rv2g/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umcGh-00000000HDI-16Co;
	Thu, 14 Aug 2025 18:01:39 +0000
Received: from gentwo.org ([62.72.0.81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umb1t-000000005nT-2xFK
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Aug 2025 16:42:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gentwo.org;
	s=default; t=1755189006;
	bh=wYpyueQHKPzqCdCt0o/J3oLjQKH68YNCumbWnMGtByU=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=QsnYclyyeC99k5HVuVlCPOqjNJUNgn7uWTVqXp7p3NfgLjEy0uPg7TaGgYGyPD9tg
	 U3qNruK9QOXLJO+kt3+kjV9QhlzJWdulKqASjIcFc2YqivNeIQ2SXLls5P4u3A9Bqk
	 LGby9CulARglhzNyO7Ou5fbaJHcEBdO6GuBwxrGw=
Received: by gentwo.org (Postfix, from userid 1003)
	id 75B87401E7; Thu, 14 Aug 2025 09:30:06 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
	by gentwo.org (Postfix) with ESMTP id 736A1401E1;
	Thu, 14 Aug 2025 09:30:06 -0700 (PDT)
Date: Thu, 14 Aug 2025 09:30:06 -0700 (PDT)
From: "Christoph Lameter (Ampere)" <cl@gentwo.org>
To: Sudeep Holla <sudeep.holla@arm.com>
cc: Jeremy Linton <jeremy.linton@arm.com>, 
    Huang Shijie <shijie@os.amperecomputing.com>, catalin.marinas@arm.com, 
    will@kernel.org, patches@amperecomputing.com, 
    Shubhang@os.amperecomputing.com, krzysztof.kozlowski@linaro.org, 
    bjorn.andersson@oss.qualcomm.com, geert+renesas@glider.be, arnd@arndb.de, 
    nm@ti.com, ebiggers@kernel.org, nfraprado@collabora.com, 
    prabhakar.mahadev-lad.rj@bp.renesas.com, 
    linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: defconfig: enable CONFIG_SCHED_CLUSTER
In-Reply-To: <aJ20imoeRL_tifky@bogus>
Message-ID: <97278200-b877-47a6-84d4-34ea9dda4e6b@gentwo.org>
References: <20250808025533.6422-1-shijie@os.amperecomputing.com> <e47757c3-6091-43b5-ba28-52e11de7d86a@arm.com> <cb383a76-8848-44cd-6f32-fd30478d9ebd@gentwo.org> <2d9259e4-1b58-435d-bf02-9c4badd52fd9@arm.com> <20250813-gifted-nimble-wildcat-6cdf65@sudeepholla>
 <d172f30d-28ad-dd46-1385-f010107bc789@gentwo.org> <c45b13b9-52ae-a52b-ce39-77f7ebe09507@gentwo.org> <aJ20imoeRL_tifky@bogus>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250814_094217_779053_080D3299 
X-CRM114-Status: GOOD (  29.39  )
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

On Thu, 14 Aug 2025, Sudeep Holla wrote:

>   |  Different architectures use different terminology to denominate logically
>   |  associated processors, but terms such as package, cluster, module, and
>   |  socket are typical examples.
>
> So how can one use these across architectures ? Package/Socket is quite
> standard. Cluster can be group of processors or it can also be group of
> processor clusters. One of the Arm vendors call it super cluster or something.
> All these makes it super hard for a generic OS to interpret that information.
> Just CONFIG_SCHED_CLUSTER was added with one notion of cluster which was soon
> realised doesn't match with some other notion of it.

What the cluster actually is used for is up to the hardware. The linux
scheduler provides this functionality. How and when this feature is used
by firmware is a vendor issue. There was never a clear definition.

> We can enable it and I am sure someone will report a regression on their
> platform and we need to disable it again. The benchmark doesn't purely
> depend on just the "notion" of cluster but it is often related to the
> private resource and how they are shared in the system. So even if you
> strictly follow the notion of cluster as supported by CONFIG_SCHED_CLUSTER
> it will fail on systems where the private resources are shared across the
> "cluster" boundaries or some variant configuration.

That is not our problem. If the vendor provides clustering information and
the scheduler uses that then the vendor can modify the firmware to not
enable clustering.

As mentioned before: We could create a blacklist to override the ACPI info
from the vendor to ensure that clustering is off.

What we should not do is disabling clustering for all.


> > We could add a blacklist for those platforms to avoid regressions but we
> > should not allow that to hinder us to enable full support for clustering
> > on ARM64.
> >
>
> Sure, but we need to improve the "cluster" definition in the ACPI and Arm
> specification, get an agreement on what it means for other architecture
> first IMO. We don't want to revisit the same topic again without these as
> IIRC this is the second time we are discussion around this topic.

The vendors need flexibility to use this feature when it makes sense.

Having a clear definition would limit the use of clustering feature and
limits innovation. Vendors can control the clustering via ACPI and the
firmware they provide with their system.

We could change definition but that but that would be a decadelong
process which will encounter resistance from vendors that make uses of the
clustering feature that does not fall into the stricter definition.




Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6DA4CA0EE8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Aug 2025 13:15:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R1p5sG6Up5RyX/VDuTRVHBTUjLDvCuikysszartwlsw=; b=CVGCigDjn0+UmL/JTNsP231KLo
	7eR38eap7b3fomBvSc5xtor3ULKNrdH4/wzei7NiqkOguC5nrnSyxCkEYyuSXoKPJCAmIAD/S2SCJ
	k5NMGZnJVWv7kelM7iuuoWS8cnARSnlvWQ1jxH4VmPS0RGV5JzzMszdnH3//fUDZPj0FfrJIWdSKq
	ezGhs1FyZCv1PAaShZZjE6qKTtbBRrLnr30yoVPXVPFVGXcpHSP5izkYrIEqDyOlJ1lfK6ohvZu5q
	p5LVwh0ScUBO1q7km4S+SZyMgCrG8iocjnl+A9lrrbgrHgfA9d0eA3XNcdP4jf6JjHbb1fh/S6BNE
	cUbTI48A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umXnT-0000000GyMC-3ITJ;
	Thu, 14 Aug 2025 13:15:11 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umUsJ-0000000GWbc-2OJT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Aug 2025 10:08:00 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BECDB1691;
	Thu, 14 Aug 2025 03:07:50 -0700 (PDT)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0A0E53F738;
	Thu, 14 Aug 2025 03:07:55 -0700 (PDT)
Date: Thu, 14 Aug 2025 11:07:53 +0100
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
Message-ID: <aJ21eZPPmQVR3Nij@bogus>
References: <20250808025533.6422-1-shijie@os.amperecomputing.com>
 <e47757c3-6091-43b5-ba28-52e11de7d86a@arm.com>
 <cb383a76-8848-44cd-6f32-fd30478d9ebd@gentwo.org>
 <2d9259e4-1b58-435d-bf02-9c4badd52fd9@arm.com>
 <20250813-gifted-nimble-wildcat-6cdf65@sudeepholla>
 <d172f30d-28ad-dd46-1385-f010107bc789@gentwo.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d172f30d-28ad-dd46-1385-f010107bc789@gentwo.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250814_030759_657931_FEE90C54 
X-CRM114-Status: GOOD (  22.97  )
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

On Wed, Aug 13, 2025 at 08:55:36AM -0700, Christoph Lameter (Ampere) wrote:
> On Wed, 13 Aug 2025, Sudeep Holla wrote:
> 
> > > The problem is that this information is being sourced from the ACPI PPTT.
> > > The ACPI specification (AFAIK) doesn't define a cluster, so the linux
> > > cluster information is being 'invented' based on however the firmware vendor
> > > choose to group CPU nodes in the PPTT. Which means its possible for them to
> > > unknowingly create clusters, or also fail to create them when they make
> > > sense.
> >
> > +1, completely agree. As Jeremy mentioned, it is hit or miss and cluster
> > is loosely defined and IIRC Huawei pushed this based on their platform at
> > the time and it did break some benchmarks on few other platforms. So it
> > is not a good idea to make it default config IMO.
> 
> Can we figure out which platforms benchmarks were affected and why?
> 

I am not sure on either. One way to figure out the affected platforms is
to merge this change and expect the platform users/maintainers to report.

> It seems the notion of a "cluster" on ARM64 is derived (I guess a better
> word than "invented" hehe)  from sibling information instead of PPTT. But
> using that information should work fine right?
> 

I have my doubts but I may be wrong. As mentioned in the other email in this
thread, "cluster" IMO is ill-defined both in ACPI and Arm architecture which
is the root cause for all the issue around it.

-- 
Regards,
Sudeep


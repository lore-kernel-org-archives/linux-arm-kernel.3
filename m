Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58417108E1F2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Mar 2026 11:46:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vRUT9pRyyGhQjgvvkUzthzyM2Lo8dR7urhekmWU0ByQ=; b=Qm7ISIPujvDJTcDrkgucr5zt+b
	colB13Hl29I8VN6QJfrzswcPK/Ix8AwDQnZb6wOal7fOKXggty254LzBKlnSGiNBnyZ4jWw/rBHco
	RgeMYX0dGQF8l3SyWObOxaXj2w02rW5nh+1Nt16alJq6P0cH2YO0asSjj+mFmF0cFAHx3kp8ttD8F
	S02WFnEAUOnFa1MtkCoDtnjFVBJ25Cm6UOakvFKdsBoTrxo1F7kQtJP1JdNEiQPns+daoEikJ9DDo
	RM9CFRMWMsO3ohwDJyveynw7Uh/WVwUNv9MOvsIbx59Ls0W4l4GNCVwLTwvGd1zihZKsEyYDDMiI9
	CG0Re0aA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3Bph-0000000AZCr-2OcR;
	Thu, 19 Mar 2026 11:46:33 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3Bpe-0000000AZBg-3WaM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Mar 2026 11:46:32 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3C61F1A25;
	Thu, 19 Mar 2026 04:46:20 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6A6313F778;
	Thu, 19 Mar 2026 04:46:24 -0700 (PDT)
Date: Thu, 19 Mar 2026 11:46:18 +0000
From: Cristian Marussi <cristian.marussi@arm.com>
To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org
Cc: sudeep.holla@kernel.org, philip.radford@arm.com,
	james.quinlan@broadcom.com, f.fainelli@gmail.com,
	vincent.guittot@linaro.org, etienne.carriere@foss.st.com,
	peng.fan@oss.nxp.com, michal.simek@amd.com,
	dan.carpenter@linaro.org, gatien.chevallier@foss.st.com,
	Cristian Marussi <cristian.marussi@arm.com>
Subject: Re: [RFC PATCH 0/4] Rework SCMI transport drivers probing sequence
Message-ID: <abviCkBeX9uzsgxy@pluto>
References: <20260317165811.3352752-1-cristian.marussi@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260317165811.3352752-1-cristian.marussi@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_044630_994365_599B35FE 
X-CRM114-Status: GOOD (  29.60  )
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

On Tue, Mar 17, 2026 at 04:58:07PM +0000, Cristian Marussi wrote:
> Hi,
> 

Hi,

a clarification replying to myself down-below... O_o

> when the SCMI transports were split out into standalone drivers [1] the
> probe sequence was laid out in such a way that:
> 
>  - the transport drivers would have probed first, triggered by the firmware
>    driven discovery process (DT/ACPI)
> 
>  - afterwards the control would have been passed to the core SCMI stack
>    driver via the creation of a dedicated device that would have inherited
>    the original firmware descriptor (since that same DT/ACPI node would
>    have still needed by the SCMI core driver to be parsed)
> 
> The tricky part came around with some transport driver like virtio and
> optee since they are, in turn, upfront dependent on an external distinct
> kernel subsystem; IOW these have first to undergo their own subsystem
> specific probe/initialization to become fully operational as transports:
> this kind of initialization sequencing of course must deal with the
> possibility of probe deferrals BUT at that time we avoid this by using the
> trick in virtio/optee transports to register the next stage transport
> drivers ONLY at the end of the subsystem specific probe routine, from
> within the probe itself.
> 
> This behaviour has 2 issues:
> 
>  - it is frowned upon and can lead to hangs in the driver core whenever
>    some core locking is changed as exposed in [2]
>  - it limits these transport drivers to a single instance probing since of
>    course you cannot register the same driver more than once
> 
> All of this was tolerable because optee/virtio are generally only employed
> in a single SCMI instance scenario AND because no hang where triggered in
> the core driver subsystem... (not saying that was perfectly fine :P)
> 
> This RFC series aims to solve both of the above issue by:
> 
>  - moving the problematic platform driver registation away from the probe
>    into its own module_init/exit
> 
>  - introducing an optional mechanism for the transport drivers to provide
>    to the SCMI core some sort of transport specific handle so that multiple
>    instances can be supported and multiple probed transports instances can
>    be registered and identified by the core. (who is who)
>    Note that at the same time this optional handle-mechanism is used to
>    synchronize the drivers probing sequences and possibly trigger, when
>    needed, the probe deferrals, if the transport driver has still to
>    undergo its own subsystem initialization and as such is still NOT fully
>    operational.

Implementation issues aside, one thing that I failed to make clear about
this series is that, while this series addresses the platform registration
@probe-time issue above and enables the capability to technically support
multiple SCMI instances also for optee/virtio transports (like it is
already for mailbox and smc), the multi instance support for optee/virtio,
as of now, still suffers from some 'structural' limitations that make it
unfit for production and useful ONLY on a testing scenario (...like in my
virtio based setup :D)

The crux of the matter lays in the fact that there is still not a way
in such transports to be able to match a specific probed transport instance
(device) with the corresponding SCMI DT top node instance descriptor that
usually, in a multi instance scenario, describes a different set of
protocols, or the same set of protocols enumerating a different set of
resources...so, e.g., if you want to match and reference by phandle a
specific clock domain from a specific instance you cannot really be sure
that the instance reference that you have is the instance that you wanted
since depends on how that was associated during the probe.
(in mailbox and smc you have an explicit channel/shmem association ...)

Still a lot to reason about this as of now...any suggestion about this
is even more very much welcome :P

Thanks,
Cristian


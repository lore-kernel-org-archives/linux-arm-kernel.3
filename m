Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3629C369B5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Apr 2025 14:05:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MOX/o99nB4nXu8KmLiU9F3Ayo4CYnkQ8if2bOcHhwl4=; b=GpLdAtEgMKYVNE+WXjC6S7A9YO
	pb4MevCAbkSQ4414A6xQOnNyvWL38l/x6ocGAYEhpXMooWEPIWWgmhKdFz9OhmLgnUC3apgJVKeCB
	3YCpNqREcdyf4NhCey8lyClURNyvtdDUXscsDNjv3J3xDjXnSon8t6AztWbkwZShU/9Hq2ndGuPL9
	MB/AV4lLyKVUuLY2hi5JXw+0X7Zg2oWhu7x5BmzYktDp6kfJr6QEZfbPq+Qlwy5gJsxvj3YhvwUIv
	j6i276ghzLqWbNfLqxUD6tnukpljIGwGiyI+SOq+M733cCdCt+UUkpRLrnjRN7Zo0FCmLK8oZi/rT
	CrrhNi7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4guv-0000000627I-0VtX;
	Tue, 15 Apr 2025 14:05:37 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4glQ-00000005zuk-0Q93
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Apr 2025 13:55:49 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5498115A1;
	Tue, 15 Apr 2025 06:55:43 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C62813F694;
	Tue, 15 Apr 2025 06:55:42 -0700 (PDT)
Date: Tue, 15 Apr 2025 14:55:33 +0100
From: Cristian Marussi <cristian.marussi@arm.com>
To: Johan Hovold <johan@kernel.org>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org, sudeep.holla@arm.com,
	james.quinlan@broadcom.com, f.fainelli@gmail.com,
	vincent.guittot@linaro.org, peng.fan@oss.nxp.com,
	michal.simek@amd.com, quic_sibis@quicinc.com,
	dan.carpenter@linaro.org, maz@kernel.org
Subject: Re: [RFC PATCH 0/3] Introduce SCMI Quirks framework
Message-ID: <Z_5lJA74OugEbB-S@pluto>
References: <20250401122545.1941755-1-cristian.marussi@arm.com>
 <Z-_dMev0v6P4UJ_i@hovoldconsulting.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z-_dMev0v6P4UJ_i@hovoldconsulting.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_065548_226917_708D94A7 
X-CRM114-Status: GOOD (  24.98  )
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

On Fri, Apr 04, 2025 at 03:22:57PM +0200, Johan Hovold wrote:
> Hi Cristian,
> 
> On Tue, Apr 01, 2025 at 01:25:42PM +0100, Cristian Marussi wrote:
> 
> > with the increasing adoption of SCMI across arm64 ecosystems, we have to
> > start considering how to deal and take care of out-of-spec SCMI firmware
> > platforms that are actively deployed in the wild, in a consistent manner.
> > 
> > This small series introduces a simple framework, based on static_keys,
> > that allows a user to:
> > 
> > - define a quirk and its matching conditions; quirks can match based on:
> > 
> >   	compatible / Vendor_ID / Sub_Vendor_ID / ImplVersion
> > 
> >   from the longest matching sequence down to the shortest.
> > 
> >   When the SCMI core stack boots it will enable the matching quirks
> >   depending on the information gathered from the platform via Base
> >   protocol: any NULL/0 match condition is ignored during matching and is
> >   interpreted as ANY, so you can decide to match on a very specific
> >   combination of compatibles and FW versions OR simply on a compatible.
> > 
> > - define a quirk code-block: simply a block of code, meant to play the
> >   magic quirk trick, defined in the proximity of where it will be used
> >   and gated by an implicit quirk static-key associated with the defined
> >   quirk
> 
> > Any feedback and testing is very much welcome.
> 
> I'm hitting the below lockdep splat when running with this series and
> the FC quirk enabled.
> 
> Johan
> 
> 
> [    8.399581] ======================================================
> [    8.399582] WARNING: possible circular locking dependency detected
> [    8.399583] 6.14.0 #103 Not tainted
> [    8.399584] ------------------------------------------------------
> [    8.399584] kworker/u49:5/165 is trying to acquire lock:
> [    8.399586] ffff65d004d36320 (&info->protocols_mtx){+.+.}-{4:4}, at: scmi_get_protocol_instance+0x4c/0x5c0
> [    8.399596] 
>                but task is already holding lock:
> [    8.399596] ffff65d00a895348 (&ni->pending_mtx){+.+.}-{4:4}, at: __scmi_event_handler_get_ops+0x70/0x47c
> [    8.399600] 
>                which lock already depends on the new lock.
> 
> [    8.399601] 
>                the existing dependency chain (in reverse order) is:
> [    8.399601] 
>                -> #4 (&ni->pending_mtx){+.+.}-{4:4}:

Hi Johan,

I have reproduced this when running with LOCKDEP and quirks enabled:
it was due to the fact that static_branch_enable() takes a cpu_lock
internally and I was triggering all of this from Base protocol init
which takes a number of other mutexes...

I moved SCMI quirk initialiation after Base protocol initialization
in scmi_probe and it is gone...and indeed was not needed anyway so
early.

I'll post a new V1 for quirks in a short while including this change.

Thanks,
Cristian


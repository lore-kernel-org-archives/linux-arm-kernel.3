Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E8E4C02192
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Feb 2025 09:35:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q1SDNTfb9XZtJlHTaWizI+capEd1WvWruP0bQWqtuCA=; b=NZDWo9MjAWPOeEfyz0fqOkPNWJ
	RtPYPKgYzk63Upu7/ELa39w11HC16eXUW7l7rWPWQTGnPKN22CD9DKXxRDaW8crGQe6tCp6ewVhF8
	uIXr7oCrEbNmqjJIYCcXnNdXN582TdRu3c/14vv1NQ+5REd1ptliGGAAlCU2FblfdjD3EQ4k9D9ka
	xx/oWxu/fTdCHiK0KY7RBHqzDikrNjIkNUyCAm8YiQwGbPN+Oc2TxWYB71591iF6ODnOaTFrgAXdw
	xk/y/HycVEjY3tssHoq2na8SNtgL3rGEE8l2rJIoBxxuMpm8gMV4jlTgLBJDTiF+S8rRnAIeM0hUs
	X7mQD4rQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tesr7-0000000F0aG-0ZU5;
	Mon, 03 Feb 2025 09:35:01 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tespm-0000000F0Qo-2v8s
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Feb 2025 09:33:39 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8DF591063;
	Mon,  3 Feb 2025 01:34:00 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BB2153F5A1;
	Mon,  3 Feb 2025 01:33:34 -0800 (PST)
Date: Mon, 3 Feb 2025 09:33:23 +0000
From: Cristian Marussi <cristian.marussi@arm.com>
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Cristian Marussi <cristian.marussi@arm.com>,
	Xinqi Zhang <quic_xinqzhan@quicinc.com>,
	Peng Fan <peng.fan@nxp.com>, Guomin Chen <guomin_chen@sina.com>
Subject: Re: [PATCH 3/3] firmware: arm_scmi: Emit modalias for SCMI devices
Message-ID: <Z6CNWOp8B_ghIrJt@pluto>
References: <20250131141822.514342-1-sudeep.holla@arm.com>
 <20250131141822.514342-3-sudeep.holla@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250131141822.514342-3-sudeep.holla@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_013338_779461_2D289E54 
X-CRM114-Status: GOOD (  14.87  )
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

On Fri, Jan 31, 2025 at 02:18:22PM +0000, Sudeep Holla wrote:
> In order to enable libkmod lookups for SCMI device objects to their
> corresponding module, add 'modalias' to the base attribute of SCMI
> devices.
> 

Hi Sudeep,

Indeed, as of today if you build the SCMI stack completely as modules, only the
core stack (scmi-core/scmi-module) and the needed SCMI transports are loaded
automatically, so this patch, I understand, is meant to add the missing bits
to enable autoloading also for the SCMI drivers that sits on top like
scmi-cpufreq etc..

In fact, I tried experimenting with something similar to your solution
recently to enable MODALIAS emission and full stack autoloading, BUT then
I realized it could have worked ONLY with an additional hack...

...the problem lays in the fact that since we wanted to allow Vendor
drivers and protocols to be easily added without changing the core (as
asked by vendors themslves AFAICR), we dont have a central static
devices-table hold by the SCMI bus core (as usual) but instead we let
SCMI drivers dynamically request protocol/devices that are needed...

...and this in turn means that the devices are created only when a driver
requires a specifc protocol/name pair (and a matching DT entry is found)
during its initalization at load time...so it's a chicken-egg problem
since the MODALIAS that will cause, say, scmi-cpufreq to be loaded will
be emitted only when the device for scmi-cpufeq will be created BUT that
currently happens only if the device was requested during the init/loading
of scmi-cpufreq itself...

...the dynamic request-device mechanism added to give vendors flexibility
does break the usual module autoloading capabilities AFAIU...

...indeed I tested this series with a full modularized SCMI stack and it
does NOT cause the full stack to be loaded...

Having said that, since this dynamic-request device mechanism was meant
to ease vendors additions, my hack was simply to pre-request all the
standard protocol devices at bus init...in that way the full stack does
finally autoload...I will post that 2 patches of mine as and RFC in
response to this for the sake of clarity...

Note that such a hack, or a better polished version of it, would NOT work
anyway for Vendor modules: if we want to keep such flexibility they still
have to be loaded manually...

Alternatively we could get rid of dynamic device creation as a whole and
revert to a more standard static central devicetable for all...not sure
really if the flexibility of device creation at runtime without keeping
a common central table is really needed/appreciated by the Vendors that
asked for it in first place :D

Thanks,
Cristian


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 538E6C77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 10:57:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NVXPuE1U1hbpxcUvr+0CrepyX1mqMdRI9E/gitvt38E=; b=mg+Y8OO2qjBTCxWyz2/gGZ3uIi
	GBNZSkK1W6NE0VJVPGhbfX6EbrQ3fqpbq0qD3uQSi4p3CzG2LYtif68Hw+0BXNS0fJbvhtmHVckUO
	Rjkc3WHmaaP4pBk6WOL0BvTcWG3C3oW/1f+sOgyISsTCFTYWDT4eZCrwWnR/IbcitdNoMdFNPv7Eq
	pZ4MsWfxbatpBJbNCNKmRG/ymbAfL/ibqUlbqB06VKiPvX+zgJdjC8pRuxfIOE09OD/6zbSRGylzZ
	t+aV7nQpR8Aw5gwSsnSzB5yS7BMTaQkp+hXJ20e0PcM2Vb3E3aEgakrQmhrSYYCmFpuPo0Wz3Yxb1
	Ia8WR0LA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU1LX-00000005NK6-2Spy;
	Tue, 24 Jun 2025 10:57:47 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU0ms-00000005I6w-0G8a
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Jun 2025 10:22:00 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 52B7C113E;
	Tue, 24 Jun 2025 03:21:39 -0700 (PDT)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 738E73F63F;
	Tue, 24 Jun 2025 03:21:55 -0700 (PDT)
Date: Tue, 24 Jun 2025 11:21:52 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Peng Fan <peng.fan@nxp.com>
Cc: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>, Dhruva Gole <d-gole@ti.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	"arm-scmi@vger.kernel.org" <arm-scmi@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Ranjani Vaidyanathan <ranjani.vaidyanathan@nxp.com>,
	Chuck Cannon <chuck.cannon@nxp.com>
Subject: Re: [PATCH 2/2] firmware: arm_scmi: power_control: Set
 SCMI_SYSPOWER_IDLE in pm resume
Message-ID: <20250624-agile-moth-of-blizzard-c7babf@sudeepholla>
References: <20250620-scmi-pm-v1-0-c2f02cae5122@nxp.com>
 <20250620-scmi-pm-v1-2-c2f02cae5122@nxp.com>
 <20250623125750.kzwndmcf5yo3siao@lcpd911>
 <20250623142957.GA10415@nxa18884-linux>
 <20250623-organic-foamy-tamarin-fefa30@sudeepholla>
 <PAXPR04MB8459E323E3C77A96272BC1728878A@PAXPR04MB8459.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PAXPR04MB8459E323E3C77A96272BC1728878A@PAXPR04MB8459.eurprd04.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_032158_151400_92D2EE72 
X-CRM114-Status: GOOD (  16.81  )
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

On Tue, Jun 24, 2025 at 01:23:10AM +0000, Peng Fan wrote:
> > 
> > Just to summarise my understanding here at very high level, the issue
> > exists as the second notification by an agent to the Linux to suspend
> > the system wakes up the system from suspend state. Since the
> > interrupts are enabled before the thaw_processes() (which eventually
> > continues the execution of scmi_suspend_work_func() to set the state
> > to SCMI_SYSPOWER_IDLE, the scmi_userspace_notifier() is executed
> > much before and ends up ignoring the request as the state is still not
> > set to SCMI_SYSPOWER_IDLE. There is a race which your patch is
> > addressing.
> 
> Thanks for writing this down, It is very correct and clear.
> 

While I am not against adding bus PM ops as it can be useful elsewhere,
just wonder if this usecase is a good use of it. Does setting the state
before the pm_suspend() call suffice. I still need to think through the
possible race with that solution, but just asking you to check if that
helps.

-- 
Regards,
Sudeep


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03C89C77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Jul 2025 16:37:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZTWNlVok4AoC3F6tBZShLdoK3k2Ch9jDIplIAZ4wm7Y=; b=MsElzzbDU6l2N8PYhhwz5XBZQ+
	44+45AxJUoUg7ZE2PQzy+sXoyn1abocyjiYiXiEd7XPxz2BsUT2UvfXu31wzkd0/X1xyFXyCSFJsE
	hA/REimczofeDKGazsSgxaEcWfbQCX69B33L+Y7Ll3dJOwBAhOet3LODCRSPz53wkeyoYjMQVcy10
	LvuIxyf8By0BHPQtv4nwjvpPVMtFkrolDd/Zn5bu8fQOzNGS/NvoqQzeVV9nKPMVEnlWw6q6aDgHx
	tOsjGJ2UP1wYcvVANI69oJCVNvUaiTMWQLzps1JvtFf8FsEZEPiMxvn0sZIgqcafy5LfZW5aYpt5h
	z5DxVVNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uX0Sn-00000008yUT-1NuT;
	Wed, 02 Jul 2025 16:37:37 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWzLq-00000008mi0-3vtI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Jul 2025 15:26:24 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B9BDB2F9D;
	Wed,  2 Jul 2025 08:26:07 -0700 (PDT)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D1BDC3F6A8;
	Wed,  2 Jul 2025 08:26:20 -0700 (PDT)
Date: Wed, 2 Jul 2025 16:26:18 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Peng Fan <peng.fan@nxp.com>, Dhruva Gole <d-gole@ti.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	"arm-scmi@vger.kernel.org" <arm-scmi@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Ranjani Vaidyanathan <ranjani.vaidyanathan@nxp.com>,
	Chuck Cannon <chuck.cannon@nxp.com>
Subject: Re: [PATCH 2/2] firmware: arm_scmi: power_control: Set
 SCMI_SYSPOWER_IDLE in pm resume
Message-ID: <20250702-apricot-anteater-of-fertility-92ebc2@sudeepholla>
References: <20250620-scmi-pm-v1-0-c2f02cae5122@nxp.com>
 <20250620-scmi-pm-v1-2-c2f02cae5122@nxp.com>
 <20250623125750.kzwndmcf5yo3siao@lcpd911>
 <20250623142957.GA10415@nxa18884-linux>
 <20250623-organic-foamy-tamarin-fefa30@sudeepholla>
 <PAXPR04MB8459E323E3C77A96272BC1728878A@PAXPR04MB8459.eurprd04.prod.outlook.com>
 <20250624-agile-moth-of-blizzard-c7babf@sudeepholla>
 <20250624145807.GA14878@nxa18884-linux>
 <20250701150735.GD20538@nxa18884-linux>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250701150735.GD20538@nxa18884-linux>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_082623_062700_81297B10 
X-CRM114-Status: GOOD (  31.59  )
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

On Tue, Jul 01, 2025 at 11:07:35PM +0800, Peng Fan wrote:
> Hi Sudeep,
> 
> On Tue, Jun 24, 2025 at 10:58:07PM +0800, Peng Fan wrote:
> >On Tue, Jun 24, 2025 at 11:21:52AM +0100, Sudeep Holla wrote:
> >>On Tue, Jun 24, 2025 at 01:23:10AM +0000, Peng Fan wrote:
> >>> > 
> >>> > Just to summarise my understanding here at very high level, the issue
> >>> > exists as the second notification by an agent to the Linux to suspend
> >>> > the system wakes up the system from suspend state. Since the
> >>> > interrupts are enabled before the thaw_processes() (which eventually
> >>> > continues the execution of scmi_suspend_work_func() to set the state
> >>> > to SCMI_SYSPOWER_IDLE, the scmi_userspace_notifier() is executed
> >>> > much before and ends up ignoring the request as the state is still not
> >>> > set to SCMI_SYSPOWER_IDLE. There is a race which your patch is
> >>> > addressing.
> >>> 
> >>> Thanks for writing this down, It is very correct and clear.
> >>> 
> >>
> >>While I am not against adding bus PM ops as it can be useful elsewhere,
> >>just wonder if this usecase is a good use of it. Does setting the state
> >>before the pm_suspend() call suffice. I still need to think through the
> >>possible race with that solution, but just asking you to check if that
> >
> >There is race condition if setting the state to SCMI_SYSPOWER_IDLE before
> >pm_suspend.
> >
> >The 2nd suspend notification could runs into pm_suspend again
> >before pm_suspend update system_state to SYSTEM_SUSPEND, if my understanding
> >is correct.
> >
> >Per pm_suspend->enter_state,
> >"Make sure that no one else is trying to put the system into a sleep state",
> >not sure, but I think better not let pm_suspend to handle the race condition.
> >
> >Since syspower only has one per system(linux), the other approach is to
> >use syscore, but need a global variable for state in scmi_power_control.c,
> >because syscore_suspend/resume does not have parameter.
> >
> >we need to set state back to IDLE after linux wakeup and before kernel
> >thread scheduling. I only see two interfaces to achieve:
> >PM ops or syscore ops.
> 
> Not sure you have time to give a look. I plan to post V2 later this
> week. In V2, I would still use pm ops.
> 

Sure, please go ahead and post. I didn't get time to look at it in depth.
I agree with your comment for now, will take a look at it again with your v2.

-- 
Regards,
Sudeep


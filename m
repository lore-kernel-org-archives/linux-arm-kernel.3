Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1987DD29FA9
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Nov 2024 07:14:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2Yl0hDawk554pnjo8kTYbcRKrQAYL8hedTy8VtFQISE=; b=hJSH3lxlKuXqnJaDndp+qss9Nv
	gA37s/Qu9s1gYKYEx8vmIIM+dW0or+gx+RC9LI078NMUIcs4CqmfTW643w6aLfHuqRS+fXT+l37Ub
	KcAk/FzoLiIJrqPfpKUOXNAbuYWQbbzW3ELF/bBgNOJfNSvZ1QNmktmuByaCWSZu0358wkkKbLRZW
	hkNds8auviruAcSYJHbeSDYjC4UBQRsN5xpu7sL4Qc0yd2UuOcIEqno4WjvRiV5VfecRMKGmzra0B
	2fa6+q4ltOMkAUTW4duU6C/Ie17fEnKO5WWpv3o8fDNzDELSiHJrn9+VUihm+UXv7rsCFN9tDYOD8
	dRiG2MZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8aFF-0000000254M-06y3;
	Wed, 06 Nov 2024 07:14:25 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8aDW-000000024xK-297V
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Nov 2024 07:12:40 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 245BF1063;
	Tue,  5 Nov 2024 23:13:07 -0800 (PST)
Received: from bogus (unknown [10.57.64.60])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 744D13F66E;
	Tue,  5 Nov 2024 23:12:29 -0800 (PST)
Date: Wed, 6 Nov 2024 07:12:15 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
	Sibi Sankar <quic_sibis@quicinc.com>, johan@kernel.org,
	jassisinghbrar@gmail.com, dmitry.baryshkov@linaro.org,
	linux-kernel@vger.kernel.org, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	konradybcio@kernel.org, linux-pm@vger.kernel.org,
	tstrudel@google.com, rafael@kernel.org
Subject: Re: [PATCH V5 0/6] firmware: arm_scmi: Misc Fixes
Message-ID: <20241106071215.jhnzcn4vkdfr3peg@bogus>
References: <20241030125512.2884761-1-quic_sibis@quicinc.com>
 <CAPDyKFoY8CnxF7JXzkT9_WXyM-TJhW4kmTw=H8NEzch32N1_7Q@mail.gmail.com>
 <ZyJeuVIbWkohymW5@pluto>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZyJeuVIbWkohymW5@pluto>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241105_231238_639259_93C5CB87 
X-CRM114-Status: GOOD (  27.72  )
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

On Wed, Oct 30, 2024 at 04:28:41PM +0000, Cristian Marussi wrote:
> On Wed, Oct 30, 2024 at 05:19:39PM +0100, Ulf Hansson wrote:
> > On Wed, 30 Oct 2024 at 13:55, Sibi Sankar <quic_sibis@quicinc.com> wrote:
> > >
> > > The series addresses the kernel warnings reported by Johan at [1] and are
> > > are required to X1E cpufreq device tree changes to land.
> > >
> > > [1] - https://lore.kernel.org/lkml/ZoQjAWse2YxwyRJv@hovoldconsulting.com/
> > >
> > > Duplicate levels:
> > > arm-scmi arm-scmi.0.auto: Level 2976000 Power 218062 Latency 30us Ifreq 2976000 Index 10
> > > arm-scmi arm-scmi.0.auto: Level 3206400 Power 264356 Latency 30us Ifreq 3206400 Index 11
> > > arm-scmi arm-scmi.0.auto: Level 3417600 Power 314966 Latency 30us Ifreq 3417600 Index 12
> > > arm-scmi arm-scmi.0.auto: Failed to add opps_by_lvl at 3417600 for NCC - ret:-16
> > > arm-scmi arm-scmi.0.auto: Failed to add opps_by_lvl at 3417600 for NCC - ret:-16
> > > arm-scmi arm-scmi.0.auto: Level 4012800 Power 528848 Latency 30us Ifreq 4012800 Index 15
> > >
> > > ^^ exist because SCP reports duplicate values for the highest sustainable
> > > freq for perf domains 1 and 2. These are the only freqs that appear as
> > > duplicates and will be fixed with a firmware update. FWIW the warnings
> > > that we are addressing in this series will also get fixed by a firmware
> > > update but they still have to land for devices already out in the wild.
> > >
> > > V4:
> > > * Rework debugfs node creation patch [Ulf/Dmitry]
> > > * Reduce report level to dev_info and tag it with FW_BUG [Johan/Dmitry]
> > > * Add cc stable and err logs to patch 1 commit message [Johan]
> > 
> > Patch4 and patch5 applied for fixes to my pmdomain tree - and by
> > adding a stable tag to them, thanks!
> > 
> > Potentially I could help to take the other patches too, to keep things
> > together, but in that case I need confirmation that's okay to do so.
> 
> SCMI patches in these series are all reviewed (all but one even by Sudeep)
> so it is really up to Sudeep preference...(who is travelling now so it could
> take a bit to reply)

I have added my reviewed by now.

> ...moreover I am not sure if the SCMI patches in this
> series could end up with wome trivial conflicts against the scmi patches
> already queued at
> 
> 	sudeep/for-next/scmi/updates
> 
> (at least the perf related ones 2 and 3 probably not)
>

I did a quick check and no conflicts were observed. Let me know if you need
a branch with first 3 patches, but I need to do that today or after Sunday
as I will away from my computer for few more days again from tomorrow.

Let me know ASAP.

-- 
Regards,
Sudeep


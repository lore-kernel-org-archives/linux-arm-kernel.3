Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3548BF31E31
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Apr 2026 15:44:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hILjoPgiqB9ArBx18oLL5Kq/RwJaRbmI53OkeTSDO2c=; b=oqG/S7yzOeHWLeuykcMIbvbZ08
	bIPcGPLBcjD0E2k/V2uQJccU2pKFQIWeq0cFrfWzrft24but3FrAS6PaEgKhf2rhVply/XPSDz8x2
	ZA1kXHOL8YwRmJ2kD+59B+Hz0YL+t9guRsPw+4BFnBHt5t4zACBEVqBAxC4p7eoiuOxYzkUgmjbpb
	mFut/som+uAJQLsikPsDT6dp9NZW//R4yY3waEoK/hrbPuvHwP7Soy+DdX5/5GkrDrOTpxUL/xXQ1
	SIfydO82df2r37syrGHbPecZiuQWNEpWy6xicPx2wBs5sDX9VTxGwVfnHuDNH3xvIvN7JuB/eYTWn
	2VrovV3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wArYi-0000000Aoqd-1T9N;
	Thu, 09 Apr 2026 15:44:44 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wArYg-0000000AoqI-0KFI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Apr 2026 15:44:43 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 433162BC4;
	Thu,  9 Apr 2026 08:44:34 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A2CF53F632;
	Thu,  9 Apr 2026 08:44:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1775749480; bh=4RWl0dTNtutbYNl6i0YeFr+pdN+hsAkInOddbhx/bvE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jjR3NWRll6qDAfDUiVc7XXWoV122na/DvBKoEUqlEPbU2mN/UzUVqLSez1iuc1uZO
	 GjHlSRv1t+hyRW1zmFUci0PCqfU/XqGT2qwUaCpUimRBcqKNC/VENe/D6i+CnzNqEY
	 otMER8GmumQmHDlxx5l8qujC8iwpXZka/EVmKHf0=
Date: Thu, 9 Apr 2026 16:44:37 +0100
From: Leo Yan <leo.yan@arm.com>
To: James Clark <james.clark@linaro.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	Yeoreum Yun <yeoreum.yun@arm.com>,
	Mark Rutland <mark.rutland@arm.com>, Will Deacon <will@kernel.org>,
	Yabin Cui <yabinc@google.com>, Keita Morisaki <keyz@google.com>,
	Yuanfang Zhang <quic_yuanfang@quicinc.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Tamas Petz <tamas.petz@arm.com>, Thomas Gleixner <tglx@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@arm.com>
Subject: Re: [PATCH v10 16/20] coresight: Add PM callbacks for sink device
Message-ID: <20260409154437.GU356832@e132581.arm.com>
References: <20260405-arm_coresight_path_power_management_improvement-v10-0-13e94754a8be@arm.com>
 <20260405-arm_coresight_path_power_management_improvement-v10-16-13e94754a8be@arm.com>
 <e7c6f497-f8f0-409b-b80a-a064b222c08d@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e7c6f497-f8f0-409b-b80a-a064b222c08d@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260409_084442_240217_9CE931AD 
X-CRM114-Status: GOOD (  31.06  )
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

On Thu, Apr 09, 2026 at 11:52:00AM +0100, James Clark wrote:

[...]

> > @@ -1787,15 +1808,32 @@ static int coresight_pm_save(struct coresight_path *path)
> >   	to = list_prev_entry(coresight_path_last_node(path), link);
> >   	coresight_disable_path_from_to(path, from, to);
> > +	ret = coresight_pm_device_save(coresight_get_sink(path));
> > +	if (ret)
> > +		goto sink_failed;
> > +
> 
> The comment directly above this says "Up to the node before sink to avoid
> latency". But then this line goes and saves the sink anyway. So I'm not sure
> what's meant by the comment?

I will refine the comment to: "Control the path up to the node before
the _system_ sink to avoid latency caused by memory copying; afterwards,
saves context if the sink provides a callback".


> >   	return 0;
> > +
> > +sink_failed:
> > +	if (!coresight_enable_path_from_to(path, coresight_get_mode(source),
> > +					   from, to))
> > +		coresight_pm_device_restore(source);
> > +
> > +	pr_err("Failed in coresight PM save on CPU%d: %d\n",
> > +	       smp_processor_id(), ret);
> > +	this_cpu_write(percpu_pm_failed, true);
> 
> Why does only a failing sink set percpu_pm_failed when failing to save the
> source exits early.

My purpose is to use "percpu_pm_failed == true" to prevent further
issues if we already know the link has failed.  To be clear, this is not
a recovery mechanism; it simply means "if link enabling or disabling
fails in CPU PM, do not continue to avoid potential hardware lockups.”

The source save failure is a bit special, it fails at the beginning of
the CoreSight CPU PM flow, and the returned error prevents the CPU idle
flow from proceeding.  As a result, there is nothing further to do.

> Sashiko has a similar comment that this could result in
> restoring uninitialised source save data later, but a comment in this
> function about why the flow is like this would be helpful.

The comment of "Restoring uninitialised source save data later" does not
make sense.

When the save fails, the notifier only rolls back the callbacks that ran
before the failing callback by invoking CPU_PM_ENTER_FAILED.  And there
is no CPU_PM_EXIT, as the idle state is never entered.

> We have coresight_disable_path_from_to() which always succeeds and doesn't
> return an error. TRBE is the only sink with a pm_save_disable()
> callback, but it always succeeds anyway.
> 
> Would it not be much simpler to require that sink save/restore callbacks
> always succeed and don't return anything? Seems like this percpu_pm_failed
> stuff is extra complexity for a scenario that doesn't exist? The only thing
> that can fail is saving the source but it doesn't goto sink_failed when that
> happens.

As you suggested, I can simplify the code with assuming sink ops
always success, but we might expect complaints from Sashiko.

> Ideally etm4_cpu_save() wouldn't have a return value either. It would be
> good if we could find away to skip or ignore the timeouts in there somehow
> because that's the only reason it can fail.

Seems to me, ETMv4 has a timeout log and returns error is not bad, as
it can be helpful to locate issue in a cheap way (sometimes, hang
issue caused by lockup might be a time-consumed debugging).

Thanks,
Leo


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B94C7E9B361
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 10:47:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DAks2+uCr8s5khXU4zCF/Ly/YMx2xBgroa8/EVuyMJE=; b=PHiWussr73q6KUPq+6+IUg372y
	ZNYczMEjq+mrewV5H37i8A4UINwGuJcCY9fEyl3VP/vVjdXyLAcErPzhqxJPBxFMrRAqsd2+2Dvg0
	cOzRVtlq/Z+lmNRUkBBUx/+boIxqy4Bnna4yW8t1OISDu6Cgn1LF2HZNu8Y2TPtDcWbIpQaH33JTS
	bpmAR2RFlVC7ThtFhpdChTfPCLkwWDkzY2T/3T/Y5DHfWRYQ3vkWmtNau5dcQ51T0/n91IOfDexA0
	oYrK2eJ28fTmDsSiMUHAGUz4cyFN+VzUazmT8Htd+hBYeJJIijJ/h8YWvmPrnedP+D4tQATlDzh48
	XRbHN4xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx0oG-0000000Ck1r-1dhp;
	Mon, 02 Mar 2026 10:47:32 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx0oD-0000000Ck0T-3MBU
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Mar 2026 10:47:31 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6CA4F14BF;
	Mon,  2 Mar 2026 02:47:20 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CB0BD3F7BD;
	Mon,  2 Mar 2026 02:47:22 -0800 (PST)
Date: Mon, 2 Mar 2026 10:47:10 +0000
From: Cristian Marussi <cristian.marussi@arm.com>
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, sudeep.holla@arm.com,
	philip.radford@arm.com, james.quinlan@broadcom.com,
	f.fainelli@gmail.com, vincent.guittot@linaro.org,
	etienne.carriere@foss.st.com, michal.simek@amd.com,
	dan.carpenter@linaro.org, geert+renesas@glider.be,
	kuninori.morimoto.gx@renesas.com, marek.vasut+renesas@gmail.com
Subject: Re: [PATCH 11/11] firmware: arm_scmi: Introduce all_rates_get clock
 operation
Message-ID: <aaVqrsh_gd9meIWT@pluto>
References: <20260227153225.2778358-1-cristian.marussi@arm.com>
 <20260227153225.2778358-12-cristian.marussi@arm.com>
 <aaJXy2V7oI1tH4Ac@shlinux89>
 <aaLHuHFpcxdyqf9P@pluto>
 <aaU5xn/UlHeAhdxk@shlinux89>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aaU5xn/UlHeAhdxk@shlinux89>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_024729_971463_A98274E6 
X-CRM114-Status: GOOD (  23.64  )
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

On Mon, Mar 02, 2026 at 03:18:30PM +0800, Peng Fan wrote:
> On Sat, Feb 28, 2026 at 10:47:20AM +0000, Cristian Marussi wrote:
> >On Sat, Feb 28, 2026 at 10:49:47AM +0800, Peng Fan wrote:
> >> On Fri, Feb 27, 2026 at 03:32:25PM +0000, Cristian Marussi wrote:
> >> >Add a clock operation to get the whole set of rates available to a specific
> >> >clock: when needed this request could transparently trigger a full rate
> >> >discovery enumeration if this specific clock-rates were previously only
> >> >lazily enumerated.
> >> >

Hi,

> >> >Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
> >> >---
> >> > drivers/firmware/arm_scmi/clock.c | 85 +++++++++++++++++++++----------
> >> > include/linux/scmi_protocol.h     |  9 ++++
> >> > 2 files changed, 67 insertions(+), 27 deletions(-)

[snip]

> >> > 
> >> >-	if (clkd->rate_discrete)
> >> >-		sort(clkd->rates, clkd->num_rates,
> >> >-		     sizeof(clkd->rates[0]), rate_cmp_func, NULL);
> >> >+	if (clkd->r.rate_discrete && PROTOCOL_REV_MAJOR(ph->version) == 0x1)
> >> 
> >> Not understand well "PROTOCOL_REV_MAJOR(ph->version) == 0x1", I may
> >> get something wrong, should use ">="?
> >
> >I have NOT double checked BUT I think fro Etienne original patch, you
> >can assume that clock rates are returned by the platform in ascending
> >order (already sorted) only after Clock protocol version 0x01, the first
> >ever, so ONLY when teh used version is 0x1 we must perform a full scan
> >(no lazy optimization since we cannot assume that rates[last-1] is max
> >AND we must sort the obtained list of clocks...
> 
> Per https://developer.arm.com/documentation/den0056/c/?lang=en, SCMI version
> 3.0, CLOCK protocol version is 1.0, I see:
> "The clock rates returned by this call should be in numeric ascending order".
> 
> SCMI 2.0 also has it. But SCMI 1.0 does not have above line.
> 
> All the above specs are using CLOCK protocol version 1.0.
> 
> It might be overshoot, should the "PROTOCOL_REV_MAJOR(ph->version) == 0x1"
> be dropped, so always sort the array?

Yes there is a 'glitch' in the specs v1.0/v2.0/v3.0 since all reports
Clock proto version 0x10000 BUT the clarification around the ordering of
the returned rates is NOT always there, so, since we must be absolutely
pedantic to guarantee compatibility with any possible deployed SCMI/FW,
we cannot assume that any 0x10000 protocol return ordered rates: this
means that if proto==0x10000 we MUST sort AND we cannot play smart with
the new bound iterators since we are NOT assure that rates[0] AND
rates[last -1] contain respectively min and max rates...

On the other side for any protocol version != 0x10000 (i.e. v3.1/v3.2/v4.0)
we can assume those rates as ordered and so, on one side, we can run 'lazy'
partial enumerations AND, on the other side, we can avoid the overhead of
sorting with full scans enumerations.

Thanks,
Cristian


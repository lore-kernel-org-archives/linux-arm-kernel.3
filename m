Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FB4BFEE4EA
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Feb 2026 10:47:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GVlGi3j4PkJDHsdw19IKlaRiG75Sl9pcB7YeYpU83EQ=; b=jD0DMMaXLgOXpu0D5kwk9by+Og
	cBDc9cI0IR9FmVw+OVsWpLo65Bj0hcUkvgtvjgBMS7mMkrvhYhNQz7+KefXA9xDH10lj7TzUJxKxt
	PH/W0DktHQ5/erj2S2DFHzgdX08xk5bm9USQYTjAEZlFOeo6XDQWE8I5unlrDhu0QKHgBEHGL4Yje
	iubZVdeHMfaVFPdfFJy34NZZswKJM3gIPdpLk4Kw9FRm4/Xf1lgzbf0NR73ggeBFB4AOQMO/rW2Nk
	XkNWyvXX7byU1Qdam9VorENHO4AZI0Qv+UbLpuP2QGIKH5xB7tA83K6yPDUH7goUg/HP0AA//iTpT
	+aCjYClA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwHr8-00000009kih-377W;
	Sat, 28 Feb 2026 10:47:30 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwHr5-00000009kiL-3jtS
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Feb 2026 10:47:29 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6AB711516;
	Sat, 28 Feb 2026 02:47:20 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 17A713F7BD;
	Sat, 28 Feb 2026 02:47:22 -0800 (PST)
Date: Sat, 28 Feb 2026 10:47:20 +0000
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
Message-ID: <aaLHuHFpcxdyqf9P@pluto>
References: <20260227153225.2778358-1-cristian.marussi@arm.com>
 <20260227153225.2778358-12-cristian.marussi@arm.com>
 <aaJXy2V7oI1tH4Ac@shlinux89>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aaJXy2V7oI1tH4Ac@shlinux89>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260228_024728_325231_3B470CE4 
X-CRM114-Status: GOOD (  19.61  )
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

On Sat, Feb 28, 2026 at 10:49:47AM +0800, Peng Fan wrote:
> On Fri, Feb 27, 2026 at 03:32:25PM +0000, Cristian Marussi wrote:
> >Add a clock operation to get the whole set of rates available to a specific
> >clock: when needed this request could transparently trigger a full rate
> >discovery enumeration if this specific clock-rates were previously only
> >lazily enumerated.
> >
> >Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
> >---
> > drivers/firmware/arm_scmi/clock.c | 85 +++++++++++++++++++++----------
> > include/linux/scmi_protocol.h     |  9 ++++
> > 2 files changed, 67 insertions(+), 27 deletions(-)
> >
> >diff --git a/drivers/firmware/arm_scmi/clock.c b/drivers/firmware/arm_scmi/clock.c
> >index a0de10652abe..c2fd9a1c3316 100644
> >--- a/drivers/firmware/arm_scmi/clock.c
> >+++ b/drivers/firmware/arm_scmi/clock.c
> >@@ -159,10 +159,8 @@ struct scmi_clock_rate_notify_payld {
> > 
> > struct scmi_clock_desc {
> > 	u32 id;
> >-	bool rate_discrete;
> > 	unsigned int tot_rates;
> >-	unsigned int num_rates;
> >-	u64 *rates;
> >+	struct scmi_clock_rates r;
> > #define	RATE_MIN	0
> > #define	RATE_MAX	1
> > #define	RATE_STEP	2
> >@@ -469,10 +467,10 @@ iter_clk_describe_update_state(struct scmi_iterator_state *st,
> > 	flags = le32_to_cpu(r->num_rates_flags);
> > 	st->num_remaining = NUM_REMAINING(flags);
> > 	st->num_returned = NUM_RETURNED(flags);
> >-	p->clkd->rate_discrete = RATE_DISCRETE(flags);
> >+	p->clkd->r.rate_discrete = RATE_DISCRETE(flags);
> > 
> > 	/* Warn about out of spec replies ... */
> >-	if (!p->clkd->rate_discrete &&
> >+	if (!p->clkd->r.rate_discrete &&
> > 	    (st->num_returned != 3 || st->num_remaining != 0)) {
> > 		dev_warn(p->dev,
> > 			 "Out-of-spec CLOCK_DESCRIBE_RATES reply for %s - returned:%d remaining:%d rx_len:%zd\n",
> >@@ -486,9 +484,9 @@ iter_clk_describe_update_state(struct scmi_iterator_state *st,
> > 	if (!st->max_resources) {
> > 		unsigned int tot_rates = st->num_returned + st->num_remaining;
> > 
> >-		p->clkd->rates = devm_kcalloc(p->dev, tot_rates,
> >-					      sizeof(*p->clkd->rates), GFP_KERNEL);
> >-		if (!p->clkd->rates)
> >+		p->clkd->r.rates = devm_kcalloc(p->dev, tot_rates,
> >+						sizeof(*p->clkd->r.rates), GFP_KERNEL);
> >+		if (!p->clkd->r.rates)
> > 			return -ENOMEM;
> > 
> > 		/* max_resources is used by the iterators to control bounds */
> >@@ -507,10 +505,10 @@ iter_clk_describe_process_response(const struct scmi_protocol_handle *ph,
> > 	struct scmi_clk_ipriv *p = priv;
> > 	const struct scmi_msg_resp_clock_describe_rates *r = response;
> > 
> >-	p->clkd->rates[p->clkd->num_rates] = RATE_TO_U64(r->rate[st->loop_idx]);
> >+	p->clkd->r.rates[p->clkd->r.num_rates] = RATE_TO_U64(r->rate[st->loop_idx]);
> > 
> > 	/* Count only effectively discovered rates */
> >-	p->clkd->num_rates++;
> >+	p->clkd->r.num_rates++;
> > 
> > 	return 0;
> > }
> >@@ -531,7 +529,13 @@ scmi_clock_describe_rates_get_full(const struct scmi_protocol_handle *ph,
> > 		.dev = ph->dev,
> > 	};
> > 
> >-	iter = ph->hops->iter_response_init(ph, &ops, 0, CLOCK_DESCRIBE_RATES,
> >+	/*
> >+	 * Using tot_rates as max_resources parameter here so as to trigger
> >+	 * the dynamic allocation only when strictly needed: when trying a
> >+	 * full enumeration after a lazy one tot_rates will be non-zero.
> >+	 */
> >+	iter = ph->hops->iter_response_init(ph, &ops, clkd->tot_rates,
> >+					    CLOCK_DESCRIBE_RATES,
> > 					    sizeof(struct scmi_msg_clock_describe_rates),
> > 					    &cpriv);
> > 	if (IS_ERR(iter))
> >@@ -542,12 +546,12 @@ scmi_clock_describe_rates_get_full(const struct scmi_protocol_handle *ph,
> > 		return ret;
> > 
> > 	/* empty set ? */
> >-	if (!clkd->num_rates)
> >+	if (!clkd->r.num_rates)
> > 		return 0;
> > 
> >-	if (clkd->rate_discrete)
> >-		sort(clkd->rates, clkd->num_rates,
> >-		     sizeof(clkd->rates[0]), rate_cmp_func, NULL);
> >+	if (clkd->r.rate_discrete && PROTOCOL_REV_MAJOR(ph->version) == 0x1)
> 
> Not understand well "PROTOCOL_REV_MAJOR(ph->version) == 0x1", I may
> get something wrong, should use ">="?

I have NOT double checked BUT I think fro Etienne original patch, you
can assume that clock rates are returned by the platform in ascending
order (already sorted) only after Clock protocol version 0x01, the first
ever, so ONLY when teh used version is 0x1 we must perform a full scan
(no lazy optimization since we cannot assume that rates[last-1] is max
AND we must sort the obtained list of clocks...

Thanks,
Cristian


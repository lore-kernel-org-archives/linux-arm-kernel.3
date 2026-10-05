Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A015CA5FF0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Oct 2026 15:31:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K1L8YDaCe7N34XHyQCY1+QmM5CdC/FpgF3HSRWTxRKo=; b=wiAcLu9aIw7Pf12Mi6u5ORBPFD
	CfR+9FBVo6NOCG/jrtONqcGbXgq5H+VVs+QWaXKVbo2RLxXt2Rl/dIPOwrgtWFDEmY00qn6Vsm3AF
	n/dI8uwgfwmY+meE7BP3BvuHDPs0pIiCMK22CNQtiA2Ze6WAFgudzSUwmG8ycZGXL1RlDjL1llQIW
	TUGapHk7tRunpzjsm3t5yFQeng57EcD0NE9a2+8f3luVhRH+zHCYHDnPLq6WazzXY0pNvJKu3h9W7
	0vdJmDirxCTDcn54nvC35x3n9WeitHTAkufFqcxj+VrBu7TEkB4EUlqZPzewhWIaoYAbk4XGxYjcb
	eD42zN8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDkfG-0000000GlBM-3wZt;
	Mon, 05 Oct 2026 15:31:42 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDkfE-0000000GlAi-2qlM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Oct 2026 15:31:41 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C694E60A64;
	Mon,  5 Oct 2026 15:31:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 201111F00893;
	Mon,  5 Oct 2026 15:31:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791214299;
	bh=K1L8YDaCe7N34XHyQCY1+QmM5CdC/FpgF3HSRWTxRKo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=YVAC7XicLNVuCWlG033oNrN+soEBb77NoN8O3cCeWuu1fNPL1MlNmDBSDqXUCmcjQ
	 40XUBMWITyhdGLKqZ78mV9Sehr6jK2mOfaoY7sXTuXxkUOhKTO5MR916QA6ZHnkezm
	 IgclDdmQWGezk4zE1Hhpuup8zbMH0VWEjT601E7rOg4wS/lwJ0g3w8zZJ1JVAx3flN
	 PUAFjum12PuM8IwiwAHLxsoR+6PkwEMqEryDHi0zQLg4jXZFi7CxJYxuCxfOFyqWRG
	 7FxORjYdIv+3j8+dKrNOkYPbuJm47Kq6+O3OTYzN/NxaYqsaSgMTeDOPcVmdGfEXrn
	 bRgMNduKVsung==
Date: Mon, 5 Oct 2026 16:31:35 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Jay Buddhabhatti <jbuddhab@amd.com>
Cc: Jay Buddhabhatti <jay.buddhabhatti@amd.com>, cristian.marussi@arm.com,
	Sudeep Holla <sudeep.holla@kernel.org>, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	git@amd.com
Subject: Re: [RFC PATCH] firmware: arm_scmi: skip empty CLOCK_DESCRIBE_RATES
 replies
Message-ID: <20261005-powerful-skilled-caterpillar-e2fdeb@sudeepholla>
References: <20261001114538.671755-1-jay.buddhabhatti@amd.com>
 <20261001-persimmon-wallaby-of-popularity-c29bf3@sudeepholla>
 <00a75d3c-f863-4ed2-aa3f-a6668e5f74f0@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <00a75d3c-f863-4ed2-aa3f-a6668e5f74f0@amd.com>
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

On Mon, Oct 05, 2026 at 06:06:09PM +0530, Jay Buddhabhatti wrote:
> Hi Sudeep,
> 
> Thanks for the review. Please find my response inline.
> 
> On 10/1/2026 8:14 PM, Sudeep Holla wrote:
> > On Thu, Oct 01, 2026 at 04:45:38AM -0700, Jay Buddhabhatti wrote:
> > > Some platforms advertise reserved or uninstantiated clock IDs that still
> > > succeed CLOCK_DESCRIBE_RATES with zero rates. After dynamic rate
> > > allocation, kcalloc(0) returns ZERO_SIZE_PTR and protocol init then
> > > dereferences rates[0], which panics.
> > > 
> > > Do not allocate or index the rate array when the firmware reports an
> > > empty list, so unused IDs are skipped instead of taking down the SCMI
> > > clock provider.
> > > 
> > > Fixes: 62ba967595e0 ("firmware: arm_scmi: Make clock rates allocation dynamic")
> > > Signed-off-by: Jay Buddhabhatti <jay.buddhabhatti@amd.com>
> > > ---
> > > The SCMI server is the source of this zero rate and successful response
> > > and it should be fixed in SCMI server. This defensive check in Linux is
> > > still useful because firmware responses must be validated before
> > > de-referencing dynamically allocated data, The panic is a Linux
> > > regression introduced by dynamic rate allocation; previous fixed array
> > > tolerated the same response and other SCMI implementations could return
> > > the same unexpected response.
> > > ---
> > >   drivers/firmware/arm_scmi/clock.c | 18 ++++++++++++++++++
> > >   1 file changed, 18 insertions(+)
> > > 
> > > diff --git a/drivers/firmware/arm_scmi/clock.c b/drivers/firmware/arm_scmi/clock.c
> > > index 0278705d809e..8934a95527e2 100644
> > > --- a/drivers/firmware/arm_scmi/clock.c
> > > +++ b/drivers/firmware/arm_scmi/clock.c
> > > @@ -8,6 +8,7 @@
> > >   #include <linux/math64.h>
> > >   #include <linux/module.h>
> > >   #include <linux/limits.h>
> > > +#include <linux/slab.h>
> > >   #include <linux/sort.h>
> > >   #include "protocols.h"
> > > @@ -484,6 +485,13 @@ iter_clk_describe_update_state(struct scmi_iterator_state *st,
> > >   	if (!st->max_resources) {
> > >   		unsigned int tot_rates = st->num_returned + st->num_remaining;
> > > +		/*
> > > +		 * Unused/reserved clock IDs return 0 rates. kmalloc(0)
> > > +		 * returns ZERO_SIZE_PTR and must not be dereferenced.
> > > +		 */
> > > +		if (!tot_rates)
> > > +			return 0;
> > > +
> > >   		p->clkd->r.rates = devm_kcalloc(p->dev, tot_rates,
> > >   						sizeof(*p->clkd->r.rates), GFP_KERNEL);
> > >   		if (!p->clkd->r.rates)
> > > @@ -505,6 +513,9 @@ iter_clk_describe_process_response(const struct scmi_protocol_handle *ph,
> > >   	struct scmi_clk_ipriv *p = priv;
> > >   	const struct scmi_msg_resp_clock_describe_rates *r = response;
> > > +	if (ZERO_OR_NULL_PTR(p->clkd->r.rates))
> > > +		return -EPROTO;
> > > +
> > >   	p->clkd->r.rates[p->clkd->r.num_rates] = RATE_TO_U64(r->rate[st->loop_idx]);
> > >   	/* Count only effectively discovered rates */
> > > @@ -622,6 +633,13 @@ scmi_clock_describe_rates_get(const struct scmi_protocol_handle *ph,
> > >   	if (ret)
> > >   		return ret;
> > > +	/*
> > > +	 * Some platforms expose reserved clock IDs with an empty
> > > +	 * CLOCK_DESCRIBE_RATES reply. Do not dereference rates[].
> > > +	 */
> > > +	if (!clkd->r.num_rates || ZERO_OR_NULL_PTR(clkd->r.rates))
> > > +		return 0;
> > > +
> > 
> > I expect the Clock rate control bit to be unset in the permissions for
> > these clock, else it may be dangerous to do this. Please add that check.
> 
> I will add that check in new version. If the Clock rate control bit is set,
> Linux clears its local copy by setting rate_ctrl_forbidden. The clock
> remains registered, but clk-scmi does not install set_rate and
> scmi_clock_rate_set() returns -EACCES. This avoids exposing rate changes
> when no valid rates were described.
> 

You did mention this is issue in the firmware. If the generic solution(once
agreed upon) doesn't work on your platform, then you need to fix it with
a quirk I am afraid. I will let you propose the patch and take it from there.

-- 
Regards,
Sudeep


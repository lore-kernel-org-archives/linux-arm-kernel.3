Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89717D132D3
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Nov 2024 14:40:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tpOWGq9R8v/JwbNCsA3k+VF3SVlSGnis2hBKBhZL2Qw=; b=rXml/qe6d6XeQUCfpUujzlbAGl
	1JTEL5Y3mKdUB98RWD3gsvETcJvtk+UpxQspYpoegTdt+1sQyhH/Ilx/9N07U2ovj5EprOLyZYWxN
	yetCnazHSVwxiwDFLNnaaqFR++G0RRPEIFrHvQRKSnrQOJ0YizPKegttmDpuI/5pnpl7dBrWK65Hj
	1hY3L+9sIJJZL43+U2qJM1G+7CJS7QTpDNSVdDVPP76pXrjxlGPyoRVFXfWmAuTfNgwYIPtN28I5E
	R664ZnNg9HwB7AysUeVV09+WMM7Es8ZZrOTChMLoLAqQGyRjxy//bYrRYtBqg5av1VPDobzn+NE0G
	jxeE5XOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7yFV-0000000E5Kr-2I3Q;
	Mon, 04 Nov 2024 14:40:09 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7xka-0000000Dzgn-3aj4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Nov 2024 14:08:15 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 46138FEC;
	Mon,  4 Nov 2024 06:08:40 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E3DB03F6A8;
	Mon,  4 Nov 2024 06:08:07 -0800 (PST)
Date: Mon, 4 Nov 2024 14:07:56 +0000
From: Cristian Marussi <cristian.marussi@arm.com>
To: Sibi Sankar <quic_sibis@quicinc.com>
Cc: Johan Hovold <johan@kernel.org>, sudeep.holla@arm.com,
	cristian.marussi@arm.com, ulf.hansson@linaro.org,
	jassisinghbrar@gmail.com, dmitry.baryshkov@linaro.org,
	linux-kernel@vger.kernel.org, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	konradybcio@kernel.org, linux-pm@vger.kernel.org,
	tstrudel@google.com, rafael@kernel.org,
	Johan Hovold <johan+linaro@kernel.org>
Subject: Re: [PATCH V5 3/6] firmware: arm_scmi: Report duplicate opps as
 firmware bugs
Message-ID: <ZyjVMBtm0eLoDlYK@pluto>
References: <20241030125512.2884761-1-quic_sibis@quicinc.com>
 <20241030125512.2884761-4-quic_sibis@quicinc.com>
 <ZyThAFbOHKaBIgLg@hovoldconsulting.com>
 <e173058b-57e7-7fd0-dab7-7398bf9d66ec@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e173058b-57e7-7fd0-dab7-7398bf9d66ec@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_060813_002323_4273ED4E 
X-CRM114-Status: GOOD (  24.69  )
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

On Mon, Nov 04, 2024 at 07:20:01PM +0530, Sibi Sankar wrote:
> 
> 
> On 11/1/24 19:39, Johan Hovold wrote:
> > On Wed, Oct 30, 2024 at 06:25:09PM +0530, Sibi Sankar wrote:
> > > Duplicate opps reported by buggy SCP firmware currently show up
> > > as warnings even though the only functional impact is that the
> > > level/index remain inaccessible. Make it less scary for the end
> > > user by using dev_info instead, along with FW_BUG tag.
> > > 
> > > Suggested-by: Johan Hovold <johan+linaro@kernel.org>
> > > Signed-off-by: Sibi Sankar <quic_sibis@quicinc.com>
> > > ---
> > >   drivers/firmware/arm_scmi/perf.c | 4 ++--
> > >   1 file changed, 2 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/drivers/firmware/arm_scmi/perf.c b/drivers/firmware/arm_scmi/perf.c
> > > index 32f9a9acd3e9..c7e5a34b254b 100644
> > > --- a/drivers/firmware/arm_scmi/perf.c
> > > +++ b/drivers/firmware/arm_scmi/perf.c
> > > @@ -387,7 +387,7 @@ process_response_opp(struct device *dev, struct perf_dom_info *dom,
> > >   	ret = xa_insert(&dom->opps_by_lvl, opp->perf, opp, GFP_KERNEL);
> > >   	if (ret) {
> > > -		dev_warn(dev, "Failed to add opps_by_lvl at %d for %s - ret:%d\n",
> > > +		dev_info(dev, FW_BUG "Failed to add opps_by_lvl at %d for %s - ret:%d\n",
> > >   			 opp->perf, dom->info.name, ret);
> > 
> > I was hoping you could make the error message a bit more informative as
> > well, for example, by saying that a duplicate opp level was ignored:
> > 
> > 	arm-scmi arm-scmi.0.auto: [Firmware Bug]: Ignoring duplicate OPP 3417600 for NCC
> 
> I did think about doing something similar but xa_insert can fail
> with both -EXIST (duplicate) and -ENOMEM, so the we can't really
> use term duplicate when insert fails. I can add the perf level
> though to the message though.
> 

It is the caller iter_perf_levels_process_response() of the above
helpers that is in charge to check the retval and decide what to do:
if it is a -EBUSY it just bails out returning 0 (SKIP) otherwise returns
the error... (and anyway the warn/info had already been given)

Originally the message was generic exactly for this reason...making some
noise to have fw/guys fix it and carry on...or fail completely the otehr
way...

I suppose you should move the error message in the caller if you want
to attain this level of information for the user...if not you are also
making noise potentially for nothing by saying FW_BUG on an -ENOMEM...

....anyway, on the otehr side, on the -ENOMEM path there is probably
really no need to say anything in any case...things are going terribly
wrong and you will notice soon in the form of a total failure of the stack,
most probably.

Thanks,
Cristian


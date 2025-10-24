Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A00C7CCD1AB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Oct 2025 10:33:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N7r5yeFAsLsoOCgMY3/DknOntpwvJU8a9jXgtliVyZQ=; b=uXlYp7+HZLzml/ZRjyopNvrUOE
	4Jda7Ga7ebL5/Uu3KcO6QbfNYElUSBBr/HI5RDeswhv27mG+s0cOdqPr1zYon2Q468x05tRc5vkOE
	R13z20I82iPyd249+MzV1moz8P5nGAS5M+D4stjbwZiLF7H0KbrNsNNTHk5pxG2GR37SKfLnO8Fyh
	MtF8cRCo1BQFQDamhqrEIHAMvZWmOnrzQEuZoYDgQ8okzCKAe9nm7RpFMSZuD0nuVBRlTD0Yox5T4
	1S76BSa8B5GfeWBnyLcBOfTd9cw/1DZh7EJaSs52gzn6c7q4rIGmUwFex6P03CTWwPLjHAzbEzBSH
	RSCYcmbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCF77-000000092Xi-1Pey;
	Fri, 24 Oct 2025 10:33:41 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCF74-000000092Wl-0fOk
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Oct 2025 10:33:40 +0000
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4ctK0m2mF5z6GDDv;
	Fri, 24 Oct 2025 18:30:16 +0800 (CST)
Received: from dubpeml100005.china.huawei.com (unknown [7.214.146.113])
	by mail.maildlp.com (Postfix) with ESMTPS id 667CD140372;
	Fri, 24 Oct 2025 18:33:34 +0800 (CST)
Received: from localhost (10.203.177.15) by dubpeml100005.china.huawei.com
 (7.214.146.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Fri, 24 Oct
 2025 11:33:33 +0100
Date: Fri, 24 Oct 2025 11:33:29 +0100
From: Jonathan Cameron <jonathan.cameron@huawei.com>
To: Cristian Marussi <cristian.marussi@arm.com>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<arm-scmi@vger.kernel.org>, <sudeep.holla@arm.com>,
	<james.quinlan@broadcom.com>, <f.fainelli@gmail.com>,
	<vincent.guittot@linaro.org>, <etienne.carriere@st.com>,
	<peng.fan@oss.nxp.com>, <michal.simek@amd.com>, <quic_sibis@quicinc.com>,
	<dan.carpenter@linaro.org>, <d-gole@ti.com>, <souvik.chakravarty@arm.com>
Subject: Re: [PATCH 06/10] firmware: arm_scmi: Add System Telemetry driver
Message-ID: <20251024113329.0000146e@huawei.com>
In-Reply-To: <aPeu2E-jfhcw7P_q@pluto>
References: <20250925203554.482371-1-cristian.marussi@arm.com>
	<20250925203554.482371-7-cristian.marussi@arm.com>
	<20251020172328.00002fc3@huawei.com>
	<aPdf9lyY9ysq2mPx@pluto>
	<20251021161529.00001468@huawei.com>
	<aPeu2E-jfhcw7P_q@pluto>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.15]
X-ClientProxiedBy: lhrpeml100009.china.huawei.com (7.191.174.83) To
 dubpeml100005.china.huawei.com (7.214.146.113)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251024_033338_486972_BD74C3FB 
X-CRM114-Status: GOOD (  28.38  )
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

On Tue, 21 Oct 2025 17:03:36 +0100
Cristian Marussi <cristian.marussi@arm.com> wrote:

> On Tue, Oct 21, 2025 at 04:15:29PM +0100, Jonathan Cameron wrote:
> > On Tue, 21 Oct 2025 11:27:02 +0100
> > Cristian Marussi <cristian.marussi@arm.com> wrote:
> >   
> > > On Mon, Oct 20, 2025 at 05:23:28PM +0100, Jonathan Cameron wrote:  
> > > > On Thu, 25 Sep 2025 21:35:50 +0100
> > > > Cristian Marussi <cristian.marussi@arm.com> wrote:
> > > >     
> > > > > Add a new SCMI System Telemetry driver which gathers platform Telemetry
> > > > > data through the new the SCMI Telemetry protocol and expose all of the
> > > > > discovered Telemetry data events on a dedicated pseudo-filesystem that
> > > > > can be used to interactively configure SCMI Telemetry and access its
> > > > > provided data.    
> > > >    
> > > 
> > > Hi,
> > >    
> > > > I'm not a fan of providing yet another filesystem but you didn't  
> > 
> > "did" was what this was meant to say.
> > 
> > Sorry for the confusing garbage comment from me!
> >   
> > > > lay out reasoning in the cover letter.    
> > > 
> > > Sorry, I dont understand..you mean here that I did NOT provide enough reasons
> > > why I am adopting a new FS approach ? ... or I misunderstood the English ?
> > > 
> > > .. because I did provide a lot of reasons (for my point-of-view) to go
> > > for a new FS in the cover-letter...
> > >   
> > > > 
> > > > One non trivial issue is that you'll have to get filesystem review on this.
> > > > My review is rather superficial but a few things stood out.    
> > > 
> > > Well yes I would have expected that, but now the FS implementation
> > > internals of this series is definetely immature and to be reworked (to
> > > the extent of using a well-know deprecated FS mount api at first..)
> > > 
> > > So I posted this V1 to lay-out the ideas and the effective FS API layout
> > > but I was planning to extend the review audience once I have reworked fully
> > > the series FS bits in the next V2...  
> > 
> > I'd suggest ABI docs for v2. That will match what you have in the cover letter
> > but put it in the somewhat formal description format of Documentation/ABI/
> >   
> 
> Oh yes of course... the while docs/ stuff is still TBD...btw I am not even
> sure if the whole driver will be required to be moved into fs/ as a
> requirement while doing filesystem review...I suppose I will leave this
> sort of reworks for the next reviews cycles....
> 
> ...and...if I may ask... is it linux-fsdevel the ML for this fs-related
> stuff I suppose...not sure about maintainers looking at MAINTAINERS ...

Seems resonable but beyond that I have no idea.

Give it a go and see what happens.  Probably also include kernfs related folk
directly. They are likely to have opinions and might review if they have time.


Jonathan
> 
> Thanks a lot for having a look Jonathan.
> Cristian
> 



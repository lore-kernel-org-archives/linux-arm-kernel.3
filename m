Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5665CCD184
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Oct 2025 16:04:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SctH2hWTeGbIwQE+zu5LiE7iF8vO8myozltN2fIzCFY=; b=Qju6mCfWNpJopgZObxFcsokyjG
	Ahpzew3zK0DDSo7oySaksixNCm7me8CMhY1lrGJRh4q34ep08xB0vnzMvuv2pqGtmwIrYUEujKqTP
	IaGv/TiteD6N7Tag4vA8DpVDSOuKkVIEXJYg+hG3IifAd0Cfen/4f1bXVA3Ks3bveIaFmJLrX7XGp
	WJuz8AgW0dT1nOlUZdTCJfIpare4wQceOlPI+46UT1n6gNjkQt9u2eqwJ7MiKIeJkFlRDAsXV8mMQ
	JnyV2ox6Ar1fa74MdgQ1kW9n3DJjz+9j7LcDNfsi5o030WNvN+Uy358L3H1wl2ojPDUlIiHkQLrhg
	j2iOBavQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBEq4-000000002mL-0Bae;
	Tue, 21 Oct 2025 16:03:56 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBEq1-000000002kI-0Dma
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Oct 2025 16:03:54 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 52E0D1063;
	Tue, 21 Oct 2025 09:03:39 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D8CD03F66E;
	Tue, 21 Oct 2025 09:03:44 -0700 (PDT)
Date: Tue, 21 Oct 2025 17:03:36 +0100
From: Cristian Marussi <cristian.marussi@arm.com>
To: Jonathan Cameron <jonathan.cameron@huawei.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org, sudeep.holla@arm.com,
	james.quinlan@broadcom.com, f.fainelli@gmail.com,
	vincent.guittot@linaro.org, etienne.carriere@st.com,
	peng.fan@oss.nxp.com, michal.simek@amd.com, quic_sibis@quicinc.com,
	dan.carpenter@linaro.org, d-gole@ti.com, souvik.chakravarty@arm.com
Subject: Re: [PATCH 06/10] firmware: arm_scmi: Add System Telemetry driver
Message-ID: <aPeu2E-jfhcw7P_q@pluto>
References: <20250925203554.482371-1-cristian.marussi@arm.com>
 <20250925203554.482371-7-cristian.marussi@arm.com>
 <20251020172328.00002fc3@huawei.com>
 <aPdf9lyY9ysq2mPx@pluto>
 <20251021161529.00001468@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251021161529.00001468@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251021_090353_128243_7B38A434 
X-CRM114-Status: GOOD (  27.31  )
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

On Tue, Oct 21, 2025 at 04:15:29PM +0100, Jonathan Cameron wrote:
> On Tue, 21 Oct 2025 11:27:02 +0100
> Cristian Marussi <cristian.marussi@arm.com> wrote:
> 
> > On Mon, Oct 20, 2025 at 05:23:28PM +0100, Jonathan Cameron wrote:
> > > On Thu, 25 Sep 2025 21:35:50 +0100
> > > Cristian Marussi <cristian.marussi@arm.com> wrote:
> > >   
> > > > Add a new SCMI System Telemetry driver which gathers platform Telemetry
> > > > data through the new the SCMI Telemetry protocol and expose all of the
> > > > discovered Telemetry data events on a dedicated pseudo-filesystem that
> > > > can be used to interactively configure SCMI Telemetry and access its
> > > > provided data.  
> > >  
> > 
> > Hi,
> >  
> > > I'm not a fan of providing yet another filesystem but you didn't
> 
> "did" was what this was meant to say.
> 
> Sorry for the confusing garbage comment from me!
> 
> > > lay out reasoning in the cover letter.  
> > 
> > Sorry, I dont understand..you mean here that I did NOT provide enough reasons
> > why I am adopting a new FS approach ? ... or I misunderstood the English ?
> > 
> > .. because I did provide a lot of reasons (for my point-of-view) to go
> > for a new FS in the cover-letter...
> > 
> > > 
> > > One non trivial issue is that you'll have to get filesystem review on this.
> > > My review is rather superficial but a few things stood out.  
> > 
> > Well yes I would have expected that, but now the FS implementation
> > internals of this series is definetely immature and to be reworked (to
> > the extent of using a well-know deprecated FS mount api at first..)
> > 
> > So I posted this V1 to lay-out the ideas and the effective FS API layout
> > but I was planning to extend the review audience once I have reworked fully
> > the series FS bits in the next V2...
> 
> I'd suggest ABI docs for v2. That will match what you have in the cover letter
> but put it in the somewhat formal description format of Documentation/ABI/
> 

Oh yes of course... the while docs/ stuff is still TBD...btw I am not even
sure if the whole driver will be required to be moved into fs/ as a
requirement while doing filesystem review...I suppose I will leave this
sort of reworks for the next reviews cycles....

...and...if I may ask... is it linux-fsdevel the ML for this fs-related
stuff I suppose...not sure about maintainers looking at MAINTAINERS ...

Thanks a lot for having a look Jonathan.
Cristian


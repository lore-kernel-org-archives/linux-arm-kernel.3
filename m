Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29EDBCCD1A7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Oct 2025 15:15:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J2ELsVcDnKwRB57E7ogJcKSZ6lVJDxlVGwUTuNiPK3g=; b=J8ESxPh636OS6d+BGqQDxkXkXV
	Cb53mdeO54aUY5QMLlenlG5zw/VsT49Xu6x9PObyFkh+9MsyB21xBc3DV+ZAEvOlyPYI8agdPDaCX
	gZSN2yRtXQ2+/h48yasQt+CrbU/19bGrImTI6gWWJ/OI6gV5R68l+3MBbqlsfPGPlp94qzCmlb1wA
	8rn4fJijyqM98xopLlQYdB4RM3Tfa9EivPf+Nk09JVt7wg8B2ZV337eZCTBJhSAC1sHPynlJ2iDsT
	c5QGi1vidiQyxNPeasbrjj/03dDmTDFE8+Tg+dhKdjn2prKsKgvortU7ueoWjiy43t/mhw4roDNxX
	vANTc22w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBE5V-0000000HT2g-0s42;
	Tue, 21 Oct 2025 15:15:49 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBE5R-0000000HT0l-2uPb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Oct 2025 15:15:48 +0000
Received: from mail.maildlp.com (unknown [172.18.186.31])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4crbPf3q5jz6D8gw;
	Tue, 21 Oct 2025 23:12:22 +0800 (CST)
Received: from dubpeml100005.china.huawei.com (unknown [7.214.146.113])
	by mail.maildlp.com (Postfix) with ESMTPS id 992A914011A;
	Tue, 21 Oct 2025 23:15:32 +0800 (CST)
Received: from localhost (10.203.177.15) by dubpeml100005.china.huawei.com
 (7.214.146.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Tue, 21 Oct
 2025 16:15:31 +0100
Date: Tue, 21 Oct 2025 16:15:29 +0100
From: Jonathan Cameron <jonathan.cameron@huawei.com>
To: Cristian Marussi <cristian.marussi@arm.com>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<arm-scmi@vger.kernel.org>, <sudeep.holla@arm.com>,
	<james.quinlan@broadcom.com>, <f.fainelli@gmail.com>,
	<vincent.guittot@linaro.org>, <etienne.carriere@st.com>,
	<peng.fan@oss.nxp.com>, <michal.simek@amd.com>, <quic_sibis@quicinc.com>,
	<dan.carpenter@linaro.org>, <d-gole@ti.com>, <souvik.chakravarty@arm.com>
Subject: Re: [PATCH 06/10] firmware: arm_scmi: Add System Telemetry driver
Message-ID: <20251021161529.00001468@huawei.com>
In-Reply-To: <aPdf9lyY9ysq2mPx@pluto>
References: <20250925203554.482371-1-cristian.marussi@arm.com>
	<20250925203554.482371-7-cristian.marussi@arm.com>
	<20251020172328.00002fc3@huawei.com>
	<aPdf9lyY9ysq2mPx@pluto>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.15]
X-ClientProxiedBy: lhrpeml100012.china.huawei.com (7.191.174.184) To
 dubpeml100005.china.huawei.com (7.214.146.113)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251021_081545_877044_6C478FCC 
X-CRM114-Status: GOOD (  20.91  )
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

On Tue, 21 Oct 2025 11:27:02 +0100
Cristian Marussi <cristian.marussi@arm.com> wrote:

> On Mon, Oct 20, 2025 at 05:23:28PM +0100, Jonathan Cameron wrote:
> > On Thu, 25 Sep 2025 21:35:50 +0100
> > Cristian Marussi <cristian.marussi@arm.com> wrote:
> >   
> > > Add a new SCMI System Telemetry driver which gathers platform Telemetry
> > > data through the new the SCMI Telemetry protocol and expose all of the
> > > discovered Telemetry data events on a dedicated pseudo-filesystem that
> > > can be used to interactively configure SCMI Telemetry and access its
> > > provided data.  
> >  
> 
> Hi,
>  
> > I'm not a fan of providing yet another filesystem but you didn't

"did" was what this was meant to say.

Sorry for the confusing garbage comment from me!

> > lay out reasoning in the cover letter.  
> 
> Sorry, I dont understand..you mean here that I did NOT provide enough reasons
> why I am adopting a new FS approach ? ... or I misunderstood the English ?
> 
> .. because I did provide a lot of reasons (for my point-of-view) to go
> for a new FS in the cover-letter...
> 
> > 
> > One non trivial issue is that you'll have to get filesystem review on this.
> > My review is rather superficial but a few things stood out.  
> 
> Well yes I would have expected that, but now the FS implementation
> internals of this series is definetely immature and to be reworked (to
> the extent of using a well-know deprecated FS mount api at first..)
> 
> So I posted this V1 to lay-out the ideas and the effective FS API layout
> but I was planning to extend the review audience once I have reworked fully
> the series FS bits in the next V2...

I'd suggest ABI docs for v2. That will match what you have in the cover letter
but put it in the somewhat formal description format of Documentation/ABI/


THanks,

Jonathan

> 



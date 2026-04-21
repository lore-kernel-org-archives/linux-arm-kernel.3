Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA6F2F8FA78
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Apr 2026 14:23:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xvFwfIuWj1RQ2CpiB0+Q1xKhkm2MsAWIHSxzMcKjdgU=; b=uR9udXESzqn/Bx/Nr4iQngYtD0
	k7bl2xCmoKH5wx1Eyg+I7VA4aC8G8ikYbaYr6ewSwuXQSwYT3DeWQm9VFQxxIZofA4C3gyhCrhAKg
	DBH2ePyPUIR+DUZPIJtBk2NidJnJCOHl+he3/ozOptKG1yMUoqjecekhwltmEI1voAEnlTJ4wsgl0
	M1ZUd5pgTBNDZrgm610ejYWmCDy0DTlujM8TTGFgIQI5i6OwPoIJXprs4fygvj86tk9iFcDp2XxZN
	IvbKveg4cdPFup7KWo+3VlvyfiQBSuBFtNaf6VdEEOD9h6zrvO3iUr3DI2uGTOiYnPAXK+lOfDM1i
	VByIrRWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFC0O-00000008jTr-1vUa;
	Tue, 21 Apr 2026 14:23:12 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFC0L-00000008jT1-0zSu
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Apr 2026 14:23:10 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BF05325DC;
	Tue, 21 Apr 2026 07:23:02 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.1.197.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 315553F915;
	Tue, 21 Apr 2026 07:23:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1776781388; bh=KM8s3Go6l2LinwodbbP9q2DHUf200LaOlGtLx14cocs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CmfR+UJqltBJNaPJGqeM1P3Hn7uquZiUo7Tucn8eYQehbesNLVsN+ejUGefkf5ZBt
	 22PYhattW5vBD73xTVajKCb10u2UvnGclQJDjqh05rxzseu9e28QpCMqr+jVvsENy7
	 cvr4wKWdtbx5QtXKAV9258/ZwuTUXR9SFnv0ocYI=
Date: Tue, 21 Apr 2026 15:23:04 +0100
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: Mike Leach <mike.leach@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, Leo Yan <leo.yan@arm.com>,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, james.clark@linaro.org,
	alexander.shishkin@linux.intel.com, jie.gan@oss.qualcomm.com
Subject: Re: [PATCH v5 04/12] coresight: etm4x: exclude ss_status from
 drvdata->config
Message-ID: <aeeISNE4lfklUQ3M@e129823.arm.com>
References: <20260415165528.3369607-1-yeoreum.yun@arm.com>
 <20260415165528.3369607-5-yeoreum.yun@arm.com>
 <20260416155118.GM356832@e132581.arm.com>
 <57dbea1b-670b-4b8f-a590-1d4239bc2c76@arm.com>
 <f2b0dcc5-8002-4ee9-a219-fb361573a9c3@arm.com>
 <aedLaFhwyYMM8tUw@e129823.arm.com>
 <aedRqhC1JcoeV+R2@e129823.arm.com>
 <c4d90a5e-d28c-49b3-ad6e-4f045769a44f@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c4d90a5e-d28c-49b3-ad6e-4f045769a44f@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260421_072309_337107_A600DF31 
X-CRM114-Status: GOOD (  26.97  )
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

Hi Mike,

> Hi,
>
> On 4/21/26 11:30, Yeoreum Yun wrote:
> > > Hi Mike,
> > >
> > > > Hi,
> > > >
> > > > This register [bit 31] indicates if a single shot comparator has matched. So
> > > > read-back provides information to the user post run to determine which if
> > > > any of the comparators set in this way has actually matched.
> > >
> > > Okay. so after disable sysfs session, to check former session
> > > check whether comprator has matched.
> > >
> > > >
> > > > Moreover, the specification states "Software must reset this bit to 0 to
> > > > re-enable single-shot control" and "Reset state is unknown. STATUS must be
> > > > written to set an initial state...."
> > > >
> > > > Therefore this register must be written as part of any configuration so
> > > > should be available in the drvdata->config for both read and write,
> > >
> > > But I don't think this is the reason for locate ss_status into "config"
> > > since its write purpose is not to configure but the "clear" former bit.
> > > That's why I think it's enough to clear when the new sysfs session starts.
> > >
> >
> > IOW, I think it's better to remove ss_status from configfs item
> > and
> >    - add field ss_cmp in etm4_cpas
> >    - add another field ss_status under "etm4_drvdata" to show "PENDING
> >      and STATUS" bits to sysfs after finishing session.
> >
> > Is is valid for you?
> >
>
> No. Why two different locations for a single register read? If I have the
> ETMv4 hardware manual I am going to look for a something that is
> recognizable as being related to the single shot comparator status
> register(s).
>
> So in sysfs I would expect to see all the bits from the register, displayed,
> without masking off the STATUS and PENDING bits as happens now.
>
> In the code I would expect to see a single location with a sensible name -
> ss_cmp doesn't really correlate terribly well with TRCSSCSR. If you do not
> like the original ss_status, then ss_cmp_status may actually be better,
> ss_cmp could be either the ss comparator status or control register.

Fine. But I'm still we don't need consider ss_status as configfs item.
So it's enough to move ss_status under etm4_drvdata from etm4_config and
use it.


--
Sincerely,
Yeoreum Yun


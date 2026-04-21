Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4ED16F89249
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Apr 2026 10:30:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KuH+qKa09XBfFiI5vcRoO9dx1tppE8+meHkV9WMslaA=; b=Qb7yyujSUAYP8esTHbyHmBb2Tf
	+/YXngimc502QUgpva1z8Wpkkk9hdI9R2Exs566Hwrqwf/Mbg3ruk4UlWnDZxH1XiS06y+WmmtdWH
	l55KnENqfgVZfhB7A+c4/vSuSXDNecD3go3ef4iCOVACmvnED2NxhwuwTca1D5yPAg/X224Dyw2Zx
	EhbOq/oBLLMlxRvb3S5mhFlOn47nRtsw2yWKDJW3oMal417KKkvFzuw1GTo9QIEr8VUoM022o2F9o
	0X4ptsP1blm2NOtYWrCArNjh+wsDOvJL06FaOt6X9Wnrk9yOYeS3HlRbdcS48kcmpGdbN5RmFvk2N
	wO5oCpng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wF8Mt-00000008RYl-2Ig7;
	Tue, 21 Apr 2026 10:30:11 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wF8Mq-00000008RXO-2mcX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Apr 2026 10:30:09 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3318025DC;
	Tue, 21 Apr 2026 03:30:01 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.1.197.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 16E7A3FE8F;
	Tue, 21 Apr 2026 03:30:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1776767406; bh=TakNj7Wkg489yxw2UozyVp1eTaX5n49I0RrLcW9q2QM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YSGGslBMiCYYiCk0oXSHT2dTqoCyEVvVShgLEaMfdPJ7AzzMDJ3NsrPAQVYEeZ5lQ
	 tCAvBCkWITvUmgvmsw0sIk0DcH5HyuZKa02j8wVEDL7QyLmKW2jQxzJiCl85T24wlD
	 P4bRDKTxzAeV2pp2W74ArdbK5RXsxHbxa16UQ0Ms=
Date: Tue, 21 Apr 2026 11:30:02 +0100
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: Mike Leach <mike.leach@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, Leo Yan <leo.yan@arm.com>,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, james.clark@linaro.org,
	alexander.shishkin@linux.intel.com, jie.gan@oss.qualcomm.com
Subject: Re: [PATCH v5 04/12] coresight: etm4x: exclude ss_status from
 drvdata->config
Message-ID: <aedRqhC1JcoeV+R2@e129823.arm.com>
References: <20260415165528.3369607-1-yeoreum.yun@arm.com>
 <20260415165528.3369607-5-yeoreum.yun@arm.com>
 <20260416155118.GM356832@e132581.arm.com>
 <57dbea1b-670b-4b8f-a590-1d4239bc2c76@arm.com>
 <f2b0dcc5-8002-4ee9-a219-fb361573a9c3@arm.com>
 <aedLaFhwyYMM8tUw@e129823.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aedLaFhwyYMM8tUw@e129823.arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260421_033008_742981_DA4E6407 
X-CRM114-Status: GOOD (  16.85  )
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

> Hi Mike,
>
> > Hi,
> >
> > This register [bit 31] indicates if a single shot comparator has matched. So
> > read-back provides information to the user post run to determine which if
> > any of the comparators set in this way has actually matched.
>
> Okay. so after disable sysfs session, to check former session
> check whether comprator has matched.
>
> >
> > Moreover, the specification states "Software must reset this bit to 0 to
> > re-enable single-shot control" and "Reset state is unknown. STATUS must be
> > written to set an initial state...."
> >
> > Therefore this register must be written as part of any configuration so
> > should be available in the drvdata->config for both read and write,
>
> But I don't think this is the reason for locate ss_status into "config"
> since its write purpose is not to configure but the "clear" former bit.
> That's why I think it's enough to clear when the new sysfs session starts.
>

IOW, I think it's better to remove ss_status from configfs item
and
  - add field ss_cmp in etm4_cpas
  - add another field ss_status under "etm4_drvdata" to show "PENDING
    and STATUS" bits to sysfs after finishing session.

Is is valid for you?

> --
> Sincerely,
> Yeoreum Yun
>

--
Sincerely,
Yeoreum Yun


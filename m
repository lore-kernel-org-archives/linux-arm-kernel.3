Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0377AF327C9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Apr 2026 09:06:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OYJMuJhFNCT2QNyin9MI6pqOhLWoRTpHqoPf3qz1wkk=; b=W16eTPTa55w2wbmIQ5gyQqxGhg
	5KCJN+mxHWHAUgZgXktxWCtUTbqXvZE1lShDDvP7POvTHHFPQrikzjlngIaoyQXAJcDRuOheQQtqU
	8BbizT2//u9VxKq81SQY1vna1IUBPXqebEVO3PIzv/OsJtLqvi/4eG/gcR5jCjnf3TlV+vhK7DNxt
	McsDrrq8MbRBv8Fpmkpo2QEor3YOrII+gMidEubwVI7JEzQm8jZ6yt2q3DfCVI4ALyw1PfAv13zB9
	F6o2NF/1Sbd12Y1ktM3E/xt2liV8Mmtvtk3JFdj31qnKcl2erx3RpWvj90RTIgdBHRd1wOEiDYS/+
	KFAZpPCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wF73t-00000008Iqk-1PPn;
	Tue, 21 Apr 2026 09:06:29 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wF73q-00000008IqJ-3UC2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Apr 2026 09:06:28 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 863F625E0;
	Tue, 21 Apr 2026 02:06:19 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.1.197.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A73883F641;
	Tue, 21 Apr 2026 02:06:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1776762385; bh=6JWVG2kXroh0p5jTbyqcaGxWiX732Fy02q4pZL3zcYc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sbAAHBFj1JBYrxIYu5XHjhREJnlD/Q+zoJ7IolaiRvJATZbTNOGlZeN747MJmIVTz
	 XMDCgjZG523yf/ZoSjiyc3Ka2YOtcI5xU+/0kT43Ci3mSaYysp8dD66LC4OkEnDnaY
	 sGrmZcG5SwfwuRW+C+Aa48Kaz9FHtb2L+8oQ21DU=
Date: Tue, 21 Apr 2026 10:06:21 +0100
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Leo Yan <leo.yan@arm.com>, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	mike.leach@arm.com, james.clark@linaro.org,
	alexander.shishkin@linux.intel.com, jie.gan@oss.qualcomm.com
Subject: Re: [PATCH v5 04/12] coresight: etm4x: exclude ss_status from
 drvdata->config
Message-ID: <aec+DQERKEWp+iTM@e129823.arm.com>
References: <20260415165528.3369607-1-yeoreum.yun@arm.com>
 <20260415165528.3369607-5-yeoreum.yun@arm.com>
 <20260416155118.GM356832@e132581.arm.com>
 <57dbea1b-670b-4b8f-a590-1d4239bc2c76@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <57dbea1b-670b-4b8f-a590-1d4239bc2c76@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260421_020626_964886_6D6C52EB 
X-CRM114-Status: GOOD (  20.73  )
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

Hi Suzuki,

> On 16/04/2026 16:51, Leo Yan wrote:
> > On Wed, Apr 15, 2026 at 05:55:20PM +0100, Yeoreum Yun wrote:
> >
> > [...]
> >
> > > @@ -573,11 +573,9 @@ static int etm4_enable_hw(struct etmv4_drvdata *drvdata)
> > >   		etm4x_relaxed_write32(csa, config->res_ctrl[i], TRCRSCTLRn(i));
> > >   	for (i = 0; i < caps->nr_ss_cmp; i++) {
> > > -		/* always clear status bit on restart if using single-shot */
> > > -		if (config->ss_ctrl[i] || config->ss_pe_cmp[i])
> > > -			config->ss_status[i] &= ~TRCSSCSRn_STATUS;
> > >   		etm4x_relaxed_write32(csa, config->ss_ctrl[i], TRCSSCCRn(i));
> > > -		etm4x_relaxed_write32(csa, config->ss_status[i], TRCSSCSRn(i));
> > > +		/* always clear status and pending bits on restart if using single-shot */
> > > +		etm4x_relaxed_write32(csa, 0x0, TRCSSCSRn(i));
> >
> > In Arm ARM, D24.4.60 TRCSSCSR<n>, bits[0..3] are RO.  I think it is
> > fine for directly clear the regiser with zero (means it will only
> > clear status / pending bits).
> >
> > [...]
> >
> > > @@ -1841,10 +1839,11 @@ static ssize_t sshot_status_show(struct device *dev,
> > >   {
> > >   	unsigned long val;
> > >   	struct etmv4_drvdata *drvdata = dev_get_drvdata(dev->parent);
> > > +	const struct etmv4_caps *caps = &drvdata->caps;
> > >   	struct etmv4_config *config = &drvdata->config;
> > >   	raw_spin_lock(&drvdata->spinlock);
> > > -	val = config->ss_status[config->ss_idx];
> > > +	val = caps->ss_cmp[config->ss_idx];
> > >   	raw_spin_unlock(&drvdata->spinlock);
> > >   	return scnprintf(buf, PAGE_SIZE, "%#lx\n", val);
> > >   }
> >
> > This sysfs knob never can print out a realtime status for sshot, I am
>
> Won't it give the status, when the ETM was disabled (and saved back to
> config), for as sysfs mode operation, where the user collects
> information about the status via sysfs ? ( The question of if someone
> actually makes use of this is a different question )

But I'm asking whether it's meaningful to give information
for PENDING and STATUS after "seesion" is disabled.
As you said, it gives a status after *disabled*.
However, Is this information meaningful and user can something with
these information? TBH I don't think so it would be better to remove
from config...

If this's required ... might be we need to move ss_status into
etm4_drvdata directly anyway.. (ss_status).


--
Sincerely,
Yeoreum Yun


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADABBD1D89F
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Dec 2025 10:02:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=217qDeGCB+Ir7vF08Xg1FzRE6+rT+VQjGqOvY5QizU8=; b=3XezqSyDNg1lTK8+XI6eH1iTNO
	vgHGq2CbG/biM24oDOwlazfH8QfsZqxQ3E6jT+3LqDwQGZW9pynUJnOCRsGRP5LWxRBCCA4WRPXPW
	mrEA3cqX8kgT8gGO0PGXl+69f05DvxMPIGGHVjx+ztt7sF2099F/oy7QNgihmp1mz0mXFAhSlsyS3
	FLqBZyZlpPLw5bqCXVQCOUeXbGRV07D9qU80B9eVTqg60Jw64TeQoYhAy97GBm+s42avCxB6iPGNe
	+INWD6bAa0fRZOxNiIVWeqq2fZzqyecJ4LNoKTnZDCvU7yEJwsOaiQ4mgR+ME6L+eQn7u6O3hF9aR
	DC90ra/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vR6A5-00000007ofD-3XrV;
	Thu, 04 Dec 2025 10:02:09 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vR6A3-00000007oel-1A4i
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Dec 2025 10:02:08 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 90593339;
	Thu,  4 Dec 2025 02:01:58 -0800 (PST)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 817523F73B;
	Thu,  4 Dec 2025 02:02:05 -0800 (PST)
Date: Thu, 4 Dec 2025 10:02:03 +0000
From: Leo Yan <leo.yan@arm.com>
To: Mike Leach <mike.leach@linaro.org>
Cc: Yingchao Deng <yingchao.deng@oss.qualcomm.com>,
	James Clark <james.clark@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
	quic_yingdeng@quicinc.com, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Jinlong Mao <jinlong.mao@oss.qualcomm.com>,
	Mao Jinlong <quic_jinlmao@quicinc.com>
Subject: Re: [PATCH v6 2/2] coresight: cti: Add Qualcomm extended CTI support
Message-ID: <20251204100203.GJ724103@e132581.arm.com>
References: <20251202-extended_cti-v6-0-ab68bb15c4f5@oss.qualcomm.com>
 <20251202-extended_cti-v6-2-ab68bb15c4f5@oss.qualcomm.com>
 <20251203182944.GG724103@e132581.arm.com>
 <20251204083802.GI724103@e132581.arm.com>
 <CAJ9a7VhNW6cQt_O6NX+99LXfo-t3mFTejzdNjWcyssbMrXR4OQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJ9a7VhNW6cQt_O6NX+99LXfo-t3mFTejzdNjWcyssbMrXR4OQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251204_020207_437231_34D12607 
X-CRM114-Status: GOOD (  26.18  )
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

On Thu, Dec 04, 2025 at 09:04:03AM +0000, Mike Leach wrote:
> Hi,
> 
> On Thu, 4 Dec 2025 at 08:38, Leo Yan <leo.yan@arm.com> wrote:
> >
> > On Wed, Dec 03, 2025 at 06:29:44PM +0000, Coresight ML wrote:
> >
> > [...]
> >
> > > > +/* Read registers with power check only (no enable check). */
> > > > +static ssize_t coresight_cti_reg_show(struct device *dev,
> > > > +                                 struct device_attribute *attr, char *buf)
> > > > +{
> > > > +   struct cti_drvdata *drvdata = dev_get_drvdata(dev->parent);
> > > > +   struct cs_off_attribute *cti_attr = container_of(attr, struct cs_off_attribute, attr);
> > > > +   u32 idx, val = 0;
> > > > +
> > > > +   pm_runtime_get_sync(dev->parent);
> > > > +   raw_spin_lock(&drvdata->spinlock);
> > > > +   idx = drvdata->config.ext_reg_sel;
> > > > +   if (drvdata->config.hw_powered) {
> > > > +           switch (cti_attr->off) {
> > > > +           case INDEX_CTITRIGINSTATUS:
> > > > +           case INDEX_CTITRIGOUTSTATUS:
> > > > +           case INDEX_ITTRIGINACK:
> > > > +           case INDEX_ITTRIGOUT:
> > > > +           case INDEX_ITTRIGOUTACK:
> > > > +           case INDEX_ITTRIGIN:
> >
> > I read again and now I understand why you need "config.ext_reg_sel"
> > as an index for these expending registers.
> >
> 
> Having this index for these extended registers matches what we do for
> the INEN and OUTEN registers. This gives the user a consistent
> approach. We do not want the unnecessary attributes as  it will
> increase the memory footprint for all cti instances, not just the qcom
> ones.

I agree with using index for CTI triggers, but it is not necessary to
add a new index for other registers (status, mode setting, ACK, etc).

It would be directive to present the status and mode setting
registers, given these registers are only from 0-3.  This will be easy
accessed from userspace, and avoid complexity in the driver.

> The first patch in this series works to reduce the memory footprint by
> only allocating resource based on the actual configuration. For
> example for an ARM designed CTI with 8 trigger registers, we no longer
> declare static 128 x 32 bit arrays for each of INEN and OUTEN which
> were required by the original design.
> 
> Given that there can be 10s or 100s of CTIs in a large multicore
> system, reducing the footprint to match the actual configuration, and
> offering a level of compression by using an index + single file to
> access a set of registers improves the efficiency of the driver.

It is good for reducing footprint, but I would give priority for a
neat implementation and easy use interfaces.

And the sysfs attr code and global structures (e.g. register conversion
struct) can shared by all instances, so I don't worry much the scale
issue if we extend them.

Thanks,
Leo


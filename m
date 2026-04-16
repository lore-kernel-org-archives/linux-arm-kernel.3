Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B5DAF8806B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Apr 2026 06:54:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KOt+j3VusrDqrcfLG/AfmnG5Yl0s9VBituC7/CrFtb0=; b=SngSjTP6x5SxzB23/MzS88h6R5
	pABP5lovU9N+55d3BegsQ0K6EKTsk7fDBGSQK8co1XNiV24SkhcZCmJCNunQeOaubG8Uu56UvWFgw
	RyXwtIBvMEAXBOUoqDyTrMNN9soCUEfjfwabmTiV1HDH3ObRvh3EDNJZROViVtT0joc01F9EEILre
	wmNxXj7svj6SFuBVY2nB0Xmg4jqy5bMZYYzchkWSiHIirMzBkBRBItL0mKr9flpjFWOTs5LClyGz/
	aShK4fFj2p1Q/wdutsjUwaTI1nh5jWopMumg9zGsomgrC9qIjR76SxAsBIlbi7d4JOaK0vKcpC5nc
	Vb5Sy/rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDGcR-0000000251u-18iH;
	Thu, 16 Apr 2026 06:54:31 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDGcO-0000000251Y-19k5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Apr 2026 06:54:29 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0C68F25E9;
	Wed, 15 Apr 2026 23:54:20 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.1.197.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3A6FA3F7D8;
	Wed, 15 Apr 2026 23:54:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1776322465; bh=uqD/dt6liEaUaBZRxwhT8lly7nB6+86rIhs4gDGLvFM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DFUsjQ1m2zhRIw4w1aAVNWMoy5NZM+jg0re5Ugxqx0mvooWG3J0q7WFLP+rbyq7uQ
	 8al3mPjbBQIcApP7zOkeK7LOIazLmIlhEVytUA+kGaJP2/xdrFByz1UupNyT90VVJx
	 kpq1Dv4d1f8dF/3z9Af90od6BZ5UT1Qto0cbbJ+k=
Date: Thu, 16 Apr 2026 07:54:21 +0100
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: Jie Gan <jie.gan@oss.qualcomm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, suzuki.poulose@arm.com,
	mike.leach@arm.com, james.clark@linaro.org,
	alexander.shishkin@linux.intel.com, leo.yan@arm.com
Subject: Re: [PATCH v5 04/12] coresight: etm4x: exclude ss_status from
 drvdata->config
Message-ID: <aeCHnToKG43oKQNF@e129823.arm.com>
References: <20260415165528.3369607-1-yeoreum.yun@arm.com>
 <20260415165528.3369607-5-yeoreum.yun@arm.com>
 <778a826b-918d-4f7c-95a9-1cdb013618d8@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <778a826b-918d-4f7c-95a9-1cdb013618d8@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260415_235428_392700_2F3BF2F5 
X-CRM114-Status: GOOD (  31.84  )
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

Hi Jie,

>
>
> On 4/16/2026 12:55 AM, Yeoreum Yun wrote:
> > The purpose of TRCSSCSRn register is to show status of
> > the corresponding Single-shot Comparator Control and input supports.
> > That means writable field's purpose for reset or restore from idle status
> > not for configuration.
> >
> > Therefore, exclude ss_status from drvdata->config, move it to etm4x_caps
> > and rename it to ss_smp.
> >
> > This includes remove TRCSSCRn from configurable item and
> > remove saving in etm4_disable_hw().
> >
> > Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
> > ---
> >   .../hwtracing/coresight/coresight-etm4x-cfg.c |  1 -
> >   .../coresight/coresight-etm4x-core.c          | 19 ++++++-------------
> >   .../coresight/coresight-etm4x-sysfs.c         |  7 ++-----
> >   drivers/hwtracing/coresight/coresight-etm4x.h |  7 ++++++-
> >   4 files changed, 14 insertions(+), 20 deletions(-)
> >
> > diff --git a/drivers/hwtracing/coresight/coresight-etm4x-cfg.c b/drivers/hwtracing/coresight/coresight-etm4x-cfg.c
> > index c302072b293a..d14d7c8a23e5 100644
> > --- a/drivers/hwtracing/coresight/coresight-etm4x-cfg.c
> > +++ b/drivers/hwtracing/coresight/coresight-etm4x-cfg.c
> > @@ -86,7 +86,6 @@ static int etm4_cfg_map_reg_offset(struct etmv4_drvdata *drvdata,
> >   		off_mask =  (offset & GENMASK(11, 5));
> >   		do {
> >   			CHECKREGIDX(TRCSSCCRn(0), ss_ctrl, idx, off_mask);
> > -			CHECKREGIDX(TRCSSCSRn(0), ss_status, idx, off_mask);
> >   			CHECKREGIDX(TRCSSPCICRn(0), ss_pe_cmp, idx, off_mask);
> >   		} while (0);
> >   	} else if ((offset >= TRCCIDCVRn(0)) && (offset <= TRCVMIDCVRn(7))) {
> > diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> > index b2b092a76eb5..f55338a4989d 100644
> > --- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
> > +++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> > @@ -91,7 +91,7 @@ static bool etm4x_sspcicrn_present(struct etmv4_drvdata *drvdata, int n)
> >   	const struct etmv4_caps *caps = &drvdata->caps;
> >   	return (n < caps->nr_ss_cmp) && caps->nr_pe_cmp &&
> > -	       (drvdata->config.ss_status[n] & TRCSSCSRn_PC);
> > +	       (caps->ss_cmp[n] & TRCSSCSRn_PC);
> >   }
> >   u64 etm4x_sysreg_read(u32 offset, bool _relaxed, bool _64bit)
> > @@ -573,11 +573,9 @@ static int etm4_enable_hw(struct etmv4_drvdata *drvdata)
> >   		etm4x_relaxed_write32(csa, config->res_ctrl[i], TRCRSCTLRn(i));
> >   	for (i = 0; i < caps->nr_ss_cmp; i++) {
> > -		/* always clear status bit on restart if using single-shot */
> > -		if (config->ss_ctrl[i] || config->ss_pe_cmp[i])
> > -			config->ss_status[i] &= ~TRCSSCSRn_STATUS;
> >   		etm4x_relaxed_write32(csa, config->ss_ctrl[i], TRCSSCCRn(i));
> > -		etm4x_relaxed_write32(csa, config->ss_status[i], TRCSSCSRn(i));
> > +		/* always clear status and pending bits on restart if using single-shot */
> > +		etm4x_relaxed_write32(csa, 0x0, TRCSSCSRn(i));
> >   		if (etm4x_sspcicrn_present(drvdata, i))
> >   			etm4x_relaxed_write32(csa, config->ss_pe_cmp[i], TRCSSPCICRn(i));
> >   	}
> > @@ -1055,12 +1053,6 @@ static void etm4_disable_hw(struct etmv4_drvdata *drvdata)
> >   	etm4_disable_trace_unit(drvdata);
> > -	/* read the status of the single shot comparators */
> > -	for (i = 0; i < caps->nr_ss_cmp; i++) {
> > -		config->ss_status[i] =
> > -			etm4x_relaxed_read32(csa, TRCSSCSRn(i));
> > -	}
> > -
> >   	/* read back the current counter values */
> >   	for (i = 0; i < caps->nr_cntr; i++) {
> >   		config->cntr_val[i] =
> > @@ -1503,8 +1495,9 @@ static void etm4_init_arch_data(void *info)
> >   	 */
> >   	caps->nr_ss_cmp = FIELD_GET(TRCIDR4_NUMSSCC_MASK, etmidr4);
> >   	for (i = 0; i < caps->nr_ss_cmp; i++) {
> > -		drvdata->config.ss_status[i] =
> > -			etm4x_relaxed_read32(csa, TRCSSCSRn(i));
> > +		caps->ss_cmp[i] = etm4x_relaxed_read32(csa, TRCSSCSRn(i));
> > +		caps->ss_cmp[i] &= (TRCSSCSRn_PC | TRCSSCSRn_DV |
> > +				    TRCSSCSRn_DA | TRCSSCSRn_INST);
>
> Just re-go through this patch and had a question here:
>
> I’m not sure whether this new change should be documented in the ABI, given
> that the TRCSSCSRn_STATUS bit is masked. In my opinion, this change breaks
> the existing ABI description.
>
> Description from the ABI document:
>
> What:           /sys/bus/coresight/devices/etm<N>/sshot_status
> Date:           December 2019
> KernelVersion:  5.5
> Contact:        Mathieu Poirier <mathieu.poirier@linaro.org>
> Description:    (Read) Print the current value of the selected single
>                 shot status register.

But, as I mentioned another thread:
  - https://lore.kernel.org/all/ad5yV2FoNbGGLE6R@e129823.arm.com/

Till now, sysfs doesn't show the *current value* of the single shot
state since the config->ss_status is updated enabled/disabled sysfs
session. an I think once the session is disabled, other status bits
(currently STATUS and PENDING bits) don't have any meaning.

I think it's enough to change the doc's Description for this.

Any thought?

--
Sincerely,
Yeoreum Yun


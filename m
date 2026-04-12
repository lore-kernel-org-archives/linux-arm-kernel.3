Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 739FDE937E9
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Apr 2026 15:48:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LwTm9cWrn8Gu/XuLHJi29qi0UnV3vqTGp1HNpOURT/k=; b=oEi97ReONixkBowvfzYlXJ9OmX
	2VcigsTZl72lwL6q1fMOzerlbH2Zhedhd4lVL8HEQQ8qdu3s7mqau0eKZ2xhxCSsb+zgRq9C7+WXu
	Cv+ST34jKvdWl94ku0Sj6UrkLygvMwn7kVX0J39zedx0UcJ9EU8moRqCdTsT2eFJ1kZLCwKszVrAl
	YhfZzJyukjnLssOWWluaZOekLB6usjhtumWbHo+Hd9SQAPy7UF4GQjEyhuEY22Qlcr/4+V2wVP3Rv
	wQyZeFLd8PAPDeSqoN9bxAugpVvUniWog7NTPoix2IM6K9q/teiteuKuvZr0hv4HFVaM/Dfx8ii6C
	GdLZa95A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBx2p-0000000ES7i-1YTV;
	Sun, 12 Apr 2026 15:48:19 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBx2m-0000000ES7E-0gKQ
	for linux-arm-kernel@lists.infradead.org;
	Sun, 12 Apr 2026 15:48:17 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E7B734CFD;
	Sun, 12 Apr 2026 08:48:08 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.1.197.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EC4CC3F7B4;
	Sun, 12 Apr 2026 08:48:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1776008894; bh=U6ulatf8SqiETTDO0DG0hTsg/mvDE9XwOigkPb7/Q0Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=J7jVtXKJI1UM4MuYUEKoiFtM9cuug/gRn7tmfStAiwgJ/v7dkVyBiqWlZk+ADC48F
	 xZFQuSHyhlukoVlbjvq0vBInLB/+je7go0lsNQRj7CBkDG8zrhD4VIxtjRbC58uAcH
	 XS/QBZoNfNKL7qXbN6nzvXjwHOAa1ue3UZVGonmo=
Date: Sun, 12 Apr 2026 16:48:10 +0100
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: Jie Gan <jie.gan@oss.qualcomm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, suzuki.poulose@arm.com,
	mike.leach@arm.com, james.clark@linaro.org,
	alexander.shishkin@linux.intel.com, leo.yan@arm.com
Subject: Re: [PATCH v2 2/5] coresight: etm4x: exclude ss_status from
 drvdata->config
Message-ID: <adu+uu3CFSbPMaFT@e129823.arm.com>
References: <20260410074310.2693385-1-yeoreum.yun@arm.com>
 <20260410074310.2693385-3-yeoreum.yun@arm.com>
 <a8d11f92-2af8-46e7-9098-18a835c6ec8a@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a8d11f92-2af8-46e7-9098-18a835c6ec8a@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260412_084816_332013_17F5A2F6 
X-CRM114-Status: GOOD (  27.01  )
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
> On 4/10/2026 3:43 PM, Yeoreum Yun wrote:
> > The purpose of TRCSSCSRn register is to show status of
> > the corresponding Single-shot Comparator Control and input supports.
> > That means writable field's purpose for reset or restore from idle status
> > not for configuration.
> >
> > Therefore, exclude ss_status from drvdata->config, move it to etm4x_caps.
> > This includes remove TRCSSCRn from configurable item and
> > remove saving in etm4_disable_hw().
> >
> > Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
> > ---
> >   .../hwtracing/coresight/coresight-etm4x-cfg.c  |  1 -
> >   .../hwtracing/coresight/coresight-etm4x-core.c | 18 +++++-------------
> >   .../coresight/coresight-etm4x-sysfs.c          |  7 ++-----
> >   drivers/hwtracing/coresight/coresight-etm4x.h  |  3 ++-
> >   4 files changed, 9 insertions(+), 20 deletions(-)
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
> > index 6443f3717b37..b7abb171f523 100644
> > --- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
> > +++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> > @@ -91,7 +91,7 @@ static bool etm4x_sspcicrn_present(struct etmv4_drvdata *drvdata, int n)
> >   	const struct etmv4_caps *caps = &drvdata->caps;
> >   	return (n < caps->nr_ss_cmp) && caps->nr_pe &&
> > -	       (drvdata->config.ss_status[n] & TRCSSCSRn_PC);
> > +	       (caps->ss_status[n] & TRCSSCSRn_PC);
> >   }
> >   u64 etm4x_sysreg_read(u32 offset, bool _relaxed, bool _64bit)
> > @@ -571,11 +571,9 @@ static int etm4_enable_hw(struct etmv4_drvdata *drvdata)
> >   		etm4x_relaxed_write32(csa, config->res_ctrl[i], TRCRSCTLRn(i));
> >   	for (i = 0; i < caps->nr_ss_cmp; i++) {
> > -		/* always clear status bit on restart if using single-shot */
> > -		if (config->ss_ctrl[i] || config->ss_pe_cmp[i])
> > -			config->ss_status[i] &= ~TRCSSCSRn_STATUS;
> >   		etm4x_relaxed_write32(csa, config->ss_ctrl[i], TRCSSCCRn(i));
> > -		etm4x_relaxed_write32(csa, config->ss_status[i], TRCSSCSRn(i));
> > +		/* always clear status bit on restart if using single-shot */
>
> the clear step for the status bit has been removed. but the comment still
> here.
>
> I think we cannot remove the clear step. The hardware requires the STATUS
> bit to be cleared before re-arming a single-shot comparator; failing to do
> so means the comparator will not fire on the next trace session

This one is intended. if you see the patch:

+  /* always clear status bit on restart if using single-shot */
+  etm4x_relaxed_write32(csa, caps->ss_status[i], TRCSSCSRn(i));

cap->ss_status[i] is initialised by etm4_init_arch_data() cleared
STATUS & PENDING bit. so the comment is still valid.


Thanks.

[...]

--
Sincerely,
Yeoreum Yun


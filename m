Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 134FCCD6E61
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Jun 2026 10:08:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rajaosXHuJHIaYK3T3csqioDStDpmpeCVfagtDiv81I=; b=IYLaNzisSSK1q63sbqUqK+Pn0F
	053r+27pgmBUym43vFRUJ03aWeZJWXK7XRMDPUT6QYs1EP2s3O937Dy00HG0IoqkvGBx/K5XF7zrN
	eAT5U+ITPadKXRRkfA6pB29OScSfmyc6DXD4AhGuprADzAptiGLtlYU+7FjF03ch714mv8d7xQqB0
	tYLVHJscoqvR0XyRjAh5ZayQ30GaxQkM2mVCxyhxRs6NRfMa2SaaOn7YrpUNG2ekkG8Si95dQjZwu
	siaVAiWIYHwaKByuVKJAQILX/9SPsuaDnrNwFnDCZULn5S0IQaVpginCb4P51bEu0dTpq/Vj2KK3Y
	/CjyRqsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTzZC-0000000AaCM-1DnQ;
	Mon, 01 Jun 2026 10:08:18 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTzZB-0000000AaCD-1R65
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 01 Jun 2026 10:08:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=rajaosXHuJHIaYK3T3csqioDStDpmpeCVfagtDiv81I=; b=A8Q7YXLPOSR8WyHXKJWypjFMHk
	iaCp/5NxuEqWM2MuxsMcQP9R/Mf/Pq3iZwSLGCMkHAlO8qhiOM/0fKuSJUX42YY7cw4HKeM6K7kJR
	5+9GWN/TCZUSmb+pt5RcoDzJZOoSYT+m1ZY50xn2zs2wGqMj4LhRC5C2LxM0+Xszb0nG7BbApTD2r
	y0JsZ7TjX+4ymzdedh4o2sc+KyX0BaVOIZjWBtmziouAXJySH/i3oblegu28Nq9NBHlrxFcP3rHjF
	irR2csmqS5Gelu07R2IDhTxv3U5tYR9RVV6SfwlhphtLnIEtbqZmFhP88EgeeMa3/LOsn2r+xOYjU
	9ljcJ5DQ==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTzZ7-00000006Kv7-2hhn
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Jun 2026 10:08:16 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 327F51E8D;
	Mon,  1 Jun 2026 03:08:07 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.1.197.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C138E3F905;
	Mon,  1 Jun 2026 03:08:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1780308492; bh=hV53Qdv1PgmYKFUIbcP2hKzzjioGX7FNtwUP59NL6Fo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gULyG36LVZfyyA7V7yPtUPaKe33/BGwN9mrHMgaYh/EXweaKU9Je1zzvpopajG7QA
	 nwdzvEWQsiidFuJzkT1gFyVrzVNlUiLyX3XgncquqexY8f8IMLuG65XXqoOIoiiXTR
	 aquEUe98PTF9FKm5gPbFv+AxV69vDr37M+kU7Zhk=
Date: Mon, 1 Jun 2026 11:08:08 +0100
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, mike.leach@arm.com,
	james.clark@linaro.org, alexander.shishkin@linux.intel.com,
	leo.yan@arm.com, jie.gan@oss.qualcomm.com
Subject: Re: [PATCH v7 02/13] coresight: etm4x: fix underflow for nrseqstate
Message-ID: <ah1aCFTgshh9klDM@e129823.arm.com>
References: <20260519154812.254884-1-yeoreum.yun@arm.com>
 <20260519154812.254884-3-yeoreum.yun@arm.com>
 <3155a54e-f0df-49d7-9cf7-6f1c0f826f31@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3155a54e-f0df-49d7-9cf7-6f1c0f826f31@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_110814_307655_41D17713 
X-CRM114-Status: GOOD (  20.62  )
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

> On 19/05/2026 16:48, Yeoreum Yun wrote:
> > TCRSEQEVR<n> is implemented only when TCRIDR5.NUMSEQSTATE is 0b100,
> > in which case n ranges from 0 to 2; otherwise, TCRIDR5.NUMSEQSTATE is 0b000.
> > 
> > Therefore, drvdata->nrseqstate should be checked before entering the loop.
> 
> for (i = 0; i < drvdata->nrseqstate - 1; i++)
> 
> Wouldn't that check cover the case ? (provided i is signed int ?)
> 
> Suzuki

Unfortunately, the drvdata->nrseqstate is u8 but i is signed int.
I think in this case it would iterate 255 times (0xff).

> 
> > 
> > Link: https://developer.arm.com/documentation/ihi0064/latest/ [0]
> > Fixes: 2e1cdfe184b5 ("coresight-etm4x: Adding CoreSight ETM4x driver")
> > Reviewed-by: Leo Yan <leo.yan@arm.com>
> > Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
> > ---
> >   .../hwtracing/coresight/coresight-etm4x-core.c | 18 ++++++++++--------
> >   .../coresight/coresight-etm4x-sysfs.c          |  2 ++
> >   2 files changed, 12 insertions(+), 8 deletions(-)
> > 
> > diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> > index 1e3b0344dc00..94b9385e964a 100644
> > --- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
> > +++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> > @@ -542,9 +542,11 @@ static int etm4_enable_hw(struct etmv4_drvdata *drvdata)
> >   	etm4x_relaxed_write32(csa, config->vissctlr, TRCVISSCTLR);
> >   	if (drvdata->nr_pe_cmp)
> >   		etm4x_relaxed_write32(csa, config->vipcssctlr, TRCVIPCSSCTLR);
> > -	for (i = 0; i < drvdata->nrseqstate - 1; i++)
> > -		etm4x_relaxed_write32(csa, config->seq_ctrl[i], TRCSEQEVRn(i));
> > +
> >   	if (drvdata->nrseqstate) {
> > +		for (i = 0; i < drvdata->nrseqstate - 1; i++)
> > +			etm4x_relaxed_write32(csa, config->seq_ctrl[i], TRCSEQEVRn(i));
> > +
> >   		etm4x_relaxed_write32(csa, config->seq_rst, TRCSEQRSTEVR);
> >   		etm4x_relaxed_write32(csa, config->seq_state, TRCSEQSTR);
> >   	}
> > @@ -1896,10 +1898,10 @@ static int etm4_cpu_save(struct coresight_device *csdev)
> >   	if (drvdata->nr_pe_cmp)
> >   		state->trcvipcssctlr = etm4x_read32(csa, TRCVIPCSSCTLR);
> > -	for (i = 0; i < drvdata->nrseqstate - 1; i++)
> > -		state->trcseqevr[i] = etm4x_read32(csa, TRCSEQEVRn(i));
> > -
> >   	if (drvdata->nrseqstate) {
> > +		for (i = 0; i < drvdata->nrseqstate - 1; i++)
> > +			state->trcseqevr[i] = etm4x_read32(csa, TRCSEQEVRn(i));
> > +
> >   		state->trcseqrstevr = etm4x_read32(csa, TRCSEQRSTEVR);
> >   		state->trcseqstr = etm4x_read32(csa, TRCSEQSTR);
> >   	}
> > @@ -2009,10 +2011,10 @@ static void etm4_cpu_restore(struct coresight_device *csdev)
> >   	if (drvdata->nr_pe_cmp)
> >   		etm4x_relaxed_write32(csa, state->trcvipcssctlr, TRCVIPCSSCTLR);
> > -	for (i = 0; i < drvdata->nrseqstate - 1; i++)
> > -		etm4x_relaxed_write32(csa, state->trcseqevr[i], TRCSEQEVRn(i));
> > -
> >   	if (drvdata->nrseqstate) {
> > +		for (i = 0; i < drvdata->nrseqstate - 1; i++)
> > +			etm4x_relaxed_write32(csa, state->trcseqevr[i], TRCSEQEVRn(i));
> > +
> >   		etm4x_relaxed_write32(csa, state->trcseqrstevr, TRCSEQRSTEVR);
> >   		etm4x_relaxed_write32(csa, state->trcseqstr, TRCSEQSTR);
> >   	}
> > diff --git a/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c b/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c
> > index e9eeea6240d5..0e1ad175aa1e 100644
> > --- a/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c
> > +++ b/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c
> > @@ -1395,6 +1395,8 @@ static ssize_t seq_idx_store(struct device *dev,
> >   	struct etmv4_drvdata *drvdata = dev_get_drvdata(dev->parent);
> >   	struct etmv4_config *config = &drvdata->config;
> > +	if (!drvdata->nrseqstate)
> > +		return -ENOTSUPP;
> >   	if (kstrtoul(buf, 16, &val))
> >   		return -EINVAL;
> >   	if (val >= drvdata->nrseqstate - 1)
> 

-- 
Sincerely,
Yeoreum Yun


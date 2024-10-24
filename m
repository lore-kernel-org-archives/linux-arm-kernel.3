Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74FA2CE8E68
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 12:09:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7Ievt0lbE3o1jXotWBqtoNBi2oh/v+fauLx1j7MzV04=; b=2KG2VgmZahh91uyLe1wxHst+yZ
	29S6Eq0CCfnE0YIqF0TbRj7Il54/UkXYc5SCKxumHxJZ3zWlQdWLgbK4vhIc7TCfMomfyfncsease
	aRRQYcgbj1+ZiFmQIsxotpdOsQhq+onzaTE+Vwkj62/2uTWM2erf/aGUpblqoBnclX5LRHJSHCuRi
	S7ru1Aoqs/o408cEKK7vqjN9R87HfwP5ENzpLRdGxIr8l7AhfmaDAnWHo8QtTg3yjIbI9tQ3racti
	X9ynSt7BP5tmepTj/Wx4g1+A+u90KmNqNK609SdbV9UAhXDoo0++TgzEzHVXOtRklry63dd0Cm98L
	V+2rxhhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3weg-00000000IPj-1Y5b;
	Thu, 24 Oct 2024 12:09:30 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3wd7-00000000IDW-1tF7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Oct 2024 12:07:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 7B25DA40898;
	Thu, 24 Oct 2024 12:07:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8EF3C4CEC7;
	Thu, 24 Oct 2024 12:07:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729771672;
	bh=8/4aou3tP+TXpUdsvrdRG2gFHM9wjSSRJmGYWThrHzE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=l9ZvJA2aZby3yuYqjVMqt8obh6t4aJeIESgD3SwGqQr5XpGfzPACDiiJMv0AcQ5sG
	 kSVL3ee7DA6h7HcXpE3oKBLCg511hye73L2X3H8k0VZcAqeH2DxZmWFCtXlvqoQ91q
	 dqoTbf/G7zKLFpiADp8U9HRG49wV96jMIRoOyiO+4/rPbWYIn3SMlBt8QiaZh4kgZm
	 bAtS5DAKACaROx2CvElOiu6CfinGvEfVrzRgXmUskjZ+WUKLtYJNRO/tFWLiAd/NwJ
	 hGm41QMN6fTOmImbAnnu3vNkQzi8QsoFABy6VdUNLWFdxaTxxc0gbdY5g1RHA+Npt5
	 6bL4ARWgGGqkQ==
Date: Thu, 24 Oct 2024 13:07:47 +0100
From: Will Deacon <will@kernel.org>
To: Gowthami Thiagarajan <gthiagarajan@marvell.com>
Cc: mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, bbhushan2@marvell.com,
	gcherian@marvell.com, sgoutham@marvell.com,
	jonathan.cameron@huawei.com
Subject: Re: [PATCH v9 3/5] perf/marvell: Odyssey DDR Performance monitor
 support
Message-ID: <20241024120746.GA30510@willie-the-truck>
References: <20241016080153.3546353-1-gthiagarajan@marvell.com>
 <20241016080153.3546353-4-gthiagarajan@marvell.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241016080153.3546353-4-gthiagarajan@marvell.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_050753_643150_1A028B75 
X-CRM114-Status: GOOD (  22.46  )
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

On Wed, Oct 16, 2024 at 01:31:51PM +0530, Gowthami Thiagarajan wrote:
> Odyssey DRAM Subsystem supports eight counters for monitoring performance
> and software can program those counters to monitor any of the defined
> performance events. Supported performance events include those counted
> at the interface between the DDR controller and the PHY, interface between
> the DDR Controller and the CHI interconnect, or within the DDR Controller.
> 
> Additionally DSS also supports two fixed performance event counters, one
> for ddr reads and the other for ddr writes.
> 
> Signed-off-by: Gowthami Thiagarajan <gthiagarajan@marvell.com>
> ---
>  Documentation/admin-guide/perf/index.rst      |   1 +
>  .../admin-guide/perf/mrvl-odyssey-ddr-pmu.rst |  80 ++++++
>  drivers/perf/marvell_cn10k_ddr_pmu.c          | 261 +++++++++++++++++-
>  3 files changed, 339 insertions(+), 3 deletions(-)
>  create mode 100644 Documentation/admin-guide/perf/mrvl-odyssey-ddr-pmu.rst

[...]

> @@ -297,20 +405,27 @@ static ktime_t cn10k_ddr_pmu_timer_period(void)
>  	return ms_to_ktime((u64)cn10k_ddr_pmu_poll_period_sec * USEC_PER_SEC);
>  }
>  
> -static int ddr_perf_get_event_bitmap(int eventid, u64 *event_bitmap)
> +static int ddr_perf_get_event_bitmap(int eventid, u64 *event_bitmap,
> +				     struct cn10k_ddr_pmu *ddr_pmu)
>  {
>  	switch (eventid) {
>  	case EVENT_HIF_RD_OR_WR ... EVENT_WAW_HAZARD:
>  	case EVENT_OP_IS_REFRESH ... EVENT_OP_IS_ZQLATCH:
>  		*event_bitmap = (1ULL << (eventid - 1));
>  		break;
> +	case EVENT_DFI_PARITY_POISON ...EVENT_DFI_CMD_IS_RETRY:
> +		if (ddr_pmu->p_data->is_ody)
> +			*event_bitmap = (1ULL << (eventid - 1));
> +		else
> +			goto err;
> +		break;

You could tidy this up a little with a fallthrough:

	int err = 0;

	switch (eventid) {
	case EVENT_DFI_PARITY_POISON ...EVENT_DFI_CMD_IS_RETRY:
		if (!ddr_pmu->p_data->is_ody) {
			err = -EINVAL;
			break;
		}
		fallthrough;
	case EVENT_HIF_RD_OR_WR ... EVENT_WAW_HAZARD:
	case EVENT_OP_IS_REFRESH ... EVENT_OP_IS_ZQLATCH:
		*event_bitmap = (1ULL << (eventid - 1));
		break;
	default:
		err = -EINVAL;
	}

	if (err) {
		pr_err("%s Invalid eventid %d\n", __func__, eventid);
		return err;
	}

>  static void cn10k_ddr_perf_event_start(struct perf_event *event, int flags)
>  {
>  	struct cn10k_ddr_pmu *pmu = to_cn10k_ddr_pmu(event->pmu);
> +	u64 ctrl_reg = pmu->p_data->cnt_op_mode_ctrl;
>  	struct hw_perf_event *hwc = &event->hw;
> +	bool is_ody = pmu->p_data->is_ody;
>  	int counter = hwc->idx;
>  
>  	local64_set(&hwc->prev_count, 0);
>  
>  	cn10k_ddr_perf_counter_enable(pmu, counter, true);
> +	if (is_ody) {
> +	/* Setup the PMU counter to work in manual mode */
> +		writeq_relaxed(OP_MODE_CTRL_VAL_MANNUAL, pmu->base +

Existing typo: OP_MODE_CTRL_VAL_MANNUAL

I guess you could fix that in one of the earlier refactoring patches, if
you wanted to.

> +			       DDRC_PERF_REG(ctrl_reg, counter));
> +
> +		cn10k_ddr_perf_counter_start(pmu, counter);
> +	}

Why not put this inside cn10k_ddr_perf_counter_enable()?

>  
>  	hwc->state = 0;
>  }
> @@ -486,7 +630,7 @@ static int cn10k_ddr_perf_event_add(struct perf_event *event, int flags)
>  	if (counter < DDRC_PERF_NUM_GEN_COUNTERS) {
>  		/* Generic counters, configure event id */
>  		reg_offset = DDRC_PERF_CFG(p_data->cfg_base, counter);
> -		ret = ddr_perf_get_event_bitmap(config, &val);
> +		ret = ddr_perf_get_event_bitmap(config, &val, pmu);
>  		if (ret)
>  			return ret;
>  
> @@ -511,10 +655,14 @@ static void cn10k_ddr_perf_event_stop(struct perf_event *event, int flags)
>  {
>  	struct cn10k_ddr_pmu *pmu = to_cn10k_ddr_pmu(event->pmu);
>  	struct hw_perf_event *hwc = &event->hw;
> +	bool is_ody = pmu->p_data->is_ody;
>  	int counter = hwc->idx;
>  
>  	cn10k_ddr_perf_counter_enable(pmu, counter, false);
>  
> +	if (is_ody)
> +		cn10k_ddr_perf_counter_stop(pmu, counter);

Same here.

Will


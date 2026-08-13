Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9F0CC5CFEB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 06:15:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:
	Content-Transfer-Encoding:Cc:References:Date:From:In-Reply-To:Message-Id:To:
	Content-Type:Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vowdvw8GuYYrcPAwUQGGmV9lD8e4hSjxfhhY5B11tpg=; b=DbJpA119Ohxdk+rKX6ZDtoodh+
	dtcGAVCozWveAP5lMF1LctInGYQdOpDxfLU2fhM8p/aHaHN368uhYL8YgLQEtWQsbAKOVExDjAebl
	BwV137fzQ5H/bqQlQ1uyH/51tMCVmTKlA1XBHsjdWRUnasmNlQs32PBFpL71e/hc73W3E7LwsaJ49
	wAhjkhjSouTXz03vvAdMUrbZJOxJy+J3himKGIrsBozVec9rqoRMxN0wjkRgOcbyQTWuI3OFApgxv
	/7pju0g75wXq6xk9KKVGlhndzdAr3P3i5otRye7ahqJrA5CLtQSuxUyClFWRvf3Joco7SAeApx5Gs
	xkbd16OA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuOih-0000000HT8m-2uMs;
	Thu, 13 Aug 2026 06:15:15 +0000
Received: from va-2-29.ptr.blmpb.com ([209.127.231.29])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuOie-0000000HT8I-37hi
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Aug 2026 06:15:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=feishu2604151535; d=picoheart.com; t=1786601707; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=vowdvw8GuYYrcPAwUQGGmV9lD8e4hSjxfhhY5B11tpg=;
 b=Zzfpty/pUGJ+Ji5wGWLjOpXQijlPENg7gSlx19Q4s0JArPm12Ig/1vlv5Eoh64yXLCQ+ol
 ZSIcU834ktM9pSxCdOIENeVeakjEy1wDqbxp8NKBGXve/LaTvZLbyiui2aRCMJ0yuS8WeH
 5kuUL2AWbyB05px9fu4bEG+s3zLJ3Z4TBHqgNsvqU+ZYSMWFuOm0RJGAcZM3cO7w6FF8rR
 RgqTBG8g2Mkfei/lmn+SQ+yEIjbaqyEWbCpBKzkEZsOJ5n19G9QnNPUxsIZ9+zrzXxfw74
 pyqFxyQvMzhNc1seZyM2n5UUXMIGLrSYkVZ94PPS7dieWx2e+dqZheE2tzXdpQ==
Mime-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
To: "Zhanpeng Zhang" <zhangzhanpeng.jasper@bytedance.com>
Message-Id: <0e73e3fb-b7f1-474e-aaef-3c8f339638b1@picoheart.com>
X-Lms-Return-Path: <lba+26a7d60e9+3d26db+lists.infradead.org+yang.yicong@picoheart.com>
In-Reply-To: <20260811160720.28580-1-zhangzhanpeng.jasper@bytedance.com>
User-Agent: Mozilla Thunderbird
From: "Yicong Yang" <yang.yicong@picoheart.com>
Date: Thu, 13 Aug 2026 14:15:01 +0800
References: <20260811131714.12779-1-zhangzhanpeng.jasper@bytedance.com> <20260811160720.28580-1-zhangzhanpeng.jasper@bytedance.com>
Received: from [100.86.210.149] ([120.234.91.246]) by smtp.feishu.cn with ESMTPS; Thu, 13 Aug 2026 14:15:04 +0800
Cc: "Shuai Xue" <xueshuai@linux.alibaba.com>, 
	"Jing Zhang" <renyu.zj@linux.alibaba.com>, <yang.yicong@picoheart.com>, 
	"Will Deacon" <will@kernel.org>, "Mark Rutland" <mark.rutland@arm.com>, 
	"Yicong Yang" <yangyicong@hisilicon.com>, 
	"Baolin Wang" <baolin.wang@linux.alibaba.com>, 
	"Jonathan Cameron" <Jonathan.Cameron@huawei.com>, 
	<linux-arm-kernel@lists.infradead.org>, 
	<linux-perf-users@vger.kernel.org>, <linux-kernel@vger.kernel.org>
X-Original-From: Yicong Yang <yang.yicong@picoheart.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2 2/2] perf/dwc_pcie: Skip sibling walks for new group leaders
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_231512_989993_E5D1A783 
X-CRM114-Status: GOOD (  19.33  )
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

On 8/12/26 12:07 AM, Zhanpeng Zhang wrote:
> for_each_sibling_event() requires the event context lock to be held.
> perf_try_init_event() only takes that lock when initializing a group
> member.

newline here for a new paragraph.

> The DWC PCIe PMU walks the sibling list twice for every event, including a
> new group leader whose event_init() method runs without the lock. Although
> the leader cannot have siblings yet, the lock assertion is evaluated before
> the empty list is walked and produces two lockdep warnings.
> 
> Skip both sibling walks while initializing a group leader. Group member
> validation is unchanged and continues to run with the event context mutex
> held.
> 
> Fixes: af9597adc2f1 ("drivers/perf: add DesignWare PCIe PMU driver")
> Signed-off-by: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>

looks good to me.

Reviewed-by: Yicong Yang <yang.yicong@picoheart.com>

> ---
> A system-wide DWC PCIe PMU perf stat completed successfully with the same
> debug configuration, without lockdep reports or kernel taint.
> 
>  drivers/perf/dwc_pcie_pmu.c | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/perf/dwc_pcie_pmu.c b/drivers/perf/dwc_pcie_pmu.c
> index 7b2e28aade73..a6667ac19a99 100644
> --- a/drivers/perf/dwc_pcie_pmu.c
> +++ b/drivers/perf/dwc_pcie_pmu.c
> @@ -417,6 +417,10 @@ static int dwc_pcie_pmu_validate_group(struct perf_event *event)
>  		if (dwc_pcie_pmu_validate_add_lane_event(leader, val_lane_events))
>  			return -ENOSPC;
>  
> +	/* A new group leader cannot have any siblings yet. */
> +	if (event == leader)
> +		return 0;
> +
>  	for_each_sibling_event(sibling, leader) {
>  		type = DWC_PCIE_EVENT_TYPE(sibling);
>  		if (type == DWC_PCIE_TIME_BASE_EVENT) {
> @@ -452,9 +456,11 @@ static int dwc_pcie_pmu_event_init(struct perf_event *event)
>  	if (event->cpu < 0 || event->attach_state & PERF_ATTACH_TASK)
>  		return -EINVAL;
>  
> -	for_each_sibling_event(sibling, event->group_leader) {
> -		if (sibling->pmu != event->pmu && !is_software_event(sibling))
> -			return -EINVAL;
> +	if (event != event->group_leader) {
> +		for_each_sibling_event(sibling, event->group_leader) {
> +			if (sibling->pmu != event->pmu && !is_software_event(sibling))
> +				return -EINVAL;
> +		}

personally feel better to make this check into dwc_pcie_pmu_validate_group().

thanks.


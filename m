Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFABFCD6E56
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Jun 2026 09:53:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OAPyRUhyO/q3hcApJCmv7/7vhmxKCeD0Ps8qqrpzuVY=; b=ch5HZqBC6eYHYSjwiS64/J3KNX
	BgB+xmMf1/kDO4z/9npJnB/L7UFMJMipZdfpaDlHVYTo+8U+zTGxEjeK4o07sb3MJir3Ni81qcQZ3
	eAbBF5na9bNJjfDSmsfmjjvNlQcQx0o7XdYvozT/qrHqRyrtKS60zYeemILdwzML/3HBdpuOuAOon
	JY+PvFGWLVXqtxKXJPUd335KiliupCMnKx6ciPvD4tpWkLc7Mw/eLPNw7quJS0FJODDhhlT9K+jZ2
	OyI0znRid144KUswO/EcBmfFva8m8Y2Xu58zX/VIXtFnJqk9HrFOfrlz1W1vWorQcdR6kWmmyrzdg
	/0e4g4ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTzL7-0000000AZCJ-2SlV;
	Mon, 01 Jun 2026 09:53:45 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTzL4-0000000AZBm-3J8e
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Jun 2026 09:53:44 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1AFF81E8D;
	Mon,  1 Jun 2026 02:53:36 -0700 (PDT)
Received: from [10.1.38.31] (Suzukis-MBP.cambridge.arm.com [10.1.38.31])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E7E213F905;
	Mon,  1 Jun 2026 02:53:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1780307621; bh=Pe2ZlJy8oKAD/VulpHzRR75gUtJV5sCF9VpBEoEx/k4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=kEScZh6UoN7ivaCz/gpnJZG+S6y9uAXQioLOL1RBUVEwiGpvDq1PuYJG3JNnh0VHx
	 ipdlAv2rtKj/vQJ5Oz48p0C5NDcP+m90ysqeQk1ChdpDq/dnuWCK/H3VpSUZ1KP/3f
	 T+A2rEfRSe1CIXDcFxp84Rj8MJ1PnRLSKDnUASec=
Message-ID: <3144c7fb-b41d-4bca-a6a0-eeb9dfddc8b8@arm.com>
Date: Mon, 1 Jun 2026 10:53:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 03/13] coresight: etm4x: introduce
 ETM_MAX_SEQ_TRANSITIONS
Content-Language: en-GB
To: Yeoreum Yun <yeoreum.yun@arm.com>, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: mike.leach@arm.com, james.clark@linaro.org,
 alexander.shishkin@linux.intel.com, leo.yan@arm.com, jie.gan@oss.qualcomm.com
References: <20260519154812.254884-1-yeoreum.yun@arm.com>
 <20260519154812.254884-4-yeoreum.yun@arm.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20260519154812.254884-4-yeoreum.yun@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_025342_923960_A45F2F1E 
X-CRM114-Status: GOOD (  16.53  )
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

On 19/05/2026 16:48, Yeoreum Yun wrote:
> According to IHI006H Embedded Trace Macrocell Architecture
> Specification [0], n could be 0-2 for TCRSEQEVR<n> when
> TCRIDR5.NUMSEQSTATE is 0b100.
> 
> Therefore, introduce ETM_MAX_SEQ_TRANSITIONS macro and apply this
> in TCRSEQEVR<n> relevant fields.
> 
> Link: https://developer.arm.com/documentation/ihi0064/latest/ [0]
> Suggestedby: Leo Yan <leo.yan@arm.com>
> Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
> ---
>   drivers/hwtracing/coresight/coresight-etm4x-cfg.c | 2 +-
>   drivers/hwtracing/coresight/coresight-etm4x.h     | 5 +++--
>   2 files changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-etm4x-cfg.c b/drivers/hwtracing/coresight/coresight-etm4x-cfg.c
> index c302072b293a..e1a59b434505 100644
> --- a/drivers/hwtracing/coresight/coresight-etm4x-cfg.c
> +++ b/drivers/hwtracing/coresight/coresight-etm4x-cfg.c
> @@ -76,7 +76,7 @@ static int etm4_cfg_map_reg_offset(struct etmv4_drvdata *drvdata,
>   	} else if ((offset & GENMASK(11, 4)) == TRCSEQEVRn(0)) {
>   		/* sequencer state control registers */
>   		idx = (offset & GENMASK(3, 0)) / 4;
> -		if (idx < ETM_MAX_SEQ_STATES) {
> +		if (idx < ETM_MAX_SEQ_TRANSITIONS) {
>   			reg_csdev->driver_regval = &drvcfg->seq_ctrl[idx];
>   			err = 0;
>   		}
> diff --git a/drivers/hwtracing/coresight/coresight-etm4x.h b/drivers/hwtracing/coresight/coresight-etm4x.h
> index 89d81ce4e04e..60e08ab085c5 100644
> --- a/drivers/hwtracing/coresight/coresight-etm4x.h
> +++ b/drivers/hwtracing/coresight/coresight-etm4x.h
> @@ -614,6 +614,7 @@ static inline u32 etm4_res_sel_pair(u8 res_sel_idx)
>   #define ETM_MAX_NR_PE			8
>   #define ETMv4_MAX_CNTR			4
>   #define ETM_MAX_SEQ_STATES		4
> +#define ETM_MAX_SEQ_TRANSITIONS		(ETM_MAX_SEQ_STATES - 1)

Similar to the other comment on the patch, please don't tie this to 
SEQ_STATES. Simpl define.

#define ETM_MAX_SEQ_CTRLS		3


Suzuki


>   #define ETM_MAX_EXT_INP_SEL		4
>   #define ETM_MAX_EXT_INP			256
>   #define ETM_MAX_EXT_OUT			4
> @@ -877,7 +878,7 @@ struct etmv4_config {
>   	u32				vipcssctlr;
>   	u8				seq_idx;
>   	u8				syncfreq;
> -	u32				seq_ctrl[ETM_MAX_SEQ_STATES];
> +	u32				seq_ctrl[ETM_MAX_SEQ_TRANSITIONS];
>   	u32				seq_rst;
>   	u32				seq_state;
>   	u8				cntr_idx;
> @@ -928,7 +929,7 @@ struct etmv4_save_state {
>   	u32	trcvissctlr;
>   	u32	trcvipcssctlr;
>   
> -	u32	trcseqevr[ETM_MAX_SEQ_STATES];
> +	u32	trcseqevr[ETM_MAX_SEQ_TRANSITIONS];
>   	u32	trcseqrstevr;
>   	u32	trcseqstr;
>   	u32	trcextinselr;



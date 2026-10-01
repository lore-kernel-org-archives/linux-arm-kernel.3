Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FC14CA5FD2
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 14:44:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=63dxPAt9XcT66Tq82kcXkbDZlj/m4Bx9Zd5XKY1en8U=; b=SEFzjREmMt+KKbUjkCfdyXm7xj
	nNiJRZuHWMjQMH1aVktOs1RFnpCpItT42QF046pqK8KkF0T3G5Ws1srKsl3fpVjDCQNMeUVwhKw8q
	NqunavzoGfSsYv8lVaJdC/jlFrHJJp2k84pWWx4cwr3ugMMZbjar4/ZLqAMKO81fUuz4aMF7AD5c0
	vUivkxcwXFPL+eDHeNBLmn0JD8VnoCuHIrcQSbL7Ap/6Gome+g8yRM6NReqNHhOcNDufbE/v+DyJf
	6k8I9v2SvqGTCT3Whe70z+Vhph1Bphqo/0gB3dG9m50aD/xVw+WNLGJdAgR42Z1edNMQEVVaswTTw
	9O0LD+BA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCI1f-00000009QfO-3Jsz;
	Thu, 01 Oct 2026 14:44:48 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCI1e-00000009QfH-0t79
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 14:44:46 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 7F00940346;
	Thu,  1 Oct 2026 14:44:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D22E1F000FF;
	Thu,  1 Oct 2026 14:44:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790865885;
	bh=63dxPAt9XcT66Tq82kcXkbDZlj/m4Bx9Zd5XKY1en8U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=TEbHaD9URUDeakq+mYH63uXsDoqNiaNTOQEMrBaTXxGpaMlzKWpodH0zd3pdWOKzS
	 vSSJuDKr0/taNbRXl4ezmx8ohpO2Nw2IPPQYV/xc0VtFgC2dIbo0RU/09UGavws660
	 IXxArJPosqeMARCusSsf34CyNu1fR9NbX3SZIF62csFABPDCLD2sBNi7vr6yWy+ky1
	 JnV2kic5MtXISVPw38eLsZPHSugGRZ56iWXT1CD5v2ZTdJTZi+NSuknpsG962qPPs1
	 2UaWQ7TlQH1TSCCnSaQzayfmHP7ginBqr3FzQWji/BYd8bnmOYzGhKTeCbS0g7FrfF
	 xF2DTmtUtBUVQ==
Date: Thu, 1 Oct 2026 15:44:42 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Jay Buddhabhatti <jay.buddhabhatti@amd.com>
Cc: cristian.marussi@arm.com, arm-scmi@vger.kernel.org,
	Sudeep Holla <sudeep.holla@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	git@amd.com
Subject: Re: [RFC PATCH] firmware: arm_scmi: skip empty CLOCK_DESCRIBE_RATES
 replies
Message-ID: <20261001-persimmon-wallaby-of-popularity-c29bf3@sudeepholla>
References: <20261001114538.671755-1-jay.buddhabhatti@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261001114538.671755-1-jay.buddhabhatti@amd.com>
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

On Thu, Oct 01, 2026 at 04:45:38AM -0700, Jay Buddhabhatti wrote:
> Some platforms advertise reserved or uninstantiated clock IDs that still
> succeed CLOCK_DESCRIBE_RATES with zero rates. After dynamic rate
> allocation, kcalloc(0) returns ZERO_SIZE_PTR and protocol init then
> dereferences rates[0], which panics.
> 
> Do not allocate or index the rate array when the firmware reports an
> empty list, so unused IDs are skipped instead of taking down the SCMI
> clock provider.
> 
> Fixes: 62ba967595e0 ("firmware: arm_scmi: Make clock rates allocation dynamic")
> Signed-off-by: Jay Buddhabhatti <jay.buddhabhatti@amd.com>
> ---
> The SCMI server is the source of this zero rate and successful response
> and it should be fixed in SCMI server. This defensive check in Linux is
> still useful because firmware responses must be validated before
> de-referencing dynamically allocated data, The panic is a Linux
> regression introduced by dynamic rate allocation; previous fixed array
> tolerated the same response and other SCMI implementations could return
> the same unexpected response.
> ---
>  drivers/firmware/arm_scmi/clock.c | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/drivers/firmware/arm_scmi/clock.c b/drivers/firmware/arm_scmi/clock.c
> index 0278705d809e..8934a95527e2 100644
> --- a/drivers/firmware/arm_scmi/clock.c
> +++ b/drivers/firmware/arm_scmi/clock.c
> @@ -8,6 +8,7 @@
>  #include <linux/math64.h>
>  #include <linux/module.h>
>  #include <linux/limits.h>
> +#include <linux/slab.h>
>  #include <linux/sort.h>
>  
>  #include "protocols.h"
> @@ -484,6 +485,13 @@ iter_clk_describe_update_state(struct scmi_iterator_state *st,
>  	if (!st->max_resources) {
>  		unsigned int tot_rates = st->num_returned + st->num_remaining;
>  
> +		/*
> +		 * Unused/reserved clock IDs return 0 rates. kmalloc(0)
> +		 * returns ZERO_SIZE_PTR and must not be dereferenced.
> +		 */
> +		if (!tot_rates)
> +			return 0;
> +
>  		p->clkd->r.rates = devm_kcalloc(p->dev, tot_rates,
>  						sizeof(*p->clkd->r.rates), GFP_KERNEL);
>  		if (!p->clkd->r.rates)
> @@ -505,6 +513,9 @@ iter_clk_describe_process_response(const struct scmi_protocol_handle *ph,
>  	struct scmi_clk_ipriv *p = priv;
>  	const struct scmi_msg_resp_clock_describe_rates *r = response;
>  
> +	if (ZERO_OR_NULL_PTR(p->clkd->r.rates))
> +		return -EPROTO;
> +
>  	p->clkd->r.rates[p->clkd->r.num_rates] = RATE_TO_U64(r->rate[st->loop_idx]);
>  
>  	/* Count only effectively discovered rates */
> @@ -622,6 +633,13 @@ scmi_clock_describe_rates_get(const struct scmi_protocol_handle *ph,
>  	if (ret)
>  		return ret;
>  
> +	/*
> +	 * Some platforms expose reserved clock IDs with an empty
> +	 * CLOCK_DESCRIBE_RATES reply. Do not dereference rates[].
> +	 */
> +	if (!clkd->r.num_rates || ZERO_OR_NULL_PTR(clkd->r.rates))
> +		return 0;
> +

I expect the Clock rate control bit to be unset in the permissions for
these clock, else it may be dangerous to do this. Please add that check.

-- 
Regards,
Sudeep


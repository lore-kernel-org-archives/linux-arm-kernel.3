Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30976E8536F
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Apr 2026 14:35:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mfQkfXvruFLjBEtgSvUk56xdMUuIiWCjbR168BWqGQ8=; b=zTXm303zCsc/JBgPVeQXg0jF2Z
	4gTHpMZ1T9VDEhB4tPyyf2P7PyChwSp8Iyl7c1thMNXr/ylD5VMB6oON5GfHtUKvsQqdND0WDiaxN
	Y1chhWMzegwy2cEMkGpKzGMRmWlESlDt7bHj8usInvQMmFhKMmO88F7WzrbJrnAXlLIzNvZn9hIlm
	pDohZvGXNXsjW8m//qWifzkASPfJJVYHMGmE4iusOuW4XRjoLQMkKT2fc2zo3TjBjqWGumgkvSP3C
	kX07uueziJL0fp/Dl6XkSAdr2md0qnhQSo11+3Imo97z79qH9O/iOpDi3c1L1wJs3W0Ud0aiNTui0
	Xb8H2INw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8fby-000000029jE-3RdF;
	Fri, 03 Apr 2026 14:35:02 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8fbx-000000029ih-0KFK
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 03 Apr 2026 14:35:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:In-Reply-To:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=mfQkfXvruFLjBEtgSvUk56xdMUuIiWCjbR168BWqGQ8=; b=pRQbY1NqTEN8nKd6c6W5iqkBEL
	jAmGIPEv+P8fxplTRpv2hBOKQHp7M1fl32SVgF9xqMf2BiVMQeQs70EQsB/LTXrto8nYPzKTJhRpV
	i0YEvyR4oDFcSYn5hK8St1rQX+9gxnfKNwmT3DW6zwk6oxFKore1gVA85N+WY8q+w741zPtVsMKnq
	4h0sISmGZ51zPlmEVG/l6QDbBFCVC1ky6w1k3emENTnIvtH9Uuz7FKLSLtQlqT8NPvHK7on/euG2x
	3naZazwGRnQ/VXUmS3UvH0A7kLtDDK9SG2MSqGQgI/GMByfPyNmgnOHj4aqPAE0nURhQZLfsc4vF3
	LGu/C6/g==;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8fbr-00000004GJJ-2WMO
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Apr 2026 14:34:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1775226891;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mfQkfXvruFLjBEtgSvUk56xdMUuIiWCjbR168BWqGQ8=;
	b=cabSK/a5hDbPJqYkTJsHJPwW6KTVtMsKVxcEM9V6E/95c0hMItclBr2x1Z+Ee1Hkh7o7NN
	MV3gZ3JgKH/N1bJehr4F4/RHgVdvFVVnFwiIpF/Zb8l1YIPMGJAmPQkz3JqYUf1hemLA18
	1E1SmMUQoQKc+zXdbXAK9VcZ36vtGDE=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1775226891;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mfQkfXvruFLjBEtgSvUk56xdMUuIiWCjbR168BWqGQ8=;
	b=cabSK/a5hDbPJqYkTJsHJPwW6KTVtMsKVxcEM9V6E/95c0hMItclBr2x1Z+Ee1Hkh7o7NN
	MV3gZ3JgKH/N1bJehr4F4/RHgVdvFVVnFwiIpF/Zb8l1YIPMGJAmPQkz3JqYUf1hemLA18
	1E1SmMUQoQKc+zXdbXAK9VcZ36vtGDE=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-114-sUokkpMLOXq4BYzsjVudgw-1; Fri, 03 Apr 2026 10:34:48 -0400
X-MC-Unique: sUokkpMLOXq4BYzsjVudgw-1
X-Mimecast-MFC-AGG-ID: sUokkpMLOXq4BYzsjVudgw_1775226888
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cfdc479f5bso529944885a.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Apr 2026 07:34:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775226888; x=1775831688;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mfQkfXvruFLjBEtgSvUk56xdMUuIiWCjbR168BWqGQ8=;
        b=f0LDTQ5NAyfwYGknPmTnNIvc2+hUjZjcZyjihMQebbPBxvFFlhN9sExd2cYArv0eLC
         LoTOgf9pVgZtRFZEesapRghMmQMFAsJkoyPjRh6W/OGo8W99BuqNd3+jv3B2yg8j16NY
         9WYy0omprb6P8OEIIMZRuAY/KyRTRy/ALdk5ZCArzkJ8e52ktxjLtfyl1lvfKxAVO3uZ
         /uJXDJ2knPgFXuFGkIQNq6OVk6w9IqSadwP/3IBqFNY53P+XB5qTuK6IWpPJOaBwp+Xt
         UjeTGK/HymqTFMr25BD2IpoYJBc7LAcnz3HJWKPHdFVuw3hkHYnpw3YQQ3GX9KWkHSAM
         sdRA==
X-Forwarded-Encrypted: i=1; AJvYcCWg++2qEi0OAnx8guDWGEjggavf5dRs8+uRfx5bOjWjeR/6DIc1x30S8GYat1x83985sMUIQvBHC8RjsSDxmJib@lists.infradead.org
X-Gm-Message-State: AOJu0YzXJpPSQ1XgZrI43EB0xNl++hGsPgBPbRI1ZwcNYhOEwxg2PsXB
	Ne/HkMkGWSxJ6mtoec46fCUuBPFGV/NJv9kLyqiyRlbL4m5BRnxCfYP4Nc+YBXL+5GMu1O6uVV9
	DzNrCFNus22ChP6iBO79kxAI5oXR0rPZTFopuR3l5YjUd/71MgJoWJo39A+I7Xe6C0on7G5HhYB
	xj
X-Gm-Gg: ATEYQzwsCjUyNjEvs68VDfvmAn5ekqUdTlrtDJYMnQJIYVUVIDUavfkM9wupRP8m954
	/QFmrAhesjXOiaCrZ8bkzzBNrXnuMA1l9LxcYgiTPL83Z9KJTVAvXdHYu0PUTyU+PcpJ0Pjhc/j
	PJiCJa/iMbj20hm1mTP823j9Xki++HNSagvuHN2/eb1zmmM5OHxIjh+edMvDTvX7bQ9B8yIIxe1
	2Zrox8wi/FZwmaMl4cZFTTtZng7XvsWwG/oAiDYNt+PKhiqBMWHu7ay9TAcvpq6pHHbDJqXdWGG
	Tw0wYPlkCyK37PlbR/6+RhADGG2nxgh8f6bvtIgytlo+ass+OMUQ0isschlrFj7XbcKs3z63uvZ
	gdDqbKoHkDuOh6rq6rtbevBMAaXw1yWTAqULC5nMbU/k+WGkPJGSvuE/e
X-Received: by 2002:a05:620a:4402:b0:8cf:e946:b2d4 with SMTP id af79cd13be357-8d41c2b913bmr448642785a.69.1775226888129;
        Fri, 03 Apr 2026 07:34:48 -0700 (PDT)
X-Received: by 2002:a05:620a:4402:b0:8cf:e946:b2d4 with SMTP id af79cd13be357-8d41c2b913bmr448634385a.69.1775226887456;
        Fri, 03 Apr 2026 07:34:47 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8d2a8c29f17sm456198385a.42.2026.04.03.07.34.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 07:34:46 -0700 (PDT)
Date: Fri, 3 Apr 2026 10:34:44 -0400
From: Brian Masney <bmasney@redhat.com>
To: Yu-Chun Lin <eleanor.lin@realtek.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, p.zabel@pengutronix.de,
	cylee12@realtek.com, afaerber@suse.com, jyanchou@realtek.com,
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-realtek-soc@lists.infradead.org, james.tai@realtek.com,
	cy.huang@realtek.com, stanley_chang@realtek.com
Subject: Re: [PATCH v6 04/10] clk: realtek: Add support for phase locked
 loops (PLLs)
Message-ID: <ac_QBGY8VxcvuVlY@redhat.com>
References: <20260402073957.2742459-1-eleanor.lin@realtek.com>
 <20260402073957.2742459-5-eleanor.lin@realtek.com>
MIME-Version: 1.0
In-Reply-To: <20260402073957.2742459-5-eleanor.lin@realtek.com>
User-Agent: Mutt/2.3.0 (2026-01-25)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: UpV7za3l5Sq2mYiWEZUy6VZlGUOxIUQJqDhHiCv9MG8_1775226888
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260403_153455_948247_7CA13F50 
X-CRM114-Status: GOOD (  29.84  )
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

Hi Cheng-Yu,

On Thu, Apr 02, 2026 at 03:39:51PM +0800, Yu-Chun Lin wrote:
> From: Cheng-Yu Lee <cylee12@realtek.com>
> 
> Provide a full set of PLL operations for programmable PLLs and a read-only
> variant for fixed or hardware-managed PLLs.
> 
> Signed-off-by: Cheng-Yu Lee <cylee12@realtek.com>
> Co-developed-by: Yu-Chun Lin <eleanor.lin@realtek.com>
> Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
> ---
> Changes in v6:
> - Add the headers used in c file to follow the "Include What You Use" principle.
> - Move to_clk_pll() from clk-pll.h to clk-pll.c to limit its scope.
> ---
>  drivers/clk/realtek/Makefile     |   2 +
>  drivers/clk/realtek/clk-pll.c    | 164 +++++++++++++++++++++++++++++++
>  drivers/clk/realtek/clk-pll.h    |  42 ++++++++
>  drivers/clk/realtek/freq_table.c |  36 +++++++
>  drivers/clk/realtek/freq_table.h |  21 ++++
>  5 files changed, 265 insertions(+)
>  create mode 100644 drivers/clk/realtek/clk-pll.c
>  create mode 100644 drivers/clk/realtek/clk-pll.h
>  create mode 100644 drivers/clk/realtek/freq_table.c
>  create mode 100644 drivers/clk/realtek/freq_table.h
> 
> diff --git a/drivers/clk/realtek/Makefile b/drivers/clk/realtek/Makefile
> index 377ec776ee47..a89ad77993e9 100644
> --- a/drivers/clk/realtek/Makefile
> +++ b/drivers/clk/realtek/Makefile
> @@ -2,3 +2,5 @@
>  obj-$(CONFIG_RTK_CLK_COMMON) += clk-rtk.o
>  
>  clk-rtk-y += common.o
> +clk-rtk-y += clk-pll.o
> +clk-rtk-y += freq_table.o
> diff --git a/drivers/clk/realtek/clk-pll.c b/drivers/clk/realtek/clk-pll.c
> new file mode 100644
> index 000000000000..44730b22a94c
> --- /dev/null
> +++ b/drivers/clk/realtek/clk-pll.c
> @@ -0,0 +1,164 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2024 Realtek Semiconductor Corporation
> + * Author: Cheng-Yu Lee <cylee12@realtek.com>
> + */
> +
> +#include <linux/regmap.h>
> +#include "clk-pll.h"
> +
> +#define TIMEOUT 2000
> +
> +static inline struct clk_pll *to_clk_pll(struct clk_hw *hw)
> +{
> +	struct clk_regmap *clkr = to_clk_regmap(hw);
> +
> +	return container_of(clkr, struct clk_pll, clkr);
> +}
> +
> +static int wait_freq_ready(struct clk_pll *clkp)
> +{
> +	u32 pollval;
> +
> +	if (!clkp->freq_ready_valid)
> +		return 0;
> +
> +	return regmap_read_poll_timeout_atomic(clkp->clkr.regmap, clkp->freq_ready_reg, pollval,
> +						(pollval & clkp->freq_ready_mask)
> +						== clkp->freq_ready_val, 0, TIMEOUT);

I would put the "(pollval & clkp->freq_ready_mask) == clkp->freq_ready_val" on
the same line to improve readability. You can go out to 100 characters.

Also should the delay be greater than 0 to avoid tons of constant
retries?

> +}
> +
> +static bool is_power_on(struct clk_pll *clkp)
> +{
> +	u32 val;
> +
> +	if (!clkp->power_reg)
> +		return true;
> +
> +	if (regmap_read(clkp->clkr.regmap, clkp->power_reg, &val))
> +		return true;

Is the intention if there is an error, then it marks it as success?

> +
> +	return (val & clkp->power_mask) == clkp->power_val_on;
> +}
> +
> +static void clk_pll_disable(struct clk_hw *hw)
> +{
> +	struct clk_pll *clkp = to_clk_pll(hw);
> +
> +	if (!clkp->seq_power_off)
> +		return;
> +
> +	regmap_multi_reg_write(clkp->clkr.regmap, clkp->seq_power_off,
> +			       clkp->num_seq_power_off);
> +}
> +
> +static int clk_pll_is_enabled(struct clk_hw *hw)
> +{
> +	struct clk_pll *clkp = to_clk_pll(hw);
> +
> +	return is_power_on(clkp);
> +}
> +
> +static int clk_pll_determine_rate(struct clk_hw *hw,
> +				  struct clk_rate_request *req)
> +{
> +	struct clk_pll *clkp = to_clk_pll(hw);
> +	const struct freq_table *ftblv = NULL;
> +
> +	ftblv = ftbl_find_by_rate(clkp->freq_tbl, req->rate);
> +	if (!ftblv)
> +		return -EINVAL;
> +
> +	req->rate = ftblv->rate;
> +	return 0;

Add newline before return.

> +}
> +
> +static unsigned long clk_pll_recalc_rate(struct clk_hw *hw,
> +					 unsigned long parent_rate)
> +{
> +	struct clk_pll *clkp = to_clk_pll(hw);
> +	const struct freq_table *fv;
> +	u32 freq_val;
> +
> +	if (regmap_read(clkp->clkr.regmap, clkp->freq_reg, &freq_val))
> +		return 0;
> +
> +	freq_val &= clkp->freq_mask;
> +
> +	fv = ftbl_find_by_val_with_mask(clkp->freq_tbl, clkp->freq_mask,
> +					freq_val);
> +	return fv ? fv->rate : 0;

Add newline before return.

> +}
> +
> +static int clk_pll_set_rate(struct clk_hw *hw, unsigned long rate,
> +			    unsigned long parent_rate)
> +{
> +	struct clk_pll *clkp = to_clk_pll(hw);
> +	const struct freq_table *fv;
> +	int ret;
> +
> +	fv = ftbl_find_by_rate(clkp->freq_tbl, rate);
> +	if (!fv || fv->rate != rate)
> +		return -EINVAL;
> +
> +	if (clkp->seq_pre_set_freq) {
> +		ret = regmap_multi_reg_write(clkp->clkr.regmap, clkp->seq_pre_set_freq,
> +					     clkp->num_seq_pre_set_freq);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	ret = regmap_update_bits(clkp->clkr.regmap, clkp->freq_reg,
> +				 clkp->freq_mask, fv->val);
> +	if (ret)
> +		return ret;
> +
> +	if (clkp->seq_post_set_freq) {
> +		ret = regmap_multi_reg_write(clkp->clkr.regmap, clkp->seq_post_set_freq,
> +					     clkp->num_seq_post_set_freq);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	if (is_power_on(clkp)) {
> +		ret = wait_freq_ready(clkp);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static int clk_pll_enable(struct clk_hw *hw)
> +{
> +	struct clk_pll *clkp = to_clk_pll(hw);
> +	int ret;
> +
> +	if (!clkp->seq_power_on)
> +		return 0;
> +
> +	if (is_power_on(clkp))
> +		return 0;
> +
> +	ret = regmap_multi_reg_write(clkp->clkr.regmap, clkp->seq_power_on,
> +				     clkp->num_seq_power_on);
> +	if (ret)
> +		return ret;
> +
> +	return wait_freq_ready(clkp);
> +}
> +
> +const struct clk_ops rtk_clk_pll_ops = {
> +	.enable         = clk_pll_enable,
> +	.disable        = clk_pll_disable,
> +	.is_enabled     = clk_pll_is_enabled,
> +	.recalc_rate    = clk_pll_recalc_rate,
> +	.determine_rate = clk_pll_determine_rate,
> +	.set_rate       = clk_pll_set_rate,
> +};
> +EXPORT_SYMBOL_NS_GPL(rtk_clk_pll_ops, "REALTEK_CLK");
> +
> +const struct clk_ops rtk_clk_pll_ro_ops = {
> +	.recalc_rate = clk_pll_recalc_rate,
> +};
> +EXPORT_SYMBOL_NS_GPL(rtk_clk_pll_ro_ops, "REALTEK_CLK");
> diff --git a/drivers/clk/realtek/clk-pll.h b/drivers/clk/realtek/clk-pll.h
> new file mode 100644
> index 000000000000..00884585a242
> --- /dev/null
> +++ b/drivers/clk/realtek/clk-pll.h
> @@ -0,0 +1,42 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (C) 2017-2019 Realtek Semiconductor Corporation
> + * Author: Cheng-Yu Lee <cylee12@realtek.com>
> + */
> +
> +#ifndef __CLK_REALTEK_CLK_PLL_H
> +#define __CLK_REALTEK_CLK_PLL_H
> +
> +#include "common.h"
> +#include "freq_table.h"
> +
> +struct reg_sequence;
> +
> +struct clk_pll {
> +	struct clk_regmap clkr;
> +	const struct reg_sequence *seq_power_on;
> +	u32 num_seq_power_on;
> +	const struct reg_sequence *seq_power_off;
> +	u32 num_seq_power_off;
> +	const struct reg_sequence *seq_pre_set_freq;
> +	u32 num_seq_pre_set_freq;
> +	const struct reg_sequence *seq_post_set_freq;
> +	u32 num_seq_post_set_freq;
> +	const struct freq_table *freq_tbl;
> +	u32 freq_reg;
> +	u32 freq_mask;
> +	u32 freq_ready_valid;
> +	u32 freq_ready_mask;
> +	u32 freq_ready_reg;
> +	u32 freq_ready_val;
> +	u32 power_reg;
> +	u32 power_mask;
> +	u32 power_val_on;
> +};
> +
> +#define __clk_pll_hw(_ptr)  __clk_regmap_hw(&(_ptr)->clkr)
> +
> +extern const struct clk_ops rtk_clk_pll_ops;
> +extern const struct clk_ops rtk_clk_pll_ro_ops;
> +
> +#endif /* __CLK_REALTEK_CLK_PLL_H */
> diff --git a/drivers/clk/realtek/freq_table.c b/drivers/clk/realtek/freq_table.c
> new file mode 100644
> index 000000000000..272a10e75a54
> --- /dev/null
> +++ b/drivers/clk/realtek/freq_table.c
> @@ -0,0 +1,36 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +
> +#include <linux/bitops.h>
> +#include "freq_table.h"
> +
> +const struct freq_table *ftbl_find_by_rate(const struct freq_table *ftbl,
> +					   unsigned long rate)
> +{
> +	unsigned long best_rate = 0;
> +	const struct freq_table *best = NULL;

Put variables in reverse Christmas tree order.

> +
> +	for (; !IS_FREQ_TABLE_END(ftbl); ftbl++) {
> +		if (ftbl->rate == rate)
> +			return ftbl;
> +
> +		if (ftbl->rate > rate)
> +			continue;
> +
> +		if (ftbl->rate > best_rate) {
> +			best_rate = ftbl->rate;
> +			best = ftbl;
> +		}
> +	}
> +
> +	return best;
> +}
> +
> +const struct freq_table *
> +ftbl_find_by_val_with_mask(const struct freq_table *ftbl, u32 mask, u32 value)
> +{
> +	for (; !IS_FREQ_TABLE_END(ftbl); ftbl++) {
> +		if ((ftbl->val & mask) == (value & mask))
> +			return ftbl;
> +	}
> +	return NULL;
> +};
> diff --git a/drivers/clk/realtek/freq_table.h b/drivers/clk/realtek/freq_table.h
> new file mode 100644
> index 000000000000..6d9116651105
> --- /dev/null
> +++ b/drivers/clk/realtek/freq_table.h
> @@ -0,0 +1,21 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +
> +struct freq_table {
> +	u32 val;
> +	unsigned long rate;
> +};
> +
> +/* ofs check */
> +#define CLK_OFS_INVALID        -1
> +#define CLK_OFS_IS_VALID(_ofs) ((_ofs) != CLK_OFS_INVALID)

Is this used anywhere?

Brian


> +
> +#define FREQ_TABLE_END    \
> +	{                 \
> +		.rate = 0 \
> +	}
> +#define IS_FREQ_TABLE_END(_f) ((_f)->rate == 0)
> +
> +const struct freq_table *ftbl_find_by_rate(const struct freq_table *ftbl,
> +					   unsigned long rate);
> +const struct freq_table *
> +ftbl_find_by_val_with_mask(const struct freq_table *ftbl, u32 mask, u32 value);
> -- 
> 2.34.1
> 



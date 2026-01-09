Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 018E9D232EE
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Jan 2026 08:10:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FAMQsqIBX9VApzAoB/iyMiZBZ9Ii7tTy/fW2jyRfgnA=; b=Y2BJXoZw3dZr/gTpoY+HtbN9Jh
	zTuNDxRcUQwJc/4RqrGm2RwlKmemM/tvxJcRN5inuxLF9p8xh9KNRMUyEvYNg5YLz1eaHDBukTn3f
	qeZSN29ovstd8KDl9vB45AeNnFfJYA7ejUm3RqxVUtOBa9+kNAO/Z/qp29W77Yw4jnxtf8Xa+Ed3G
	GHe3hMYfppCcc5Ki64ZWhK64dmEJkSRbkXJfmsbW3oC8tfTdvICbOdGIr1TyKL5scqpeswK3Ajkd6
	n6zqLl333wv7Ihl4t3AtCo4abW8YderLjPhUh84ESRKx1B3XBaLoyD5qVZzdwuZGhqtEuabk77q/G
	Kwy8pvww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve7ZX-00000001qZ5-3F57;
	Fri, 09 Jan 2026 08:10:16 +0000
Received: from mleia.com ([178.79.152.223] helo=mail.mleia.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve7ZT-00000001qXg-3csX
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Jan 2026 08:10:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1767946210; bh=t/E7bKZ+u/vdPJTBp/1yUrD65ZcPdr1jOsuXNAVd5uY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=khnjaE9eSEq0AVmiTfWRsMEERo9YbJYPVsBBdp/zEizvxFQWhPWK4i3wv01L87T+F
	 KDO2h7mRaoy2NMaz8ilOkgy4PiKwcw+gaifEjvbmWcN1yqfsLjO1l9b9RFQx+qpKJK
	 O3WFUrx0wuzS8lAi1vSyy9cDee4+Hu4t0tbdFgKq0H8GRY+uw/XGPyWAf1+drdi3Fi
	 gwHNjpl7+sl8LQDyRtdE9e3Fd86Bhfkm0ePLAJZetxOScEf+H3/qIEFptXhOoTAazu
	 60HUbzEHg7XpLNq84lev0zipzmhOWhL1jlwmBPD9IJyq/pFh2N/Q/EU/MLkHAWNI0z
	 iubSFF0m2mV6A==
Received: from mail.mleia.com (localhost [127.0.0.1])
	by mail.mleia.com (Postfix) with ESMTP id 0D62D3EB34F;
	Fri,  9 Jan 2026 08:10:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1767946209; bh=t/E7bKZ+u/vdPJTBp/1yUrD65ZcPdr1jOsuXNAVd5uY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=FWIm4lCPRFPUrO32qC58RZ105QCWyu7VBOPCx7+xwuV8HDPQTc2HCFLrRYCyBRrbe
	 cnzV3tZF/VSt+j0SanatHNMqPJBnhyfxZE0pSlE6eb9zqEguOG5hFVCFjC6AN4gXkS
	 i2rhnhlDFM2Cm5aKXvr4e3rj6pMqw93x5JdM1WXyLVNrs6BBLgbekwPDhwrhPGsMws
	 v981/Fc+fPNwvyxD71PNp8PRMCkRFEFS6sm7gFChaMz2WSfBH/lsChNM/6Oov57b0W
	 Hlxr5/WOdre1KtmG1OQFdGglbz1Jnq2OQY8Rwq2JYuZznBRqEyLcLhYoiRZXEdW08O
	 QBbgrISzIweyw==
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi [91.159.24.186])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.mleia.com (Postfix) with ESMTPSA id 8D6A73EAC0F;
	Fri,  9 Jan 2026 08:10:09 +0000 (UTC)
Message-ID: <4e69222b-8e26-44d8-8e09-379e7f4c7d55@mleia.com>
Date: Fri, 9 Jan 2026 10:10:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 13/27] clk: nxp: lpc32xx: convert from
 divider_round_rate() to divider_determine_rate()
To: Brian Masney <bmasney@redhat.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
 linux-arm-kernel@lists.infradead.org
References: <20260108-clk-divider-round-rate-v1-0-535a3ed73bf3@redhat.com>
 <20260108-clk-divider-round-rate-v1-13-535a3ed73bf3@redhat.com>
From: Vladimir Zapolskiy <vz@mleia.com>
In-Reply-To: <20260108-clk-divider-round-rate-v1-13-535a3ed73bf3@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-49551924 
X-CRM114-CacheID: sfid-20260109_081010_069918_D0411628 
X-CRM114-Status: GOOD (  17.62  )
/bin/ln: failed to access 'reaver_cache/texts/20260109_081010_069918_D0411628': No such file or directory
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260109_081010_069918_D0411628 
X-CRM114-Status: GOOD (  19.85  )
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

On 1/8/26 23:16, Brian Masney wrote:
> The divider_round_rate() function is now deprecated, so let's migrate
> to divider_determine_rate() instead so that this deprecated API can be
> removed.
> 
> Note that when the main function itself was migrated to use
> determine_rate, this was mistakenly converted to:
> 
>      req->rate = divider_round_rate(...)
> 
> This is invalid in the case when an error occurs since it can set the
> rate to a negative value.
> 
> Fixes: 0879768df240 ("clk: nxp: lpc32xx: convert from round_rate() to determine_rate()")
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> 
> ---
> To: Vladimir Zapolskiy <vz@mleia.com>
> To: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
> Cc: linux-arm-kernel@lists.infradead.org
> ---
>   drivers/clk/nxp/clk-lpc32xx.c | 6 ++----
>   1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/clk/nxp/clk-lpc32xx.c b/drivers/clk/nxp/clk-lpc32xx.c
> index 23f980cf6a2b59ee1c93a2519fe5188d251fa12f..ae2fa5341a2e4fbe5f2d3ef9a6cf9e9d75180d59 100644
> --- a/drivers/clk/nxp/clk-lpc32xx.c
> +++ b/drivers/clk/nxp/clk-lpc32xx.c
> @@ -975,10 +975,8 @@ static int clk_divider_determine_rate(struct clk_hw *hw,
>   		return 0;
>   	}
>   
> -	req->rate = divider_round_rate(hw, req->rate, &req->best_parent_rate,
> -				       divider->table, divider->width, divider->flags);
> -
> -	return 0;
> +	return divider_determine_rate(hw, req, divider->table, divider->width,
> +				      divider->flags);
>   }
>   
>   static int clk_divider_set_rate(struct clk_hw *hw, unsigned long rate,
> 

Tested-by: Vladimir Zapolskiy <vz@mleia.com>
Reviewed-by: Vladimir Zapolskiy <vz@mleia.com>

-- 
Best wishes,
Vladimir


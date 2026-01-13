Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0621D0C84F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Jan 2026 11:04:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2Jadah+cTe4W525bZbMa2L3Zq+Yu6qwVwd5AuG96W9o=; b=yxM4Ga0Q2f7VKlE80v7KPJD0/P
	Mpb3R8WJD7V9BwjjG+1PB8IIPMDce2IyaGMyMii5yVfMutgjyrKmLICXNwLGj9TtdT+9BWIj8o8gy
	Omc3YBm7OUspaa0h+yUGT1ID6G6US2uTc2xFqdCuyS0MRB3ZG7D0S55TczEvIGAFPg9IjdwtFEjp1
	t0whcxdzred30sWLsKi6yitg4tJpUlEnZiuMHZZysGtsFLpQZWsxHkSjnohdygtHMEmTKGCoeo+Wh
	YxALHz4QN8EhOooKPSFWo2SBnnqUzh3UuHp/hlJWf6mWeDzS7cCsETBxsEQZC0tH/HwPHPo7lfgPx
	5mc7hA/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfcCi-00000006z8H-20e1;
	Tue, 13 Jan 2026 11:04:52 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfcCh-00000006z85-1NLc;
	Tue, 13 Jan 2026 11:04:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7183C6000A;
	Tue, 13 Jan 2026 11:04:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63185C116C6;
	Tue, 13 Jan 2026 11:04:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768302290;
	bh=wOormaL9PD1DYwYJHqWiopjDekcsEFD3wPQ8gHBL2cw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=caCPIhWUJaaWLRUhsVIf6sJpFdGESi270guP9LIaFZ4qr0jAh0mRMI7ntyHpCB7Y0
	 YNVrWfB5Hy5jXNmtaOCcVoFsLjJ0OoOM2cQnSHH0hLwsMB8nmH7urYJONXD9PuUKGl
	 Y952TiVZ/KfWRlYUIrQ+4ZdKfTK9NB2VJeXnXQJK5vmkYAVwM4ra2SEXLnVulhiuYs
	 3UntSOeR+olyVNb1s0b1TdsMV00SzGdWImf2XZ6J3whYDx7vUHXVmGBzbx3sfkxGOh
	 pGC9jmRyLZQB6F9/AazKgBWT5/e9z1+ZpHNN1NGIB7qgn7/0wm46tsC+ahU+kCUDeU
	 Wlc2WyKPCxOKQ==
Date: Tue, 13 Jan 2026 11:04:44 +0000
From: Lee Jones <lee@kernel.org>
To: guptarud@gmail.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	Kamil =?utf-8?Q?Trzci=C5=84ski?= <ayufan@ayufan.eu>,
	Martijn Braam <martijn@brixit.nl>, Ondrej Jirman <megi@xff.cz>
Subject: Re: [PATCH 2/3] mfd: rk8xx-core: Configure `rk808-clkout2` function
Message-ID: <20260113110444.GD1902656@google.com>
References: <20260112-ppp_connectivity-v1-0-284d6e83b212@gmail.com>
 <20260112-ppp_connectivity-v1-2-284d6e83b212@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260112-ppp_connectivity-v1-2-284d6e83b212@gmail.com>
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

On Mon, 12 Jan 2026, Rudraksha Gupta via B4 Relay wrote:

> From: Kamil Trzciński <ayufan@ayufan.eu>
> 
> While the Wifi and Bluetooth chip are defined in the Pinephone Pro's
> DTS, it actually isn't able to be used. Let's define rk808-clkout2 so
> that userspace can actually interact with Wifi and Bluetooth
> 
> Co-developed-by: Martijn Braam <martijn@brixit.nl>
> Signed-off-by: Martijn Braam <martijn@brixit.nl>
> Signed-off-by: Kamil Trzciński <ayufan@ayufan.eu>
> Signed-off-by: Ondrej Jirman <megi@xff.cz>
> Signed-off-by: Rudraksha Gupta <guptarud@gmail.com>

This is a bonkers amount of SoBs for a 3-line change.

What on earth is going on here?

> ---
>  drivers/mfd/rk8xx-core.c  | 1 +
>  include/linux/mfd/rk808.h | 2 ++
>  2 files changed, 3 insertions(+)
> 
> diff --git a/drivers/mfd/rk8xx-core.c b/drivers/mfd/rk8xx-core.c
> index def4587fdfb8..602218694334 100644
> --- a/drivers/mfd/rk8xx-core.c
> +++ b/drivers/mfd/rk8xx-core.c
> @@ -282,6 +282,7 @@ static const struct rk808_reg_data rk818_pre_init_reg[] = {
>  	{ RK818_H5V_EN_REG,	  BIT(0),	    RK818_H5V_EN },
>  	{ RK808_VB_MON_REG,	  MASK_ALL,	    VB_LO_ACT |
>  						    VB_LO_SEL_3500MV },
> +	{ RK808_CLK32OUT_REG, CLK32KOUT2_FUNC_MASK, CLK32KOUT2_FUNC },
>  };
>  
>  static const struct regmap_irq rk805_irqs[] = {
> diff --git a/include/linux/mfd/rk808.h b/include/linux/mfd/rk808.h
> index 28170ee08898..077fe2e15b78 100644
> --- a/include/linux/mfd/rk808.h
> +++ b/include/linux/mfd/rk808.h
> @@ -934,6 +934,8 @@ enum rk806_dvs_mode {
>  
>  #define VOUT_LO_INT	BIT(0)
>  #define CLK32KOUT2_EN	BIT(0)
> +#define CLK32KOUT2_FUNC		(0 << 1)
> +#define CLK32KOUT2_FUNC_MASK	BIT(1)
>  
>  #define TEMP105C			0x08
>  #define TEMP115C			0x0c
> 
> -- 
> 2.52.0
> 
> 

-- 
Lee Jones [李琼斯]


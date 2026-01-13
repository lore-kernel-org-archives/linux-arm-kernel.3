Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04C58D30CC2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Jan 2026 20:21:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zJ9najKVQrAsmnSBxXVihCGJpl+juoHCCvtdG6HO1nU=; b=ihltZErq4dqw3S6/1fRYZd5geU
	0bhUy2udrmmIqrXNrzyL5dt2019sDBSsMqjQlLKWYaJsxOYlxBcHFINFJGhoAgY9S76pdxCGtbLC+
	hMJy3fu8fozc+2bJ2mD3Iuz+yrWXd/tiFtZ28wjABRXfo5EuIi+5dgGDdfiMDEYMHnqhY/PVIWabJ
	oxD/ET3SrOeIUp6mARXxuHvyFGcZQGjyhZJGm7u/WUl18xtSHDLBKqU+BRmShip0/eQYUFf1MOp2U
	L5QQImxDUQtqt975V/Ljvvh1F6hhU8lKjOqU4ymNeuZM3O7+EQiCYd900OK7VsSzUJaxmJwdySLYq
	HBfWYFHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfkt4-00000007gTh-1h7H;
	Tue, 13 Jan 2026 20:21:10 +0000
Received: from vps.xff.cz ([195.181.215.36])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfksw-00000007gTA-3yal;
	Tue, 13 Jan 2026 20:21:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xff.cz; s=mail;
	t=1768335657; bh=4qRB3n1SAwl6RtI0sIa55a0VepVkx8uJIqy5veReaWg=;
	h=Date:From:To:Cc:Subject:X-My-GPG-KeyId:References:From;
	b=iMQZzVmEAPqwtnWIOrfBvjn78MLlUP45stGFjZBJOjL14mg5xgw24Fgce+Jm4CEm2
	 Y8g4jgebc+b9Te1t/g5sFm8ivP6vGfwOw1IqpeeQaoXFhekYK4vyROH+jsgf+PRfOY
	 x/Q3ToYiyAp9ipXF5lsQQDQSd2LBoeol7R1REkMU=
Date: Tue, 13 Jan 2026 21:20:57 +0100
From: =?utf-8?Q?Ond=C5=99ej?= Jirman <megi@xff.cz>
To: guptarud@gmail.com
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Lee Jones <lee@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Kamil =?utf-8?Q?Trzci=C5=84ski?= <ayufan@ayufan.eu>, Martijn Braam <martijn@brixit.nl>
Subject: Re: [PATCH 2/3] mfd: rk8xx-core: Configure `rk808-clkout2` function
Message-ID: <w7vj2nkvxmledeptr7gd5twa6nxtgmaleenkdqjay22ppxba6t@z66nt7k5qi6q>
Mail-Followup-To: =?utf-8?Q?Ond=C5=99ej?= Jirman <megi@xff.cz>, 
	guptarud@gmail.com, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Lee Jones <lee@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Kamil =?utf-8?Q?Trzci=C5=84ski?= <ayufan@ayufan.eu>, Martijn Braam <martijn@brixit.nl>
X-My-GPG-KeyId: EBFBDDE11FB918D44D1F56C1F9F0A873BE9777ED
 <https://xff.cz/key.txt>
References: <20260112-ppp_connectivity-v1-0-284d6e83b212@gmail.com>
 <20260112-ppp_connectivity-v1-2-284d6e83b212@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260112-ppp_connectivity-v1-2-284d6e83b212@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_122103_456530_EF4AAFDB 
X-CRM114-Status: GOOD (  15.36  )
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

On Mon, Jan 12, 2026 at 10:42:25PM -0800, Rudraksha Gupta via B4 Relay wrote:
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

Hi Rudraksha, I don't belong here. Semi-original patch from 5 yrs ago is here:
  
  https://codeberg.org/megi/linux/commit/75be96faf939504d0fd5112846e73e437573f716

thanks,
	o.

> Signed-off-by: Rudraksha Gupta <guptarud@gmail.com>
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


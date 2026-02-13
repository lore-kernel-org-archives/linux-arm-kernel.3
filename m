Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79934EDF023
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Feb 2026 09:35:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v2sr77zQGEtH16ijO0gQaYPUXbn49B/6xoYa5H+1VQU=; b=Cjv2+qB0EfFo+YTMfIPrP0j3/+
	pRsDQhvAxOpGy/3FNl9hbQzFnU+/GC9nvNpIHeT8ycsxbP7iJxmrVD0T04EPKlG0fMaZ3dGx/4JJX
	rLCvGni5jw51zrNehKdgF19KYFlCJdBprMOZHhoo5kS1IuUtDcvWQym9latmI3dhsjvkmCqlcNnJt
	brw0IQ6sxj+QuYkR8/5WR3ClBb/j940BJCRyDcCOuhdjX+GTwxsnaRHiECby3R/uKWoAwrmvVjvia
	J2fuRi7+fpsMHSWCvPrR5HOxaLtWDsfeXDneumUbshbD2W/IPIHpGwNsZVxv6FWCx9zHJTa8FqK56
	+8X0u+og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqpaA-00000003FWE-1YfN;
	Fri, 13 Feb 2026 09:35:26 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqpa5-00000003FUp-2iYw;
	Fri, 13 Feb 2026 09:35:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1770975318;
	bh=f9czAYBnY4F1mb2qB92X9nU6lRz+eaOYt/gVPcytyK4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=WF6UIG1L/DlR4lhHsHYVWBoyIIbWGoqF7Za+PgATHTvvIW7tKTp5QLlfltd4S0alo
	 8yYP9PCnSjAjrbpuP/8PWMnSCOCNLqRresRVB2pO8Ac4I+qo92a5czKysIEBmAnRh6
	 qGqVUPNYVcvE8YrLf4Cumf4MqgQL7i2ki6ZHOFna+ETtfye5KfEamjqH9VeVunrJUi
	 rOsqxyFxPzE00DR0b7DzFJ5CsAWc4yZMDEMhxDduR9CbSF8CLVAe2dtA8MNh+4gbfv
	 J/gkLKVBtwgEJSKNKu7iW3ZM1SwmKWjLmU9R3OrPH/zs7TrnrNaMiph0OUx4HaKvj9
	 M4XzZzruB0zRw==
Received: from [10.40.0.100] (185-67-175-126.lampert.tv [185.67.175.126])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: mriesch)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 019B217E00AC;
	Fri, 13 Feb 2026 10:35:17 +0100 (CET)
Message-ID: <c58b5662-6785-4605-9832-f7c4704c33ba@collabora.com>
Date: Fri, 13 Feb 2026 10:35:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] media: synopsys: only check errors from
 devm_clk_bulk_get_all()
To: Frank Li <Frank.Li@nxp.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, Guoniu Zhou <guoniu.zhou@oss.nxp.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, imx@lists.linux.dev
References: <20260210-imx93-dw-csi2-v1-0-69667bb86bfa@nxp.com>
 <20260210-imx93-dw-csi2-v1-2-69667bb86bfa@nxp.com>
Content-Language: en-US
From: Michael Riesch <michael.riesch@collabora.com>
In-Reply-To: <20260210-imx93-dw-csi2-v1-2-69667bb86bfa@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260213_013521_869741_F03DBC65 
X-CRM114-Status: GOOD (  16.80  )
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

Hi Frank,

Thanks for your patch.

The remark w.r.t. the "media: synopsys: csi2rx: " prefix holds for this
and all the other patches in this series as well, of course.

On 2/10/26 18:11, Frank Li wrote:
> devm_clk_bulk_get_all() returns all clocks described in the DT, which are
> already validated by the binding. Do not need enforce an expected clock
> count.
> 
> Only check for error returns (< 0) to support more SoCs.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  drivers/media/platform/synopsys/dw-mipi-csi2rx.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/synopsys/dw-mipi-csi2rx.c b/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
> index 0cc892f4a1b3c6ce575a5d4fca7acf7057f7b7f7..61cd7f491b3d5b8a37707b23ca03ce709b40a79f 100644
> --- a/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
> +++ b/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
> @@ -630,7 +630,7 @@ static int dw_mipi_csi2rx_probe(struct platform_device *pdev)
>  		return PTR_ERR(csi2->base_addr);
>  
>  	ret = devm_clk_bulk_get_all(dev, &csi2->clks);
> -	if (ret != DW_MIPI_CSI2RX_CLKS_MAX)

DW_MIPI_CSI2RX_CLKS_MAX is not used anymore, please remove.

With that change,

Reviewed-by: Michael Riesch <michael.riesch@collabora.com>

Best regards,
Michael


> +	if (ret < 0)
>  		return dev_err_probe(dev, -ENODEV, "failed to get clocks\n");
>  	csi2->clks_num = ret;
>  
> 



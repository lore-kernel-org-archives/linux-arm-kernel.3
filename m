Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 733FDC369D3
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Apr 2025 11:20:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YOn5uDNnmbpz2YvqS/MmIuJTmu3qB5FpprhRLnKlvIE=; b=XprJ6sRa1SobQTwUdML31tyEfg
	46J3L8N5j7cIOwIKn3NAHFYaBIxYkQ9NJQpyH138uv24tKnYUNaXPG7Sz9q8E6DYKpPrGhYLIKBw+
	R4J3UkAOijuqAjFU4az406mbl9Pvz+ZsAbGx+XO1xrrb7eriVdtOuaZoG/CDTdIRKRpGRMydsGb7L
	96BfzIgFBiiE0oWMT4CCd53/AOIXQu3acFtHxL7j++20XGPyYPJ5yyxxRaDsuFchpMMTbng/+AFv0
	sEp2wMsSDWod0sM07EYsYf7E3tLJsrCCRIYANvPa+qY/qZGQftC6Jn2LNt35kFENB0hzmD2fi7IpT
	Wk0wB3Rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u903r-00000003Oz1-3oJH;
	Sun, 27 Apr 2025 11:20:39 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8zzK-00000003OWX-3Kga
	for linux-arm-kernel@lists.infradead.org;
	Sun, 27 Apr 2025 11:16:00 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-301918a4e3bso4331265a91.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 27 Apr 2025 04:15:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745752558; x=1746357358; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YOn5uDNnmbpz2YvqS/MmIuJTmu3qB5FpprhRLnKlvIE=;
        b=tO1MYY+s1LdqyKv41AimtKERyC1T2AcKbUHcUtaQRoGtWgSch05rCeicMZXyj9YWrq
         Wz55stVjJzOAEJR+2tBNpMAIbnMAx47Y3SRxFBUf9Nx0CqGkdc9BVUQCENZiqZ25jCi4
         doeEutxkrz4SRNVXxsWrM1+LqTX5EdMidWbHHXIyaMtX3tI9MV+MLJ4r04vpZoJl19Rh
         DjQgmCb21IkVpP/jonAACBQrJE5P1snw+5qdLEBdN27rh+S2eIXv30E6EBkSmWNqzqhX
         rBTr9KjD3jzZsR1ApDsSFpo14WJvEJ4EL/2x0B39hxcEV7rw3NOP6bcNUOI/0opmHMU7
         k8gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745752558; x=1746357358;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YOn5uDNnmbpz2YvqS/MmIuJTmu3qB5FpprhRLnKlvIE=;
        b=EtH5Ve9ZWbmjWTpcgBN0wk1X7MMVzdk/Gvf7mWVWddQRjGudH7gn3CyfuWMHi6cKFy
         fbgEp+HhH/bqEi7OdABr6PZoq0COtStXmdQRe6Mx9nBnXDUEgd7fb/zmT0M8fxB5ykZb
         RywmfW5MgJgng7vRGEutoh7Qipkveg9xRY7XWM9ybqGMz2vP3GE7Tke6GziccLa+82qA
         D5jE9Q8ZsLnGmd7U7677cAJxHSJzeTUm3iptcQn++Vj1HLCCHoByHBTU0i361Y+1gvly
         mhV++Y2cH756/vEVEoebly70QwW0QHW3WMSvSbHJc7uqD38vYYFDHcgmekxxkZHQTQHN
         uhQQ==
X-Forwarded-Encrypted: i=1; AJvYcCXU7nUpUeBy7dHUO7TwV6JTS4tVVJ1tPV2TzJWl7j3fqiPFw4BfAUgyv35BN9y9TU1GBtPIai9p4UO5QUE6L4Yv@lists.infradead.org
X-Gm-Message-State: AOJu0YxQSIXzoyIPO5tEazVaqsNgLFhtghXn7YI81Sj2dRLBu9rNrvhE
	aRmvQaaQJhmBWT/IBUf9VeVioO6NiG2VgchTwn6EqQu89pppO3eBsosclI6ybQ==
X-Gm-Gg: ASbGncsIO8Ue7JPxNJHgtqlDQtosjIz5ijzb63imuXeC3Ge6ZJZYxHqFo/grn2L08rZ
	/vwEUtWq+233Zfg6cX8HMl1+ogvNKHYMGxXWUrpV14Xr5PsJ3SyOWrLHNFvJyskNMS8mtIYoRMn
	PMcKJi72kEe3X442PZySF7JXqaOHGvpv2ZDS6JP6iSdtV2d12uLtaMMmr5OUKRWCKcgpUHJBlPC
	uyqJWbTxOPYRBu8IoxEY8aWF51EfvPDYPLmMS+6Lzm+rshkOc+H4wBM3edvGsgzVlLVlJ36yLYL
	mvnqfeAvLT8EqyXk0d6Z5s8nMDv6AOrhMBaKKByO6/yWp4LgJEPx04YyMhjs9Io=
X-Google-Smtp-Source: AGHT+IFLgscZ/lYINfuAkkH9jISjtRT3pDQ1Z95sY0g7bHDD7akZs8rvcSaagngpu+qBp7Bz7x7Yig==
X-Received: by 2002:a17:90b:2dca:b0:2ee:edae:75e with SMTP id 98e67ed59e1d1-309f7dd8a34mr12567779a91.13.1745752557651;
        Sun, 27 Apr 2025 04:15:57 -0700 (PDT)
Received: from thinkpad ([120.60.143.241])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db50e7cb2sm62778045ad.112.2025.04.27.04.15.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Apr 2025 04:15:57 -0700 (PDT)
Date: Sun, 27 Apr 2025 16:45:51 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Richard Zhu <hongxing.zhu@nxp.com>
Cc: frank.li@nxp.com, l.stach@pengutronix.de, lpieralisi@kernel.org, 
	kw@linux.com, robh@kernel.org, bhelgaas@google.com, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND v6 4/7] PCI: imx6: Workaround i.MX95 PCIe may not
 exit L23 ready
Message-ID: <4cbv5uzo2vcigrjmpisg5ndovhkp2cpyg5sczpxsde7gmv5fd2@cf4li7yqkxwn>
References: <20250416081314.3929794-1-hongxing.zhu@nxp.com>
 <20250416081314.3929794-5-hongxing.zhu@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250416081314.3929794-5-hongxing.zhu@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250427_041558_835199_888113D8 
X-CRM114-Status: GOOD (  19.22  )
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

On Wed, Apr 16, 2025 at 04:13:11PM +0800, Richard Zhu wrote:
> ERR051624: The Controller Without Vaux Cannot Exit L23 Ready Through Beacon
> or PERST# De-assertion
> 
> When the auxiliary power is not available, the controller cannot exit from
> L23 Ready with beacon or PERST# de-assertion when main power is not
> removed.
> 
> Workaround: Set SS_RW_REG_1[SYS_AUX_PWR_DET] to 1.
> 
> The workaround is irrespective of Vaux presence in remote partner.
> In the other words, this workaround should work whatever the remote
> partner has the Vaux or not.
> 
> Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> ---
>  drivers/pci/controller/dwc/pci-imx6.c | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
> index 7c60b712480a..016b86add959 100644
> --- a/drivers/pci/controller/dwc/pci-imx6.c
> +++ b/drivers/pci/controller/dwc/pci-imx6.c
> @@ -48,6 +48,8 @@
>  #define IMX95_PCIE_SS_RW_REG_0			0xf0
>  #define IMX95_PCIE_REF_CLKEN			BIT(23)
>  #define IMX95_PCIE_PHY_CR_PARA_SEL		BIT(9)
> +#define IMX95_PCIE_SS_RW_REG_1			0xf4
> +#define IMX95_PCIE_SYS_AUX_PWR_DET		BIT(31)
>  
>  #define IMX95_PE0_GEN_CTRL_1			0x1050
>  #define IMX95_PCIE_DEVICE_TYPE			GENMASK(3, 0)
> @@ -227,6 +229,19 @@ static unsigned int imx_pcie_grp_offset(const struct imx_pcie *imx_pcie)
>  
>  static int imx95_pcie_init_phy(struct imx_pcie *imx_pcie)
>  {
> +	/*
> +	 * ERR051624: The Controller Without Vaux Cannot Exit L23 Ready
> +	 * Through Beacon or PERST# De-assertion
> +	 *
> +	 * When the auxiliary power is not available, the controller
> +	 * cannot exit from L23 Ready with beacon or PERST# de-assertion
> +	 * when main power is not removed.
> +	 *
> +	 * Workaround: Set SS_RW_REG_1[SYS_AUX_PWR_DET] to 1.
> +	 */
> +	regmap_set_bits(imx_pcie->iomuxc_gpr, IMX95_PCIE_SS_RW_REG_1,
> +			IMX95_PCIE_SYS_AUX_PWR_DET);
> +
>  	regmap_update_bits(imx_pcie->iomuxc_gpr,
>  			IMX95_PCIE_SS_RW_REG_0,
>  			IMX95_PCIE_PHY_CR_PARA_SEL,
> -- 
> 2.37.1
> 

-- 
மணிவண்ணன் சதாசிவம்


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A61DC3601E
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Apr 2025 15:21:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t5SxyZdFhsBdqIFHmGXVTKr/6RFpFPtSv5Kv+4B1G54=; b=NuR6Gnz9FSLuRO058JZ+rUsnHq
	jhkME7HFblbV/khtIBAXwZZYQkfYxmaJsfhJIcbWNqS/UhHqvHSYV6+jJTmhEcsJtQsRwGcSA3KFQ
	aefc+IJvujBi/3B1Xl5BEGOwIYWT5aFMyU0Zc7k6b1pM97CdkXdf64d+jMpFMcNlNI64Dwt/dGPJ2
	GcSQ/VDyTN/o+DxvraLYNo7XT+fXE49em2bjHQj8UXrmWTnRQkJZxfJRfJoEdINnR8x3l1obvaT6I
	I6GByzhVcgm/csz/gcJSPkHlVjQgRp8LdeLCK6I9jjpNU5jzKIYriVPBVktY/eRdG1L6uWT0iVPFn
	wbV55m8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3z9Q-0000000HJvG-211Q;
	Sun, 13 Apr 2025 15:21:40 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3z6Q-0000000HJhR-3DY3
	for linux-arm-kernel@lists.infradead.org;
	Sun, 13 Apr 2025 15:18:35 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-22409077c06so46607315ad.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 13 Apr 2025 08:18:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744557514; x=1745162314; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=t5SxyZdFhsBdqIFHmGXVTKr/6RFpFPtSv5Kv+4B1G54=;
        b=oPDzsV3RvDaYpWKZsoCwXt9bmTuhrSx94wwPzJ9jRVq7+9IZMZvZR83bCq5YtM6xCk
         6IicjviSQJKELh8JL6limSZFIM4MiOGlJ2vq66XV+K7jn+kgP92lGgxPgFdMfrrkh02B
         mnC+mG/8CJDC5z/ZtECsbdhxgJn5XcuTaT9ZhrSHIMUSEs4Ap38zpH3Csqlkw0NGmaqE
         kfwg4LmczcNxnepD2khDavUtR381V5sAJm9OU4RBiCLdk3tDHWgsNukrLfGSrgwIRM/p
         VCMEW2IfxSg3ktUgJxwl9AArlgh3f3FNkMcya9UEzNS8qeeNxBUUAemQexL/VEArlcyc
         k72Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744557514; x=1745162314;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=t5SxyZdFhsBdqIFHmGXVTKr/6RFpFPtSv5Kv+4B1G54=;
        b=Co8IsyqQ3hM4/Eb9RrzECOlt+NbHOIxvmnNwDjgipCByMV4qNj+YAz9LhZiCCPuQCD
         0jwBU0EPE44mV6rXN2S76uuuOQimcaZ9F8eFQ4N2HH/ErNFnFTsTTM2jd50mTp5LAwrp
         OmJeb1v3KpiBEEqZw83UY7ZhaSPFrJkwRimKcGSOct/gtp2Hhi8sL7aJh5SCCC/H6/p/
         byxMqF8tmn5pRDtTl649qigBFsO9Uu9cdisOp0d1vtRD9KAI5t8bv1P+YtM0nN9Zw/y6
         4HlTaIGHpjx1yFP7i5iyROmJXp4fnX+pujg+qYbBFh+7XkcxHSe86wDQ/Y99WzJ0an0t
         fltw==
X-Forwarded-Encrypted: i=1; AJvYcCVGt02W9H0SnevxeErfAgioRao57475xqqhqU+R1gejy6cVZb3bdQHCKyxzxhdCE6VrFZip6KiBgSbf6iTprPrr@lists.infradead.org
X-Gm-Message-State: AOJu0YwB5iPqz+w24jfhKWO6cgml5QRlBOGRfJynStI55Mcqx6xeghGF
	xsrbeooagyoIZgu8xbJZ0K+sgdmJjZVv8Z2yFnMUbsjsKjx2+8mStLiRY1RPDQ==
X-Gm-Gg: ASbGncsOSPAohfcX5iu2wPcJtE5900a6tEeLXPKCYOX6KGI3j8S4CNO0ppymboeOvK7
	dbLKtBML4pxME5QFfxG9lbaRjNKtBzH6fxW8caZllGVdWSe1NQtntJopLxUk4cB47rWVE7Dv7hr
	IgXSNUCwFwYIwvIwtLr8XjGFBnjo27I5j/oRPnS4rWdUoytXM2CeZjuJdnql3gu6+JB5R7z4bS8
	bBGn/ljnIVf5S9BgYMg7SklOrF9Hm6tGVbRig8LaT0gxqs2Z4NVNkudUEvJ6ozwGGZXSMVD8QsU
	ghpRyXP6mb15IcQ3Tz7WhAJEj3VS143Fi2IjG3YwE+RLag+DCLH1
X-Google-Smtp-Source: AGHT+IHDZ8f7JVDhbxKzAwHoGnI3IfIzM3yHwUjNE3PyS9q8zuAZM5A71PAC0QwIseLe1+9XzUcjmQ==
X-Received: by 2002:a17:903:2309:b0:220:c813:dfcc with SMTP id d9443c01a7336-22bea4f1ab1mr152530195ad.40.1744557513757;
        Sun, 13 Apr 2025 08:18:33 -0700 (PDT)
Received: from thinkpad ([120.60.137.231])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7cb59a6sm83980095ad.203.2025.04.13.08.18.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Apr 2025 08:18:33 -0700 (PDT)
Date: Sun, 13 Apr 2025 20:48:25 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Richard Zhu <hongxing.zhu@nxp.com>
Cc: frank.li@nxp.com, l.stach@pengutronix.de, lpieralisi@kernel.org, 
	kw@linux.com, robh@kernel.org, bhelgaas@google.com, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 3/7] PCI: imx6: Toggle the cold reset for i.MX95 PCIe
Message-ID: <pnc2kgveacnox4kbdamggp6p7pjmuyan6lwucdgzyqg3u75uo7@bb6bnsy75e4x>
References: <20250408025930.1863551-1-hongxing.zhu@nxp.com>
 <20250408025930.1863551-4-hongxing.zhu@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250408025930.1863551-4-hongxing.zhu@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250413_081834_810579_BE081D4F 
X-CRM114-Status: GOOD (  22.76  )
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

On Tue, Apr 08, 2025 at 10:59:26AM +0800, Richard Zhu wrote:
> Add the cold reset toggle for i.MX95 PCIe to align PHY's power up sequency.

Please avoid spelling mistakes in the commit messages.

> 
> Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> ---
>  drivers/pci/controller/dwc/pci-imx6.c | 42 +++++++++++++++++++++++++++
>  1 file changed, 42 insertions(+)
> 
> diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
> index c5871c3d4194..7c60b712480a 100644
> --- a/drivers/pci/controller/dwc/pci-imx6.c
> +++ b/drivers/pci/controller/dwc/pci-imx6.c
> @@ -71,6 +71,9 @@
>  #define IMX95_SID_MASK				GENMASK(5, 0)
>  #define IMX95_MAX_LUT				32
>  
> +#define IMX95_PCIE_RST_CTRL			0x3010
> +#define IMX95_PCIE_COLD_RST			BIT(0)
> +
>  #define to_imx_pcie(x)	dev_get_drvdata((x)->dev)
>  
>  enum imx_pcie_variants {
> @@ -773,6 +776,43 @@ static int imx7d_pcie_core_reset(struct imx_pcie *imx_pcie, bool assert)
>  	return 0;
>  }
>  
> +static int imx95_pcie_core_reset(struct imx_pcie *imx_pcie, bool assert)
> +{
> +	u32 val;
> +
> +	if (assert) {
> +		/*
> +		 * From i.MX95 PCIe PHY perspective, the COLD reset toggle
> +		 * should be complete after power-up by the following sequence.
> +		 *                 > 10us(at power-up)
> +		 *                 > 10ns(warm reset)
> +		 *               |<------------>|
> +		 *                ______________
> +		 * phy_reset ____/              \________________
> +		 *                                   ____________
> +		 * ref_clk_en_______________________/
> +		 * Toggle COLD reset aligned with this sequence for i.MX95 PCIe.
> +		 */
> +		regmap_set_bits(imx_pcie->iomuxc_gpr, IMX95_PCIE_RST_CTRL,
> +				IMX95_PCIE_COLD_RST);
> +		/*
> +		 * Make sure the write to IMX95_PCIE_RST_CTRL is flushed to the
> +		 * hardware by doing a read. Otherwise, there is no guarantee
> +		 * that the write has reached the hardware before udelay().
> +		 */
> +		regmap_read_bypassed(imx_pcie->iomuxc_gpr, IMX95_PCIE_RST_CTRL,
> +				     &val);
> +		udelay(15);
> +		regmap_clear_bits(imx_pcie->iomuxc_gpr, IMX95_PCIE_RST_CTRL,
> +				  IMX95_PCIE_COLD_RST);
> +		regmap_read_bypassed(imx_pcie->iomuxc_gpr, IMX95_PCIE_RST_CTRL,
> +				     &val);
> +		udelay(10);
> +	}
> +
> +	return 0;
> +}
> +
>  static void imx_pcie_assert_core_reset(struct imx_pcie *imx_pcie)
>  {
>  	reset_control_assert(imx_pcie->pciephy_reset);
> @@ -1739,6 +1779,7 @@ static const struct imx_pcie_drvdata drvdata[] = {
>  		.ltssm_mask = IMX95_PCIE_LTSSM_EN,
>  		.mode_off[0]  = IMX95_PE0_GEN_CTRL_1,
>  		.mode_mask[0] = IMX95_PCIE_DEVICE_TYPE,
> +		.core_reset = imx95_pcie_core_reset,
>  		.init_phy = imx95_pcie_init_phy,
>  	},
>  	[IMX8MQ_EP] = {
> @@ -1792,6 +1833,7 @@ static const struct imx_pcie_drvdata drvdata[] = {
>  		.mode_off[0]  = IMX95_PE0_GEN_CTRL_1,
>  		.mode_mask[0] = IMX95_PCIE_DEVICE_TYPE,
>  		.init_phy = imx95_pcie_init_phy,
> +		.core_reset = imx95_pcie_core_reset,
>  		.epc_features = &imx95_pcie_epc_features,
>  		.mode = DW_PCIE_EP_TYPE,
>  	},
> -- 
> 2.37.1
> 

-- 
மணிவண்ணன் சதாசிவம்


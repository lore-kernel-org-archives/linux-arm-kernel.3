Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0348D132DC
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Nov 2024 15:15:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IWAz5TdjV0s3G3j5HR50h22mQFRBfFcqS1CejLxUMh4=; b=FJoJy/GtjjeWom6YBTqyR6sWRZ
	fmnoM3+4XpsVxazZhJqoFMR44YrP8SPk6EMSsB3T20K0/u4HthrNLC2hX7Tpgrvtw54XIgnlBAQTQ
	z8zDRFx9ca2gcj4pjrdwFM6/wdT38WDzgiwVsYhayFD8FIMoQ5A7B40symLReSn/697KecV3zQcBa
	A7MbrdjPhaBpi+pawNNIQr2XekBfLpkYmdDmDQlDx3cNfgnaOJfIzkcbeiNVYARcC21q5UelXEVZy
	+41c4hLPxAjM10tcNskukcPJCMRSUb0y8juyPworj7HuPrTWEaXNJADba8VSt+E65ck+bfX7c2IhJ
	9/4GD2bQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7ynK-0000000EAWU-3x4J;
	Mon, 04 Nov 2024 15:15:06 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7ykV-0000000EA78-3re5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Nov 2024 15:12:13 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-20c803787abso33453095ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 04 Nov 2024 07:12:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730733130; x=1731337930; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IWAz5TdjV0s3G3j5HR50h22mQFRBfFcqS1CejLxUMh4=;
        b=CkiD+dhWwDrLn6A53PSo45qfDfLpy0CfewSADz35lMmTIi28SlXHCMmBtvhVcjSkKI
         yhPD5qf+I/qImIlOlZTQMu/o0aq1VJZXXOFBpH9t7pRWi0iyQ9h7z9WIPyDXOfEPKQ1D
         43xrzPtbhwlUSsAkG85EDPl8ZfccPrYSOW2zapLPWnOvMwEFzmFWpHpDKUnbqXCAOQWa
         CwYHaBtloZarN2JeViajzy5pb6ZubFFmbrrk8dimMLr+Z2iFVuAybdW2/wD9kr/s+j05
         VJ8uS1R5qF9PdioPVEoU8GT3IpdPUspAg13PC4Z3FTIqCclZbimL/oLe64mtQ4HyZVhv
         dbKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730733130; x=1731337930;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IWAz5TdjV0s3G3j5HR50h22mQFRBfFcqS1CejLxUMh4=;
        b=MULnx2nE16NHhxpSRYgfvJ8169jl9HGWr2xptKGi0lgjmV4cli8thDFlm7Bhymsdnt
         FpMuuflI01YoplvM0IphzCwmeDyOTgRWaT7gRcS/yNtAPnhbSPwyboOUyN1rIfJHXIEK
         9xeH7SrZMzjVd3flza1+d0IrnYFC5RkvdyCXew1/sG/t7il3vmX/l7df2JVpOI1fta7c
         SrU9+dXuN0FnlSonOmOqKd8mHK5eRxPkFdgx3/IZB8gxwRV72GA5oX/u12glXWnBtAdv
         BxEUmrK93ATYBZnbjo0rpDG1WFyEPQqiyOCyLn/rKWj795LKl6ThJLrfMRIJWluYekSa
         FOYg==
X-Forwarded-Encrypted: i=1; AJvYcCUZAQs2UyyEdhM5I5zzOmz+WtNSU9N0qkCcq5Z8zpl66ZPUv9r1y+m1DiQ6xC4q0czJ6Y5lS+A1rmCCIq5Xfkj+@lists.infradead.org
X-Gm-Message-State: AOJu0Yxlya7c/8p1nEG75QpcwkyIP/j/7x6QJR1V/5oJI/fLM2rxGt9W
	b18lcrNwdoOij3Ym1gdYs8lxDBgRBHuZGSiEeaKAL4dRen/zjCsKkT3p8e9pkplTIm4zLK5L6HQ
	=
X-Google-Smtp-Source: AGHT+IF/DA7LNyMgu1pnTQkftl5jvkj6Flffim544TjwWV+oZb0jj3oRtdO+6se3chWJxM92S10XOw==
X-Received: by 2002:a17:902:ccd2:b0:20c:9026:93a with SMTP id d9443c01a7336-2111946831emr213769535ad.19.1730733130510;
        Mon, 04 Nov 2024 07:12:10 -0800 (PST)
Received: from thinkpad ([2409:40f4:3049:1cc7:217b:63a:40ce:2e01])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21105707e12sm62411805ad.82.2024.11.04.07.12.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2024 07:12:09 -0800 (PST)
Date: Mon, 4 Nov 2024 20:42:02 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Stefan Eichenberger <eichest@gmail.com>
Cc: hongxing.zhu@nxp.com, l.stach@pengutronix.de, lpieralisi@kernel.org,
	kw@linux.com, robh@kernel.org, bhelgaas@google.com,
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, francesco.dolcini@toradex.com, Frank.li@nxp.com,
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev, linux-kernel@vger.kernel.org,
	Stefan Eichenberger <stefan.eichenberger@toradex.com>
Subject: Re: [PATCH v4] PCI: imx6: Add suspend/resume support for i.MX6QDL
Message-ID: <20241104151202.k6v6fxwyb44n7qw6@thinkpad>
References: <20241030103250.83640-1-eichest@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241030103250.83640-1-eichest@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_071212_101606_15715667 
X-CRM114-Status: GOOD (  37.64  )
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

On Wed, Oct 30, 2024 at 11:32:45AM +0100, Stefan Eichenberger wrote:
> From: Stefan Eichenberger <stefan.eichenberger@toradex.com>
> 
> The suspend/resume functionality is currently broken on the i.MX6QDL
> platform, as documented in the NXP errata (ERR005723):
> https://www.nxp.com/docs/en/errata/IMX6DQCE.pdf
> 
> This patch addresses the issue by sharing most of the suspend/resume
> sequences used by other i.MX devices, while avoiding modifications to
> critical registers that disrupt the PCIe functionality. It targets the
> same problem as the following downstream commit:
> https://github.com/nxp-imx/linux-imx/commit/4e92355e1f79d225ea842511fcfd42b343b32995
> 
> Unlike the downstream commit, this patch also resets the connected PCIe
> device if possible. Without this reset, certain drivers, such as ath10k
> or iwlwifi, will crash on resume. The device reset is also done by the
> driver on other i.MX platforms, making this patch consistent with
> existing practices.
> 
> Without this patch, suspend/resume will fail on i.MX6QDL devices if a
> PCIe device is connected. Upon resuming, the kernel will hang and
> display an error. Here's an example of the error encountered with the
> ath10k driver:
> ath10k_pci 0000:01:00.0: Unable to change power state from D3hot to D0, device inaccessible
> Unhandled fault: imprecise external abort (0x1406) at 0x0106f944
> 
> Signed-off-by: Stefan Eichenberger <stefan.eichenberger@toradex.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> ---
> Changes in v4:
> - Improve commit message (Bjorn)
> - Fix style issue on comments (Bjorn)
> - s/msi/MSI (Bjorn)
> 
> Changes in v3:
> - Added a new flag to the driver data to indicate that the suspend/resume
>   is broken on the i.MX6QDL platform. (Frank)
> - Fix comments to be more relevant (Mani)
> - Use imx_pcie_assert_core_reset in suspend (Mani)
> 
>  drivers/pci/controller/dwc/pci-imx6.c | 57 +++++++++++++++++++++------
>  1 file changed, 46 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
> index 808d1f1054173..c8d5c90aa4d45 100644
> --- a/drivers/pci/controller/dwc/pci-imx6.c
> +++ b/drivers/pci/controller/dwc/pci-imx6.c
> @@ -82,6 +82,11 @@ enum imx_pcie_variants {
>  #define IMX_PCIE_FLAG_HAS_SERDES		BIT(6)
>  #define IMX_PCIE_FLAG_SUPPORT_64BIT		BIT(7)
>  #define IMX_PCIE_FLAG_CPU_ADDR_FIXUP		BIT(8)
> +/*
> + * Because of ERR005723 (PCIe does not support L2 power down) we need to
> + * workaround suspend resume on some devices which are affected by this errata.
> + */
> +#define IMX_PCIE_FLAG_BROKEN_SUSPEND		BIT(9)
>  
>  #define imx_check_flag(pci, val)	(pci->drvdata->flags & val)
>  
> @@ -1237,9 +1242,19 @@ static int imx_pcie_suspend_noirq(struct device *dev)
>  		return 0;
>  
>  	imx_pcie_msi_save_restore(imx_pcie, true);
> -	imx_pcie_pm_turnoff(imx_pcie);
> -	imx_pcie_stop_link(imx_pcie->pci);
> -	imx_pcie_host_exit(pp);
> +	if (imx_check_flag(imx_pcie, IMX_PCIE_FLAG_BROKEN_SUSPEND)) {
> +		/*
> +		 * The minimum for a workaround would be to set PERST# and to
> +		 * set the PCIE_TEST_PD flag. However, we can also disable the
> +		 * clock which saves some power.
> +		 */
> +		imx_pcie_assert_core_reset(imx_pcie);
> +		imx_pcie->drvdata->enable_ref_clk(imx_pcie, false);
> +	} else {
> +		imx_pcie_pm_turnoff(imx_pcie);
> +		imx_pcie_stop_link(imx_pcie->pci);
> +		imx_pcie_host_exit(pp);
> +	}
>  
>  	return 0;
>  }
> @@ -1253,14 +1268,32 @@ static int imx_pcie_resume_noirq(struct device *dev)
>  	if (!(imx_pcie->drvdata->flags & IMX_PCIE_FLAG_SUPPORTS_SUSPEND))
>  		return 0;
>  
> -	ret = imx_pcie_host_init(pp);
> -	if (ret)
> -		return ret;
> -	imx_pcie_msi_save_restore(imx_pcie, false);
> -	dw_pcie_setup_rc(pp);
> +	if (imx_check_flag(imx_pcie, IMX_PCIE_FLAG_BROKEN_SUSPEND)) {
> +		ret = imx_pcie->drvdata->enable_ref_clk(imx_pcie, true);
> +		if (ret)
> +			return ret;
> +		ret = imx_pcie_deassert_core_reset(imx_pcie);
> +		if (ret)
> +			return ret;
> +		/*
> +		 * Using PCIE_TEST_PD seems to disable MSI and powers down the
> +		 * root complex. This is why we have to setup the rc again and
> +		 * why we have to restore the MSI register.
> +		 */
> +		ret = dw_pcie_setup_rc(&imx_pcie->pci->pp);
> +		if (ret)
> +			return ret;
> +		imx_pcie_msi_save_restore(imx_pcie, false);
> +	} else {
> +		ret = imx_pcie_host_init(pp);
> +		if (ret)
> +			return ret;
> +		imx_pcie_msi_save_restore(imx_pcie, false);
> +		dw_pcie_setup_rc(pp);
>  
> -	if (imx_pcie->link_is_up)
> -		imx_pcie_start_link(imx_pcie->pci);
> +		if (imx_pcie->link_is_up)
> +			imx_pcie_start_link(imx_pcie->pci);
> +	}
>  
>  	return 0;
>  }
> @@ -1485,7 +1518,9 @@ static const struct imx_pcie_drvdata drvdata[] = {
>  	[IMX6Q] = {
>  		.variant = IMX6Q,
>  		.flags = IMX_PCIE_FLAG_IMX_PHY |
> -			 IMX_PCIE_FLAG_IMX_SPEED_CHANGE,
> +			 IMX_PCIE_FLAG_IMX_SPEED_CHANGE |
> +			 IMX_PCIE_FLAG_BROKEN_SUSPEND |
> +			 IMX_PCIE_FLAG_SUPPORTS_SUSPEND,
>  		.dbi_length = 0x200,
>  		.gpr = "fsl,imx6q-iomuxc-gpr",
>  		.clk_names = imx6q_clks,
> -- 
> 2.43.0
> 

-- 
மணிவண்ணன் சதாசிவம்


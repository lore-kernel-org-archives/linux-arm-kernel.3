Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16042CAC581
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Sep 2025 17:08:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OLEsv3J3Kq1CN12rIPFxcle1rGi1xSKzDbJ+T8kiiFs=; b=bbZ20y4pc4KvlnyLg0s9k1BNqB
	dNEJF7JaVTaOTWla1uOoXHjphji036y1zSTeQWgdyq1MSZSCdhDbc/UvIPd/pAD3ud0wsn+bLRNCd
	gAtxU+Zs9zkLWVX3UfywaxzA5mOyYpKDmJED44KdBKEnJNRpFM92QbLJO30p7tN9S5R3q0qUjfsxz
	JwVj83EK/1IrdAo6tFD/M5kqnTQBcP8mYDGjNXodYkV4tmN0pX3SIKQKyTj7934sOciaE6EWlTjjk
	63SDD8C7rfgB+bmaZnT2pjmOwMtaPz3pcrpWbundZJ60yNd7/0SudXWVdKAgNv6lCjZIydhHvA15v
	1go4qn9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvfLv-0000000115u-2Q6C;
	Mon, 08 Sep 2025 17:08:27 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvb8j-0000000H4Xi-0pe3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Sep 2025 12:38:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8304F601CF;
	Mon,  8 Sep 2025 12:38:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62BFFC4CEF1;
	Mon,  8 Sep 2025 12:38:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757335112;
	bh=u/aSpq/tYI23caay5KQ+gDiq/maVvqHIQQw80mCFn3c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=p+1Jw5QJyiyJodrRlHhDg3F8S0oQOxQpM6sq+lJgHPJRsFH/9qXp37SfULYDNstZQ
	 YEjX6PgRPC/uWE5fOcUMF8gCKGHf9lnvsBHrfHs1VnIGT6pYwy7bOwb0OaqdWU/ZL2
	 n9yAvPUdlzF8zCl+Rc/LhrzAiOnTVzw09lMhDahFsQVIaD6g0mJS3gYgXf+lRld2Oe
	 ynGKPo2qqdxvQLuLpjHWMtowk43XtkB1aHtXWn5NzkYTYtL0QEpJmFFLhjO2GKp33m
	 OToNakbvsd1SVG2IFzxlN+xrC+VJYxsvApsELK2aZW8LDgZnVQ8HQuuo5eYXtPH9TX
	 ahdbbFP4y4Nxw==
Date: Mon, 8 Sep 2025 18:08:24 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>
Cc: Frank.Li@nxp.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, lpieralisi@kernel.org, kwilczynski@kernel.org, 
	bhelgaas@google.com, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, yuji2.ishikawa@toshiba.co.jp
Subject: Re: [PATCH v3 2/2] PCI: dwc: visconti: Remove cpu_addr_fix() after
 DTS fix ranges
Message-ID: <etltxzybqmhkst3324knpofx46lyp2vju43wvfu47oovfbmo5r@4v4nniat4sx5>
References: <1757298848-15154-1-git-send-email-nobuhiro.iwamatsu.x90@mail.toshiba>
 <1757298848-15154-3-git-send-email-nobuhiro.iwamatsu.x90@mail.toshiba>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1757298848-15154-3-git-send-email-nobuhiro.iwamatsu.x90@mail.toshiba>
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

On Mon, Sep 08, 2025 at 11:34:08AM GMT, Nobuhiro Iwamatsu wrote:
> From: Frank Li <Frank.Li@nxp.com>
> 
> Remove cpu_addr_fix() since it is no longer needed. The PCIe ranges
> property has been corrected in the DTS, and the DesignWare common code now
> handles address translation properly without requiring this workaround.
> 

What about the old DTs? Wouldn't this driver fail to work if you use it with old
DTs as cpu_addr_fixup() no longer exists?

- Mani

> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> Signed-off-by: Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>
> 
> ---
> v3:
>   Add pci->use_parent_dt_ranges fixes.
>   Update Signed-off-by address, because my company email address haschanged.
> 
> v2:
>   No Update.
> ---
>  drivers/pci/controller/dwc/pcie-visconti.c | 15 ++-------------
>  1 file changed, 2 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-visconti.c b/drivers/pci/controller/dwc/pcie-visconti.c
> index cdeac6177143c..d8765e57147af 100644
> --- a/drivers/pci/controller/dwc/pcie-visconti.c
> +++ b/drivers/pci/controller/dwc/pcie-visconti.c
> @@ -171,20 +171,7 @@ static void visconti_pcie_stop_link(struct dw_pcie *pci)
>  	visconti_mpu_writel(pcie, val | MPU_MP_EN_DISABLE, PCIE_MPU_REG_MP_EN);
>  }
>  
> -/*
> - * In this SoC specification, the CPU bus outputs the offset value from
> - * 0x40000000 to the PCIe bus, so 0x40000000 is subtracted from the CPU
> - * bus address. This 0x40000000 is also based on io_base from DT.
> - */
> -static u64 visconti_pcie_cpu_addr_fixup(struct dw_pcie *pci, u64 cpu_addr)
> -{
> -	struct dw_pcie_rp *pp = &pci->pp;
> -
> -	return cpu_addr & ~pp->io_base;
> -}
> -
>  static const struct dw_pcie_ops dw_pcie_ops = {
> -	.cpu_addr_fixup = visconti_pcie_cpu_addr_fixup,
>  	.link_up = visconti_pcie_link_up,
>  	.start_link = visconti_pcie_start_link,
>  	.stop_link = visconti_pcie_stop_link,
> @@ -310,6 +297,8 @@ static int visconti_pcie_probe(struct platform_device *pdev)
>  
>  	platform_set_drvdata(pdev, pcie);
>  
> +	pci->use_parent_dt_ranges = true;
> +
>  	return visconti_add_pcie_port(pcie, pdev);
>  }
>  
> -- 
> 2.51.0
> 
> 

-- 
மணிவண்ணன் சதாசிவம்


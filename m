Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF6AACCD1AB
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 19 Oct 2025 05:47:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AposZdA97v4QvIOBBItfYm/C3IV29NLm7krGfYU2BhE=; b=OLUpPGuBF0rW61EdUtYJ+qdZFZ
	ymFLkY15ecGkAK7ZeBD2L1mrYiSr3dzYT0cHFfxkBIrgKRXAJ1ZHujyOcxSqt4jNxkdLKNTXi70uw
	YaKm51ueMFipjy2T++Z4PSxz2eQUzH3cQIEZ0gO5P+2Bv0iD/zabwmhHSc3QWnqHXdzvYJB3jF8Mb
	1diEjRURmyZV1X316wnMRBbDr7BVMDAdx53NV5RX7ErpWDpKWwcpUmkDXySQimSjC8e8Xk2Fjri6D
	HnmlqX5Y4Xu1mr9chHEpyy71kGZO02WeLi0R8/G9aBGan8vqXri4WSuJpJHfON0NwT+veYaa3TArz
	mWS2De/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAMGT-0000000AhgY-37JH;
	Sun, 19 Oct 2025 05:47:33 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAMGS-0000000Ahg5-0WSU
	for linux-arm-kernel@lists.infradead.org;
	Sun, 19 Oct 2025 05:47:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 378E060261;
	Sun, 19 Oct 2025 05:47:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4AE4C4CEE7;
	Sun, 19 Oct 2025 05:47:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760852842;
	bh=Cug9c27jA9+gokQPguItXYngRRlfQacDDzPvQMTHUb4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bkLBBCIuBF3XQUYxsX2zWfNGa7gmHAqJZP4DYD/7CiIKL5EREik60ZaHWZCdNYqyK
	 52N1yPT4O+4Ay2DNL2TL+zC3vVC5ieANkDRL6EIhcT4wtAtZBP7IIoOBl2ITUFUKx5
	 hTXaRnLdM1HK2b1O20Zv1J7dVNGfFVdoc9RU+dDVaAJbfiJIH3d51WHLfKC/v2ijs9
	 laGlk1NyN/O8XMgk1b91Oco8al9mN4RL06rPHxPsxFyGew/pWQkD9+/EHCJtE4Z6Xn
	 HkBI+7CLQIcjwt8MrZ2a26lC+GRqte6t+o6pi8278sR1uFw98xIlgeNDvPGLkHQ5ci
	 dFfl97YBVE4gA==
Date: Sun, 19 Oct 2025 11:17:04 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>
Cc: Frank.Li@nxp.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, lpieralisi@kernel.org, kwilczynski@kernel.org, 
	bhelgaas@google.com, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, yuji2.ishikawa@toshiba.co.jp
Subject: Re: [PATCH v3 2/2] PCI: dwc: visconti: Remove cpu_addr_fix() after
 DTS fix ranges
Message-ID: <v7voxo42ryezh7iypjqqqnpxk6pdrm4fovgsdvmd56362umdsy@bhooegmb5rx6>
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

On Mon, Sep 08, 2025 at 11:34:08AM +0900, Nobuhiro Iwamatsu wrote:
> From: Frank Li <Frank.Li@nxp.com>
> 
> Remove cpu_addr_fix() since it is no longer needed. The PCIe ranges
> property has been corrected in the DTS, and the DesignWare common code now
> handles address translation properly without requiring this workaround.
> 
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

I hope you'll respin this series by keeping just the above flag and dropping the
cpu_addr_fixup removal.

- Mani

-- 
மணிவண்ணன் சதாசிவம்


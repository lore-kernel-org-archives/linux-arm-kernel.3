Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58733CAC587
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 06:52:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=RZFjES2k2kBsAkAviByrospglkEep/Rk5p+P1xEzAd0=; b=KZChjU5W4bwLmK
	DMNYN7M1BJmE26z08GwI320tWhZMkfjRLSTAw1pj2dAlEBkw9B4D9YWiL5H3pWB0yk+PpBlbZFass
	F1P9Z6mvOSJBbMb8sNVaUvzlXkihBlAT/eQamQ4EtT+qOJgBpll+kXC1qPfLnbQfFPwTMFggRV7pj
	U22pMO8x6Jw1DcpDg9xSyQppkuwms5HrFHYBojROKuU02yjTcwF/ktNlWBrZy+cDk5FSHX75ZgDPS
	ZCmDQkzk4pt1EUg7dnI7sT5s0RyvH03WN+jBs5mOohzu45VRSR5LqJl3+zKw88qGTfDJwg5WyS5l3
	Mgn0tF15j/miQAtRuKMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvsCl-00000004qgU-271N;
	Tue, 09 Sep 2025 06:51:51 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvjpQ-00000002bLk-1KYF
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Sep 2025 21:55:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 077BB405BC;
	Mon,  8 Sep 2025 21:55:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6B7AC4CEF1;
	Mon,  8 Sep 2025 21:55:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757368511;
	bh=+nYJPbuKlpnqlu3CLLJjdFbOtA1lzkZavy4yOLM+sGc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=kiDbdfAuo9J++rxAYt2nbuOgNET0a6aGGKZyM1O70K6sKUOOBtjNGuP5/jiU0a2O7
	 kgDOBgNSMfStFqgdYWCblaRMhdw7xF1V8/WBdswaXIMObwyEyCKJLFMb13dwZc07rt
	 IjUSn7k/xbQQ3go5vh6EUy5WulEkff8YPQDzVBRI8kU5AuNWVfVPKUSSmrRtP1AYuR
	 vx04Rru42xQY6+u2WSM0ZRr3xwOBqnxcctWQgasngIzjADGtKq7Iq4oQtMXlawR9kx
	 yE3u9L6fsekFx4PQ4yK6olQo65pW1Ed4I3YxMTsa2Xwpa2lAJ+vPB3bRE/Tn/bCc2e
	 nz5PYilemvA6Q==
Date: Mon, 8 Sep 2025 16:55:10 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>
Cc: Frank.Li@nxp.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, lpieralisi@kernel.org, kwilczynski@kernel.org,
	mani@kernel.org, bhelgaas@google.com,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
	yuji2.ishikawa@toshiba.co.jp
Subject: Re: [PATCH v3 2/2] PCI: dwc: visconti: Remove cpu_addr_fix() after
 DTS fix ranges
Message-ID: <20250908215510.GA1467223@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1757298848-15154-3-git-send-email-nobuhiro.iwamatsu.x90@mail.toshiba>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_145512_379054_9720D5A1 
X-CRM114-Status: GOOD (  21.47  )
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

In subject, s/PCI: dwc: visconti:/PCI: visconti:/ to match previous
history.

On Mon, Sep 08, 2025 at 11:34:08AM +0900, Nobuhiro Iwamatsu wrote:
> From: Frank Li <Frank.Li@nxp.com>
> 
> Remove cpu_addr_fix() since it is no longer needed. The PCIe ranges
> property has been corrected in the DTS, and the DesignWare common code now
> handles address translation properly without requiring this workaround.

As Mani pointed out, the driver has to continue working correctly with
any old DTs in the field.

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


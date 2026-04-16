Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE9A9F433D2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Apr 2026 00:29:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:Cc:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b7fNNyLnGOcPPmzEQN5mA5MPrcDctArkyQ2ZUb33EbE=; b=mwcxNV8l5CNn/f2dpikRH1iw+h
	Kadf+RKb+96uj2tWcIia5hDYISW6TPu8+AoiMMltx0P4XpYB93bCO7cwukN+yozAFJvH6OAqHiDEg
	yMgR93FW3pSuD18DJoOjghJLaCipZznCc4s2mBFeszyGNu3jFhbJx1bc9QSDVy5S/EcpQWsQUwfux
	spPaMCGfAjdIOFZbNBpdUadkCS6ZXLnV9QOGwrQDntXKsJz/jBFQaxb5x2fvnCvoUn8aCeLODJKWt
	K0WLSje256AvHelR0nPy4/4lMVNuM0L74aHb47wbM0AzIm8zs2/w8UtJmuTJzTmnU3y07ChFShsZ3
	AMzwG1hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDAbt-00000001oih-3qdB;
	Thu, 16 Apr 2026 00:29:33 +0000
Received: from mail-m9365.xmail.ntesmail.com ([103.126.93.65])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDAbr-00000001oiL-1hGf
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Apr 2026 00:29:32 +0000
Received: from [172.16.12.17] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 3ae6eb0eb;
	Thu, 16 Apr 2026 08:29:26 +0800 (GMT+08:00)
Message-ID: <96fb5db4-0860-b412-11fd-ebcc0b34f887@rock-chips.com>
Date: Thu, 16 Apr 2026 08:29:24 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.1
Cc: shawn.lin@rock-chips.com, linux-mmc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH v3 2/2] mmc: dw_mmc: exynos: increase DMA threshold value
 for exynos7870
To: Kaustabh Chakraborty <kauschluss@disroot.org>,
 Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jaehoon Chung <jh80.chung@samsung.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
References: <20260415-dwmmc-dma-thr-v3-0-31014d36b6ee@disroot.org>
 <20260415-dwmmc-dma-thr-v3-2-31014d36b6ee@disroot.org>
From: Shawn Lin <shawn.lin@rock-chips.com>
In-Reply-To: <20260415-dwmmc-dma-thr-v3-2-31014d36b6ee@disroot.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9d93b1580809cckunm8bc0942b1a9e90
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGU1NHlZKSEhLHhlDGB8YGRhWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=FY4wyXPy7pPdpC1z4Oh5qnqUOrHKOYc1xgeKUNcNddoBfDq9QScon2T9WfCqWFexbTg2oG3bTWI+kHBkfLqU45+jpDOxjlPWiTVWadVqLRSlXCyuVcEOeAZzAnwruf5tJDuawE0F794L3wUZJE/pqFtBfiC3mErYtFsi4djKqRc=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=b7fNNyLnGOcPPmzEQN5mA5MPrcDctArkyQ2ZUb33EbE=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260415_172931_656957_1F6F477A 
X-CRM114-Status: GOOD (  12.53  )
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

在 2026/04/15 星期三 23:02, Kaustabh Chakraborty 写道:
> Exynos 7870 compatible controllers, such as SDIO ones are not able to
> perform DMA transfers for small sizes of data (~16 to ~512 bytes),
> resulting in cache issues in subsequent transfers. Increase the DMA
> transfer threshold to 512 to allow the shorter transfers to take place,
> bypassing DMA.
> 

Reviewed-by: Shawn Lin <shawn.lin@rock-chips.com>

> Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
> ---
>   drivers/mmc/host/dw_mmc-exynos.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/mmc/host/dw_mmc-exynos.c b/drivers/mmc/host/dw_mmc-exynos.c
> index 261344d3a8cfe..4b76b997ddc15 100644
> --- a/drivers/mmc/host/dw_mmc-exynos.c
> +++ b/drivers/mmc/host/dw_mmc-exynos.c
> @@ -141,6 +141,7 @@ static int dw_mci_exynos_priv_init(struct dw_mci *host)
>   		priv->ctrl_type == DW_MCI_TYPE_EXYNOS7870_SMU) {
>   		/* Quirk needed for certain Exynos SoCs */
>   		host->quirks |= DW_MMC_QUIRK_FIFO64_32;
> +		host->dma_threshold = 512;
>   	}
>   
>   	if (priv->ctrl_type == DW_MCI_TYPE_ARTPEC8) {
> 


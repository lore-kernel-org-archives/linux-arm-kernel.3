Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85DF1CAC582
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 17:17:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4ZK0nnmxaQ9IB9dHwbLjN/eXkkuhmEA1MIMy+rG8Waw=; b=rbfqtX6xGupQ3Hj5p+tv3umxL8
	1DgSc4MY4ezsobLT18n97gCs7qiVnyBxc5IT9r6m/SynxHcYMMGoL/0pHpeRu6lqvKGSg1qZ/zXyj
	AEYeLqD+rfqkvb02XUmDT7lpiIpyMG9xr5nJkAmIZ5msoLwIIasVYI8CbqR5sqIffbrVA+z256cO9
	0JpEpaMRpskoG1DUxlVUu+qZNsIDM7BCjCUcuOYJyEZXelOy7A0R5Fw1IKsfJ3NyM5XfcSOgG0H5y
	EN2kuIQQb2Z4ozcqmlMvsfGGDl4/3IlisRUdXINjdPnFoVYnh1fxCvc4RelybKxxckC6zG1RmkgM2
	LicBaVpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw1yD-00000008rJf-1pbk;
	Tue, 09 Sep 2025 17:17:29 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvxcN-000000077oJ-3Y17;
	Tue, 09 Sep 2025 12:38:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0EE24441B1;
	Tue,  9 Sep 2025 12:38:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A145EC4CEF4;
	Tue,  9 Sep 2025 12:38:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757421518;
	bh=xfgZpizSAgvpGfQ8FdJH4LJSv5oOdJ0VWjfgQAiTsPA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=VLapeKkHSiUpVT88yPkc0OnVXeMqWBP6lcyXDy6HLdVlaQ3XnSFzdWV6JotxLRisG
	 CWWH/rMMNftyNPxRKTG1IoYbvljzP5wy9LEM+STlAp/IZbHFkdCsS2ekXN/5Xy3w2T
	 m89f8HrBmWokcWFPlm6UTxwNAPNBbqWDjuHclvxNOMeWQ3xWFe9cdPUrLWXhsLKTTn
	 ujnjfzSxA3WuEdmXVvmiNJ8nEfsxazKPHNomVZlsnV6xOYeaVgCxB22qIV8Js9xfga
	 XeMI7HeUDhrIHdFAYRX4oBW53M2FXRZ8IL0AAINTg9+YO7LUi/qA2/wSBfaqj5ArI+
	 goBPjjRfaA1xQ==
Message-ID: <a85fa602-8310-446d-8903-92f1d597976c@kernel.org>
Date: Tue, 9 Sep 2025 14:38:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: mediatek: mt8195: Remove suspend-breaking
 reset from pcie0
To: Guoqing Jiang <guoqing.jiang@canonical.com>, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, jianjun.wang@mediatek.com,
 tinghan.shen@mediatek.com
Cc: macpaul.lin@mediatek.com, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20250721095959.57703-1-guoqing.jiang@canonical.com>
Content-Language: en-US, ca-ES, es-ES
From: Matthias Brugger <matthias.bgg@kernel.org>
In-Reply-To: <20250721095959.57703-1-guoqing.jiang@canonical.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_053839_903365_EFCF0A4D 
X-CRM114-Status: GOOD (  13.43  )
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

On 21/07/2025 11:59, Guoqing Jiang wrote:
> When test suspend resume with 6.8 based kernel, system can't resume
> and I got below error which can be also reproduced with 6.16 rc6+
> kernel.
> 
> mtk-pcie-gen3 112f0000.pcie: PCIe link down, current LTSSM state: detect.quiet (0x0)
> mtk-pcie-gen3 112f0000.pcie: PM: dpm_run_callback(): genpd_resume_noirq returns -110
> mtk-pcie-gen3 112f0000.pcie: PM: failed to resume noirq: error -110
> 
> After investigation, looks pcie0 has the same problem as pcie1 as
> decribed in commit 3d7fdd8e38aa ("arm64: dts: mediatek: mt8195:
> Remove suspend-breaking reset from pcie1").
> 
> Fixes: ecc0af6a3fe6 ("arm64: dts: mt8195: Add pcie and pcie phy nodes")
> Signed-off-by: Guoqing Jiang <guoqing.jiang@canonical.com>

Queued, thanks.

Matthias

> ---
>   arch/arm64/boot/dts/mediatek/mt8195.dtsi | 3 ---
>   1 file changed, 3 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> index dd065b1bf94a..50cf01452208 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> @@ -1563,9 +1563,6 @@ pcie0: pcie@112f0000 {
>   
>   			power-domains = <&spm MT8195_POWER_DOMAIN_PCIE_MAC_P0>;
>   
> -			resets = <&infracfg_ao MT8195_INFRA_RST2_PCIE_P0_SWRST>;
> -			reset-names = "mac";
> -
>   			#interrupt-cells = <1>;
>   			interrupt-map-mask = <0 0 0 7>;
>   			interrupt-map = <0 0 0 1 &pcie_intc0 0>,



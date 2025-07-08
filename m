Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE5DDC83F09
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jul 2025 17:29:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=cpbYyesIjYC2i5hYzrhkmtMKaF4zvzwxQqK77r3sLjM=; b=lGs5VWwx8CNlyO
	hMoUVUQKptfxrwEUkObmz1sCYGVH9oGP/Gb3cx2ZCtNKRsB1GXFMPp4oBtnUHpm1T+Svxb9Tihe0b
	fKV1Ngh0n2c3NnNSfK48ZN4ZkKVoNzn2CsSWdu0F9taPXnA2XeOeOEdTETzniQMTf3GPiU+jxTWRi
	bcEi8NAuOCGF9VtNNztCN3+P2WcD6/pcTcTDj9CTiR14mSnL9FyMdKJ0tnwu6ECJrQSeZ1ljMU424
	adZUk8LtxxffYvNB+3MB1E2ZCq8e+1QgXKLhT8kp56Ia97tP6R/7OloVCZFddeAzsqzLuE3rRiyyk
	HYGNkDTSAIyXiVNCCFfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZC7r-000000067I7-305E;
	Tue, 08 Jul 2025 17:29:03 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZBbb-000000061sj-0UNP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Jul 2025 16:55:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 413E5A53ECE;
	Tue,  8 Jul 2025 16:55:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB01BC4CEF0;
	Tue,  8 Jul 2025 16:55:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751993741;
	bh=9SPb1rRg+3+y0YQTrg9m/lWRcSKvEJxMR3VbM/EFUUA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=EHpaHR0ffbOEJLvutnq6EJZxTb4B+wsgE0ku2vZ6OGZue52AHZyXy4ClSNQErDb1A
	 e7wui51WfrOD1y6A/38rkoxGDfxsj3KGtcUIrWFw4rT54xVXMd0v6lBBxslKek1GyN
	 erhDuARC7u3/perdrZ31s7mVo0aRRtDORWHdjZlz0WzMWQdzaGGBoEORy61nJZxM15
	 H/hdHI+IikZEqweykpUhM393xWfSLHwKd/fLxdCxfEu6onms3cKXezc0x4pChK3OT0
	 iPaMKXcN0jjSwn+w/lhOPOEWidhO26xgsz6AzqZ2pfBY8BYZrkjJMyOYQzbCrw2n4u
	 36fkHlc7ThUQg==
Date: Tue, 8 Jul 2025 11:55:40 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: bhelgaas@google.com, lpieralisi@kernel.org, kwilczynski@kernel.org,
	mani@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, geert+renesas@glider.be, magnus.damm@gmail.com,
	catalin.marinas@arm.com, will@kernel.org, mturquette@baylibre.com,
	sboyd@kernel.org, p.zabel@pengutronix.de, lizhi.hou@amd.com,
	linux-pci@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: Re: [PATCH v3 7/9] arm64: dts: renesas: rzg3s-smarc-som: Update
 dma-ranges for PCIe
Message-ID: <20250708165540.GA2148533@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250704161410.3931884-8-claudiu.beznea.uj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_095543_215700_FFD94D28 
X-CRM114-Status: GOOD (  18.38  )
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

On Fri, Jul 04, 2025 at 07:14:07PM +0300, Claudiu wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> 
> The first 128MB of memory is reserved on this board for secure area.
> Update the PCIe dma-ranges property to reflect this.

Can we include a sentence or two about what the "secure area" means?
I don't know how to connect this with anything in the driver.

> Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> ---
> 
> Changes in v3:
> - collected tags
> 
> Changes in v2:
> - none, this patch is new
> 
>  arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi b/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
> index 39845faec894..1b03820a6f02 100644
> --- a/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
> +++ b/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
> @@ -214,6 +214,11 @@ &sdhi2 {
>  };
>  #endif
>  
> +&pcie {
> +	/* First 128MB is reserved for secure area. */
> +	dma-ranges = <0x42000000 0 0x48000000 0 0x48000000 0x0 0x38000000>;
> +};
> +
>  &pinctrl {
>  #if SW_CONFIG3 == SW_ON
>  	eth0-phy-irq-hog {
> -- 
> 2.43.0
> 


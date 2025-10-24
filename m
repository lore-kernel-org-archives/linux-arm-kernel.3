Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F1C3CCD1AB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Oct 2025 12:05:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=19wXdencSio4CXqE9z6Ow4JakjnRUuhu0uUJfH7NPAo=; b=I07YZlhn8mKl8r6el3+IMOJkwj
	+vy1worduexrtJYFONV01b6Dav3b4EflBkeg5M60Gb0crlpbq5WQclTenN8wgEfhcl3HmaNWzEBW0
	7da8J3B9d3+e6CKZAdKc2KRO7eBayLXeb3MdKfGOVVgiXhUInV4I+M5Ve07f8X0qVRNtP4l69op7b
	bp19bpGuF7ReHanvjUVDtzwgy0Smr40OT9k0iCWi5B//9tvVQQUtXEuAXg4nYlI9euiXQBFXMhHGo
	UYuEao4v7835KJ258z9HXWpiDdHoqoRcD2YdYOHCdQ+NzOAXkGeXpNIsvlxeI2jiVBPwgtUzqCB3U
	UJ80wKVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCGXu-00000009J0X-2jMq;
	Fri, 24 Oct 2025 12:05:26 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCGXs-00000009J0J-4Bll
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Oct 2025 12:05:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id EA4F3604ED;
	Fri, 24 Oct 2025 12:05:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3CC34C4CEF1;
	Fri, 24 Oct 2025 12:05:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761307523;
	bh=SoTqsQyeJsNHR+NjV5RVJfzLtjEZs9jDVX9K8tQd7VQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=MtzvBRZ2QznIMWkDD8LXC05vVfSz54eV+CSiyFUDrQpPPDKOy274P9UHODkl8bzRw
	 XLpz4bQi/UlOmqd1+PiFh1mv48mQtysnDrKWluwlZ1RwZvHu5tmO6VDIfva8YhUh0M
	 Pgg9cgsSdMPsNNOmvSK1IdrStowqm3dxiixgC7o/36+MB8+CiYC5RA/vAEjtbLc148
	 l6XtgEQFMhcCaSVpio+X4tstvezR/mDrzl8ROAbZpKfRCaMqnenvdZW9b1YVSkS62z
	 Gj8MZQwyfEQexesICFIKXxvRN6ihqs1yDG7/eY5QB7xxEhRZvqADN1TeoW4LqNDoUF
	 pw8BRS6IB2XYA==
Message-ID: <9559cde8-8dc4-4f4b-8e9f-973656bb575c@kernel.org>
Date: Fri, 24 Oct 2025 07:05:21 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 04/10] arm64: dts: socfpga: agilex5: smmu enablement
To: Steffen Trumtrar <s.trumtrar@pengutronix.de>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Matthew Gerlach <matthew.gerlach@altera.com>
Cc: kernel@pengutronix.de, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, Austin Zhang <austin.zhang@intel.com>,
 Adrian Ng Ho Yin <adrian.ho.yin.ng@intel.com>
References: <20251024-v6-12-topic-socfpga-agilex5-v5-0-4c4a51159eeb@pengutronix.de>
 <20251024-v6-12-topic-socfpga-agilex5-v5-4-4c4a51159eeb@pengutronix.de>
Content-Language: en-US
From: Dinh Nguyen <dinguyen@kernel.org>
In-Reply-To: <20251024-v6-12-topic-socfpga-agilex5-v5-4-4c4a51159eeb@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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



On 10/24/25 06:49, Steffen Trumtrar wrote:
> From: Austin Zhang <austin.zhang@intel.com>
> 
> Add iommu property for peripherals connected to TBU.
> 
> Signed-off-by: Adrian Ng Ho Yin <adrian.ho.yin.ng@intel.com>
> Signed-off-by: Steffen Trumtrar <s.trumtrar@pengutronix.de>
> ---
>   arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi b/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi
> index 4f7ed20749927..4ccfebfd9d322 100644
> --- a/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi
> +++ b/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi
> @@ -303,6 +303,7 @@ nand: nand-controller@10b80000 {
>   			interrupts = <GIC_SPI 97 IRQ_TYPE_LEVEL_HIGH>;
>   			clocks = <&clkmgr AGILEX5_NAND_NF_CLK>;
>   			cdns,board-delay-ps = <4830>;
> +			iommus = <&smmu 4>;
>   			status = "disabled";
>   		};
>   
> @@ -329,6 +330,7 @@ dmac0: dma-controller@10db0000 {
>   			snps,block-size = <32767 32767 32767 32767>;
>   			snps,priority = <0 1 2 3>;
>   			snps,axi-max-burst-len = <8>;
> +			iommus = <&smmu 8>;
>   		};
>   
>   		dmac1: dma-controller@10dc0000 {
> @@ -346,6 +348,7 @@ dmac1: dma-controller@10dc0000 {
>   			snps,block-size = <32767 32767 32767 32767>;
>   			snps,priority = <0 1 2 3>;
>   			snps,axi-max-burst-len = <8>;
> +			iommus = <&smmu 9>;
>   		};
>   
>   		rst: rstmgr@10d11000 {
> @@ -468,6 +471,7 @@ usb0: usb@10b00000 {
>   			reset-names = "dwc2", "dwc2-ecc";
>   			clocks = <&clkmgr AGILEX5_USB2OTG_HCLK>;
>   			clock-names = "otg";
> +			iommus = <&smmu 6>;
>   			status = "disabled";
>   		};
>   
> @@ -553,6 +557,7 @@ gmac0: ethernet@10810000 {
>   			snps,tso;
>   			altr,sysmgr-syscon = <&sysmgr 0x44 0>;
>   			snps,clk-csr = <0>;
> +			iommus = <&smmu 1>;
>   			status = "disabled";
>   
>   			stmmac_axi_emac0_setup: stmmac-axi-config {
> @@ -665,6 +670,7 @@ gmac1: ethernet@10820000 {
>   			snps,tso;
>   			altr,sysmgr-syscon = <&sysmgr 0x48 0>;
>   			snps,clk-csr = <0>;
> +			iommus = <&smmu 2>;
>   			status = "disabled";
>   
>   			stmmac_axi_emac1_setup: stmmac-axi-config {
> @@ -777,6 +783,7 @@ gmac2: ethernet@10830000 {
>   			snps,tso;
>   			altr,sysmgr-syscon = <&sysmgr 0x4c 0>;
>   			snps,clk-csr = <0>;
> +			iommus = <&smmu 3>;
>   			status = "disabled";
>   
>   			stmmac_axi_emac2_setup: stmmac-axi-config {
> 


I have a similar patches for this and 3/10 queued up for v6.19.

The DTS patches are staged in my repo under the branch 
socfpga_updates_for_v6.19

Dinh


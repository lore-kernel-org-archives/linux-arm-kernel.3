Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D212C0219E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 17:51:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ux51PGVpKLgsu5rDot4gbKTPI/0fh9hiFHDixCmncKE=; b=Ov07z9NrIMAUJu0GRE5RBdMsEJ
	ca5mEeEuFyfdw5jErl5OoE8dTLOnc7OcCpBh0aUuQz2RbAvujSKPGuwJ92oZRNydIWPZV+iodlFfa
	xazp1GTEf8Kch6qoq85E6vE2wMCzoMJ3MzqMpYGI5MqVuiSg9SafUohaYfqgdRpp1tr6NxkdiGhsV
	dRhSfJ1nhJ37o66gN7T3p+4bNvGgq3MksWq+xG/ytFgjjacTlylXCnlT2ix7nYfGt9U3dTUNKlwM/
	v6kaZs/kQJAz82UfqM31qQRcWcpfCCSwFb6XGkCxT1R4irOBVyQ1XWrizvPxdZMOjsQtpfI5TiINO
	4UgrB9fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thuQC-00000004kvQ-15N4;
	Tue, 11 Feb 2025 17:51:44 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thuOB-00000004kbD-3qCS;
	Tue, 11 Feb 2025 17:49:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=Ux51PGVpKLgsu5rDot4gbKTPI/0fh9hiFHDixCmncKE=; b=VfIdK6G+oQZWb8jG7sTDpP3P1+
	fX+uwOH2ihorYY5fKoPuf5/o+47YhEISBdyamkzxakNUMdISH4AKe6P2cwUhNlX2A+Cfef4TDejEl
	FEJq936ohIohKTCsgVhSp26iSAam1SXLpIPlFh/II7e4axoFSanLqZr1S0D+1jXzKs8AJ6VGGmdhT
	1xP+EsTETZqkH/+BcLND7EypV2+I2/fOp+qCWI3od7dB9Cpxh8DVLS0541j15pD2K2g91SWnJKKmZ
	Klt23qL7GjpW9n4puz/ASkP3jkCIKwnxTf51tEhfIm/+yZ5T/sp4wG0c+MWQKqMpr2ExjkcfCT3IF
	0NHaHHbw==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thuO8-00000000evL-0mJu;
	Tue, 11 Feb 2025 17:49:38 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 393EC13D5;
	Tue, 11 Feb 2025 09:49:55 -0800 (PST)
Received: from [10.57.35.63] (unknown [10.57.35.63])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 085D83F5A1;
	Tue, 11 Feb 2025 09:49:31 -0800 (PST)
Message-ID: <7996d1ec-6ceb-4d8a-bf03-1911ac5f8f0c@arm.com>
Date: Tue, 11 Feb 2025 17:49:29 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: rockchip: disable IOMMU when running rk3588
 in PCIe endpoint mode
To: Niklas Cassel <cassel@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: Damien Le Moal <dlemoal@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
References: <20250207143900.2047949-2-cassel@kernel.org>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <20250207143900.2047949-2-cassel@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_174936_678304_F8E97826 
X-CRM114-Status: GOOD (  26.29  )
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

On 2025-02-07 2:39 pm, Niklas Cassel wrote:
> Commit da92d3dfc871 ("arm64: dts: rockchip: enable the mmu600_pcie IOMMU
> on the rk3588 SoC") enabled the mmu600_pcie IOMMU, both in the normal case
> (when all PCIe controllers are running in Root Complex mode) and in the
> case when running the pcie3x4 PCIe controller in Endpoint mode.
> 
> There have been no issues detected when running the PCIe controllers in
> Root Complex mode. During PCI probe time, we will add a SID to the IOMMU
> for each PCI device enumerated on the bus, including the root port itself.
> 
> However, when running the pcie3x4 PCIe controller in Endpoint mode, we
> will only add a single SID to the IOMMU (the SID specified in the iommus
> DT property).
> 
> The enablement of IOMMU in endpoint mode was verified on setup with two
> Rock 5b:s, where the BDF of the Root Complex has BDF (00:00.0).
> 
> A Root Complex sending a TLP to the Endpoint will have Requester ID set
> to the BDF of the initiator. On the EP side, the Requester ID will then
> be used as the SID. This works fine if the Root Complex has a BDF that
> matches the iommus DT property, however, if the Root Complex has any other
> BDF, we will see something like:
> arm-smmu-v3 fc900000.iommu: event: C_BAD_STREAMID client: (unassigned sid) sid: 0x1600 ssid: 0x0
> on the endpoint side.
> 
> For PCIe controllers running in endpoint mode that always uses the
> incoming Requester ID as the SID, the iommus DT property simply isn't
> a viable solution. (Neither is iommu-map a viable solution, as there is
> no enumeration done on the endpoint side.)

Well, strictly the controller should own all the StreamIDs it's capable 
of emitting - if that's just one per possible bus number (as the iATU 
FUNC_NUM/FUNC_BYPASS stuff appears to suggest?) then 256 "iommus" 
entries isn't *entirely* unmanageable. If it were to support being 
arbitrary (or multiple) devices/functions, though, then we probably 
would want to look for a different solution, because nobody wants a 
512KB DT property... :)

Thanks,
Robin.

> Thus, partly revert commit da92d3dfc871 ("arm64: dts: rockchip: enable the
> mmu600_pcie IOMMU on the rk3588 SoC") by disabling the PCI IOMMU when
> running the pcie3x4 PCIe controller in Endpoint mode.
> 
> Since the PCI IOMMU is working as expected in the normal case, keep it
> enabled when running all PCIe controllers in Root Complex mode.
> 
> Fixes: da92d3dfc871 ("arm64: dts: rockchip: enable the mmu600_pcie IOMMU on the rk3588 SoC")
> Signed-off-by: Niklas Cassel <cassel@kernel.org>
> ---
>   arch/arm64/boot/dts/rockchip/rk3588-extra.dtsi           | 1 -
>   arch/arm64/boot/dts/rockchip/rk3588-rock-5b-pcie-ep.dtso | 4 ++++
>   2 files changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk3588-extra.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-extra.dtsi
> index 42b57e27ee4c..b5feefda9d2d 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3588-extra.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3588-extra.dtsi
> @@ -215,7 +215,6 @@ pcie3x4_ep: pcie-ep@fe150000 {
>   		interrupt-names = "sys", "pmc", "msg", "legacy", "err",
>   				  "dma0", "dma1", "dma2", "dma3";
>   		max-link-speed = <3>;
> -		iommus = <&mmu600_pcie 0x0000>;
>   		num-lanes = <4>;
>   		phys = <&pcie30phy>;
>   		phy-names = "pcie-phy";
> diff --git a/arch/arm64/boot/dts/rockchip/rk3588-rock-5b-pcie-ep.dtso b/arch/arm64/boot/dts/rockchip/rk3588-rock-5b-pcie-ep.dtso
> index 672d748fcc67..f229cb49da68 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3588-rock-5b-pcie-ep.dtso
> +++ b/arch/arm64/boot/dts/rockchip/rk3588-rock-5b-pcie-ep.dtso
> @@ -23,3 +23,7 @@ &pcie3x4_ep {
>   	vpcie3v3-supply = <&vcc3v3_pcie30>;
>   	status = "okay";
>   };
> +
> +&mmu600_pcie {
> +	status = "disabled";
> +};



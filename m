Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E4E6CA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 17 Aug 2025 14:43:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9qAbd3ku5uYwTB5Wd++OM2GdMbge/n131agoI9FgTbc=; b=gkceA3tMRcxnw81HdWyiecssts
	tdAlr0AIdyaiQ0R7VVY6vcvrGWk2g2oJBqzSD1L3xg2A5TG3fiE07cDF+CViSmKSFmtBAzv1lKttK
	lRD6/BcN+CRWfxTc+xl04yCpvx1mc3/nh9yxlFsfZZq/89Uds9sTsLA9ufB4d3GAU3l31sT9BH4k8
	awWfHUZS39L546R/XHmczmVK58nIvh4sMXTC0g3Fe1jKyamOpeHTUaErjBK2xGp59COknbGo9A6Mn
	4SHy2+0Z2btE4+TyOTmNaNcQAQdZNOiuUlLBX9yBRSWKvvADxk0OWifuvjG3AsVzuvCi13xiLNE68
	0EbUukWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unebY-00000005l5i-33pd;
	Sun, 17 Aug 2025 14:43:28 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uneYy-00000005kwh-1Kol
	for linux-arm-kernel@lists.infradead.org;
	Sun, 17 Aug 2025 14:40:50 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id AB83D20E7F;
	Sun, 17 Aug 2025 16:40:43 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jhqNozXW2LyZ; Sun, 17 Aug 2025 16:40:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1755441643; bh=C5O+EoyOlPQcNHOMGrGy4W+Ta3zzOZ7A+ckXJmSQiJM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=DcvrLON4F3fL35nfNmHCEDN0tx/MKWxtBImknCbtLG5RtYWzvoSIjdegdBeHwfhUn
	 cqDgfyYD07SN+4pQBHv0W088Ul6PVjUT1QpQkRrxx5WsfYECGTRQo2KYtKKMk9wUPC
	 eJVvnGhhB541xeSCejMEQhxwllUilGdn1JH8uYeKMuoMUMpYOo/JD1bExy06JHiTkw
	 0oFx4LkHHPXvl0lDDg7o0282ZEWFE2USxRHwZXXlwkeLMP6Txkw22Z7E8QarZpuHV5
	 eMpAscHXQeg8K1bOadu4EY4gScUPOjffolyAFzKinvVCpGN39/jNuJHN0iPgWeQzSG
	 l3Anlo/R3u9vQ==
MIME-Version: 1.0
Date: Sun, 17 Aug 2025 14:40:42 +0000
From: Kaustabh Chakraborty <kauschluss@disroot.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/6] arm64: dts: exynos7870: add DSI support
In-Reply-To: <6f0451ee-ddb8-4ded-8f0a-b491de9cc308@kernel.org>
References: <20250627-exynos7870-drm-dts-v2-0-d4a59207390d@disroot.org>
 <20250627-exynos7870-drm-dts-v2-3-d4a59207390d@disroot.org>
 <6f0451ee-ddb8-4ded-8f0a-b491de9cc308@kernel.org>
Message-ID: <00240935c664edaec3092354a303a91f@disroot.org>
X-Sender: kauschluss@disroot.org
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250817_074048_777127_312970F6 
X-CRM114-Status: GOOD (  10.38  )
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

On 2025-08-13 07:56, Krzysztof Kozlowski wrote:
> On 26/06/2025 22:13, Kaustabh Chakraborty wrote:
>>  			reboot-mode {
>>  				compatible = "syscon-reboot-mode";
>>  				offset = <0x080c>;
>> @@ -674,6 +682,83 @@ cmu_isp: clock-controller@144d0000 {
>>  				 <&cmu_mif CLK_GOUT_MIF_CMU_ISP_VRA>;
>>  		};
>> 
>> +		syscon_cam0: syscon@144f1040 {
>> +			compatible = "samsung,exynos7870-cam0-sysreg", "syscon";
>> +			reg = <0x144f1040 0x04>;
>> +		};
>> +
>> +		dsi: dsi@14800000 {
>> +			compatible = "samsung,exynos7870-mipi-dsi";
>> +			reg = <0x14800000 0x100>;
>> +			interrupts = <GIC_SPI 207 IRQ_TYPE_LEVEL_HIGH>;
>> +
>> +			clock-names = "bus", "pll", "byte", "esc";
>> +			clocks = <&cmu_dispaud CLK_GOUT_DISPAUD_BUS_DISP>,
>> +				 <&cmu_dispaud CLK_GOUT_DISPAUD_APB_DISP>,
>> +				 <&cmu_dispaud CLK_GOUT_DISPAUD_MUX_MIPIPHY_TXBYTECLKHS_USER>,
>> +				 <&cmu_dispaud CLK_GOUT_DISPAUD_MUX_MIPIPHY_RXCLKESC0_USER>;
> 
> First clocks, then clock-names, please. Same for phys here and in all
> other place.

x-names followed by x approach is followed by the entire dts.
I will apply your suggestion in the next rev, and will also send a
separate patch for the same in all other places.

> 
>> +
>> +			phy-names = "dsim";
>> +			phys = <&mipi_phy 1>;
>> +
>> +			status = "disabled";
>> +
>> +			ports {
>> +				#address-cells = <1>;
>> +				#size-cells = <0>;
>> +
>> +				port@0 {
>> +					reg = <0>;
>> +
>> +					dsi_to_decon: endpoint {
>> +						remote-endpoint = <&decon_to_dsi>;
>> +					};
>> +				};
>> +			};
>> +		};
>> +
>> +		decon: decon@14830000 {
> 
> node name: display-controller@

This was preemptively changed, thanks.

> 
>> +			compatible = "samsung,exynos7870-decon";
>> +			reg = <0x14830000 0x8000>;
>> +			interrupt-names = "fifo", "vsync", "lcd_sys";
>> +			interrupts = <GIC_SPI 201 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 202 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 203 IRQ_TYPE_LEVEL_HIGH>;
>> +
>> +			clock-names = "pclk_decon0", "aclk_decon0",
>> +				      "decon0_eclk", "decon0_vclk";
>> +			clocks = <&cmu_dispaud CLK_GOUT_DISPAUD_MUX_PLL>,
>> +				 <&cmu_dispaud CLK_GOUT_DISPAUD_MUX_BUS_USER>,
>> +				 <&cmu_dispaud CLK_GOUT_DISPAUD_MUX_DECON_ECLK>,
>> +				 <&cmu_dispaud CLK_GOUT_DISPAUD_MUX_DECON_VCLK>;
>> +
>> +			iommus = <&sysmmu_decon>;
>> +
>> +			status = "disabled";
>> +
>> +			ports {
>> +				#address-cells = <1>;
>> +				#size-cells = <0>;
>> +
>> +				port@0 {
>> +					reg = <0>;
>> +					decon_to_dsi: endpoint {
>> +						remote-endpoint = <&dsi_to_decon>;
>> +					};
>> +				};
>> +			};
>> +		};
>> +
>> +		sysmmu_decon: sysmmu@14860000 {
> 
> iommu@

Also preemptively changed.

> 
>> +			compatible = "samsung,exynos-sysmmu";
>> +			reg = <0x14860000 0x1000>;
>> +			interrupts = <GIC_SPI 193 IRQ_TYPE_LEVEL_HIGH>;
>> +			#iommu-cells = <0>;
>> +
>> +			clock-names = "sysmmu";
>> +			clocks = <&cmu_dispaud CLK_GOUT_DISPAUD_MUX_BUS_USER>;
>> +		};
> 
> 
> 
> Best regards,
> Krzysztof


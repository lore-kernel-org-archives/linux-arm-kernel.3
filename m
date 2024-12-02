Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24EE6D4979C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 04:53:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:Cc:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cDVRJapTTKIEkPi1buTVc3tXS1QEJK+G0n5EUf611IE=; b=zKFjCQM7jAVIwxUyEXkyWHIJJn
	V3kHFuGpdSNCmN4t3e5LDLlI0+8BZXoxo1fPp6/9q+xbDhkBPliFY5BbC7D/GVzJ4f6hgjuIbaJhg
	4bgzlkVmtzVypRUI/u8/YFdzp8Is/b6lLoivnkG8PYCTG2RtExl/RVguJKoyZLgEP8JCtPkX1afYA
	3eTWFvmXJ/xeqrc1H9h9tJtvx5k3LpSCbB3QmYKq4Q2Ml/2Ap6tM13j2iDAlsukB6yxCrbDlt+Obu
	dZG46THeFJVb/CukkE/j6ula9hjl1lyS7EU71NNHStQ7tgSSgXUnvjgFBzWLN09h45/798gyavWvD
	y3wGaemQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tHyQs-0000000550H-2TOu;
	Mon, 02 Dec 2024 04:53:14 +0000
Received: from omta36.uswest2.a.cloudfilter.net ([35.89.44.35])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tHyPW-000000054pD-1mmv
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Dec 2024 04:51:52 +0000
Received: from eig-obgw-5009a.ext.cloudfilter.net ([10.0.29.176])
	by cmsmtp with ESMTPS
	id HE5nt5ZeRqvuoHyPGt9EPG; Mon, 02 Dec 2024 04:51:35 +0000
Received: from md-in-79.webhostbox.net ([43.225.55.182])
	by cmsmtp with ESMTPS
	id HyPDtC3xLlDL5HyPEt3Rcu; Mon, 02 Dec 2024 04:51:33 +0000
X-Authority-Analysis: v=2.4 cv=LLtgQoW9 c=1 sm=1 tr=0 ts=674d3cd5
 a=LfuyaZh/8e9VOkaVZk0aRw==:117 a=kofhyyBXuK/oEhdxNjf66Q==:17
 a=IkcTkHD0fZMA:10 a=RZcAm9yDv7YA:10 a=-pn6D5nKLtMA:10 a=vU9dKmh3AAAA:8
 a=c-Ag78a_ZS1VCw5oD-gA:9 a=QEXdDO2ut3YA:10 a=rsP06fVo5MYu2ilr0aT5:22
 a=ZCPYImcxYIQFgLOT52_G:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=linumiz.com
	; s=default; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=cDVRJapTTKIEkPi1buTVc3tXS1QEJK+G0n5EUf611IE=; b=UzLNJVZlQFq1k7ehsk6kZJSGU3
	g1M3vCrp39TdiFyZFZwRkb8mrYzKfKewwfS9EGRRpM+tp4XT6RVFVW7yB9BYRQQfMDGIiqcI+dQLw
	zpwXbwbb6uwGmwrf04kyQZSmQ4aBfA6p0bBEDETL8KToM0R1w2KbMqCAUWjiDIqiT7IGXr9JY/SwZ
	uZ4gwg41I1yXsSjr+QmOlUKiLfEGHBVtiMvcDO2+bg1HLp6TMoqGs/Jfhjh4tAHg5KSwGlVcHWDR1
	vK2SCletrX0aSkmYz32ZmqdAMF9+VIDGdcUltIMRWG2jzOjO1TQ7My+7vdhYQfnuFF9RN+Bq0q2HC
	B7AJq2Sw==;
Received: from [122.165.245.213] (port=48956 helo=[192.168.1.5])
	by md-in-79.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <parthiban@linumiz.com>)
	id 1tHyPB-003JlN-2w;
	Mon, 02 Dec 2024 10:21:30 +0530
Message-ID: <d394f125-f301-4cc6-a477-36d1267b614a@linumiz.com>
Date: Mon, 2 Dec 2024 10:21:26 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: parthiban@linumiz.com, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, Andre Przywara <andre.przywara@arm.com>
Subject: Re: [PATCH 2/2] arm64: dts: allwinner: a100: Add syscon nodes
To: Cody Eksal <masterr3c0rd@epochal.quest>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>
References: <20241202-a100-syscon-v1-0-86c6524f24d7@epochal.quest>
 <20241202-a100-syscon-v1-2-86c6524f24d7@epochal.quest>
Content-Language: en-US
From: Parthiban <parthiban@linumiz.com>
Organization: Linumiz
In-Reply-To: <20241202-a100-syscon-v1-2-86c6524f24d7@epochal.quest>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - md-in-79.webhostbox.net
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - linumiz.com
X-BWhitelist: no
X-Source-IP: 122.165.245.213
X-Source-L: No
X-Exim-ID: 1tHyPB-003JlN-2w
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: ([192.168.1.5]) [122.165.245.213]:48956
X-Source-Auth: parthiban@linumiz.com
X-Email-Count: 4
X-Org: HG=dishared_whb_net_legacy;ORG=directi;
X-Source-Cap: bGludW1jbWM7aG9zdGdhdG9yO21kLWluLTc5LndlYmhvc3Rib3gubmV0
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfKmQtVDeQDfesKzWhkvySkfm8lTTSM/4FiutTBiJl8jH1qm4tiQXeV4sWA5hA/XOmvwqTBcezrxcJbsAmG5slNLWHusNxFXytJnUl4dPP7820vruD07Z
 pc/3yaFHI66K9ARim8pO20+3/EWHpz2kDkAx6lf8ViO/9QdIyIjHqt5iVBjlWbQyp40LsIO34OJGwbQmMBuQIo+x56AbndxTBK44ZEBaFa9mnAzCOHtKgrVs
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241201_205150_805936_E61C4E25 
X-CRM114-Status: GOOD (  12.84  )
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

On 12/2/24 10:13 AM, Cody Eksal wrote:
> The Allwinner A100 has a system configuration block, denoted as SYS_CFG
> in the user manual's memory map. It is undocumented in the manual, but
> a glance at the vendor tree shows this block is similar to its
> predecessors in the A64 and H6. The A100 also has 3 SRAM blocks: A1, A2,
> and C. Add all of these to the SoC's device tree.
> 
> Signed-off-by: Cody Eksal <masterr3c0rd@epochal.quest>
Reviewed-by: Parthiban Nallathambi <parthiban@linumiz.com>

Thanks,
Parthiban
> ---
>  arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi | 31 ++++++++++++++++++++++++++
>  1 file changed, 31 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi
> index 29ac7716c7a5284ccf8af675db9c7d016785f0ff..31540a7ca1f01c6c2e69e329054aca16ffd112c4 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi
> @@ -101,6 +101,37 @@ soc {
>  		#size-cells = <1>;
>  		ranges = <0 0 0 0x3fffffff>;
>  
> +		syscon: syscon@3000000 {
> +			compatible = "allwinner,sun50i-a100-system-control",
> +				     "allwinner,sun50i-a64-system-control";
> +			reg = <0x03000000 0x1000>;
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +			ranges;
> +
> +			sram_a1: sram@20000 {
> +				compatible = "mmio-sram";
> +				reg = <0x00020000 0x4000>;
> +				#address-cells = <1>;
> +				#size-cells = <1>;
> +				ranges = <0 0x00020000 0x4000>;
> +			};
> +			sram_c: sram@24000 {
> +				compatible = "mmio-sram";
> +				reg = <0x024000 0x21000>;
> +				#address-cells = <1>;
> +				#size-cells = <1>;
> +				ranges = <0 0x024000 0x21000>;
> +			};
> +			sram_a2: sram@100000 {
> +				compatible = "mmio-sram";
> +				reg = <0x0100000 0x14000>;
> +				#address-cells = <1>;
> +				#size-cells = <1>;
> +				ranges = <0 0x0100000 0x14000>;
> +			};
> +		};
> +
>  		ccu: clock@3001000 {
>  			compatible = "allwinner,sun50i-a100-ccu";
>  			reg = <0x03001000 0x1000>;
> 



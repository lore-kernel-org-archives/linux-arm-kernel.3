Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F327C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jul 2026 09:13:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Subject:To:MIME-Version:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SvRq5CdKRK+cXuPIl01vwgEHpAzifmdPRhufpqKIi68=; b=gybZAvot1j+ah38iPnqY600JcH
	od6AShdE2MIkcrRKXuNGV4/nFYY+rDSVxDpROBwAxDA7v5I1v/hh6XG+V95CIz6ULwxMmcoWnPEzl
	Z1czuJW72abCj8PWfvs5jXApBPYYi8ZuyKjAooYuIgC3SQ/MP+fQ/71jQXSEHbB+N5dWjyrbgzYwt
	re3VCx8Wc0L6fDY3hwKA2p0cSZbHG2Qr5cReZEfmm4kOUOaEuHyyWsvKjt1zr5ZWfCLFozf/kR+c5
	B6qGlskWRcYIz0ndJywOPnZSl77SWFWGqpS1dxdvOKywtCvTcelqJES73uDbIRINnF9mBXA/DLDou
	DLcMAlRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh1rY-0000000Eayv-4A5m;
	Tue, 07 Jul 2026 09:13:08 +0000
Received: from canpmsgout02.his.huawei.com ([113.46.200.217])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh1rT-0000000Eay2-2QWK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jul 2026 09:13:08 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=SvRq5CdKRK+cXuPIl01vwgEHpAzifmdPRhufpqKIi68=;
	b=dCEr1IrECrVxXkkww71i9eXle7zGxMWVmIeugpng72TeD4oJpSaX53iRVOsawEEzVpdRNkpiB
	EEjQkTHpJnuV3+PTt2SjX0qAcoYnZGLK6mZmpWcFVIdeP/EJBv+N6rm9S9zWHuIpsv4CZYQZM8c
	rpLLp3fo/zqlgxG2d2uoQDo=
Received: from mail.maildlp.com (unknown [172.19.162.144])
	by canpmsgout02.his.huawei.com (SkyGuard) with ESMTPS id 4gvZyg4qhZzcb3P;
	Tue,  7 Jul 2026 17:03:39 +0800 (CST)
Received: from dggemv712-chm.china.huawei.com (unknown [10.1.198.32])
	by mail.maildlp.com (Postfix) with ESMTPS id 082D240538;
	Tue,  7 Jul 2026 17:12:41 +0800 (CST)
Received: from kwepemq100003.china.huawei.com (7.202.195.72) by
 dggemv712-chm.china.huawei.com (10.1.198.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 7 Jul 2026 17:12:40 +0800
Received: from [10.67.113.213] (10.67.113.213) by
 kwepemq100003.china.huawei.com (7.202.195.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 7 Jul 2026 17:12:40 +0800
Message-ID: <6A4CC307.5000606@hisilicon.com>
Date: Tue, 7 Jul 2026 17:12:39 +0800
From: Wei Xu <xuwei5@hisilicon.com>
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<xuwei5@hisilicon.com>
Subject: Re: [PATCH] arm64: dts: hisilicon: hi3798cv200: Drop unused clock-names
 and reset-names
References: <20260625091335.106951-2-krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20260625091335.106951-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.113.213]
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 kwepemq100003.china.huawei.com (7.202.195.72)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_021304_281504_2173E8E5 
X-CRM114-Status: GOOD (  12.04  )
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

Hi Krzysztof, 

On 2026/6/25 17:13, Krzysztof Kozlowski wrote:
> Neither Linux drivers nor DT bindings ever described or used clock-names
> and reset-names for this SoC.  The binding allows clock-names only for
> atmel,at91sam9g45-ehci and atmel,at91rm9200-ohci, but not for HiSilicon.
> reset-names were never allowed.
> 
> Drop them from DTS to fix dtbs_check warnings:
> 
>   hi3798cv200-poplar.dtb: usb@9880000 (generic-ohci): False schema does not allow ['bus', 'clk12', 'clk48']
>   hi3798cv200-poplar.dtb: usb@9880000 (generic-ohci): Unevaluated properties are not allowed ('reset-names' was unexpected)
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/hisilicon/hi3798cv200.dtsi | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/hisilicon/hi3798cv200.dtsi b/arch/arm64/boot/dts/hisilicon/hi3798cv200.dtsi
> index 2f4ad5da5e33..e5010c9d4c39 100644
> --- a/arch/arm64/boot/dts/hisilicon/hi3798cv200.dtsi
> +++ b/arch/arm64/boot/dts/hisilicon/hi3798cv200.dtsi
> @@ -633,9 +633,7 @@ ohci: usb@9880000 {
>  			clocks = <&crg HISTB_USB2_BUS_CLK>,
>  				 <&crg HISTB_USB2_12M_CLK>,
>  				 <&crg HISTB_USB2_48M_CLK>;
> -			clock-names = "bus", "clk12", "clk48";
>  			resets = <&crg 0xb8 12>;
> -			reset-names = "bus";
>  			phys = <&usb2_phy1_port0>;
>  			phy-names = "usb";
>  			status = "disabled";
> @@ -648,11 +646,9 @@ ehci: usb@9890000 {
>  			clocks = <&crg HISTB_USB2_BUS_CLK>,
>  				 <&crg HISTB_USB2_PHY_CLK>,
>  				 <&crg HISTB_USB2_UTMI_CLK>;
> -			clock-names = "bus", "phy", "utmi";
>  			resets = <&crg 0xb8 12>,
>  				 <&crg 0xb8 16>,
>  				 <&crg 0xb8 13>;
> -			reset-names = "bus", "phy", "utmi";
>  			phys = <&usb2_phy1_port0>;
>  			phy-names = "usb";
>  			status = "disabled";
> 


Applied to the HiSilicon arm64 dt tree.
Thanks!

Best Regards,
Wei

